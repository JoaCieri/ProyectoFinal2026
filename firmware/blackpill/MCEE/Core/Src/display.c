/*
 * display.c
 *
 *  Created on: 4 oct 2026
 *      Author: igles
 */

#include "display.h"
#include "main.h"
extern SPI_HandleTypeDef hspi2;

// Orientación: 0x28 = apaisado. Si la imagen sale espejada o rotada, probar 0xE8, 0x48 o 0x88.
#define DISPLAY_MADCTL_VALUE  0x28

// Comandos del ILI9341
#define CMD_SWRESET  0x01
#define CMD_SLPOUT   0x11
#define CMD_DISPON   0x29
#define CMD_CASET    0x2A
#define CMD_PASET    0x2B
#define CMD_RAMWR    0x2C
#define CMD_MADCTL   0x36
#define CMD_PIXFMT   0x3A

typedef struct {
    uint8_t cmd;
    uint8_t n;
    uint8_t data[15];
} init_cmd_t;

static const init_cmd_t init_seq[] = {
    {0xCF, 3,  {0x00, 0xC1, 0x30}},
    {0xED, 4,  {0x64, 0x03, 0x12, 0x81}},
    {0xE8, 3,  {0x85, 0x00, 0x78}},
    {0xCB, 5,  {0x39, 0x2C, 0x00, 0x34, 0x02}},
    {0xF7, 1,  {0x20}},
    {0xEA, 2,  {0x00, 0x00}},
    {0xC0, 1,  {0x23}},                 // Power control 1
    {0xC1, 1,  {0x10}},                 // Power control 2
    {0xC5, 2,  {0x3E, 0x28}},           // VCOM 1
    {0xC7, 1,  {0x86}},                 // VCOM 2
    {0xB1, 2,  {0x00, 0x18}},           // Frame rate
    {0xB6, 3,  {0x08, 0x82, 0x27}},     // Display function
    {0xF2, 1,  {0x00}},                 // 3-gamma off
    {0x26, 1,  {0x01}},                 // Gamma curve
    {0xE0, 15, {0x0F, 0x31, 0x2B, 0x0C, 0x0E, 0x08, 0x4E, 0xF1,
                0x37, 0x07, 0x10, 0x03, 0x0E, 0x09, 0x00}},   // Gamma +
    {0xE1, 15, {0x00, 0x0E, 0x14, 0x03, 0x11, 0x07, 0x31, 0xC1,
                0x48, 0x08, 0x0F, 0x0C, 0x31, 0x36, 0x0F}},   // Gamma -
};

static uint8_t line_buf[DISPLAY_WIDTH * 2];

static inline void cs_low(void)  { HAL_GPIO_WritePin(DISP_CS_GPIO_Port, DISP_CS_Pin, GPIO_PIN_RESET); }
static inline void cs_high(void) { HAL_GPIO_WritePin(DISP_CS_GPIO_Port, DISP_CS_Pin, GPIO_PIN_SET); }
static inline void dc_cmd(void)  { HAL_GPIO_WritePin(DISP_DC_GPIO_Port, DISP_DC_Pin, GPIO_PIN_RESET); }
static inline void dc_data(void) { HAL_GPIO_WritePin(DISP_DC_GPIO_Port, DISP_DC_Pin, GPIO_PIN_SET); }

static void write_cmd(uint8_t cmd)
{
    dc_cmd();
    cs_low();
    HAL_SPI_Transmit(&hspi2, &cmd, 1, HAL_MAX_DELAY);
    cs_high();
}

static void write_data(const uint8_t *data, uint16_t len)
{
    dc_data();
    cs_low();
    HAL_SPI_Transmit(&hspi2, (uint8_t *)data, len, HAL_MAX_DELAY);
    cs_high();
}

static void write_cmd_data(uint8_t cmd, const uint8_t *data, uint8_t n)
{
    write_cmd(cmd);
    if (n) write_data(data, n);
}

