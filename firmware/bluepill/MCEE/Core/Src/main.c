/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
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
/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include <math.h>
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
ADC_HandleTypeDef hadc1;
DMA_HandleTypeDef hdma_adc1;

TIM_HandleTypeDef htim3;

/* USER CODE BEGIN PV */
#define ADC_CHANNELS              6
#define DMA_BUFFER_SAMPLES        256
#define HALF_BUFFER_SAMPLES       (DMA_BUFFER_SAMPLES / 2)
#define SAMPLES_PER_CYCLE   100   // 5000 SPS / 50 Hz

// Media movil
#define VRMS_AVG_SAMPLES   50   // ~1s de promedio (50 buffers de ~20ms)
volatile float vrms1_display = 0.0f;
static float vrms1_accum = 0.0f;
static uint16_t vrms1_avg_count = 0;


/* Buffer del ADC */
uint16_t adc_buffer[ADC_CHANNELS * DMA_BUFFER_SAMPLES];
volatile uint8_t adc_half_complete = 0;
volatile uint8_t adc_full_complete = 0;
uint8_t calibration_done = 0;

/* Valores de tension y corriente por fase */
float voltage1[HALF_BUFFER_SAMPLES];
float current1[HALF_BUFFER_SAMPLES];
float voltage2[HALF_BUFFER_SAMPLES];
float current2[HALF_BUFFER_SAMPLES];
float voltage3[HALF_BUFFER_SAMPLES];
float current3[HALF_BUFFER_SAMPLES];
float voltage1_ac[HALF_BUFFER_SAMPLES];
float current1_ac[HALF_BUFFER_SAMPLES];
float voltage2_ac[HALF_BUFFER_SAMPLES];
float current2_ac[HALF_BUFFER_SAMPLES];
float voltage3_ac[HALF_BUFFER_SAMPLES];
float current3_ac[HALF_BUFFER_SAMPLES];

/* Factores de ajuste y calibración(ganancia y offset)  */
float voltage1_offset = 0.0f;
float current1_offset = 0.0f;
float voltage2_offset = 0.0f;
float current2_offset = 0.0f;
float voltage3_offset = 0.0f;
float current3_offset = 0.0f;
float voltage1_gain = 224/1.4; //1,4vrms medidos con 224 vac medidos con multimetro
float current1_gain = 1.0f;
float voltage2_gain = 1.0f;
float current2_gain = 1.0f;
float voltage3_gain = 1.0f;
float current3_gain = 1.0f;

/* Variables electricas */
volatile float vrms1 = 0;
volatile float irms1 = 0;
volatile float vrms2 = 0;
volatile float irms2 = 0;
volatile float vrms3 = 0;
volatile float irms3 = 0;

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_DMA_Init(void);
static void MX_ADC1_Init(void);
static void MX_TIM3_Init(void);
/* USER CODE BEGIN PFP */
void ProcessADCBuffer(uint16_t *buffer);
void ProcessMeasurements(void);
void CalibrateOffset(void);
void ApplyCalibration(void);
float CalculateRMS(float *signal);
float CalculateMean(float *signal);

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */


