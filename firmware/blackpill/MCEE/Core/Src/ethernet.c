/*
 * ethernet.c
 * Ver ethernet.h
 *
 * W5500 en modo SPI "variable data length": cada transaccion es
 *   [direccion alta][direccion baja][byte de control][datos...]  con CS bajo durante todo el bloque.
 * Byte de control = (bloque << 3) | (escritura << 2).
 * Bloques: 0 = registros comunes, 4*n+1 = registros del socket n, 4*n+2 = buffer TX, 4*n+3 = buffer RX.
 */
#include "ethernet.h"
#include "main.h"
#include "display.h"
#include "processing.h"
#include <string.h>

extern SPI_HandleTypeDef hspi2;

/* Si en CubeMX los pines tienen otros nombres, ajustar aca */
#ifndef ETH1_CS_Pin
  #define ETH1_CS_GPIO_Port  GPIOA
  #define ETH1_CS_Pin        GPIO_PIN_15
#endif
#ifndef ETH2_CS_Pin
  #define ETH2_CS_GPIO_Port  GPIOB
  #define ETH2_CS_Pin        GPIO_PIN_5
#endif
#ifndef ETH_RST_Pin
  #define ETH_RST_GPIO_Port  GPIOC
  #define ETH_RST_Pin        GPIO_PIN_14
#endif

/* SPI2 cuelga de APB1 = 50 MHz. El W5500 admite hasta 33 MHz; 6.25 MHz sobra y tolera cables */
#define ETH_SPEED   SPI_BAUDRATEPRESCALER_8

/* Registros comunes (bloque 0) */
#define REG_MR        0x0000u   /* bit 7 = reset por software */
#define REG_GAR       0x0001u   /* gateway, 4 bytes */
#define REG_SUBR      0x0005u   /* mascara, 4 bytes */
#define REG_SHAR      0x0009u   /* MAC, 6 bytes */
#define REG_SIPR      0x000Fu   /* IP, 4 bytes */
#define REG_PHYCFGR   0x002Eu   /* bit 0 = enlace arriba */
#define REG_VERSIONR  0x0039u   /* siempre 0x04 */

/* Registros de socket */
#define SN_MR         0x0000u
#define SN_CR         0x0001u
#define SN_SR         0x0003u
#define SN_PORT       0x0004u
#define SN_TX_FSR     0x0020u
#define SN_TX_WR      0x0024u
#define SN_RX_RSR     0x0026u
#define SN_RX_RD      0x0028u
#define SN_KPALVTR    0x002Fu   /* keepalive automatico, unidades de 5 s */

/* Comandos (Sn_CR) */
#define CR_OPEN       0x01
#define CR_LISTEN     0x02
#define CR_DISCON     0x08
#define CR_CLOSE      0x10
#define CR_SEND       0x20
#define CR_RECV       0x40

/* Estados (Sn_SR) */
#define SR_CLOSED       0x00
#define SR_INIT         0x13
#define SR_LISTEN       0x14
#define SR_ESTABLISHED  0x17
#define SR_CLOSE_WAIT   0x1C

#define MR_TCP        0x01

#define MBAP_LEN      7u        /* transaccion(2) + protocolo(2) + largo(2) + unidad(1) */
#define MAX_FRAME     260u      /* largo maximo de un pedido Modbus TCP */

volatile uint8_t  eth_dbg_version = 0;
volatile uint8_t  eth_dbg_link    = 0;
volatile uint32_t modbus_requests = 0;
volatile uint32_t modbus_errors   = 0;

static bool    reset_done = false;
static uint8_t modbus_chip = 0;
static bool    modbus_ready = false;
static uint16_t regs[MODBUS_NUM_REGS];

static const uint8_t zero_block[MAX_FRAME + 16] = { 0 };

/* ------------------------------ bus SPI ------------------------------ */

static void spi_set_prescaler(uint32_t br)
{
    __HAL_SPI_DISABLE(&hspi2);
    MODIFY_REG(hspi2.Instance->CR1, SPI_CR1_BR, br);
    __HAL_SPI_ENABLE(&hspi2);
}

