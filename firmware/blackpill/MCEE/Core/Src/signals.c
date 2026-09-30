#include "signals.h"

float voltage1_ac[HALF_BUFFER_SAMPLES];
float voltage2_ac[HALF_BUFFER_SAMPLES];
float voltage3_ac[HALF_BUFFER_SAMPLES];
float current1_ac[HALF_BUFFER_SAMPLES];
float current2_ac[HALF_BUFFER_SAMPLES];
float current3_ac[HALF_BUFFER_SAMPLES];

float voltage1_offset = 0.0f, voltage2_offset = 0.0f, voltage3_offset = 0.0f;
float current1_offset = 0.0f, current2_offset = 0.0f, current3_offset = 0.0f;
float voltage1_gain = 227.0f / 1.46f; // 1.46Vrms medidos con 227VAC de referencia (multimetro)
float voltage2_gain = 1.0f, voltage3_gain = 1.0f;
float current1_gain = 1.0f, current2_gain = 1.0f, current3_gain = 1.0f;

volatile float vrms1 = 0.0f, vrms2 = 0.0f, vrms3 = 0.0f;
volatile float irms1 = 0.0f, irms2 = 0.0f, irms3 = 0.0f;
volatile float vrms1_display = 0.0f;
volatile float irms1_display = 0.0f;

volatile float measured_line_freq = 0.0f;
volatile float line_freq_min = 9999.0f;
volatile float line_freq_max = 0.0f;

float voltage1_harmonics[MAX_HARMONIC + 1];
float voltage1_thd = 0.0f;

volatile float p_active1 = 0.0f;
volatile float p_apparent1 = 0.0f;
volatile float p_reactive1 = 0.0f;
volatile float power_factor1 = 0.0f;

power_event_t events_log[MAX_EVENTS_LOG];
volatile uint8_t events_count = 0;
