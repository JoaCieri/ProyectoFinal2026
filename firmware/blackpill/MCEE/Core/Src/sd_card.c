/*
 * sd_card.c
 * Ver sd_card.h
 *
 * Basado en el protocolo SPI de la especificacion SD (CMD0/CMD8/ACMD41/CMD58, lectura
 * y escritura simple y multiple), con la estructura clasica de los drivers MMC de ChaN.
 */
#include "sd_card.h"
#include "main.h"
#include "display.h"
#include "processing.h"

extern SPI_HandleTypeDef hspi2;

/* SPI2 cuelga de APB1 = 50 MHz */
#define SD_SPEED_INIT   SPI_BAUDRATEPRESCALER_128   /* 390 kHz: el estandar pide <= 400 kHz al inicializar */
#define SD_SPEED_RUN    SPI_BAUDRATEPRESCALER_8     /* 6.25 MHz. Con buen cableado probar _4 (12.5) o _2 (25 MHz) */

#define SD_CS_LOW()     HAL_GPIO_WritePin(SD_CS_GPIO_Port, SD_CS_Pin, GPIO_PIN_RESET)
#define SD_CS_HIGH()    HAL_GPIO_WritePin(SD_CS_GPIO_Port, SD_CS_Pin, GPIO_PIN_SET)

/* Comandos (el bit 7 marca un comando "ACMD": se antepone CMD55) */
#define CMD0     0
#define CMD8     8
#define CMD9     9
#define CMD12    12
#define CMD16    16
#define CMD17    17
#define CMD18    18
#define CMD24    24
#define CMD25    25
#define CMD55    55
#define CMD58    58
#define ACMD23   (0x80 | 23)
#define ACMD41   (0x80 | 41)

/* Tipo de tarjeta */
#define CT_SD1     0x01   /* SD v1 (SDSC)  */
#define CT_SD2     0x02   /* SD v2         */
#define CT_BLOCK   0x04   /* direccionamiento por bloque (SDHC/SDXC) */

#define INIT_TIMEOUT_MS    1000
#define READY_TIMEOUT_MS   500

static uint8_t  card_type    = 0;
static uint32_t sector_count = 0;
static bool     initialized  = false;

/* Diagnostico: respuestas crudas del ultimo SD_Init() (mirar en Expressions) */
volatile uint8_t sd_dbg_cmd0    = 0;      /* R1 de CMD0: esperado 0x01 */
volatile uint8_t sd_dbg_cmd8    = 0;      /* R1 de CMD8: 0x01 = SD v2, 0x05 = SD v1/MMC */
volatile uint8_t sd_dbg_echo[4] = {0};    /* eco de CMD8: esperado 00 00 01 AA */
volatile uint8_t sd_dbg_acmd41  = 0;      /* ultimo R1 de ACMD41: esperado 0x00 al final */

/* Bloque de 0xFF para generar los clocks durante las lecturas */
static const uint8_t ff_block[SD_SECTOR_SIZE] = { [0 ... SD_SECTOR_SIZE - 1] = 0xFF };

/* ------------------------------ bus SPI ------------------------------ */

static void spi_set_prescaler(uint32_t br)
{
    __HAL_SPI_DISABLE(&hspi2);
    MODIFY_REG(hspi2.Instance->CR1, SPI_CR1_BR, br);
    __HAL_SPI_ENABLE(&hspi2);
}

/* Toma el bus: espera que termine el DMA de la pantalla y fija la velocidad de la SD */
static void bus_acquire(uint32_t br)
{
    while (Display_FlushBusy())
        ProcessPendingBuffers();
    spi_set_prescaler(br);
}

/* Devuelve el bus a la velocidad original (la de CubeMX, que usa la pantalla) */
static void bus_release(void)
{
    spi_set_prescaler(hspi2.Init.BaudRatePrescaler);
}

static uint8_t spi_xfer(uint8_t tx)
{
    uint8_t rx = 0xFF;
    HAL_SPI_TransmitReceive(&hspi2, &tx, &rx, 1, 10);
    return rx;
}

/* ------------------------- seleccion y comandos ------------------------- */

/* La tarjeta mantiene MISO en 0 mientras esta ocupada; se espera 0xFF */
static bool wait_ready(uint32_t timeout_ms)
{
    uint32_t t0 = HAL_GetTick();
    while (spi_xfer(0xFF) != 0xFF)
    {
        if ((HAL_GetTick() - t0) > timeout_ms)
            return false;
        ProcessPendingBuffers();   /* no desatender al ADC mientras la tarjeta escribe */
    }
    return true;
}

static void deselect(void)
{
    SD_CS_HIGH();
    spi_xfer(0xFF);   /* libera MISO */
}

static bool select_card(void)
{
    SD_CS_LOW();
    spi_xfer(0xFF);
    if (wait_ready(READY_TIMEOUT_MS))
        return true;
    deselect();
    return false;
}

