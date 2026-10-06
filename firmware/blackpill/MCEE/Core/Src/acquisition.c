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


volatile uint32_t adc_overruns = 0;


/* Callback de buffer completo */
void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* hadc)
{
	/* el bloque anterior no se procesó a tiempo */
    if (adc_full_complete) adc_overruns++;
	adc_full_complete = 1;
}

/* Callback de mitad de buffer */
void HAL_ADC_ConvHalfCpltCallback(ADC_HandleTypeDef* hadc)
{
    if (adc_half_complete) adc_overruns++;
    adc_half_complete = 1;
}

void ProcessADCBuffer(uint16_t *buffer)
{
    for (uint16_t i = 0; i < HALF_BUFFER_SAMPLES; i++)
    {
        uint16_t index = i * ADC_CHANNELS;
        // ADC de 12 Bits: 2^12=4095
        voltage1[i] = (buffer[index + 0] * 3.3f) / 4095.0f;
        current1[i] = (buffer[index + 1] * 3.3f) / 4095.0f;
        voltage2[i] = (buffer[index + 2] * 3.3f) / 4095.0f;
        current2[i] = (buffer[index + 3] * 3.3f) / 4095.0f;
        voltage3[i] = (buffer[index + 4] * 3.3f) / 4095.0f;
        current3[i] = (buffer[index + 5] * 3.3f) / 4095.0f;
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