/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{

  /* USER CODE BEGIN 1 */
  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_DMA_Init();
  MX_ADC1_Init();
  MX_TIM3_Init();
  /* USER CODE BEGIN 2 */

  HAL_TIM_Base_Start_IT(&htim3);
  HAL_ADC_Start_DMA(&hadc1, (uint32_t*)adc_buffer, ADC_CHANNELS * DMA_BUFFER_SAMPLES);
  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
	  // Leer y procesar las muestras capturadas por el ADC dependiendo si esta a la mitad o al final de la cola
	  if (adc_half_complete)
	  {
		  adc_half_complete = 0;
		  ProcessADCBuffer(&adc_buffer[0]);
		  ProcessMeasurements();
	  }

	  else if (adc_full_complete)
	  {
		  adc_full_complete = 0;
		  ProcessADCBuffer(&adc_buffer[(ADC_CHANNELS * DMA_BUFFER_SAMPLES)/2]);
		  ProcessMeasurements();
	  }



    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};
  RCC_PeriphCLKInitTypeDef PeriphClkInit = {0};

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.HSEPredivValue = RCC_HSE_PREDIV_DIV1;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLMUL = RCC_PLL_MUL9;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_2) != HAL_OK)
  {
    Error_Handler();
  }
  PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_ADC;
  PeriphClkInit.AdcClockSelection = RCC_ADCPCLK2_DIV6;
  if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief ADC1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_ADC1_Init(void)
{

  /* USER CODE BEGIN ADC1_Init 0 */

  /* USER CODE END ADC1_Init 0 */

  ADC_ChannelConfTypeDef sConfig = {0};

  /* USER CODE BEGIN ADC1_Init 1 */

  /* USER CODE END ADC1_Init 1 */

  /** Common config
  */
  hadc1.Instance = ADC1;
  hadc1.Init.ScanConvMode = ADC_SCAN_ENABLE;
  hadc1.Init.ContinuousConvMode = DISABLE;
  hadc1.Init.DiscontinuousConvMode = DISABLE;
  hadc1.Init.ExternalTrigConv = ADC_EXTERNALTRIGCONV_T3_TRGO;
  hadc1.Init.DataAlign = ADC_DATAALIGN_RIGHT;
  hadc1.Init.NbrOfConversion = 6;
  if (HAL_ADC_Init(&hadc1) != HAL_OK)
  {
    Error_Handler();
  }

  /** Configure Regular Channel
  */
  sConfig.Channel = ADC_CHANNEL_0;
  sConfig.Rank = ADC_REGULAR_RANK_1;
  sConfig.SamplingTime = ADC_SAMPLETIME_71CYCLES_5;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }

  /** Configure Regular Channel
  */
  sConfig.Channel = ADC_CHANNEL_1;
  sConfig.Rank = ADC_REGULAR_RANK_2;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }

  /** Configure Regular Channel
  */
  sConfig.Channel = ADC_CHANNEL_2;
  sConfig.Rank = ADC_REGULAR_RANK_3;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }

  /** Configure Regular Channel
  */
  sConfig.Channel = ADC_CHANNEL_3;
  sConfig.Rank = ADC_REGULAR_RANK_4;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }

  /** Configure Regular Channel
  */
  sConfig.Channel = ADC_CHANNEL_5;
  sConfig.Rank = ADC_REGULAR_RANK_5;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }

  /** Configure Regular Channel
  */
  sConfig.Channel = ADC_CHANNEL_6;
  sConfig.Rank = ADC_REGULAR_RANK_6;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN ADC1_Init 2 */

  /* USER CODE END ADC1_Init 2 */

}

/**
  * @brief TIM3 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM3_Init(void)
{

  /* USER CODE BEGIN TIM3_Init 0 */

  /* USER CODE END TIM3_Init 0 */

  TIM_ClockConfigTypeDef sClockSourceConfig = {0};
  TIM_MasterConfigTypeDef sMasterConfig = {0};

  /* USER CODE BEGIN TIM3_Init 1 */

  /* USER CODE END TIM3_Init 1 */
  htim3.Instance = TIM3;
  htim3.Init.Prescaler = 71;
  htim3.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim3.Init.Period = 199;
  htim3.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim3.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
  if (HAL_TIM_Base_Init(&htim3) != HAL_OK)
  {
    Error_Handler();
  }
  sClockSourceConfig.ClockSource = TIM_CLOCKSOURCE_INTERNAL;
  if (HAL_TIM_ConfigClockSource(&htim3, &sClockSourceConfig) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_UPDATE;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim3, &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN TIM3_Init 2 */

  /* USER CODE END TIM3_Init 2 */

}

/**
  * Enable DMA controller clock
  */