/* Envia un comando y devuelve la respuesta R1 (0xFF = sin respuesta) */
static uint8_t send_cmd(uint8_t cmd, uint32_t arg)
{
    uint8_t r;

    if (cmd & 0x80)
    {
        cmd &= 0x7F;
        r = send_cmd(CMD55, 0);
        if (r > 1)
            return r;
    }

    if (cmd != CMD12)   /* CMD12 se envia con la tarjeta ya seleccionada */
    {
        deselect();
        if (!select_card())
            return 0xFF;
    }

    uint8_t crc = 0x01;
    if (cmd == CMD0) crc = 0x95;   /* en modo SPI solo se verifica el CRC de CMD0 y CMD8 */
    if (cmd == CMD8) crc = 0x87;

    spi_xfer(0x40 | cmd);
    spi_xfer((uint8_t)(arg >> 24));
    spi_xfer((uint8_t)(arg >> 16));
    spi_xfer((uint8_t)(arg >> 8));
    spi_xfer((uint8_t)arg);
    spi_xfer(crc);

    if (cmd == CMD12)
        spi_xfer(0xFF);   /* descartar el byte de relleno */

    uint8_t n = 10;
    do
    {
        r = spi_xfer(0xFF);
    } while ((r & 0x80) && --n);

    return r;
}

/* ------------------------------ bloques ------------------------------ */

static bool read_datablock(uint8_t *buf, uint16_t len)
{
    uint8_t token;
    uint32_t t0 = HAL_GetTick();

    do
    {
        token = spi_xfer(0xFF);
        if (token != 0xFF)
            break;
        ProcessPendingBuffers();
    } while ((HAL_GetTick() - t0) < 200);

    if (token != 0xFE)
        return false;

    if (HAL_SPI_TransmitReceive(&hspi2, (uint8_t *)ff_block, buf, len, 100) != HAL_OK)
        return false;

    spi_xfer(0xFF);   /* CRC, se ignora */
    spi_xfer(0xFF);
    return true;
}

/* token: 0xFE = bloque simple, 0xFC = bloque de escritura multiple, 0xFD = fin de multiple */
static bool write_datablock(const uint8_t *buf, uint8_t token)
{
    if (!wait_ready(READY_TIMEOUT_MS))
        return false;

    spi_xfer(token);
    if (token != 0xFD)
    {
        if (HAL_SPI_Transmit(&hspi2, (uint8_t *)buf, SD_SECTOR_SIZE, 100) != HAL_OK)
            return false;
        spi_xfer(0xFF);   /* CRC dummy */
        spi_xfer(0xFF);
        if ((spi_xfer(0xFF) & 0x1F) != 0x05)   /* respuesta de datos: 0b00101 = aceptado */
            return false;
    }
    return true;
}

/* Cantidad de sectores a partir del registro CSD */
static uint32_t csd_sector_count(const uint8_t *csd)
{
    if ((csd[0] >> 6) == 1)   /* CSD v2 (SDHC/SDXC) */
    {
        uint32_t c_size = ((uint32_t)(csd[7] & 0x3F) << 16) | ((uint32_t)csd[8] << 8) | csd[9];
        return (c_size + 1) << 10;
    }

    /* CSD v1 (SDSC) */
    uint32_t n = (csd[5] & 15) + ((csd[10] & 128) >> 7) + ((csd[9] & 3) << 1) + 2;
    uint32_t c_size = (csd[8] >> 6) + ((uint32_t)csd[7] << 2) + ((uint32_t)(csd[6] & 3) << 10) + 1;
    return c_size << (n - 9);
}

/* ------------------------------- API ------------------------------- */