/* Toma el bus: espera que termine el DMA de la pantalla y fija la velocidad del W5500 */
static void bus_acquire(void)
{
    while (Display_FlushBusy())
        ProcessPendingBuffers();
    spi_set_prescaler(ETH_SPEED);
}

/* Devuelve el bus a la velocidad original (la de CubeMX, que usa la pantalla) */
static void bus_release(void)
{
    spi_set_prescaler(hspi2.Init.BaudRatePrescaler);
}

static void cs_low(uint8_t chip)
{
    if (chip == 0) HAL_GPIO_WritePin(ETH1_CS_GPIO_Port, ETH1_CS_Pin, GPIO_PIN_RESET);
    else           HAL_GPIO_WritePin(ETH2_CS_GPIO_Port, ETH2_CS_Pin, GPIO_PIN_RESET);
}

static void cs_high(uint8_t chip)
{
    if (chip == 0) HAL_GPIO_WritePin(ETH1_CS_GPIO_Port, ETH1_CS_Pin, GPIO_PIN_SET);
    else           HAL_GPIO_WritePin(ETH2_CS_GPIO_Port, ETH2_CS_Pin, GPIO_PIN_SET);
}

/* Espera sin dejar de atender al ADC */
static void wait_ms(uint32_t ms)
{
    uint32_t t0 = HAL_GetTick();
    while ((HAL_GetTick() - t0) < ms)
        ProcessPendingBuffers();
}

/* ----------------------- acceso a registros y buffers ----------------------- */
/* Estas funciones asumen que el bus ya fue tomado con bus_acquire() */

static void w_write(uint8_t chip, uint16_t addr, uint8_t block, const uint8_t *data, uint16_t len)
{
    uint8_t hdr[3] = { (uint8_t)(addr >> 8), (uint8_t)addr, (uint8_t)((block << 3) | 0x04) };

    cs_low(chip);
    HAL_SPI_Transmit(&hspi2, hdr, 3, 20);
    HAL_SPI_Transmit(&hspi2, (uint8_t *)data, len, 20);
    cs_high(chip);
}

static void w_read(uint8_t chip, uint16_t addr, uint8_t block, uint8_t *data, uint16_t len)
{
    uint8_t hdr[3] = { (uint8_t)(addr >> 8), (uint8_t)addr, (uint8_t)(block << 3) };

    cs_low(chip);
    HAL_SPI_Transmit(&hspi2, hdr, 3, 20);
    HAL_SPI_TransmitReceive(&hspi2, (uint8_t *)zero_block, data, len, 20);
    cs_high(chip);
}

static uint8_t rd8(uint8_t chip, uint16_t addr, uint8_t block)
{
    uint8_t v = 0;
    w_read(chip, addr, block, &v, 1);
    return v;
}

static void wr8(uint8_t chip, uint16_t addr, uint8_t block, uint8_t v)
{
    w_write(chip, addr, block, &v, 1);
}

static uint16_t rd16(uint8_t chip, uint16_t addr, uint8_t block)
{
    uint8_t b[2];
    w_read(chip, addr, block, b, 2);
    return (uint16_t)((b[0] << 8) | b[1]);
}

/* Los registros de 16 bits del contador cambian mientras llegan datos: se lee hasta que
 * dos lecturas seguidas coinciden (recomendacion del fabricante). */
static uint16_t rd16_stable(uint8_t chip, uint16_t addr, uint8_t block)
{
    uint16_t a = rd16(chip, addr, block);
    for (uint8_t i = 0; i < 4; i++)
    {
        uint16_t b = rd16(chip, addr, block);
        if (a == b)
            return a;
        a = b;
    }
    return a;
}

static void wr16(uint8_t chip, uint16_t addr, uint8_t block, uint16_t v)
{
    uint8_t b[2] = { (uint8_t)(v >> 8), (uint8_t)v };
    w_write(chip, addr, block, b, 2);
}

/* Bloques de un socket */
#define BLK_REG(s)  ((uint8_t)((s) * 4 + 1))
#define BLK_TX(s)   ((uint8_t)((s) * 4 + 2))
#define BLK_RX(s)   ((uint8_t)((s) * 4 + 3))

