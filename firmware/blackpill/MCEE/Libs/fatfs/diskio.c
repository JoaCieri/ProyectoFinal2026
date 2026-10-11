/*
 * diskio.c
 * Capa entre FatFs y el driver de bajo nivel sd_card (SPI2).
 *
 * Una sola unidad (pdrv 0). Entre una operacion y otra se atiende al ADC
 * (ProcessPendingBuffers) porque FatFs puede encadenar varias lecturas/escrituras
 * seguidas (por ejemplo al crear un archivo) y el plazo por bloque es de 25.6 ms.
 *
 * get_fattime() entrega la fecha y hora del DS3231 para los archivos.
 */
#include "ff.h"
#include "diskio.h"
#include "sd_card.h"
#include "i2c_devices.h"
#include "processing.h"

DSTATUS disk_status(BYTE pdrv)
{
    if (pdrv != 0)
        return STA_NOINIT;
    return SD_IsReady() ? 0 : STA_NOINIT;
}

DSTATUS disk_initialize(BYTE pdrv)
{
    if (pdrv != 0)
        return STA_NOINIT;
    /* FatFs llama aca cada vez que monta: se reinicia siempre la tarjeta, asi tambien
     * funciona despues de sacarla y ponerla (o cambiarla) con el equipo encendido. */
    return (SD_Init() == SD_OK) ? 0 : STA_NOINIT;
}

DRESULT disk_read(BYTE pdrv, BYTE *buff, LBA_t sector, UINT count)
{
    if (pdrv != 0 || count == 0)
        return RES_PARERR;
    if (!SD_IsReady())
        return RES_NOTRDY;

    ProcessPendingBuffers();
    return (SD_ReadBlocks((uint32_t)sector, buff, count) == SD_OK) ? RES_OK : RES_ERROR;
}

DRESULT disk_write(BYTE pdrv, const BYTE *buff, LBA_t sector, UINT count)
{
    if (pdrv != 0 || count == 0)
        return RES_PARERR;
    if (!SD_IsReady())
        return RES_NOTRDY;

    ProcessPendingBuffers();
    return (SD_WriteBlocks((uint32_t)sector, buff, count) == SD_OK) ? RES_OK : RES_ERROR;
}

DRESULT disk_ioctl(BYTE pdrv, BYTE cmd, void *buff)
{
    if (pdrv != 0)
        return RES_PARERR;
    if (!SD_IsReady())
        return RES_NOTRDY;

    switch (cmd)
    {
    case CTRL_SYNC:
        return (SD_Sync() == SD_OK) ? RES_OK : RES_ERROR;

    case GET_SECTOR_COUNT:
        *(LBA_t *)buff = SD_GetSectorCount();
        return RES_OK;

    case GET_SECTOR_SIZE:
        *(WORD *)buff = SD_SECTOR_SIZE;
        return RES_OK;

    case GET_BLOCK_SIZE:
        *(DWORD *)buff = 1;   /* tamano de bloque de borrado desconocido (solo lo usa f_mkfs) */
        return RES_OK;

    default:
        return RES_PARERR;
    }
}

/* Fecha y hora para los archivos: bits 31-25 anio desde 1980, 24-21 mes, 20-16 dia,
 * 15-11 hora, 10-5 minuto, 4-0 segundos/2. Si el RTC falla, 01/01/2025 00:00:00. */
DWORD get_fattime(void)
{
    rtc_time_t t;

    if (!DS3231_GetTime(&t) || t.year < 1980)
        return ((DWORD)(2025 - 1980) << 25) | (1UL << 21) | (1UL << 16);

    return ((DWORD)(t.year - 1980) << 25)
         | ((DWORD)t.month << 21)
         | ((DWORD)t.day   << 16)
         | ((DWORD)t.hour  << 11)
         | ((DWORD)t.min   << 5)
         | ((DWORD)t.sec   >> 1);
}