void Display_Init(void)
{
    // Reset por hardware
    HAL_GPIO_WritePin(DISP_RST_GPIO_Port, DISP_RST_Pin, GPIO_PIN_RESET);
    HAL_Delay(10);
    HAL_GPIO_WritePin(DISP_RST_GPIO_Port, DISP_RST_Pin, GPIO_PIN_SET);
    HAL_Delay(120);

    write_cmd(CMD_SWRESET);
    HAL_Delay(150);

    for (uint32_t i = 0; i < sizeof(init_seq) / sizeof(init_seq[0]); i++) {
        write_cmd_data(init_seq[i].cmd, init_seq[i].data, init_seq[i].n);
    }

    uint8_t madctl = DISPLAY_MADCTL_VALUE;
    write_cmd_data(CMD_MADCTL, &madctl, 1);

    uint8_t pixfmt = 0x55;    // RGB565, 16 bits por pixel
    write_cmd_data(CMD_PIXFMT, &pixfmt, 1);

    write_cmd(CMD_SLPOUT);
    HAL_Delay(120);
    write_cmd(CMD_DISPON);
    HAL_Delay(20);
}

void Display_SetWindow(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1)
{
    uint8_t col[4] = { x0 >> 8, x0 & 0xFF, x1 >> 8, x1 & 0xFF };
    uint8_t row[4] = { y0 >> 8, y0 & 0xFF, y1 >> 8, y1 & 0xFF };
    write_cmd_data(CMD_CASET, col, 4);
    write_cmd_data(CMD_PASET, row, 4);
}

void Display_FillRect(uint16_t x, uint16_t y, uint16_t w, uint16_t h, uint16_t color)
{
    if (x >= DISPLAY_WIDTH || y >= DISPLAY_HEIGHT || w == 0 || h == 0) return;
    if (x + w > DISPLAY_WIDTH)  w = DISPLAY_WIDTH - x;
    if (y + h > DISPLAY_HEIGHT) h = DISPLAY_HEIGHT - y;

    uint8_t hi = color >> 8, lo = color & 0xFF;
    for (uint16_t i = 0; i < DISPLAY_WIDTH; i++) {
        line_buf[2 * i]     = hi;
        line_buf[2 * i + 1] = lo;
    }

    Display_SetWindow(x, y, x + w - 1, y + h - 1);

    uint8_t cmd = CMD_RAMWR;
    dc_cmd();
    cs_low();
    HAL_SPI_Transmit(&hspi2, &cmd, 1, HAL_MAX_DELAY);
    dc_data();

    uint32_t remaining = (uint32_t)w * h;
    while (remaining) {
        uint16_t px = (remaining > DISPLAY_WIDTH) ? DISPLAY_WIDTH : (uint16_t)remaining;
        HAL_SPI_Transmit(&hspi2, line_buf, px * 2, HAL_MAX_DELAY);
        remaining -= px;
    }
    cs_high();
}

void Display_FillScreen(uint16_t color)
{
    Display_FillRect(0, 0, DISPLAY_WIDTH, DISPLAY_HEIGHT, color);
}

void Display_TestPattern(void)
{
    Display_FillScreen(DISPLAY_BLACK);
    Display_FillRect(0,   0, 107, 240, DISPLAY_RED);
    Display_FillRect(107, 0, 107, 240, DISPLAY_GREEN);
    Display_FillRect(214, 0, 106, 240, DISPLAY_BLUE);
    Display_FillRect(0,   0, 320, 4,   DISPLAY_WHITE);   // borde superior, sirve para ver la orientación
}

// ---- Envío por DMA (usado por LVGL) ----
static volatile uint8_t flush_busy = 0;
static void (*flush_done_cb)(void) = NULL;

uint8_t Display_FlushBusy(void)
{
    return flush_busy;
}

// len en bytes, máximo 65535 (límite de una transferencia DMA)
void Display_FlushAsync(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1,
                        const uint8_t *data, uint16_t len, void (*done_cb)(void))
{
    Display_SetWindow(x0, y0, x1, y1);
    flush_done_cb = done_cb;

    uint8_t cmd = CMD_RAMWR;
    dc_cmd();
    cs_low();
    HAL_SPI_Transmit(&hspi2, &cmd, 1, HAL_MAX_DELAY);
    dc_data();

    flush_busy = 1;
    if (HAL_SPI_Transmit_DMA(&hspi2, (uint8_t *)data, len) != HAL_OK) {
        cs_high();
        flush_busy = 0;
        if (flush_done_cb) flush_done_cb();
    }
}

void HAL_SPI_TxCpltCallback(SPI_HandleTypeDef *hspi)
{
    if (hspi->Instance == SPI2) {
        cs_high();
        flush_busy = 0;
        if (flush_done_cb) flush_done_cb();
    }
}

