/*
 * gui.c
 * Pantalla provisoria (320x240, horizontal), siempre con los valores en vivo de la fase 1:
 *
 *   +--------------------------------------------+
 *   | MCEE F1      12/10 14:03:22      REC  125  |  barra: hora del RTC y estado del registro
 *   | Tension                           220.4 V  |
 *   | Corriente                          3.25 A  |
 *   | P         | Q         | S                  |
 *   | FP        | f         | THD V              |
 *   | THD I     | SD        | ETH                |
 *   +--------------------------------------------+
 *
 * Los valores los entrega test_logger (Gui_ShowLive / Gui_SetStatus). Esta pantalla no lee
 * variables de medicion directamente.
 */
#include "gui.h"
#include "lvgl/lvgl.h"

/* Fuente grande para tension y corriente: habilitar LV_FONT_MONTSERRAT_28 en lv_conf.h.
 * Si no esta habilitada se usa la fuente por defecto y compila igual. */
#if LV_FONT_MONTSERRAT_28
  #define FONT_BIG   (&lv_font_montserrat_28)
#else
  #define FONT_BIG   LV_FONT_DEFAULT
#endif

#define COLOR_BG        lv_color_hex(0x101820)
#define COLOR_BAR       lv_color_hex(0x1F3A5F)
#define COLOR_CAPTION   lv_color_hex(0x9AA5B1)
#define COLOR_SEP       lv_color_hex(0x2A3744)
#define COLOR_REC       lv_color_hex(0xFF5252)
#define COLOR_IDLE      lv_color_hex(0xFFD54F)

#define SCREEN_W        320
#define MARGIN_X        10

#define BAR_H           32
#define BIG_Y0          (BAR_H + 4)     /* tension */
#define BIG_H           44
#define GRID_Y0         (BIG_Y0 + 2 * BIG_H + 4)
#define CELL_H          36
#define CELL_W          (SCREEN_W / 3)

enum { CELL_P = 0, CELL_Q, CELL_S, CELL_FP, CELL_F, CELL_THDV, CELL_THDI, CELL_SD, CELL_ETH, CELL_COUNT };

static lv_obj_t *lbl_time, *lbl_status;
static lv_obj_t *lbl_v, *lbl_i;
static lv_obj_t *lbl_cell[CELL_COUNT];

static lv_obj_t *make_separator(lv_obj_t *scr, int y)
{
    lv_obj_t *sep = lv_obj_create(scr);
    lv_obj_remove_style_all(sep);
    lv_obj_set_size(sep, SCREEN_W - 2 * MARGIN_X, 1);
    lv_obj_set_pos(sep, MARGIN_X, y);
    lv_obj_set_style_bg_opa(sep, LV_OPA_COVER, 0);
    lv_obj_set_style_bg_color(sep, COLOR_SEP, 0);
    return sep;
}

/* Fila grande: titulo a la izquierda, valor a la derecha */
static lv_obj_t *make_big_row(lv_obj_t *scr, int y, const char *caption, lv_color_t color)
{
    make_separator(scr, y);

    lv_obj_t *cap = lv_label_create(scr);
    lv_label_set_text(cap, caption);
    lv_obj_set_style_text_color(cap, COLOR_CAPTION, 0);
    lv_obj_align(cap, LV_ALIGN_TOP_LEFT, MARGIN_X, y + (BIG_H - 14) / 2);

    lv_obj_t *val = lv_label_create(scr);
    lv_label_set_text(val, "---");
    lv_obj_set_style_text_font(val, FONT_BIG, 0);
    lv_obj_set_style_text_color(val, color, 0);
    lv_obj_align(val, LV_ALIGN_TOP_RIGHT, -MARGIN_X, y + 8);
    return val;
}

/* Recuadro chico: titulo arriba (gris) y valor abajo */
static void make_cell(lv_obj_t *scr, int idx, const char *caption)
{
    int col = idx % 3;
    int row = idx / 3;
    int x = col * CELL_W + MARGIN_X;
    int y = GRID_Y0 + row * CELL_H;

    if (col == 0)
        make_separator(scr, y);

    lv_obj_t *cap = lv_label_create(scr);
    lv_label_set_text(cap, caption);
    lv_obj_set_style_text_color(cap, COLOR_CAPTION, 0);
    lv_obj_set_pos(cap, x, y + 3);

    lv_obj_t *val = lv_label_create(scr);
    lv_label_set_text(val, "---");
    lv_obj_set_style_text_color(val, lv_color_white(), 0);
    lv_obj_set_pos(val, x, y + 3 + 15);
    lbl_cell[idx] = val;
}

/* Escribe "valor unidad" en buf; "---" si no hay dato (NaN). Sin %f: el printf de LVGL no lo trae. */
static void fmt_val(char *buf, size_t n, float v, int scale, const char *unit)
{
    if (v != v)
    {
        lv_snprintf(buf, n, "---");
        return;
    }

    const char *sign = "";
    if (v < 0.0f)
    {
        v = -v;
        sign = "-";
    }
    if (v > 1.0e6f)
        v = 1.0e6f;

    int scaled = (int)(v * (float)scale + 0.5f);
    if (scale == 1)
        lv_snprintf(buf, n, "%s%d %s", sign, scaled, unit);
    else if (scale == 10)
        lv_snprintf(buf, n, "%s%d.%d %s", sign, scaled / scale, scaled % scale, unit);
    else
        lv_snprintf(buf, n, "%s%d.%02d %s", sign, scaled / scale, scaled % scale, unit);
}

