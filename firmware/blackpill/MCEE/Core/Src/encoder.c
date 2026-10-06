/*
 * encoder.c
 *
 *  Created on: 4 oct 2026
 *      Author: igles
 */

#include "encoder.h"
#include "main.h"
extern TIM_HandleTypeDef htim4;

//Antirebote
static volatile uint8_t  btn_pending = 0;
static volatile uint32_t btn_edge_tick = 0;
static uint8_t           btn_armed = 1;


#define COUNTS_PER_DETENT   4     // KY-040: 4 cuentas de cuadratura por muesca
#define BUTTON_DEBOUNCE_MS  50

static uint16_t last_cnt = 0;
static int16_t  remainder_cnt = 0;

void Encoder_Init(void)
{
    HAL_TIM_Encoder_Start(&htim4, TIM_CHANNEL_ALL);
    last_cnt = __HAL_TIM_GET_COUNTER(&htim4);
}

int16_t Encoder_GetDelta(void)
{
    uint16_t cnt = __HAL_TIM_GET_COUNTER(&htim4);
    int16_t diff = (int16_t)(cnt - last_cnt);   // correcto aunque el contador de 16 bits desborde
    last_cnt = cnt;

    remainder_cnt += diff;
    int16_t detents = remainder_cnt / COUNTS_PER_DETENT;
    remainder_cnt -= detents * COUNTS_PER_DETENT;   // conserva las cuentas sueltas entre llamadas
    return detents;
}

uint8_t Encoder_ButtonIsDown(void)
{
    return (HAL_GPIO_ReadPin(ENCODER_SW_GPIO_Port, ENCODER_SW_Pin) == GPIO_PIN_RESET);
}

uint8_t Encoder_ButtonPressed(void)
{
    uint32_t now = HAL_GetTick();

    if (!btn_armed)
    {
        /* Esperar a que se suelte y quede estable */
        if (!Encoder_ButtonIsDown() && (now - btn_edge_tick) > BUTTON_DEBOUNCE_MS)
        {
            btn_pending = 0;
            btn_armed = 1;
        }
        return 0;
    }

    if (btn_pending && (now - btn_edge_tick) >= BUTTON_DEBOUNCE_MS)
    {
        btn_pending = 0;
        if (Encoder_ButtonIsDown())
        {
            btn_armed = 0;
            return 1;
        }
    }
    return 0;
}

void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin)
{
    if (GPIO_Pin == ENCODER_SW_Pin)
    {
        btn_edge_tick = HAL_GetTick();
        btn_pending = 1;
    }
}
