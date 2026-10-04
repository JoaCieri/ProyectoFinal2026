/*
 * lvgl_port.c
 *
 *  Created on: 4 oct 2026
 *      Author: igles
 */

#include "lvgl_port.h"
#include "lvgl.h"
#include "main.h"
#include "display.h"
#include "encoder.h"
#include "processing.h"

// Buffers parciales: 24 líneas x 320 px x 2 bytes = 15360 bytes (cada flush entra en una sola transferencia DMA)
#define DRAW_BUF_LINES  24
#define DRAW_BUF_BYTES  (DISPLAY_WIDTH * DRAW_BUF_LINES * 2)

static uint8_t draw_buf1[DRAW_BUF_BYTES] __attribute__((aligned(4)));
static uint8_t draw_buf2[DRAW_BUF_BYTES] __attribute__((aligned(4)));

static lv_display_t *disp;

static void flush_done(void)
{
    lv_display_flush_ready(disp);
}

static void flush_cb(lv_display_t *d, const lv_area_t *area, uint8_t *px_map)
{
    (void)d;

    // Por si la transferencia anterior sigue en curso, seguimos atendiendo el ADC
    while (Display_FlushBusy()) {
        ProcessPendingBuffers();
    }

    uint32_t px_count = (uint32_t)lv_area_get_width(area) * lv_area_get_height(area);

    // LVGL entrega RGB565 en el orden de bytes del micro; el ILI9341 espera el byte alto primero
    uint16_t *p = (uint16_t *)px_map;
    for (uint32_t i = 0; i < px_count; i++) {
        uint16_t v = p[i];
        p[i] = (uint16_t)((v << 8) | (v >> 8));
    }

    Display_FlushAsync(area->x1, area->y1, area->x2, area->y2,
                       px_map, (uint16_t)(px_count * 2), flush_done);
}

// LVGL llama a esta función cuando tiene que esperar que termine un flush.
// Debe volver recién cuando el flush terminó; mientras tanto atendemos el muestreo.
static void flush_wait_cb(lv_display_t *d)
{
    (void)d;
    while (Display_FlushBusy()) {
        ProcessPendingBuffers();
    }
}

static void encoder_read_cb(lv_indev_t *indev, lv_indev_data_t *data)
{
    (void)indev;
    data->enc_diff = Encoder_GetDelta();    // si gira al revés, poner el signo menos
    data->state = Encoder_ButtonIsDown() ? LV_INDEV_STATE_PRESSED : LV_INDEV_STATE_RELEASED;
}

void LvglPort_Init(void)
{
    Display_Init();

    lv_init();
    lv_tick_set_cb(HAL_GetTick);

    disp = lv_display_create(DISPLAY_WIDTH, DISPLAY_HEIGHT);
    lv_display_set_color_format(disp, LV_COLOR_FORMAT_RGB565);
    lv_display_set_flush_cb(disp, flush_cb);
    lv_display_set_flush_wait_cb(disp, flush_wait_cb);
    lv_display_set_buffers(disp, draw_buf1, draw_buf2, DRAW_BUF_BYTES,
                           LV_DISPLAY_RENDER_MODE_PARTIAL);

    lv_indev_t *indev = lv_indev_create();
    lv_indev_set_type(indev, LV_INDEV_TYPE_ENCODER);
    lv_indev_set_read_cb(indev, encoder_read_cb);

    lv_group_t *group = lv_group_create();
    lv_group_set_default(group);
    lv_indev_set_group(indev, group);
}
