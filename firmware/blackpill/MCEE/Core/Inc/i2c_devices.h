/*
 * i2c_devices.h
 * Drivers de dispositivos en el bus I2C1 (PB8 SCL / PB9 SDA):
 *   - DS3231  : RTC con compensacion de temperatura (0x68)
 *   - AT24C32 : EEPROM de 4 KB (0x50, o 0x57 en el modulo ZS-042)
 *
 * Todas las funciones son bloqueantes y devuelven true si salio bien.
 */
#ifndef I2C_DEVICES_H
#define I2C_DEVICES_H

#include <stdint.h>
#include <stdbool.h>

/* ======================= DS3231 (RTC) ======================= */

typedef struct
{
    uint8_t  sec;     /* 0-59 */
    uint8_t  min;     /* 0-59 */
    uint8_t  hour;    /* 0-23 */
    uint8_t  wday;    /* 1-7 (1 = lunes, 7 = domingo). Solo lectura: SetTime lo calcula */
    uint8_t  day;     /* 1-31 */
    uint8_t  month;   /* 1-12 */
    uint16_t year;    /* 2000-2099 */
} rtc_time_t;

bool DS3231_Init(void);                              /* verifica presencia y configura control */
bool DS3231_LostPower(void);                         /* true si la hora no es confiable (OSF) */
bool DS3231_GetTime(rtc_time_t *t);
bool DS3231_SetTime(const rtc_time_t *t);            /* valida rangos y limpia OSF */
bool DS3231_GetTemperatureX100(int16_t *temp_x100);  /* grados C x100 (2575 = 25.75 C) */

/* ======================= AT24C32 (EEPROM) ======================= */

#define EEPROM_SIZE        4096u   /* bytes */
#define EEPROM_PAGE_SIZE   32u     /* bytes */

bool EEPROM_Init(void);                                            /* verifica presencia */
bool EEPROM_Read(uint16_t addr, uint8_t *data, uint16_t len);
bool EEPROM_Write(uint16_t addr, const uint8_t *data, uint16_t len);

#endif /* I2C_DEVICES_H */
