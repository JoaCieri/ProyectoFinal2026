#include "processing.h"
#include "signals.h"
#include "acquisition.h"
#include "measurements.h"
#include <math.h>

#define WARMUP_BUFFERS     200  // ~5s de descarte antes de calibrar y medir
#define VRMS_AVG_SAMPLES   50   // ~1s de promedio (50 buffers de ~20ms)

/* Piso de ruido de la medicion de corriente (medido en vacio con el SCT-013, 2026-10-24).
 * Es ruido aleatorio (P promedia ~0), asi que se resta en forma cuadratica: I = sqrt(I^2 - In^2).
 * Por debajo de CURRENT_MIN_A se muestra 0 (y P = Q = 0). */
#define CURRENT1_NOISE_A   0.28f      /* medido entre 0.25 y 0.29 A segun el arranque */
#define CURRENT_MIN_A      0.15f

/* Valores promediados en ~1 s, para mostrar / registrar / Modbus */
volatile float p_active1_display   = 0.0f;   /* W   */
volatile float q_reactive1_display = 0.0f;   /* var, con signo (+ inductiva) */

/* Diagnostico: mayor tiempo sin atender el ADC (si supera ~25 ms se pierden buffers) */
volatile uint32_t dbg_max_gap_ms = 0;
volatile uint32_t dbg_max_gap_at_ms = 0;     /* HAL_GetTick() cuando ocurrio */

static uint16_t buffer_count = 0;
static uint8_t calibration_done = 0;

static float vrms1_accum = 0.0f;
static uint16_t vrms1_avg_count = 0;
static float irms1_sq_accum = 0.0f;           /* suma de I^2: el promedio de RMS se hace en cuadratico */
static float p1_accum = 0.0f;
static float q1_accum = 0.0f;
static uint16_t irms1_avg_count = 0;

void ProcessMeasurements(void)
{
    /* Descartar buffers iniciales, todavia no calibrar ni medir */
    if (buffer_count < WARMUP_BUFFERS)
    {
        buffer_count++;
        return;
    }

    /* CALIBRACION */
    if (!calibration_done)
    {
        CalibrateOffset();
        calibration_done = 1;
    }
    ApplyCalibration();

    /* FRECUENCIA */
    measured_line_freq = MeasureLineFrequency(voltage1_ac, HALF_BUFFER_SAMPLES, 5000.0f);
    if (measured_line_freq > 0.0f)
    {
        if (measured_line_freq < line_freq_min) line_freq_min = measured_line_freq;
        if (measured_line_freq > line_freq_max) line_freq_max = measured_line_freq;
    }

    /* TENSION RMS */
    vrms1 = CalculateRMS(voltage1_ac);
    vrms1_accum += vrms1;
    vrms1_avg_count++;
    if (vrms1_avg_count >= VRMS_AVG_SAMPLES)
    {
        vrms1_display = vrms1_accum / VRMS_AVG_SAMPLES;
        vrms1_accum = 0.0f;
        vrms1_avg_count = 0;
    }

    /* CORRIENTE RMS Y POTENCIA (de este ciclo) */
    irms1 = CalculateRMS(current1_ac);
    CalculatePower(voltage1_ac, current1_ac, vrms1, irms1);

    /* Promedio de ~1 s: I en cuadratico (para poder restar el ruido), P y Q lineales */
    irms1_sq_accum += irms1 * irms1;
    p1_accum += p_active1;
    q1_accum += p_reactive1;
    irms1_avg_count++;
    if (irms1_avg_count >= VRMS_AVG_SAMPLES)
    {
        float i2 = irms1_sq_accum / VRMS_AVG_SAMPLES - CURRENT1_NOISE_A * CURRENT1_NOISE_A;
        float i  = (i2 > 0.0f) ? sqrtf(i2) : 0.0f;

        if (i < CURRENT_MIN_A)
        {
            irms1_display       = 0.0f;
            p_active1_display   = 0.0f;
            q_reactive1_display = 0.0f;
        }
        else
        {
            irms1_display       = i;
            p_active1_display   = p1_accum / VRMS_AVG_SAMPLES;
            q_reactive1_display = q1_accum / VRMS_AVG_SAMPLES;
        }
        irms1_sq_accum = 0.0f;
        p1_accum = 0.0f;
        q1_accum = 0.0f;
        irms1_avg_count = 0;
    }

    /* ARMONICOS */
    CalculateHarmonics(voltage1_ac);

    /* DETECCION DE EVENTOS */
    DetectVoltageEvents(vrms1);
}


void ProcessPendingBuffers(void)
{
    /* Diagnostico: cuanto tiempo paso desde la ultima vez que se llamo a esta funcion */
    static uint32_t last_call_ms = 0;
    static uint8_t  adc_running = 0;      /* se mide recien cuando llego el primer buffer del ADC */
    uint32_t now = HAL_GetTick();
    if (adc_half_complete || adc_full_complete)
        adc_running = 1;
    if (adc_running && last_call_ms != 0 && (now - last_call_ms) > dbg_max_gap_ms)
    {
        dbg_max_gap_ms = now - last_call_ms;
        dbg_max_gap_at_ms = now;
    }
    last_call_ms = now;

    if (adc_half_complete) {
        adc_half_complete = 0;
        ProcessADCBuffer(&adc_buffer[0]);
        ProcessMeasurements();
    } else if (adc_full_complete) {
        adc_full_complete = 0;
        ProcessADCBuffer(&adc_buffer[(ADC_CHANNELS * DMA_BUFFER_SAMPLES) / 2]);
        ProcessMeasurements();
    }
}
