/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.h
  * @brief          : Header for main.c file.
  *                   This file contains the common defines of the application.
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2026 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32f4xx_hal.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
#define ETH_RST_Pin GPIO_PIN_14
#define ETH_RST_GPIO_Port GPIOC
#define ENCODER_SW_Pin GPIO_PIN_15
#define ENCODER_SW_GPIO_Port GPIOC
#define ENCODER_SW_EXTI_IRQn EXTI15_10_IRQn
#define voltage1_Pin GPIO_PIN_0
#define voltage1_GPIO_Port GPIOA
#define current1_Pin GPIO_PIN_1
#define current1_GPIO_Port GPIOA
#define voltage2_Pin GPIO_PIN_2
#define voltage2_GPIO_Port GPIOA
#define current2_Pin GPIO_PIN_3
#define current2_GPIO_Port GPIOA
#define voltage3_Pin GPIO_PIN_0
#define voltage3_GPIO_Port GPIOB
#define current3_Pin GPIO_PIN_1
#define current3_GPIO_Port GPIOB
#define DISP_RST_Pin GPIO_PIN_10
#define DISP_RST_GPIO_Port GPIOB
#define DISP_CS_Pin GPIO_PIN_12
#define DISP_CS_GPIO_Port GPIOB
#define DISP_DC_Pin GPIO_PIN_8
#define DISP_DC_GPIO_Port GPIOA
#define ETH1_CS_Pin GPIO_PIN_15
#define ETH1_CS_GPIO_Port GPIOA
#define SD_CS_Pin GPIO_PIN_3
#define SD_CS_GPIO_Port GPIOB
#define ETH2_CS_Pin GPIO_PIN_5
#define ETH2_CS_GPIO_Port GPIOB

/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */
