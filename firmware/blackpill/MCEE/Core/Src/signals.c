#include "signals.h"

float voltage1_ac[HALF_BUFFER_SAMPLES];
float voltage2_ac[HALF_BUFFER_SAMPLES];
float voltage3_ac[HALF_BUFFER_SAMPLES];
float current1_ac[HALF_BUFFER_SAMPLES];
float current2_ac[HALF_BUFFER_SAMPLES];
float current3_ac[HALF_BUFFER_SAMPLES];

float voltage1_offset = 0.0f, voltage2_offset = 0.0f, voltage3_offset = 0.0f;
float current1_offset = 0.0f, current2_offset = 0.0f, current3_offset = 0.0f;
float voltage1_gain = 229.0f/0.148416877f; //0.0028Vrms medidos con 229VAC de referencia (multimetro)
float voltage2_gain = 1.0f, voltage3_gain = 1.0f;
/* SCT-013 100 A / 1 V: solo, da 1 V eficaz a 100 A (carga interna ~20 ohm con 2000 espiras).
 * En la PCB, R2 = 100 ohm queda EN PARALELO con el sensor (entre TOP y RING):
 * 20 || 100 = 16.7 ohm -> ~0.83 V a 100 A -> ~120 A/V. Valor inicial; calibrar con una pinza:
 *     gain_nuevo = gain_actual * I_pinza / I_medida
 * (Si se saca R2, el valor teorico vuelve a ser 100 A/V.) */
float current1_gain = 120.0f;
float current2_gain = 1.0f, current3_gain = 1.0f;

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
