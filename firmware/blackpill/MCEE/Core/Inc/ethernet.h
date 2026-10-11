/*
 * ethernet.h
 * Driver minimo del W5500 (SPI2, compartido con pantalla y SD) y servidor Modbus TCP.
 *
 *   ETH1_CS = PA15, ETH2_CS = PB5, ETH_RST = PC14 (reset comun a los dos chips).
 *
 * El servidor Modbus usa 4 sockets escuchando en el puerto 502 (hasta 4 clientes a la vez)
 * y responde lectura de registros (funciones 0x03 y 0x04). Las dos funciones leen la
 * misma tabla de registros, que el firmware llena con Modbus_SetU16 / Modbus_SetFloat.
 * Escritura: no soportada (responde "funcion ilegal").
 *
 * Todo es no bloqueante salvo Eth_Init (unos 100 ms). Llamar Modbus_Poll() desde el lazo principal.
 */
#ifndef ETHERNET_H
#define ETHERNET_H

#include <stdint.h>
#include <stdbool.h>

typedef struct
{
    uint8_t mac[6];
    uint8_t ip[4];
    uint8_t gateway[4];
    uint8_t mask[4];
} eth_config_t;

/* ============================ W5500 ============================ */

/* chip: 0 = ETH1, 1 = ETH2. Hace el reset por hardware (una sola vez), verifica el chip
 * (registro de version = 0x04) y carga la configuracion de red.
 * Devuelve false si el chip no responde. */
bool Eth_Init(uint8_t chip, const eth_config_t *cfg);
bool Eth_LinkUp(uint8_t chip);   /* true si hay cable conectado y enlace establecido */

/* Para mirar en Expressions despues de Eth_Init() */
extern volatile uint8_t eth_dbg_version;   /* esperado: 4 */
extern volatile uint8_t eth_dbg_link;      /* 1 = enlace arriba */

/* ========================= Modbus TCP ========================= */

#define MODBUS_PORT        502u
#define MODBUS_NUM_REGS    64u     /* direcciones 0..63 */
#define MODBUS_NUM_SOCKETS 4u      /* sockets 0..3 del chip elegido */

void Modbus_Init(uint8_t chip);    /* abre los sockets; llamar despues de Eth_Init() */
void Modbus_Poll(void);            /* atiende conexiones y pedidos; llamar en cada vuelta del lazo (internamente corre cada 2 ms) */

void Modbus_SetU16(uint16_t addr, uint16_t value);
void Modbus_SetFloat(uint16_t addr, float value);   /* ocupa 2 registros: palabra alta primero */

/* Contadores para depurar (Expressions) */
extern volatile uint32_t modbus_requests;   /* pedidos respondidos bien */
extern volatile uint32_t modbus_errors;     /* pedidos respondidos con excepcion o descartados */

#endif /* ETHERNET_H */
