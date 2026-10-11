/*
 * test_logger.c
 * Ver test_logger.h
 */
#include "test_logger.h"
#include "main.h"
#include "ff.h"
#include "ethernet.h"
#include "encoder.h"
#include "gui.h"
#include "signals.h"
#include "processing.h"
#include <string.h>
#include <stdio.h>

/* --------- Variables de la fase 1 (ajustar si en tu codigo se llaman distinto) ---------
 * P, Q y THD de corriente no estan asociados: quedan como "sin dato" (NaN) hasta que apuntes
 * estas macros a las variables reales de potencia activa [W], reactiva [var] y THD de corriente [%]
 * de la fase 1. S se calcula como V*I; FP = P/S cuando hay P. */
#define SNAP_VRMS()    ((float)vrms1_display)
#define SNAP_IRMS()    ((float)irms1_display)
#define SNAP_FREQ()    ((float)measured_line_freq)
#define SNAP_THD_V()   ((float)voltage1_thd)
#ifndef SNAP_P_W
#define SNAP_P_W()     (NAN_VALUE)     /* ej.: (active_power1) */
#endif
#ifndef SNAP_Q_VAR
#define SNAP_Q_VAR()   (NAN_VALUE)     /* ej.: (reactive_power1) */
#endif
#ifndef SNAP_THD_I
#define SNAP_THD_I()   (NAN_VALUE)     /* ej.: (current1_thd) */
#endif

#define NAN_VALUE      (__builtin_nanf(""))

#define SD_RETRY_MS    5000u     /* si se pierde la SD registrando, reintentar cada 5 s */

volatile uint8_t  tl_sd_state = TL_SD_NOT_TRIED;
volatile uint8_t  tl_fresult  = 0;
volatile uint8_t  tl_eth_ok   = 0;
volatile uint8_t  tl_logging  = 0;
volatile uint32_t tl_samples  = 0;
char              tl_file_name[48] = "";

static FATFS    fs;
static FIL      logfile;
static bool     fs_mounted   = false;
static bool     file_open    = false;
static bool     rtc_valid    = false;   /* ultimo estado conocido del RTC */
static bool     last_sd_ok   = false;
static uint32_t next_sample_ms = 0;
static uint32_t last_live_ms   = 0;
static uint32_t last_retry_ms  = 0;

static const eth_config_t net_cfg =
{
    .mac = NET_MAC, .ip = NET_IP, .gateway = NET_GATEWAY, .mask = NET_MASK
};

static inline bool is_nan(float v) { return v != v; }

/* ------------------------------ texto ------------------------------ */

/* Escribe v con 'dec' decimales sin usar %f (newlib-nano no lo trae). NaN -> campo vacio. */
static char *put_fixed(char *p, float v, uint8_t dec)
{
    static const uint32_t pow10[] = { 1, 10, 100, 1000, 10000 };

    if (is_nan(v))
        return p;

    if (v < 0.0f)
    {
        *p++ = '-';
        v = -v;
    }
    if (v > 4.0e8f)       /* fuera de rango para entero de 32 bits: no intentar */
        v = 4.0e8f;

    uint32_t scaled = (uint32_t)(v * (float)pow10[dec] + 0.5f);
    uint32_t whole  = scaled / pow10[dec];
    uint32_t frac   = scaled % pow10[dec];

    p += sprintf(p, "%lu", (unsigned long)whole);
    if (dec)
    {
        *p++ = '.';
        for (uint32_t d = pow10[dec] / 10; d > 1 && frac < d; d /= 10)
            *p++ = '0';                       /* ceros a la izquierda de la parte decimal */
        p += sprintf(p, "%lu", (unsigned long)frac);
    }
    return p;
}

static char *put_uint(char *p, uint32_t v)
{
    return p + sprintf(p, "%lu", (unsigned long)v);
}

