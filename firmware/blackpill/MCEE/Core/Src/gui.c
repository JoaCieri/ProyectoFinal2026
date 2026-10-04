/*
 * gui.c
 *
 *  Created on: 4 oct 2026
 *      Author: igles
 */


#include "gui.h"
#include "lvgl.h"
#include "signals.h"

static lv_obj_t *lbl_vrms;

// Se formatea con enteros porque el printf de LVGL no soporta %f por defecto
static void update_cb(lv_timer_t *t)
{
    (void)t;
    int tenths = (int)(vrms1_display * 10.0f + 0.5f);
    lv_label_set_text_fmt(lbl_vrms, "V1: %d.%d V", tenths / 10, tenths % 10);
}

void Gui_Init(void)
{
    lv_obj_t *scr = lv_screen_active();

    lv_obj_t *title = lv_label_create(scr);
    lv_label_set_text(title, "MCEE - Monitor de Calidad de Energia");
    lv_obj_align(title, LV_ALIGN_TOP_MID, 0, 10);

    lbl_vrms = lv_label_create(scr);
    lv_obj_align(lbl_vrms, LV_ALIGN_CENTER, 0, 0);

    update_cb(NULL);
    lv_timer_create(update_cb, 500, NULL);
}