/* Manda un comando al socket y espera a que el chip lo acepte (Sn_CR vuelve a 0) */
static bool sock_cmd(uint8_t chip, uint8_t s, uint8_t cmd)
{
    wr8(chip, SN_CR, BLK_REG(s), cmd);
    uint32_t t0 = HAL_GetTick();
    while (rd8(chip, SN_CR, BLK_REG(s)) != 0)
    {
        if ((HAL_GetTick() - t0) > 20)
            return false;
    }
    return true;
}

/* ================================ W5500 ================================ */

bool Eth_Init(uint8_t chip, const eth_config_t *cfg)
{
    if (chip > 1 || cfg == NULL)
        return false;

    cs_high(0);
    cs_high(1);

    if (!reset_done)
    {
        /* Reset por hardware comun a los dos chips: 1 ms en bajo y ~60 ms para que arranque el PLL */
        HAL_GPIO_WritePin(ETH_RST_GPIO_Port, ETH_RST_Pin, GPIO_PIN_RESET);
        wait_ms(2);
        HAL_GPIO_WritePin(ETH_RST_GPIO_Port, ETH_RST_Pin, GPIO_PIN_SET);
        wait_ms(60);
        reset_done = true;
    }

    bus_acquire();

    uint8_t ver = rd8(chip, REG_VERSIONR, 0);
    eth_dbg_version = ver;
    if (ver != 0x04)
    {
        bus_release();
        return false;
    }

    /* Reset por software y espera a que se auto-limpie el bit */
    wr8(chip, REG_MR, 0, 0x80);
    uint32_t t0 = HAL_GetTick();
    while (rd8(chip, REG_MR, 0) & 0x80)
    {
        if ((HAL_GetTick() - t0) > 50)
        {
            bus_release();
            return false;
        }
    }

    w_write(chip, REG_GAR,  0, cfg->gateway, 4);
    w_write(chip, REG_SUBR, 0, cfg->mask, 4);
    w_write(chip, REG_SHAR, 0, cfg->mac, 6);
    w_write(chip, REG_SIPR, 0, cfg->ip, 4);

    eth_dbg_link = (rd8(chip, REG_PHYCFGR, 0) & 0x01) ? 1 : 0;

    bus_release();
    return true;
}

bool Eth_LinkUp(uint8_t chip)
{
    bus_acquire();
    bool up = (rd8(chip, REG_PHYCFGR, 0) & 0x01) != 0;
    bus_release();
    eth_dbg_link = up ? 1 : 0;
    return up;
}

/* ============================== Modbus TCP ============================== */

void Modbus_SetU16(uint16_t addr, uint16_t value)
{
    if (addr < MODBUS_NUM_REGS)
        regs[addr] = value;
}

void Modbus_SetFloat(uint16_t addr, float value)
{
    uint32_t raw;
    memcpy(&raw, &value, sizeof(raw));
    Modbus_SetU16(addr,     (uint16_t)(raw >> 16));
    Modbus_SetU16(addr + 1, (uint16_t)(raw & 0xFFFF));
}

void Modbus_Init(uint8_t chip)
{
    modbus_chip = chip;
    modbus_ready = true;
    /* Los sockets se abren solos en Modbus_Poll() cuando los ve cerrados */
}

/* Arma la respuesta a un pedido. Devuelve su largo total. frame = pedido completo (con MBAP). */
static uint16_t build_response(const uint8_t *req, uint8_t *resp)
{
    uint8_t  fc  = req[7];
    uint16_t len = (uint16_t)((req[4] << 8) | req[5]);   /* bytes que siguen al campo de largo */

    memcpy(resp, req, 4);       /* mismo identificador de transaccion y protocolo */
    resp[6] = req[6];           /* misma unidad */

    uint8_t exc = 0;
    if (fc != 0x03 && fc != 0x04)
        exc = 0x01;                                   /* funcion ilegal */
    else if (len != 6)
        exc = 0x03;                                   /* valor ilegal (largo del pedido) */
    else
    {
        uint16_t addr = (uint16_t)((req[8] << 8) | req[9]);
        uint16_t qty  = (uint16_t)((req[10] << 8) | req[11]);

        if (qty < 1 || qty > 125)
            exc = 0x03;
        else if ((uint32_t)addr + qty > MODBUS_NUM_REGS)
            exc = 0x02;                               /* direccion ilegal */
        else
        {
            resp[4] = 0;
            resp[5] = (uint8_t)(3 + 2 * qty);
            resp[7] = fc;
            resp[8] = (uint8_t)(2 * qty);
            for (uint16_t i = 0; i < qty; i++)
            {
                resp[9 + 2 * i]  = (uint8_t)(regs[addr + i] >> 8);
                resp[10 + 2 * i] = (uint8_t)(regs[addr + i]);
            }
            modbus_requests++;
            return (uint16_t)(9 + 2 * qty);
        }
    }

    resp[4] = 0;
    resp[5] = 3;
    resp[7] = (uint8_t)(fc | 0x80);
    resp[8] = exc;
    modbus_errors++;
    return 9;
}

