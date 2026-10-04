/*
 * display.h
 *
 *  Created on: 4 oct 2026
 *      Author: igles
 */

#ifndef DISPLAY_H
#define DISPLAY_H

// Driver de display TFT 320x240. Controlador: ILI9341, interfaz SPI (bus SPI2 compartido).

#include <stdint.h>

#define DISPLAY_WIDTH   320   // horizontal (apaisado)
#define DISPLAY_HEIGHT  240

#define RGB565(r, g, b) ((uint16_t)((((r) & 0xF8) << 8) | (((g) & 0xFC) << 3) | ((b) >> 3)))

#define DISPLAY_BLACK   0x0000
#define DISPLAY_WHITE   0xFFFF
#define DISPLAY_RED     0xF800
#define DISPLAY_GREEN   0x07E0
#define DISPLAY_BLUE    0x001F

void Display_Init(void);
void Display_SetWindow(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1);
void Display_FillRect(uint16_t x, uint16_t y, uint16_t w, uint16_t h, uint16_t color);
void Display_FillScreen(uint16_t color);
void Display_TestPattern(void);

uint8_t Display_FlushBusy(void);
void Display_FlushAsync(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1, const uint8_t *data, uint16_t len, void (*done_cb)(void));

#endif
