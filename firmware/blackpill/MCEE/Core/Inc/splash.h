/*
 * splash.h
 * Imagenes de inicio desde la micro SD.
 *
 * Archivos (en la raiz de la tarjeta): SPLASH1.BMP, SPLASH2.BMP, SPLASH3.BMP, SPLASH4.BMP.
 * Se muestran en ese orden, cada una SPLASH_MS; los que no estan se saltean.
 * Formato: BMP sin compresion de 24 bits (o 32 bits), idealmente de 320x240. Si es mas chica
 * se centra sobre fondo negro; si es mas grande no se usa.
 * (Paint de Windows: Cambiar tamano -> 320 x 240 px, Guardar como -> BMP 24 bits.)
 *
 * Uso en main.c (USER CODE 2):
 *     LvglPort_Init();
 *     Splash_Show();        <- monta la SD y muestra la primera imagen
 *     Gui_Init(); DS3231_Init(); Settings_Init();
 *     Splash_Finish();      <- muestra las demas y suelta la SD (ANTES de TestLogger_Init)
 *     TestLogger_Init();    <- mientras tanto sigue visible la ultima imagen
 *     lv_refr_now(NULL);    <- recien aca se dibuja la pantalla normal
 */
#ifndef SPLASH_H
#define SPLASH_H

#include <stdint.h>

#ifndef SPLASH_MS
#define SPLASH_MS   3000u      /* tiempo de cada imagen [ms] */
#endif

/* Resultado, para mirar en Expressions */
enum
{
    SPLASH_NOT_TRIED = 0,
    SPLASH_SHOWN,          /* 1: se mostro al menos una imagen */
    SPLASH_NO_SD,          /* 2: no hay tarjeta o no se pudo montar */
    SPLASH_NO_FILE,        /* 3: no hay ningun SPLASHn.BMP */
    SPLASH_BAD_FORMAT,     /* 4: no es BMP de 24/32 bits sin compresion o es mas grande que la pantalla */
    SPLASH_READ_ERROR      /* 5: fallo leyendo la tarjeta a mitad de una imagen */
};
extern volatile uint8_t splash_result;
extern volatile uint8_t splash_count;    /* cuantas imagenes se mostraron */

void Splash_Show(void);
void Splash_Finish(void);

#endif /* SPLASH_H */
