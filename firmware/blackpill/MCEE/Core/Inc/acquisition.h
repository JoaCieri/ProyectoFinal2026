#ifndef ACQUISITION_H
#define ACQUISITION_H

#include "main.h"

#define ADC_CHANNELS        6
#define DMA_BUFFER_SAMPLES  256

extern uint16_t adc_buffer[ADC_CHANNELS * DMA_BUFFER_SAMPLES];
extern volatile uint8_t adc_half_complete;
extern volatile uint8_t adc_full_complete;

void ProcessADCBuffer(uint16_t *buffer);
void CalibrateOffset(void);
void ApplyCalibration(void);

#endif /* ACQUISITION_H */
