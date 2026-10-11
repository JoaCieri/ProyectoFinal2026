/*
 * sd_card.h
 * Driver de tarjeta SD / SDHC en modo SPI sobre SPI2 (PB13 SCK, PB14 MISO, PB15 MOSI, CS = SD_CS).
 * Lee y escribe sectores de 512 bytes. Es la capa de bajo nivel para FatFs.
 *
 * El bus SPI2 es compartido con la pantalla (DMA) y los W5500: cada operacion espera
 * que termine el DMA de la pantalla, usa su propia velocidad y deja el SPI como estaba.
 * Mientras espera a la tarjeta sigue atendiendo los bloques del ADC (ProcessPendingBuffers).
 *
 * Todas las funciones son bloqueantes y se llaman SOLO desde el lazo principal.
 */
#ifndef SD_CARD_H
#define SD_CARD_H

#include <stdint.h>
#include <stdbool.h>

#define SD_SECTOR_SIZE   512u

typedef enum
{
    SD_OK = 0,
    SD_ERR_NO_CARD,       /* la tarjeta no responde (no hay tarjeta o cableado) */
    SD_ERR_TIMEOUT,       /* la tarjeta no termino de inicializar a tiempo */
    SD_ERR_UNSUPPORTED,   /* tarjeta no soportada (MMC, o tension incompatible) */
    SD_ERR_CMD,           /* respuesta inesperada a un comando */
    SD_ERR_READ,
    SD_ERR_WRITE,
    SD_ERR_PARAM,         /* sector fuera de rango o cantidad cero */
    SD_ERR_NOT_INIT       /* falta llamar a SD_Init() */
} sd_result_t;

/* Inicializa la tarjeta (tarda entre 50 y 300 ms; hasta ~0.5 s si no hay tarjeta). */
sd_result_t SD_Init(void);

bool        SD_IsReady(void);
uint32_t    SD_GetSectorCount(void);   /* cantidad de sectores de 512 bytes */

sd_result_t SD_ReadBlocks(uint32_t sector, uint8_t *buf, uint32_t count);
sd_result_t SD_WriteBlocks(uint32_t sector, const uint8_t *buf, uint32_t count);

/* Espera a que la tarjeta termine de escribir internamente (usar antes de sacarla o apagar). */
sd_result_t SD_Sync(void);

#endif /* SD_CARD_H */
