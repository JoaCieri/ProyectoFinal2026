/*
 * settings.c
 * Ver settings.h
 *
 * Formato en la EEPROM: dos copias identicas (A y B), cada una con cabecera y CRC32.
 * Se escribe primero A y despues B, asi un corte de energia en medio de una escritura
 * siempre deja al menos una copia valida.
 */
#include "settings.h"
#include "i2c_devices.h"
#include "signals.h"
#include "processing.h"
#include <string.h>
#include <stdint.h>

#define SETTINGS_MAGIC     0x4D434545u   /* 'MCEE' */
#define SETTINGS_VERSION   1u

#define SLOT_A_ADDR        0u
#define SLOT_B_ADDR        64u           /* multiplo de 32: cada copia arranca en limite de pagina */

typedef struct
{
    uint32_t magic;
    uint16_t version;
    uint16_t length;        /* sizeof(settings_blob_t) */
    float    gain[6];       /* V1, I1, V2, I2, V3, I3 (mismo orden que los canales del ADC) */
    uint32_t reserved[4];   /* futuro */
    uint32_t crc;           /* CRC32 de todo lo anterior */
} settings_blob_t;          /* 52 bytes: entra en una ranura de 64 */

static settings_blob_t factory;
static bool factory_valid = false;

/* ----------------------------- CRC32 ----------------------------- */

/* CRC-32 estandar (polinomio 0xEDB88320). Sin tabla: son pocos bytes y casi nunca se llama. */
static uint32_t crc32_calc(const uint8_t *d, uint32_t n)
{
    uint32_t crc = 0xFFFFFFFFu;
    while (n--)
    {
        crc ^= *d++;
        for (uint8_t i = 0; i < 8; i++)
            crc = (crc & 1u) ? (crc >> 1) ^ 0xEDB88320u : (crc >> 1);
    }
    return ~crc;
}

/* --------------------- variables <-> bloque --------------------- */

static void blob_from_globals(settings_blob_t *b)
{
    memset(b, 0, sizeof(*b));
    b->magic   = SETTINGS_MAGIC;
    b->version = SETTINGS_VERSION;
    b->length  = sizeof(*b);

    b->gain[0] = voltage1_gain;
    b->gain[1] = current1_gain;
    b->gain[2] = voltage2_gain;
    b->gain[3] = current2_gain;
    b->gain[4] = voltage3_gain;
    b->gain[5] = current3_gain;

    b->crc = crc32_calc((const uint8_t *)b, sizeof(*b) - sizeof(b->crc));
}

static void blob_apply(const settings_blob_t *b)
{
    voltage1_gain = b->gain[0];
    current1_gain = b->gain[1];
    voltage2_gain = b->gain[2];
    current2_gain = b->gain[3];
    voltage3_gain = b->gain[4];
    current3_gain = b->gain[5];
}

static bool blob_valid(const settings_blob_t *b)
{
    if (b->magic != SETTINGS_MAGIC)     return false;
    if (b->version != SETTINGS_VERSION) return false;
    if (b->length != sizeof(*b))        return false;
    return b->crc == crc32_calc((const uint8_t *)b, sizeof(*b) - sizeof(b->crc));
}

/* --------------------------- EEPROM --------------------------- */

static bool read_slot(uint16_t addr, settings_blob_t *b)
{
    return EEPROM_Read(addr, (uint8_t *)b, sizeof(*b)) && blob_valid(b);
}

/* Escribe pagina por pagina y atiende al ADC entre paginas (plazo de 25.6 ms por bloque). */
static bool write_slot(uint16_t addr, const settings_blob_t *b)
{
    const uint8_t *p = (const uint8_t *)b;
    uint16_t off = 0;
    uint16_t left = sizeof(*b);

    while (left > 0)
    {
        uint16_t n = (left > EEPROM_PAGE_SIZE) ? EEPROM_PAGE_SIZE : left;
        if (!EEPROM_Write(addr + off, p + off, n))
            return false;
        off  += n;
        left -= n;
        ProcessPendingBuffers();
    }
    return true;
}

/* Escribe y relee para verificar */
static bool write_slot_verified(uint16_t addr, const settings_blob_t *b)
{
    settings_blob_t check;
    if (!write_slot(addr, b))
        return false;
    bool ok = read_slot(addr, &check) && (memcmp(b, &check, sizeof(*b)) == 0);
    ProcessPendingBuffers();
    return ok;
}

/* ---------------------------- API ---------------------------- */

settings_status_t Settings_Init(void)
{
    /* Los valores de fabrica son los que trae signals.c antes de leer la EEPROM */
    blob_from_globals(&factory);
    factory_valid = true;

    if (!EEPROM_Init())
        return SETTINGS_NO_EEPROM;

    settings_blob_t a, b;
    bool a_ok = read_slot(SLOT_A_ADDR, &a);
    bool b_ok = read_slot(SLOT_B_ADDR, &b);

    if (a_ok)
    {
        blob_apply(&a);
        /* A se escribe primero: si B falta o difiere, A es la mas nueva. Re-sincronizar B */
        if (!b_ok || memcmp(&a, &b, sizeof(a)) != 0)
            write_slot_verified(SLOT_B_ADDR, &a);
        return SETTINGS_LOADED;
    }

    if (b_ok)
    {
        blob_apply(&b);
        write_slot_verified(SLOT_A_ADDR, &b);
        return SETTINGS_LOADED_BACKUP;
    }

    /* EEPROM virgen o danada: grabar los valores de fabrica */
    Settings_Save();
    return SETTINGS_DEFAULTS;
}

bool Settings_Save(void)
{
    settings_blob_t blob;
    blob_from_globals(&blob);

    if (!write_slot_verified(SLOT_A_ADDR, &blob))
        return false;
    return write_slot_verified(SLOT_B_ADDR, &blob);
}

void Settings_RestoreFactory(void)
{
    if (factory_valid)
        blob_apply(&factory);
}
