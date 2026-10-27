#include "acquisition.h"
#include "signals.h"
#include "measurements.h"   // CalculateMean() lo usa CalibrateOffset()

uint16_t adc_buffer[ADC_CHANNELS * DMA_BUFFER_SAMPLES];
volatile uint8_t adc_half_complete = 0;
volatile uint8_t adc_full_complete = 0;

/* Señales crudas (antes de calibrar): solo las usa este archivo */
static float voltage1[HALF_BUFFER_SAMPLES];
static float voltage2[HALF_BUFFER_SAMPLES];
static float voltage3[HALF_BUFFER_SAMPLES];
static float current1[HALF_BUFFER_SAMPLES];
static float current2[HALF_BUFFER_SAMPLES];
static float current3[HALF_BUFFER_SAMPLES];

/* Esta variable se debe monitorear que permanezca en 0 para validar que el
 * agregado de modulos no afecte la adquisicion de muestras y se pierdan */
volatile uint32_t adc_overruns = 0;
volatile uint32_t adc_overrun_first_ms = 0;   /* HAL_GetTick() del primer buffer perdido */
volatile uint32_t adc_overrun_last_ms  = 0;   /* HAL_GetTick() del ultimo buffer perdido */

/* Diagnostico de los callbacks (mirar en Expressions):
 *   dbg_cb_min_ms / dbg_cb_max_ms : intervalo minimo y maximo entre callbacks seguidos.
 *                                   Normal: ~25-26 ms (medio buffer de 128 muestras a 5 kHz).
 *   dbg_ovr_age_ms                : en el ultimo overrun, cuanto hacia que ese medio buffer
 *                                   estaba esperando ser procesado.
 *                                   ~51 ms  -> el programa no lo atendio a tiempo
 *                                   pocos ms -> el callback se disparo de mas (no es falta de tiempo) */
volatile uint32_t dbg_cb_min_ms = 0xFFFFFFFFu, dbg_cb_max_ms = 0;
volatile uint32_t dbg_ovr_age_ms = 0;
volatile uint32_t dbg_cb_count = 0;

static uint32_t half_set_ms = 0, full_set_ms = 0, last_cb_ms = 0;

static void cb_interval(uint32_t now)
{
    if (dbg_cb_count > 4)                 /* los primeros pueden venir pegados al arranque */
    {
        uint32_t d = now - last_cb_ms;
        if (d < dbg_cb_min_ms) dbg_cb_min_ms = d;
        if (d > dbg_cb_max_ms) dbg_cb_max_ms = d;
    }
    last_cb_ms = now;
    dbg_cb_count++;
}

static void overrun(uint32_t age_ms)
{
    adc_overruns++;
    dbg_ovr_age_ms = age_ms;
    adc_overrun_last_ms = HAL_GetTick();
    if (adc_overrun_first_ms == 0)
        adc_overrun_first_ms = adc_overrun_last_ms;
}


/* Callback de buffer completo */
void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* hadc)
{
    uint32_t now = HAL_GetTick();
    cb_interval(now);
    if (adc_full_complete) overrun(now - full_set_ms);
    full_set_ms = now;
	adc_full_complete = 1;
}

/* Callback de mitad de buffer */
void HAL_ADC_ConvHalfCpltCallback(ADC_HandleTypeDef* hadc)
{
    uint32_t now = HAL_GetTick();
    cb_interval(now);
    if (adc_half_complete) overrun(now - half_set_ms);
    half_set_ms = now;
    adc_half_complete = 1;
}

/* Diagnostico de recorte: minimo y maximo crudos (0..4095) de V1 e I1 en el ultimo medio buffer.
 * Si llegan a ~0 o ~4095 la senial esta saturando el ADC (bajar la amplitud con el preset del ZMPT). */
volatile uint16_t dbg_v1_min, dbg_v1_max, dbg_i1_min, dbg_i1_max;

/* Captura de un ciclo crudo (100 muestras, valores 0..4095) para ver la forma de onda.
 * Uso: en Expressions poner dbg_capture = 1 y dar Resume; al siguiente medio buffer se copian
 * las muestras y dbg_capture pasa a 2 (ya no cambian). Pausar y copiar dbg_v1_wave / dbg_i1_wave. */
#define DBG_WAVE_LEN   100
volatile uint8_t  dbg_capture = 0;
volatile uint16_t dbg_v1_wave[DBG_WAVE_LEN];
volatile uint16_t dbg_i1_wave[DBG_WAVE_LEN];

void ProcessADCBuffer(uint16_t *buffer)
{
    uint16_t vmin = 4095, vmax = 0, imin = 4095, imax = 0;

    for (uint16_t i = 0; i < HALF_BUFFER_SAMPLES; i++)
    {
        uint16_t index = i * ADC_CHANNELS;
        uint16_t rv = buffer[index + 0], ri = buffer[index + 1];
        if (rv < vmin) vmin = rv;
        if (rv > vmax) vmax = rv;
        if (ri < imin) imin = ri;
        if (ri > imax) imax = ri;
        // ADC de 12 Bits: 2^12=4095
        voltage1[i] = (buffer[index + 0] * 3.3f) / 4095.0f;
        current1[i] = (buffer[index + 1] * 3.3f) / 4095.0f;
        voltage2[i] = (buffer[index + 2] * 3.3f) / 4095.0f;
        current2[i] = (buffer[index + 3] * 3.3f) / 4095.0f;
        voltage3[i] = (buffer[index + 4] * 3.3f) / 4095.0f;
        current3[i] = (buffer[index + 5] * 3.3f) / 4095.0f;
    }

    dbg_v1_min = vmin;  dbg_v1_max = vmax;
    dbg_i1_min = imin;  dbg_i1_max = imax;

    if (dbg_capture == 1)
    {
        for (uint16_t i = 0; i < DBG_WAVE_LEN && i < HALF_BUFFER_SAMPLES; i++)
        {
            dbg_v1_wave[i] = buffer[i * ADC_CHANNELS + 0];
            dbg_i1_wave[i] = buffer[i * ADC_CHANNELS + 1];
        }
        dbg_capture = 2;
    }
}

void CalibrateOffset(void)
{
    voltage1_offset = CalculateMean(voltage1);
    current1_offset = CalculateMean(current1);
    voltage2_offset = CalculateMean(voltage2);
    current2_offset = CalculateMean(current2);
    voltage3_offset = CalculateMean(voltage3);
    current3_offset = CalculateMean(current3);
}

void ApplyCalibration(void)
{
    for (uint16_t i = 0; i < HALF_BUFFER_SAMPLES; i++)
    {
        voltage1_ac[i] = (voltage1[i] - voltage1_offset) * voltage1_gain;
        current1_ac[i] = (current1[i] - current1_offset) * current1_gain;
        voltage2_ac[i] = (voltage2[i] - voltage2_offset) * voltage2_gain;
        current2_ac[i] = (current2[i] - current2_offset) * current2_gain;
        voltage3_ac[i] = (voltage3[i] - voltage3_offset) * voltage3_gain;
        current3_ac[i] = (current3[i] - current3_offset) * current3_gain;
    }
}