void Gui_ShowLive(const measurement_snapshot_t *s)
{
    char b[24];

    fmt_val(b, sizeof(b), s->vrms, 10, "V");     lv_label_set_text(lbl_v, b);
    fmt_val(b, sizeof(b), s->irms, 100, "A");    lv_label_set_text(lbl_i, b);

    fmt_val(b, sizeof(b), s->p,     1,   "W");    lv_label_set_text(lbl_cell[CELL_P], b);
    fmt_val(b, sizeof(b), s->q,     1,   "var");  lv_label_set_text(lbl_cell[CELL_Q], b);
    fmt_val(b, sizeof(b), s->s,     1,   "VA");   lv_label_set_text(lbl_cell[CELL_S], b);
    fmt_val(b, sizeof(b), s->pf,    100, "");     lv_label_set_text(lbl_cell[CELL_FP], b);
    if (s->freq > 1.0f)
        fmt_val(b, sizeof(b), s->freq, 100, "Hz");
    else
        lv_snprintf(b, sizeof(b), "--- Hz");
    lv_label_set_text(lbl_cell[CELL_F], b);
    fmt_val(b, sizeof(b), s->thd_v, 10,  "%");    lv_label_set_text(lbl_cell[CELL_THDV], b);
    fmt_val(b, sizeof(b), s->thd_i, 10,  "%");    lv_label_set_text(lbl_cell[CELL_THDI], b);

    lv_label_set_text_fmt(lbl_time, "%02d/%02d %02d:%02d:%02d%s",
                          (int)s->time.day, (int)s->time.month,
                          (int)s->time.hour, (int)s->time.min, (int)s->time.sec,
                          s->time_valid ? "" : " ?");
}

void Gui_SetStatus(bool logging, uint32_t samples, const char *sd_text, const char *eth_text)
{
    if (logging)
    {
        lv_label_set_text_fmt(lbl_status, "REC  %d", (int)samples);
        lv_obj_set_style_text_color(lbl_status, COLOR_REC, 0);
    }
    else
    {
        lv_label_set_text(lbl_status, "En espera");
        lv_obj_set_style_text_color(lbl_status, COLOR_IDLE, 0);
    }

    lv_label_set_text(lbl_cell[CELL_SD], sd_text);
    lv_label_set_text(lbl_cell[CELL_ETH], eth_text);
}

void Gui_Init(void)
{
    lv_obj_t *scr = lv_screen_active();
    lv_obj_set_style_bg_color(scr, COLOR_BG, 0);
    lv_obj_set_style_bg_opa(scr, LV_OPA_COVER, 0);
    lv_obj_set_scrollable(scr, false);

    /* Barra superior */
    lv_obj_t *bar = lv_obj_create(scr);
    lv_obj_remove_style_all(bar);
    lv_obj_set_size(bar, SCREEN_W, BAR_H);
    lv_obj_set_pos(bar, 0, 0);
    lv_obj_set_style_bg_opa(bar, LV_OPA_COVER, 0);
    lv_obj_set_style_bg_color(bar, COLOR_BAR, 0);

    lv_obj_t *title = lv_label_create(bar);
    lv_label_set_text(title, "MCEE F1");
    lv_obj_set_style_text_color(title, lv_color_white(), 0);
    lv_obj_align(title, LV_ALIGN_LEFT_MID, MARGIN_X, 0);

    lbl_time = lv_label_create(bar);
    lv_label_set_text(lbl_time, "--/-- --:--:--");
    lv_obj_set_style_text_color(lbl_time, lv_color_white(), 0);
    lv_obj_align(lbl_time, LV_ALIGN_CENTER, -8, 0);

    lbl_status = lv_label_create(bar);
    lv_label_set_text(lbl_status, "En espera");
    lv_obj_set_style_text_color(lbl_status, COLOR_IDLE, 0);
    lv_obj_align(lbl_status, LV_ALIGN_RIGHT_MID, -MARGIN_X, 0);

    /* Tension y corriente grandes */
    lbl_v = make_big_row(scr, BIG_Y0,          "Tension",   lv_color_hex(0xFFD54F));
    lbl_i = make_big_row(scr, BIG_Y0 + BIG_H,  "Corriente", lv_color_hex(0x4FC3F7));

    /* Grilla de 3 x 3 */
    make_cell(scr, CELL_P,    "P");
    make_cell(scr, CELL_Q,    "Q");
    make_cell(scr, CELL_S,    "S");
    make_cell(scr, CELL_FP,   "FP");
    make_cell(scr, CELL_F,    "Frecuencia");
    make_cell(scr, CELL_THDV, "THD V");
    make_cell(scr, CELL_THDI, "THD I");
    make_cell(scr, CELL_SD,   "SD");
    make_cell(scr, CELL_ETH,  "Ethernet");
}