sd_result_t SD_Init(void)
{
    uint8_t ocr[4];
    uint8_t csd[16];
    uint8_t type = 0;
    sd_result_t res = SD_ERR_NO_CARD;

    initialized  = false;
    card_type    = 0;
    sector_count = 0;

    bus_acquire(SD_SPEED_INIT);

    SD_CS_HIGH();
    for (uint8_t i = 0; i < 10; i++)   /* >= 74 clocks con CS en alto */
        spi_xfer(0xFF);

    sd_dbg_cmd0 = send_cmd(CMD0, 0);
    if (sd_dbg_cmd0 == 0x01)   /* tarjeta en estado idle */
    {
        uint32_t t0 = HAL_GetTick();

        sd_dbg_cmd8 = send_cmd(CMD8, 0x1AA);
        if (sd_dbg_cmd8 == 0x01)   /* SD v2: 2.7-3.6 V, patron de verificacion 0xAA */
        {
            for (uint8_t i = 0; i < 4; i++)
            {
                ocr[i] = spi_xfer(0xFF);
                sd_dbg_echo[i] = ocr[i];
            }

            if (ocr[2] != 0x01 || ocr[3] != 0xAA)
            {
                res = SD_ERR_UNSUPPORTED;
            }
            else
            {
                res = SD_ERR_TIMEOUT;
                while ((HAL_GetTick() - t0) < INIT_TIMEOUT_MS)
                {
                    sd_dbg_acmd41 = send_cmd(ACMD41, 1UL << 30);   /* HCS: soportamos SDHC */
                    if (sd_dbg_acmd41 == 0)
                    {
                        res = SD_OK;
                        break;
                    }
                    ProcessPendingBuffers();
                }

                if (res == SD_OK)
                {
                    if (send_cmd(CMD58, 0) == 0)   /* leer OCR: el bit CCS dice si es SDHC */
                    {
                        for (uint8_t i = 0; i < 4; i++)
                            ocr[i] = spi_xfer(0xFF);
                        type = (ocr[0] & 0x40) ? (CT_SD2 | CT_BLOCK) : CT_SD2;
                    }
                    else
                    {
                        res = SD_ERR_CMD;
                    }
                }
            }
        }
        else   /* SD v1 (o MMC, que no soportamos) */
        {
            res = SD_ERR_TIMEOUT;
            while ((HAL_GetTick() - t0) < INIT_TIMEOUT_MS)
            {
                uint8_t r = send_cmd(ACMD41, 0);
                sd_dbg_acmd41 = r;
                if (r == 0)
                {
                    res = SD_OK;
                    break;
                }
                if (r > 1)   /* no entiende ACMD41: es una MMC */
                {
                    res = SD_ERR_UNSUPPORTED;
                    break;
                }
                ProcessPendingBuffers();
            }

            if (res == SD_OK)
            {
                if (send_cmd(CMD16, SD_SECTOR_SIZE) == 0)
                    type = CT_SD1;
                else
                    res = SD_ERR_CMD;
            }
        }
    }

    if (res == SD_OK)
    {
        spi_set_prescaler(SD_SPEED_RUN);   /* ya inicializada: subir la velocidad */

        if (send_cmd(CMD9, 0) == 0 && read_datablock(csd, 16))
        {
            card_type    = type;
            sector_count = csd_sector_count(csd);
            initialized  = true;
        }
        else
        {
            res = SD_ERR_CMD;
        }
    }

    deselect();
    bus_release();
    return res;
}

bool SD_IsReady(void)
{
    return initialized;
}

uint32_t SD_GetSectorCount(void)
{
    return sector_count;
}

sd_result_t SD_ReadBlocks(uint32_t sector, uint8_t *buf, uint32_t count)
{
    if (!initialized)
        return SD_ERR_NOT_INIT;
    if (count == 0 || sector >= sector_count || count > (sector_count - sector))
        return SD_ERR_PARAM;

    sd_result_t res = SD_ERR_READ;
    uint32_t addr = (card_type & CT_BLOCK) ? sector : sector * SD_SECTOR_SIZE;

    bus_acquire(SD_SPEED_RUN);

    if (count == 1)
    {
        if (send_cmd(CMD17, addr) == 0 && read_datablock(buf, SD_SECTOR_SIZE))
            res = SD_OK;
    }
    else if (send_cmd(CMD18, addr) == 0)
    {
        uint32_t n = 0;
        while (n < count && read_datablock(buf + n * SD_SECTOR_SIZE, SD_SECTOR_SIZE))
            n++;
        send_cmd(CMD12, 0);   /* cortar la lectura multiple */
        if (n == count)
            res = SD_OK;
    }

    deselect();
    bus_release();
    return res;
}

sd_result_t SD_WriteBlocks(uint32_t sector, const uint8_t *buf, uint32_t count)
{
    if (!initialized)
        return SD_ERR_NOT_INIT;
    if (count == 0 || sector >= sector_count || count > (sector_count - sector))
        return SD_ERR_PARAM;

    sd_result_t res = SD_ERR_WRITE;
    uint32_t addr = (card_type & CT_BLOCK) ? sector : sector * SD_SECTOR_SIZE;

    bus_acquire(SD_SPEED_RUN);

    if (count == 1)
    {
        if (send_cmd(CMD24, addr) == 0 && write_datablock(buf, 0xFE))
            res = SD_OK;
    }
    else
    {
        send_cmd(ACMD23, count);   /* aviso de pre-borrado: acelera la escritura multiple */
        if (send_cmd(CMD25, addr) == 0)
        {
            uint32_t n = 0;
            while (n < count && write_datablock(buf + n * SD_SECTOR_SIZE, 0xFC))
                n++;
            if (write_datablock(NULL, 0xFD) && n == count)   /* token de fin */
                res = SD_OK;
        }
    }

    deselect();
    bus_release();
    return res;
}

sd_result_t SD_Sync(void)
{
    if (!initialized)
        return SD_ERR_NOT_INIT;

    bus_acquire(SD_SPEED_RUN);
    bool ok = select_card();   /* espera a que MISO vuelva a 0xFF */
    if (ok)
        deselect();
    bus_release();
    return ok ? SD_OK : SD_ERR_TIMEOUT;
}
