#include <math.h>
#include "measurements.h"
#include "signals.h"

////////////////////////////////////////////////////////////////////////////
// RMS, MEDIA Y FRECUENCIA DE RED
////////////////////////////////////////////////////////////////////////////

#define ZC_HYSTERESIS          3.0f   // volts; ajustable segun ruido observado
#define MIN_SAMPLES_PER_CYCLE  95     // ~52.6Hz maximo plausible (+5%)
#define MAX_SAMPLES_PER_CYCLE  105    // ~47.6Hz minimo plausible (-5%)

float CalculateRMS(float *signal)
{
    float sum = 0.0f;
    for (uint16_t i = 0; i < SAMPLES_PER_CYCLE; i++)
    {
        sum += signal[i] * signal[i];
    }
    return sqrtf(sum / SAMPLES_PER_CYCLE);
}

float CalculateMean(float *signal)
{
    float sum = 0.0f;
    for (uint16_t i = 0; i < SAMPLES_PER_CYCLE; i++)
    {
        sum += signal[i];
    }
    return sum / SAMPLES_PER_CYCLE;
}

float MeasureLineFrequency(float *signal, uint16_t N, float fs)
{
    int16_t first_crossing = -1;
    int16_t second_crossing = -1;
    uint8_t armed = 0; // se "arma" cuando la senial estuvo claramente negativa

    for (uint16_t i = 0; i < N; i++)
    {
        if (signal[i] < -ZC_HYSTERESIS)
        {
            armed = 1;
        }
        else if (armed && signal[i] > ZC_HYSTERESIS)
        {
            if (first_crossing == -1)
            {
                first_crossing = i;
            }
            else
            {
                second_crossing = i;
                break;
            }
            armed = 0;
        }
    }

    if (first_crossing >= 0 && second_crossing > first_crossing)
    {
        uint16_t samples_per_cycle_real = second_crossing - first_crossing;

        if (samples_per_cycle_real >= MIN_SAMPLES_PER_CYCLE &&
            samples_per_cycle_real <= MAX_SAMPLES_PER_CYCLE)
        {
            return fs / (float)samples_per_cycle_real;
        }
    }

    return 0.0f; // no se pudo medir un ciclo plausible
}

////////////////////////////////////////////////////////////////////////////
// ARMONICOS Y THD
////////////////////////////////////////////////////////////////////////////

/* Calcula la amplitud del armonico "k" (k=1 es la fundamental) sobre un buffer de N muestras */
static float GoertzelMagnitude(float *signal, uint16_t N, uint16_t k)
{
    float w = 2.0f * 3.14159265f * k / N;
    float coeff = 2.0f * cosf(w);

    float s_prev = 0.0f;
    float s_prev2 = 0.0f;

    for (uint16_t i = 0; i < N; i++)
    {
        float s = signal[i] + coeff * s_prev - s_prev2;
        s_prev2 = s_prev;
        s_prev = s;
    }

    float real = s_prev - s_prev2 * cosf(w);
    float imag = s_prev2 * sinf(w);

    return (2.0f / N) * sqrtf(real * real + imag * imag);
}

void CalculateHarmonics(float *signal)
{
    for (uint16_t k = 1; k <= MAX_HARMONIC; k++)
    {
        voltage1_harmonics[k] = GoertzelMagnitude(signal, SAMPLES_PER_CYCLE, k);
    }

    float sum_sq_harmonics = 0.0f;
    for (uint16_t k = 2; k <= MAX_HARMONIC; k++)
    {
        sum_sq_harmonics += voltage1_harmonics[k] * voltage1_harmonics[k];
    }

    voltage1_thd = (voltage1_harmonics[1] > 0.0f)
        ? (sqrtf(sum_sq_harmonics) / voltage1_harmonics[1]) * 100.0f
        : 0.0f;
}

////////////////////////////////////////////////////////////////////////////
// POTENCIA (P, Q, S, FP)
////////////////////////////////////////////////////////////////////////////

void CalculatePower(float *voltage_ac, float *current_ac, float vrms, float irms)
{
    float sum_inst = 0.0f;

    for (uint16_t i = 0; i < SAMPLES_PER_CYCLE; i++)
    {
        sum_inst += voltage_ac[i] * current_ac[i];
    }

    p_active1 = sum_inst / SAMPLES_PER_CYCLE;
    p_apparent1 = vrms * irms;

    float q_sq = (p_apparent1 * p_apparent1) - (p_active1 * p_active1);
    p_reactive1 = (q_sq > 0.0f) ? sqrtf(q_sq) : 0.0f;

    power_factor1 = (p_apparent1 > 0.0f) ? (p_active1 / p_apparent1) : 0.0f;
}

////////////////////////////////////////////////////////////////////////////
// EVENTOS: SAG / SWELL
////////////////////////////////////////////////////////////////////////////

#define NOMINAL_VOLTAGE       220.0f
#define SAG_THRESHOLD_LOW     (0.90f * NOMINAL_VOLTAGE)
#define SAG_THRESHOLD_HIGH    (0.92f * NOMINAL_VOLTAGE)
#define SWELL_THRESHOLD_HIGH  (1.10f * NOMINAL_VOLTAGE)
#define SWELL_THRESHOLD_LOW   (1.08f * NOMINAL_VOLTAGE)

static event_type_t current_event_type = EVENT_NONE;
static uint32_t current_event_start = 0;
static float current_event_extreme = 0.0f;

void DetectVoltageEvents(float vrms)
{
    if (current_event_type == EVENT_NONE)
    {
        if (vrms < SAG_THRESHOLD_LOW)
        {
            current_event_type = EVENT_SAG;
            current_event_start = HAL_GetTick();
            current_event_extreme = vrms;
        }
        else if (vrms > SWELL_THRESHOLD_HIGH)
        {
            current_event_type = EVENT_SWELL;
            current_event_start = HAL_GetTick();
            current_event_extreme = vrms;
        }
    }
    else if (current_event_type == EVENT_SAG)
    {
        if (vrms < current_event_extreme) current_event_extreme = vrms;

        if (vrms >= SAG_THRESHOLD_HIGH)
        {
            if (events_count < MAX_EVENTS_LOG)
            {
                events_log[events_count].type = EVENT_SAG;
                events_log[events_count].start_time_ms = current_event_start;
                events_log[events_count].duration_ms = HAL_GetTick() - current_event_start;
                events_log[events_count].extreme_value = current_event_extreme;
                events_count++;
            }
            current_event_type = EVENT_NONE;
        }
    }
    else // EVENT_SWELL
    {
        if (vrms > current_event_extreme) current_event_extreme = vrms;

        if (vrms <= SWELL_THRESHOLD_LOW)
        {
            if (events_count < MAX_EVENTS_LOG)
            {
                events_log[events_count].type = EVENT_SWELL;
                events_log[events_count].start_time_ms = current_event_start;
                events_log[events_count].duration_ms = HAL_GetTick() - current_event_start;
                events_log[events_count].extreme_value = current_event_extreme;
                events_count++;
            }
            current_event_type = EVENT_NONE;
        }
    }
}
