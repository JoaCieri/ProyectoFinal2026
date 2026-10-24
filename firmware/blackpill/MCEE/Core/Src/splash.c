/*
 * splash.c
 * Ver splash.h
 *
 * Lee SPLASH1.BMP, SPLASH2.BMP... fila por fila desde la SD y la manda a la pantalla con transferencias SPI
 * simples (sin LVGL ni DMA). Se usa una sola vez al arrancar, antes de que LVGL dibuje.
 */
#include "splash.h"
#include "main.h"
#include "display.h"
#include "ff.h"
#include <stdbool.h>
#include <string.h>

extern SPI_HandleTypeDef hspi2;

#define CMD_RAMWR       0x2C

volatile uint8_t splash_result = SPLASH_NOT_TRIED;
volatile uint8_t splash_count  = 0;

static FATFS    sfs;
static FIL      sfile;
static bool     shown = false;
static uint32_t shown_at = 0;

static uint8_t row_in[DISPLAY_WIDTH * 4];    /* una fila del BMP (hasta 32 bits por pixel) */
static uint8_t row_out[DISPLAY_WIDTH * 2];   /* la misma fila en RGB565, byte alto primero */

static uint16_t le16(const uint8_t *p) { return (uint16_t)(p[0] | (p[1] << 8)); }
static uint32_t le32(const uint8_t *p) { return (uint32_t)p[0] | ((uint32_t)p[1] << 8) | ((uint32_t)p[2] << 16) | ((uint32_t)p[3] << 24); }

/* Manda una fila a la pantalla en (x, y). El bus queda libre entre filas para leer la SD. */
static void send_row(uint16_t x, uint16_t y, uint16_t w)
{
    uint8_t cmd = CMD_RAMWR;

    Display_SetWindow(x, y, (uint16_t)(x + w - 1), y);

    HAL_GPIO_WritePin(DISP_DC_GPIO_Port, DISP_DC_Pin, GPIO_PIN_RESET);   /* comando */
    HAL_GPIO_WritePin(DISP_CS_GPIO_Port, DISP_CS_Pin, GPIO_PIN_RESET);
    HAL_SPI_Transmit(&hspi2, &cmd, 1, 10);
    HAL_GPIO_WritePin(DISP_DC_GPIO_Port, DISP_DC_Pin, GPIO_PIN_SET);     /* datos */
    HAL_SPI_Transmit(&hspi2, row_out, (uint16_t)(w * 2), 50);
    HAL_GPIO_WritePin(DISP_CS_GPIO_Port, DISP_CS_Pin, GPIO_PIN_SET);
}

static uint8_t draw_bmp(void)
{
    uint8_t h[54];
    UINT br;

    if (f_read(&sfile, h, sizeof(h), &br) != FR_OK || br != sizeof(h) || h[0] != 'B' || h[1] != 'M')
        return SPLASH_BAD_FORMAT;

    uint32_t data_off = le32(h + 10);
    int32_t  w        = (int32_t)le32(h + 18);
    int32_t  hgt      = (int32_t)le32(h + 22);
    uint16_t bpp      = le16(h + 28);
    uint32_t comp     = le32(h + 30);

    bool top_down = (hgt < 0);           /* altura negativa: la primera fila del archivo es la de arriba */
    if (top_down)
        hgt = -hgt;

    if (w <= 0 || hgt <= 0 || w > DISPLAY_WIDTH || hgt > DISPLAY_HEIGHT)
        return SPLASH_BAD_FORMAT;
    if (!((bpp == 24 && comp == 0) || (bpp == 32 && (comp == 0 || comp == 3))))
        return SPLASH_BAD_FORMAT;        /* 0 = BI_RGB, 3 = BI_BITFIELDS (Paint usa este en 32 bits) */

    uint32_t bytes_pp = bpp / 8u;
    uint32_t stride   = ((uint32_t)w * bytes_pp + 3u) & ~3u;   /* las filas se rellenan a multiplo de 4 */
    uint16_t x0 = (uint16_t)((DISPLAY_WIDTH  - w) / 2);
    uint16_t y0 = (uint16_t)((DISPLAY_HEIGHT - hgt) / 2);

    if (w < DISPLAY_WIDTH || hgt < DISPLAY_HEIGHT)
        Display_FillScreen(DISPLAY_BLACK);                     /* imagen chica: fondo negro y centrada */

    if (f_lseek(&sfile, data_off) != FR_OK)
        return SPLASH_READ_ERROR;

    for (int32_t r = 0; r < hgt; r++)
    {
        if (f_read(&sfile, row_in, stride, &br) != FR_OK || br != stride)
            return SPLASH_READ_ERROR;

        /* BMP guarda azul, verde, rojo (y un byte de relleno en 32 bits) */
        for (int32_t i = 0; i < w; i++)
        {
            const uint8_t *px = &row_in[i * bytes_pp];
            uint16_t c = (uint16_t)(((px[2] & 0xF8) << 8) | ((px[1] & 0xFC) << 3) | (px[0] >> 3));
            row_out[2 * i]     = (uint8_t)(c >> 8);
            row_out[2 * i + 1] = (uint8_t)c;
        }

        int32_t y = top_down ? r : (hgt - 1 - r);              /* BMP normal: de abajo hacia arriba */
        send_row(x0, (uint16_t)(y0 + y), (uint16_t)w);
    }
    return SPLASH_SHOWN;
}

/* Archivos que se buscan, en orden. Los que no estan se saltean. */
static const char *const splash_files[] = { "SPLASH1.BMP", "SPLASH2.BMP", "SPLASH3.BMP", "SPLASH4.BMP" };
#define SPLASH_FILES   (sizeof(splash_files) / sizeof(splash_files[0]))

static uint8_t next_idx = 0;
static bool    mounted  = false;

/* Muestra la siguiente imagen que exista. Devuelve true si mostro alguna. */
static bool show_next(void)
{
    while (next_idx < SPLASH_FILES)
    {
        const char *name = splash_files[next_idx++];

        if (f_open(&sfile, name, FA_READ) != FR_OK)
        {
            if (splash_result == SPLASH_NOT_TRIED)
                splash_result = SPLASH_NO_FILE;
            continue;
        }
        uint8_t r = draw_bmp();
        f_close(&sfile);

        if (r == SPLASH_SHOWN)
        {
            splash_result = SPLASH_SHOWN;
            splash_count++;
            shown = true;
            shown_at = HAL_GetTick();
            return true;
        }
        splash_result = r;        /* formato invalido o error de lectura: probar con la siguiente */
    }
    return false;
}

static void release_card(void)
{
    if (mounted)
        f_mount(NULL, "", 0);     /* test_logger la vuelve a montar con su propio objeto */
    mounted = false;
}

void Splash_Show(void)
{
    shown = false;
    next_idx = 0;
    splash_count = 0;
    splash_result = SPLASH_NOT_TRIED;

    if (f_mount(&sfs, "", 1) != FR_OK)
    {
        splash_result = SPLASH_NO_SD;
        f_mount(NULL, "", 0);
        return;
    }
    mounted = true;

    if (!show_next())
        release_card();           /* no hay ninguna imagen: seguir sin esperar */
}

void Splash_Finish(void)
{
    while (shown)
    {
        while ((HAL_GetTick() - shown_at) < SPLASH_MS)
        {
            /* el ADC todavia no arranco: solo esperar */
        }
        shown = false;
        if (mounted)
            show_next();          /* si hay otra imagen, la muestra y vuelve a esperar */
    }
    release_card();
}
