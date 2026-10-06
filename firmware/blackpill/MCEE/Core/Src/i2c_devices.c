/*
 * i2c_devices.c
 *
 *  Created on: 6 oct 2026
 *      Author: igles
 */

#include "i2c_devices.h"
#include "main.h"

extern I2C_HandleTypeDef hi2c1;

#define I2C_TIMEOUT_MS          50

/* ======================= DS3231 ======================= */

#define DS3231_ADDR             (0x68 << 1)
#define DS3231_REG_TIME         0x00
#define DS3231_REG_CONTROL      0x0E
#define DS3231_REG_STATUS       0x0F
#define DS3231_REG_TEMP         0x11
#define DS3231_STATUS_OSF       0x80   /* oscilador se detuvo: hora no confiable */

static uint8_t bcd2bin(uint8_t v) { return (uint8_t)((v >> 4) * 10u + (v & 0x0Fu)); }
static uint8_t bin2bcd(uint8_t v) { return (uint8_t)(((v / 10u) << 4) | (v % 10u)); }

/* Dia de la semana (algoritmo de Sakamoto). Devuelve 1 = lunes ... 7 = domingo */
static uint8_t calc_wday(uint16_t y, uint8_t m, uint8_t d)
{
    static const uint8_t t[12] = {0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4};
    if (m < 3) y -= 1;
    uint8_t w = (uint8_t)((y + y / 4 - y / 100 + y / 400 + t[m - 1] + d) % 7);  /* 0 = domingo */
    return (w == 0) ? 7 : w;
}

bool DS3231_Init(void)
{
    if (HAL_I2C_IsDeviceReady(&hi2c1, DS3231_ADDR, 2, I2C_TIMEOUT_MS) != HAL_OK)
        return false;

    /* EOSC=0 (oscila tambien con bateria), sin onda cuadrada ni alarmas */
    uint8_t ctrl = 0x04;
    return HAL_I2C_Mem_Write(&hi2c1, DS3231_ADDR, DS3231_REG_CONTROL,
                             I2C_MEMADD_SIZE_8BIT, &ctrl, 1, I2C_TIMEOUT_MS) == HAL_OK;
}

bool DS3231_LostPower(void)
{
    uint8_t st;
    if (HAL_I2C_Mem_Read(&hi2c1, DS3231_ADDR, DS3231_REG_STATUS,
                         I2C_MEMADD_SIZE_8BIT, &st, 1, I2C_TIMEOUT_MS) != HAL_OK)
        return true;   /* si no responde, no confiar en la hora */

    return (st & DS3231_STATUS_OSF) != 0;
}

bool DS3231_GetTime(rtc_time_t *t)
{
    uint8_t r[7];
    if (HAL_I2C_Mem_Read(&hi2c1, DS3231_ADDR, DS3231_REG_TIME,
                         I2C_MEMADD_SIZE_8BIT, r, 7, I2C_TIMEOUT_MS) != HAL_OK)
        return false;

    t->sec   = bcd2bin(r[0] & 0x7F);
    t->min   = bcd2bin(r[1] & 0x7F);
    t->hour  = bcd2bin(r[2] & 0x3F);          /* modo 24 h */
    t->wday  = r[3] & 0x07;
    t->day   = bcd2bin(r[4] & 0x3F);
    t->month = bcd2bin(r[5] & 0x1F);          /* bit 7 = siglo, se ignora */
    t->year  = 2000u + bcd2bin(r[6]);
    return true;
}

