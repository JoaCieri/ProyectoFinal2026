/*
 * test_logger.h
 * Logica de prueba:
 *   - La pantalla muestra siempre los valores en vivo de la fase 1 (se refresca cada 500 ms).
 *   - El boton del encoder INICIA / DETIENE el registro. Mientras registra, una vez por segundo:
 *       1) agrega una linea a un CSV en la SD, con fecha y hora del RTC,
 *       2) actualiza los registros Modbus TCP (servidor en el puerto 502 del W5500 numero 1).
 *     Cada vez que se inicia se crea un archivo nuevo: MCEE_AAAAMMDD_HHMMSS.csv
 *
 * Cada parte se puede apagar para probar los drivers de a uno (ver TL_ENABLE_* mas abajo).
 *
 * Mapa de registros Modbus: es el que lee el software de PC (driver.py, funcion 0x03,
 * direcciones 0..30). Todos son enteros de 16 bits con escala:
 *
 *            L1   L2   L3
 *   Vrms     0    8    16     x10   [V]
 *   Irms     1    9    17     x100  [A]
 *   P        2    10   18     x10   [W]    con signo (complemento a 2)
 *   Q        3    11   19     x10   [var]  con signo
 *   S        4    12   20     x10   [VA]
 *   FP       5    13   21     x1000        con signo
 *   THD V    6    14   22     x10   [%]
 *   THD I    7    15   23     x10   [%]
 *   P total 24 (x10) | Q total 25 (x10) | S total 26 (x10) | FP total 27 (x1000)
 *   frecuencia 28 (x100 Hz) | topologia 29 (1 = monofasica, 2 = bifasica, 3 = trifasica)
 *   alarmas 30 (bitmask, ver SNAP_ALARMS en test_logger.c) | reserva 31 = 0
 *
 * Extras (fuera de lo que lee driver.py):
 *   32 numero de muestra de la sesion   33..38 anio, mes, dia, hora, minuto, segundo de la muestra
 *   39 banderas: bit0 = ultima muestra guardada en SD, bit1 = hora del RTC valida, bit2 = registrando
 *
 * En esta prueba solo se mide la fase 1: L2 y L3 quedan en 0. Los registros 0..29 se actualizan
 * SOLO mientras se registra (despues de detener quedan con la ultima muestra). Limites por la
 * escala x10: P y Q +-3276.7, S y totales hasta 6553.5; lo que excede se satura. Sin dato = 0.
 */
#ifndef TEST_LOGGER_H
#define TEST_LOGGER_H

#include <stdint.h>
#include <stdbool.h>
#include "i2c_devices.h"

typedef struct
{
    uint32_t   seq;
    rtc_time_t time;
    bool       time_valid;
    float      vrms, irms, p, q, s, pf, freq, thd_v, thd_i;   /* fase 1 */
    float      temp_c;     /* temperatura del equipo (sensor del DS3231) [C] */
    bool       sd_ok;
    bool       eth_ok;
} measurement_snapshot_t;


/* Partes de la prueba: 1 = activa, 0 = apagada (para probar cada driver por separado) */
#define TL_ENABLE_SD    1
#define TL_ENABLE_ETH   1


/* Cada cuanto se toma una muestra mientras se registra, y cada cuanto se refresca la pantalla */
#define TL_LOG_PERIOD_MS    1000u
#define TL_LIVE_PERIOD_MS   500u

/* Topologia que informa el equipo por Modbus (1 = monofasica: solo se mide la fase 1) */
#define NET_TOPOLOGY    1

/* Configuracion de red del equipo (192.168.0.50: la que usa driver.py). El PC debe estar en la
 * misma subred, p. ej. 192.168.0.10 con mascara 255.255.255.0 */
#define NET_IP        { 192, 168, 0, 50 }
#define NET_GATEWAY   { 192, 168, 0, 1 }
#define NET_MASK      { 255, 255, 255, 0 }
#define NET_MAC       { 0x02, 0x4D, 0x43, 0x45, 0x45, 0x01 }

/* Estados para mirar en Expressions */
typedef enum
{
    TL_SD_NOT_TRIED = 0,
    TL_SD_OK,
    TL_SD_NO_CARD,        /* SD_Init fallo */
    TL_SD_NO_FILESYSTEM,  /* la tarjeta responde pero no tiene FAT/exFAT valido (formatear en la PC) */
    TL_SD_MOUNT_ERROR,
    TL_SD_WRITE_ERROR
} tl_sd_state_t;

extern volatile uint8_t  tl_sd_state;       /* tl_sd_state_t */
extern volatile uint8_t  tl_fresult;        /* ultimo FRESULT de FatFs (0 = FR_OK) */
extern volatile uint8_t  tl_eth_ok;         /* 1 = W5500 detectado e inicializado */
extern volatile uint8_t  tl_logging;        /* 1 = registrando */
extern volatile uint32_t tl_samples;        /* muestras de la sesion actual */
extern char              tl_file_name[48];  /* archivo de la sesion actual */

/* Monta la SD e inicializa Ethernet + Modbus. Llamar una vez, despues de DS3231_Init() y Gui_Init(),
 * antes de arrancar el ADC. */
void TestLogger_Init(void);

/* Llamar en cada vuelta del lazo principal (junto con lv_timer_handler) */
void TestLogger_Process(void);

#endif /* TEST_LOGGER_H */