static char *put_time(char *p, const measurement_snapshot_t *s)
{
    return p + sprintf(p, "%04u-%02u-%02u %02u:%02u:%02u",
                       (unsigned)s->time.year, (unsigned)s->time.month, (unsigned)s->time.day,
                       (unsigned)s->time.hour, (unsigned)s->time.min, (unsigned)s->time.sec);
}

static const char csv_header[] =
    "fecha_hora,muestra,V1_V,I1_A,P_W,Q_var,S_VA,FP,f_Hz,THD_V_pct,THD_I_pct,rtc_valido\r\n";

static uint16_t build_csv_line(char *buf, const measurement_snapshot_t *s)
{
    char *p = buf;

    p = put_time(p, s);          *p++ = ',';
    p = put_uint(p, s->seq);     *p++ = ',';
    p = put_fixed(p, s->vrms, 1);  *p++ = ',';
    p = put_fixed(p, s->irms, 3);  *p++ = ',';
    p = put_fixed(p, s->p, 1);     *p++ = ',';
    p = put_fixed(p, s->q, 1);     *p++ = ',';
    p = put_fixed(p, s->s, 1);     *p++ = ',';
    p = put_fixed(p, s->pf, 3);    *p++ = ',';
    p = put_fixed(p, s->freq, 2);  *p++ = ',';
    p = put_fixed(p, s->thd_v, 2); *p++ = ',';
    p = put_fixed(p, s->thd_i, 2); *p++ = ',';
    *p++ = s->time_valid ? '1' : '0';
    *p++ = '\r';
    *p++ = '\n';
    *p = '\0';
    return (uint16_t)(p - buf);
}

/* --------------------------------- SD --------------------------------- */

static bool sd_mount(void)
{
    if (fs_mounted)
        return true;

    /* opt = 1: monta ahora mismo (inicializa la tarjeta y lee el sistema de archivos) */
    FRESULT r = f_mount(&fs, "", 1);
    tl_fresult = (uint8_t)r;

    if (r == FR_OK)
    {
        fs_mounted = true;
        tl_sd_state = TL_SD_OK;
        return true;
    }

    if (r == FR_NOT_READY || r == FR_DISK_ERR)
        tl_sd_state = TL_SD_NO_CARD;
    else if (r == FR_NO_FILESYSTEM)
        tl_sd_state = TL_SD_NO_FILESYSTEM;
    else
        tl_sd_state = TL_SD_MOUNT_ERROR;

    f_mount(NULL, "", 0);
    return false;
}

/* Algo fallo con la tarjeta: se suelta todo para volver a montarla de cero la proxima vez */
static void sd_drop(void)
{
    if (file_open)
        f_close(&logfile);
    file_open = false;
    fs_mounted = false;
    f_mount(NULL, "", 0);
}

/* Cierra el archivo de la sesion (queda sincronizado) */
static void sd_close_session(void)
{
    if (!file_open)
        return;
    FRESULT r = f_close(&logfile);
    file_open = false;
    tl_fresult = (uint8_t)r;
    if (r != FR_OK)
        tl_sd_state = TL_SD_WRITE_ERROR;
}

/* Monta la tarjeta, crea el archivo MCEE_AAAAMMDD_HHMMSS.csv y escribe el encabezado */
static bool sd_open_session(const rtc_time_t *t, bool time_valid)
{
#if !TL_ENABLE_SD
    (void)t; (void)time_valid;
    return false;
#else
    /* Se monta de nuevo cada vez: asi sirve aunque hayan cambiado la tarjeta con el equipo prendido */
    fs_mounted = false;
    f_mount(NULL, "", 0);
    if (!sd_mount())
        return false;

    char base[40];
    if (time_valid)
        sprintf(base, "MCEE_%04u%02u%02u_%02u%02u%02u", (unsigned)t->year, (unsigned)t->month,
                (unsigned)t->day, (unsigned)t->hour, (unsigned)t->min, (unsigned)t->sec);
    else
        strcpy(base, "MCEE_SINHORA");

    /* FA_CREATE_NEW: nunca pisa un archivo existente; si el nombre esta usado se prueba con _1, _2... */
    FRESULT r = FR_EXIST;
    for (uint8_t n = 0; n < 100 && r == FR_EXIST; n++)
    {
        if (n == 0)
            sprintf(tl_file_name, "%s.csv", base);
        else
            sprintf(tl_file_name, "%s_%u.csv", base, (unsigned)n);
        r = f_open(&logfile, tl_file_name, FA_CREATE_NEW | FA_WRITE);
    }
    tl_fresult = (uint8_t)r;
    if (r != FR_OK)
    {
        tl_sd_state = TL_SD_WRITE_ERROR;
        sd_drop();
        return false;
    }
    file_open = true;

    UINT bw;
    r = f_write(&logfile, csv_header, sizeof(csv_header) - 1, &bw);
    if (r == FR_OK)
        r = f_sync(&logfile);
    tl_fresult = (uint8_t)r;
    if (r != FR_OK)
    {
        tl_sd_state = TL_SD_WRITE_ERROR;
        sd_drop();
        return false;
    }

    tl_sd_state = TL_SD_OK;
    return true;
#endif
}

/* Agrega una linea al archivo y la sincroniza (si se corta la energia, queda guardada) */
static bool sd_write_line(const measurement_snapshot_t *s)
{
    char line[128];
    UINT bw;
    uint16_t n = build_csv_line(line, s);

    FRESULT r = f_write(&logfile, line, n, &bw);
    if (r == FR_OK && bw != n)
        r = FR_DENIED;
    if (r == FR_OK)
        r = f_sync(&logfile);

    tl_fresult = (uint8_t)r;
    if (r != FR_OK)
    {
        tl_sd_state = TL_SD_WRITE_ERROR;
        sd_drop();
        return false;
    }
    return true;
}

/* ------------------------------ muestra ------------------------------ */

/* Arma una muestra con los valores de este instante. check_rtc = true revisa tambien si el RTC
 * conserva la hora (una lectura extra por I2C; se hace solo al registrar). */
static void take_snapshot(measurement_snapshot_t *s, bool check_rtc)
{
    memset(s, 0, sizeof(*s));

    s->vrms  = SNAP_VRMS();
    s->irms  = SNAP_IRMS();
    s->freq  = SNAP_FREQ();
    s->thd_v = SNAP_THD_V();
    s->thd_i = SNAP_THD_I();
    s->p     = SNAP_P_W();
    s->q     = SNAP_Q_VAR();
    s->s     = s->vrms * s->irms;
    s->pf    = (!is_nan(s->p) && s->s > 0.001f) ? (s->p / s->s) : NAN_VALUE;

    bool read_ok = DS3231_GetTime(&s->time);
    if (check_rtc)
        rtc_valid = read_ok && !DS3231_LostPower();
    else if (!read_ok)
        rtc_valid = false;

    s->time_valid = rtc_valid;
    if (!read_ok || s->time.year < 2000)
        memset(&s->time, 0, sizeof(s->time));

    s->eth_ok = tl_eth_ok != 0;
    s->sd_ok  = last_sd_ok;
}

/* ------------------------------ Modbus ------------------------------ */

/* Escala un valor a registro de 16 bits. Sin dato (NaN) -> 0. Se satura en vez de dar la vuelta. */
static uint16_t reg_u(float v, float scale)
{
    if (is_nan(v) || v <= 0.0f)
        return 0;
    float x = v * scale + 0.5f;
    return (x >= 65535.0f) ? 65535u : (uint16_t)x;
}

/* Igual, pero con signo (complemento a 2 de 16 bits) */
static uint16_t reg_s(float v, float scale)
{
    if (is_nan(v))
        return 0;
    float x = v * scale;
    int32_t r = (int32_t)(x >= 0.0f ? x + 0.5f : x - 0.5f);
    if (r > 32767)  r = 32767;
    if (r < -32768) r = -32768;
    return (uint16_t)(int16_t)r;
}