/* Atiende un socket conectado: si hay un pedido completo, lo responde */
static void serve_socket(uint8_t chip, uint8_t s)
{
    uint8_t req[MAX_FRAME], resp[MAX_FRAME];

    uint16_t rsr = rd16_stable(chip, SN_RX_RSR, BLK_REG(s));
    if (rsr < MBAP_LEN)
        return;

    uint16_t rd = rd16(chip, SN_RX_RD, BLK_REG(s));
    w_read(chip, rd, BLK_RX(s), req, MBAP_LEN);

    uint16_t len = (uint16_t)((req[4] << 8) | req[5]);
    if (req[2] != 0 || req[3] != 0 || len < 2 || (6u + len) > MAX_FRAME)
    {
        /* No es Modbus TCP: se corta la conexion */
        modbus_errors++;
        sock_cmd(chip, s, CR_CLOSE);
        return;
    }

    uint16_t total = (uint16_t)(6u + len);
    if (rsr < total)
        return;   /* el pedido todavia no llego completo */

    /* Hay lugar para responder? (un pedido tarda menos que el buffer en vaciarse) */
    if (rd16_stable(chip, SN_TX_FSR, BLK_REG(s)) < 270)
        return;

    w_read(chip, rd, BLK_RX(s), req, total);
    wr16(chip, SN_RX_RD, BLK_REG(s), (uint16_t)(rd + total));
    sock_cmd(chip, s, CR_RECV);

    uint16_t rlen = build_response(req, resp);

    uint16_t wr = rd16(chip, SN_TX_WR, BLK_REG(s));
    w_write(chip, wr, BLK_TX(s), resp, rlen);
    wr16(chip, SN_TX_WR, BLK_REG(s), (uint16_t)(wr + rlen));
    sock_cmd(chip, s, CR_SEND);
}

void Modbus_Poll(void)
{
    static uint32_t last_ms = 0;

    if (!modbus_ready)
        return;

    /* Cada 2 ms alcanza (un cliente SCADA consulta mucho mas lento), y si la pantalla esta
     * mandando un bloque por DMA se pospone en vez de esperarla: asi no frena el dibujo. */
    uint32_t now = HAL_GetTick();
    if ((now - last_ms) < 2 || Display_FlushBusy())
        return;
    last_ms = now;

    uint8_t chip = modbus_chip;

    bus_acquire();

    for (uint8_t s = 0; s < MODBUS_NUM_SOCKETS; s++)
    {
        uint8_t sr = rd8(chip, SN_SR, BLK_REG(s));

        switch (sr)
        {
        case SR_CLOSED:
            wr8(chip, SN_MR, BLK_REG(s), MR_TCP);
            wr16(chip, SN_PORT, BLK_REG(s), MODBUS_PORT);
            wr8(chip, SN_KPALVTR, BLK_REG(s), 6);        /* keepalive cada 30 s: detecta clientes caidos */
            sock_cmd(chip, s, CR_OPEN);
            break;

        case SR_INIT:
            sock_cmd(chip, s, CR_LISTEN);
            break;

        case SR_ESTABLISHED:
            serve_socket(chip, s);
            break;

        case SR_CLOSE_WAIT:
            sock_cmd(chip, s, CR_DISCON);   /* el cliente cerro: cerrar de nuestro lado */
            break;

        default:
            break;   /* LISTEN y estados de cierre/conexion en curso: no hacer nada */
        }
    }

    bus_release();
}