static void MX_DMA_Init(void)
{

  /* DMA controller clock enable */
  __HAL_RCC_DMA1_CLK_ENABLE();

  /* DMA interrupt init */
  /* DMA1_Channel1_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(DMA1_Channel1_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA1_Channel1_IRQn);

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};
  /* USER CODE BEGIN MX_GPIO_Init_1 */

  /* USER CODE END MX_GPIO_Init_1 */

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOC_CLK_ENABLE();
  __HAL_RCC_GPIOD_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOC, GPIO_PIN_13, GPIO_PIN_RESET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(SD_CS_GPIO_Port, SD_CS_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin : PC13 */
  GPIO_InitStruct.Pin = GPIO_PIN_13;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOC, &GPIO_InitStruct);

  /*Configure GPIO pin : SD_CS_Pin */
  GPIO_InitStruct.Pin = SD_CS_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(SD_CS_GPIO_Port, &GPIO_InitStruct);

  /* USER CODE BEGIN MX_GPIO_Init_2 */

  /* USER CODE END MX_GPIO_Init_2 */
}

/* USER CODE BEGIN 4 */

/* El buffer completo tiene 6*256=1536 muestras
 * A 5 kHz por canal cada uno de los 2 callback se ejecuta cada 128/5000 = 25,6 ms*/
/* callback de buffer completo */
void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* hadc)
{
    adc_full_complete = 1;
}

/* Callback de mitad de buffer */
void HAL_ADC_ConvHalfCpltCallback(ADC_HandleTypeDef* hadc)
{
    adc_half_complete = 1;
}

void ProcessADCBuffer(uint16_t *buffer)
{
    for(uint16_t i = 0; i < HALF_BUFFER_SAMPLES; i++)
    {
        uint16_t index = i * ADC_CHANNELS;
        // ADC de 12 Bits: 2^12=4095
        voltage1[i] =((buffer[index + 0] * 3.3f) / 4095.0f);
        current1[i] =((buffer[index + 1] * 3.3f) / 4095.0f);
        voltage2[i] =((buffer[index + 2] * 3.3f) / 4095.0f);
        current2[i] =((buffer[index + 3] * 3.3f) / 4095.0f);
        voltage3[i] =((buffer[index + 4] * 3.3f) / 4095.0f);
        current3[i] =((buffer[index + 5] * 3.3f) / 4095.0f);
    }
}

void ProcessMeasurements()
{

    if (!calibration_done)
    {
        CalibrateOffset();
        calibration_done = 1;
    }

    ApplyCalibration();
    vrms1 = CalculateRMS(voltage1_ac);

    vrms1_accum += vrms1;
    vrms1_avg_count++;

    if (vrms1_avg_count >= VRMS_AVG_SAMPLES)
    {
        vrms1_display = vrms1_accum / VRMS_AVG_SAMPLES;
        vrms1_accum = 0.0f;
        vrms1_avg_count = 0;
    }

}


float CalculateRMS(float *signal)
{
    float sum = 0.0f;

    for(uint16_t i = 0; i < SAMPLES_PER_CYCLE; i++)
    {
        sum += signal[i] * signal[i];
    }

    return sqrtf(sum / SAMPLES_PER_CYCLE);
}

float CalculateMean(float *signal)
{
    float sum = 0.0f;

    for(uint16_t i = 0; i < SAMPLES_PER_CYCLE; i++)
    {
        sum += signal[i];
    }

    return sum / SAMPLES_PER_CYCLE;
}

/* Función para calibrar offset  */
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
    for(uint16_t i = 0; i < HALF_BUFFER_SAMPLES; i++)
    {
        voltage1_ac[i] =
            (voltage1[i] - voltage1_offset) * voltage1_gain;

        current1_ac[i] =
            (current1[i] - current1_offset) * current1_gain;

        voltage2_ac[i] =
            (voltage2[i] - voltage2_offset) * voltage2_gain;

        current2_ac[i] =
            (current2[i] - current2_offset) * current2_gain;

        voltage3_ac[i] =
            (voltage3[i] - voltage3_offset) * voltage3_gain;

        current3_ac[i] =
            (current3[i] - current3_offset) * current3_gain;
    }
}

/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}
#ifdef USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */
