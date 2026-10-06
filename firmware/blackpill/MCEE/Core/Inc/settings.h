/*
 * settings.h
 * Configuracion persistente en la EEPROM (AT24C32) con CRC32 y copia de respaldo.
 *
 * Por ahora guarda las 6 ganancias de calibracion (V1, I1, V2, I2, V3, I3).
 * El bloque tiene espacio reservado para ir sumando campos (relacion de TC,
 * alarmas, etc.) subiendo SETTINGS_VERSION cuando cambie el formato.
 *
 * Los "valores de fabrica" son los que estan compilados en signals.c: Settings_Init()
 * los captura al arrancar, antes de pisarlos con lo guardado en la EEPROM.
 */
#ifndef SETTINGS_H
#define SETTINGS_H

#include <stdbool.h>

typedef enum
{
    SETTINGS_LOADED = 0,     /* se cargo la copia principal */
    SETTINGS_LOADED_BACKUP,  /* la principal estaba danada: se uso el respaldo y se reparo */
    SETTINGS_DEFAULTS,       /* EEPROM virgen o danada: se grabaron los valores de fabrica */
    SETTINGS_NO_EEPROM       /* la EEPROM no responde: quedan los valores de fabrica en RAM */
} settings_status_t;

/* Llamar una vez al arrancar, despues de configurar I2C y ANTES de arrancar el ADC. */
settings_status_t Settings_Init(void);

/* Guarda las ganancias actuales (las variables de signals.c) en las dos copias. true si ambas quedaron verificadas. */
bool Settings_Save(void);

/* Vuelve las ganancias a los valores de fabrica (solo en RAM; llamar Settings_Save() para grabarlos). */
void Settings_RestoreFactory(void);

#endif /* SETTINGS_H */