static uint16_t flags_reg(const measurement_snapshot_t *s)
{
    return (uint16_t)((s->sd_ok ? 1u : 0u) | (s->time_valid ? 2u : 0u) | (tl_logging ? 4u : 0u));
}

static void publish_snapshot(const measurement_snapshot_t *s)
{
#if TL_ENABLE_ETH
    /* Fase 1 (L2 y L3 en 0: solo se mide la fase 1) */
    for (uint16_t a = 8; a < 24; a++)
        Modbus_SetU16(a, 0);

    Modbus_SetU16(0, reg_u(s->vrms, 10.0f));
    Modbus_SetU16(1, reg_u(s->irms, 100.0f));
    Modbus_SetU16(2, reg_s(s->p, 10.0f));
    Modbus_SetU16(3, reg_s(s->q, 10.0f));
    Modbus_SetU16(4, reg_u(s->s, 10.0f));
    Modbus_SetU16(5, reg_s(s->pf, 1000.0f));
    Modbus_SetU16(6, reg_u(s->thd_v, 10.0f));
    Modbus_SetU16(7, reg_u(s->thd_i, 10.0f));

    /* Totales = fase 1 */
    Modbus_SetU16(24, reg_s(s->p, 10.0f));
    Modbus_SetU16(25, reg_s(s->q, 10.0f));
    Modbus_SetU16(26, reg_u(s->s, 10.0f));
    Modbus_SetU16(27, reg_s(s->pf, 1000.0f));

    Modbus_SetU16(28, reg_u(s->freq, 10.0f));
    Modbus_SetU16(29, NET_TOPOLOGY);

    Modbus_SetU16(33, s->time.year);
    Modbus_SetU16(34, s->time.month);
    Modbus_SetU16(35, s->time.day);
    Modbus_SetU16(36, s->time.hour);
    Modbus_SetU16(37, s->time.min);
    Modbus_SetU16(38, s->time.sec);
    Modbus_SetU16(39, flags_reg(s));
    Modbus_SetU16(32, (uint16_t)s->seq);    /* al final: quien lee ve el numero nuevo con todos los datos */
#else
    (void)s;
#endif
}

/* ------------------------------ pantalla ------------------------------ */

static void update_status(void)
{
    const char *sd_txt;
#if !TL_ENABLE_SD
    sd_txt = "off";
#else
    switch (tl_sd_state)
    {
    case TL_SD_OK:            sd_txt = file_open ? "guardando" : "lista"; break;
    case TL_SD_NO_FILESYSTEM: sd_txt = "formatear";                       break;
    case TL_SD_NO_CARD:       sd_txt = "sin tarjeta";                     break;
    case TL_SD_NOT_TRIED:     sd_txt = "---";                             break;
    default:                  sd_txt = "error";                           break;
    }
#endif

    const char *eth_txt;
#if !TL_ENABLE_ETH
    eth_txt = "off";
#else
    eth_txt = tl_eth_ok ? "ok" : "sin chip";
#endif

    Gui_SetStatus(tl_logging != 0, tl_samples, sd_txt, eth_txt);
}

/* ------------------------------- Ethernet ------------------------------- */

static void eth_start(void)
{
#if !TL_ENABLE_ETH
    return;
#endif
    if (Eth_Init(0, &net_cfg))
    {
        Modbus_Init(0);
        tl_eth_ok = 1;
    }
    else
    {
        tl_eth_ok = 0;
    }
}

/* ---------------------------------- RTC ---------------------------------- */

/* Si el RTC perdio la hora (modulo nuevo o sin pila) lo pone en la hora de compilacion,
 * asi la primera prueba ya tiene fecha casi correcta. Para ajustarlo bien: recompilar y cargar. */
