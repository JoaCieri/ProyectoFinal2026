#ifndef GUI_H
#define GUI_H

#include <stdint.h>
#include <stdbool.h>
#include "test_logger.h"

void Gui_Init(void);

/* Actualiza los valores en vivo de la fase 1 y la hora (lo llama test_logger cada 500 ms) */
void Gui_ShowLive(const measurement_snapshot_t *s);

/* Estado del registro: logging = grabando, samples = muestras de la sesion,
 * sd_text / eth_text = textos cortos para los recuadros SD y ETH. */
void Gui_SetStatus(bool logging, uint32_t samples, const char *sd_text, const char *eth_text);

#endif
