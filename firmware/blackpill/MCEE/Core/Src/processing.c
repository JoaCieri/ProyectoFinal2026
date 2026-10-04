#include "processing.h"
#include "signals.h"
#include "acquisition.h"
#include "measurements.h"

#define WARMUP_BUFFERS     200  // ~5s de descarte antes de calibrar y medir
#define VRMS_AVG_SAMPLES   50   // ~1s de promedio (50 buffers de ~20ms)

static uint16_t buffer_count = 0;
static uint8_t calibration_done = 0;

static float vrms1_accum = 0.0f;
static uint16_t vrms1_avg_count = 0;
static float irms1_accum = 0.0f;
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

    /* CORRIENTE RMS */
    irms1 = CalculateRMS(current1_ac);
    irms1_accum += irms1;
    irms1_avg_count++;
    if (irms1_avg_count >= VRMS_AVG_SAMPLES)
    {
        irms1_display = irms1_accum / VRMS_AVG_SAMPLES;
        irms1_accum = 0.0f;
        irms1_avg_count = 0;
    }

    /* POTENCIA */
    CalculatePower(voltage1_ac, current1_ac, vrms1, irms1);

    /* ARMONICOS */
    CalculateHarmonics(voltage1_ac);

    /* DETECCION DE EVENTOS */
    DetectVoltageEvents(vrms1);
}


void ProcessPendingBuffers(void)
{
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
