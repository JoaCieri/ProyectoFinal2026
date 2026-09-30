#ifndef SIGNALS_H
#define SIGNALS_H

#include "main.h"

#define HALF_BUFFER_SAMPLES  128
#define SAMPLES_PER_CYCLE    100   // 5000 SPS / 50 Hz

/* Señales calibradas (AC, offset removido, ganancia aplicada) */
extern float voltage1_ac[HALF_BUFFER_SAMPLES];
extern float voltage2_ac[HALF_BUFFER_SAMPLES];
extern float voltage3_ac[HALF_BUFFER_SAMPLES];
extern float current1_ac[HALF_BUFFER_SAMPLES];
extern float current2_ac[HALF_BUFFER_SAMPLES];
extern float current3_ac[HALF_BUFFER_SAMPLES];

/* Calibracion: offset y ganancia por canal */
extern float voltage1_offset, voltage2_offset, voltage3_offset;
extern float current1_offset, current2_offset, current3_offset;
extern float voltage1_gain, voltage2_gain, voltage3_gain;
extern float current1_gain, current2_gain, current3_gain;

/* Resultados: tension/corriente RMS */
extern volatile float vrms1, vrms2, vrms3;
extern volatile float irms1, irms2, irms3;
extern volatile float vrms1_display;
extern volatile float irms1_display;

/* Resultados: frecuencia de red */
extern volatile float measured_line_freq;
extern volatile float line_freq_min;
extern volatile float line_freq_max;

/* Resultados: armonicos y THD (fase 1) */
#define MAX_HARMONIC   25
extern float voltage1_harmonics[MAX_HARMONIC + 1];
extern float voltage1_thd;

/* Resultados: potencia (fase 1) */
extern volatile float p_active1;
extern volatile float p_apparent1;
extern volatile float p_reactive1;
extern volatile float power_factor1;

/* Resultados: eventos sag/swell */
typedef enum { EVENT_NONE = 0, EVENT_SAG, EVENT_SWELL } event_type_t;

typedef struct {
    event_type_t type;
    uint32_t start_time_ms;
    uint32_t duration_ms;
    float extreme_value;
} power_event_t;

#define MAX_EVENTS_LOG   20
extern power_event_t events_log[MAX_EVENTS_LOG];
extern volatile uint8_t events_count;

#endif /* SIGNALS_H */
