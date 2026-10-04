/*
 * encoder.h
 *
 *  Created on: 4 oct 2026
 *      Author: igles
 */

#ifndef ENCODER_H
#define ENCODER_H

#include <stdint.h>

void    Encoder_Init(void);
int16_t Encoder_GetDelta(void);       // pasos (muescas) desde la última llamada: + horario, - antihorario
uint8_t Encoder_ButtonPressed(void);  // devuelve 1 una vez por pulsación y se limpia solo
uint8_t Encoder_ButtonIsDown(void);   // 1 mientras el botón está apretado

#endif