static void rtc_set_build_time_if_lost(void)
{
    static const char months[] = "JanFebMarAprMayJunJulAugSepOctNovDec";
    rtc_time_t t;
    char mon[4] = { __DATE__[0], __DATE__[1], __DATE__[2], 0 };   /* "Oct 11 2026" */

    if (!DS3231_LostPower())
        return;

    const char *m = strstr(months, mon);
    t.month = m ? (uint8_t)((m - months) / 3 + 1) : 1;
    t.day   = (uint8_t)((__DATE__[4] == ' ' ? 0 : (__DATE__[4] - '0') * 10) + (__DATE__[5] - '0'));
    t.year  = (uint16_t)((__DATE__[7] - '0') * 1000 + (__DATE__[8] - '0') * 100 +
                         (__DATE__[9] - '0') * 10 + (__DATE__[10] - '0'));
    t.hour  = (uint8_t)((__TIME__[0] - '0') * 10 + (__TIME__[1] - '0'));
    t.min   = (uint8_t)((__TIME__[3] - '0') * 10 + (__TIME__[4] - '0'));
    t.sec   = (uint8_t)((__TIME__[6] - '0') * 10 + (__TIME__[7] - '0'));
    t.wday  = 1;   /* SetTime lo recalcula */
    DS3231_SetTime(&t);
}

/* ------------------------------ registro ------------------------------ */

/* Toma una muestra, la guarda en la SD y la publica por Modbus */
static void log_sample(uint32_t now)
{
    measurement_snapshot_t s;
    take_snapshot(&s, true);
    s.seq = ++tl_samples;

#if TL_ENABLE_SD
    if (!file_open && (now - last_retry_ms) >= SD_RETRY_MS)
    {
        /* Se perdio la SD (o nunca se pudo abrir): reintentar cada tanto con un archivo nuevo */
        last_retry_ms = now;
        sd_open_session(&s.time, s.time_valid);
    }
    last_sd_ok = file_open && sd_write_line(&s);
#else
    (void)now;
    last_sd_ok = false;
#endif
    s.sd_ok  = last_sd_ok;
    s.eth_ok = tl_eth_ok != 0;

    publish_snapshot(&s);
    update_status();
}

static void start_logging(uint32_t now)
{
    tl_samples = 0;
    tl_logging = 1;
    last_sd_ok = false;
    last_retry_ms = now;

    if (!tl_eth_ok)
        eth_start();           /* si Ethernet no habia arrancado, reintentar (no hace nada si esta apagado) */

    measurement_snapshot_t s;
    take_snapshot(&s, true);
    sd_open_session(&s.time, s.time_valid);

    next_sample_ms = now;      /* la primera muestra sale enseguida */
    update_status();
}

static void stop_logging(void)
{
    tl_logging = 0;
    sd_close_session();
    last_sd_ok = false;

    measurement_snapshot_t s;
    take_snapshot(&s, false);
    s.seq = tl_samples;
    Modbus_SetU16(39, flags_reg(&s));      /* avisa por Modbus que se dejo de registrar */
    update_status();
}

/* ------------------------------- API ------------------------------- */

void TestLogger_Init(void)
{
    rtc_set_build_time_if_lost();
    eth_start();
#if TL_ENABLE_SD
    sd_mount();
#endif

    measurement_snapshot_t s;
    take_snapshot(&s, true);
    Gui_ShowLive(&s);
    update_status();
    last_live_ms = HAL_GetTick();
}

void TestLogger_Process(void)
{
    uint32_t now = HAL_GetTick();

#if TL_ENABLE_ETH
    Modbus_Poll();
#endif

    if (Encoder_ButtonPressed())
    {
        if (tl_logging)
            stop_logging();
        else
            start_logging(now);
        now = HAL_GetTick();      /* iniciar puede tardar (montar la SD) */
    }

    if (tl_logging && (int32_t)(now - next_sample_ms) >= 0)
    {
        next_sample_ms = now + TL_LOG_PERIOD_MS;
        log_sample(now);
        now = HAL_GetTick();
    }

    if ((now - last_live_ms) >= TL_LIVE_PERIOD_MS)
    {
        last_live_ms = now;
        measurement_snapshot_t s;
        take_snapshot(&s, false);
        Gui_ShowLive(&s);
    }
}