bool DS3231_SetTime(const rtc_time_t *t)
{
    if (t->sec > 59 || t->min > 59 || t->hour > 23 ||
        t->day < 1 || t->day > 31 || t->month < 1 || t->month > 12 ||
        t->year < 2000 || t->year > 2099)
        return false;

    uint8_t r[7];
    r[0] = bin2bcd(t->sec);
    r[1] = bin2bcd(t->min);
    r[2] = bin2bcd(t->hour);                  /* bit 6 = 0 -> modo 24 h */
    r[3] = calc_wday(t->year, t->month, t->day);
    r[4] = bin2bcd(t->day);
    r[5] = bin2bcd(t->month);
    r[6] = bin2bcd((uint8_t)(t->year - 2000u));

    if (HAL_I2C_Mem_Write(&hi2c1, DS3231_ADDR, DS3231_REG_TIME,
                          I2C_MEMADD_SIZE_8BIT, r, 7, I2C_TIMEOUT_MS) != HAL_OK)
        return false;

    /* Hora valida: limpiar el flag OSF */
    uint8_t st;
    if (HAL_I2C_Mem_Read(&hi2c1, DS3231_ADDR, DS3231_REG_STATUS,
                         I2C_MEMADD_SIZE_8BIT, &st, 1, I2C_TIMEOUT_MS) != HAL_OK)
        return false;

    st &= (uint8_t)~DS3231_STATUS_OSF;
    return HAL_I2C_Mem_Write(&hi2c1, DS3231_ADDR, DS3231_REG_STATUS,
                             I2C_MEMADD_SIZE_8BIT, &st, 1, I2C_TIMEOUT_MS) == HAL_OK;
}

bool DS3231_GetTemperatureX100(int16_t *temp_x100)
{
    uint8_t r[2];
    if (HAL_I2C_Mem_Read(&hi2c1, DS3231_ADDR, DS3231_REG_TEMP,
                         I2C_MEMADD_SIZE_8BIT, r, 2, I2C_TIMEOUT_MS) != HAL_OK)
        return false;

    /* 10 bits con signo: MSB entero, 2 bits altos del LSB en pasos de 0.25 C */
    int16_t raw = (int16_t)(((uint16_t)r[0] << 8) | r[1]) >> 6;
    *temp_x100 = (int16_t)(raw * 25);
    return true;
}

/* ======================= AT24C32 ======================= */

/* A0-A2 a GND -> 0x50. El modulo ZS-042 las trae a VCC -> 0x57 */
#define EEPROM_I2C_ADDR         (0x50 << 1)
#define EEPROM_WRITE_TIMEOUT_MS 20     /* el ciclo de escritura tipico es 5-10 ms */

/* Polling de ACK: la EEPROM no contesta mientras escribe internamente */
static bool eeprom_wait_ready(void)
{
    uint32_t t0 = HAL_GetTick();
    while (HAL_I2C_IsDeviceReady(&hi2c1, EEPROM_I2C_ADDR, 1, 2) != HAL_OK)
    {
        if ((HAL_GetTick() - t0) > EEPROM_WRITE_TIMEOUT_MS)
            return false;
    }
    return true;
}

bool EEPROM_Init(void)
{
    return HAL_I2C_IsDeviceReady(&hi2c1, EEPROM_I2C_ADDR, 2, I2C_TIMEOUT_MS) == HAL_OK;
}

bool EEPROM_Read(uint16_t addr, uint8_t *data, uint16_t len)
{
    if ((uint32_t)addr + len > EEPROM_SIZE)
        return false;

    return HAL_I2C_Mem_Read(&hi2c1, EEPROM_I2C_ADDR, addr, I2C_MEMADD_SIZE_16BIT,
                            data, len, I2C_TIMEOUT_MS) == HAL_OK;
}

bool EEPROM_Write(uint16_t addr, const uint8_t *data, uint16_t len)
{
    if ((uint32_t)addr + len > EEPROM_SIZE)
        return false;

    while (len > 0)
    {
        /* Una escritura no puede cruzar el limite de pagina de 32 bytes */
        uint16_t room = EEPROM_PAGE_SIZE - (addr % EEPROM_PAGE_SIZE);
        uint16_t n = (len < room) ? len : room;

        if (HAL_I2C_Mem_Write(&hi2c1, EEPROM_I2C_ADDR, addr, I2C_MEMADD_SIZE_16BIT,
                              (uint8_t *)data, n, I2C_TIMEOUT_MS) != HAL_OK)
            return false;

        if (!eeprom_wait_ready())
            return false;

        addr += n;
        data += n;
        len  -= n;
    }
    return true;
}
