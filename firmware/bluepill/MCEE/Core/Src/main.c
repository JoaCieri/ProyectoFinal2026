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

/* ADC */
#define ADC_CHANNELS              6
#define DMA_BUFFER_SAMPLES        256
#define HALF_BUFFER_SAMPLES       (DMA_BUFFER_SAMPLES / 2)
#define SAMPLES_PER_CYCLE   100   // 5000 SPS / 50 Hz
#define WARMUP_BUFFERS   200   // ~5s de descarte antes de calibrar y medir
volatile uint16_t buffer_count = 0;
/* Buffer del ADC */
uint16_t adc_buffer[ADC_CHANNELS * DMA_BUFFER_SAMPLES];
volatile uint8_t adc_half_complete = 0;
volatile uint8_t adc_full_complete = 0;
uint8_t calibration_done = 0;

/* TENSION */
float voltage1[HALF_BUFFER_SAMPLES];
float voltage2[HALF_BUFFER_SAMPLES];
float voltage3[HALF_BUFFER_SAMPLES];
float voltage1_ac[HALF_BUFFER_SAMPLES];
float voltage2_ac[HALF_BUFFER_SAMPLES];
float voltage3_ac[HALF_BUFFER_SAMPLES];
float voltage1_offset = 0.0f;
float voltage2_offset = 0.0f;
float voltage3_offset = 0.0f;
float voltage1_gain = 229/1.355;//1.355vrms medidos con 228 vac medidos con multimetro
float voltage2_gain = 1.0f;
float voltage3_gain = 1.0f;
volatile float vrms1 = 0;
volatile float vrms2 = 0;
volatile float vrms3 = 0;
// Media movil
#define VRMS_AVG_SAMPLES   50   // ~1s de promedio (50 buffers de ~20ms)
volatile float vrms1_display = 0.0f;
static float vrms1_accum = 0.0f;
static uint16_t vrms1_avg_count = 0;

/* CORRIENTE */
float current1[HALF_BUFFER_SAMPLES];
float current2[HALF_BUFFER_SAMPLES];
float current3[HALF_BUFFER_SAMPLES];
float current1_ac[HALF_BUFFER_SAMPLES];
float current2_ac[HALF_BUFFER_SAMPLES];
float current3_ac[HALF_BUFFER_SAMPLES];
float current1_offset = 0.0f;
float current2_offset = 0.0f;
float current3_offset = 0.0f;
float current1_gain = 1.0f;
float current2_gain = 1.0f;
float current3_gain = 1.0f;
volatile float irms1 = 0;
volatile float irms2 = 0;
volatile float irms3 = 0;
// Media movil
volatile float irms1_display = 0.0f;
static float irms1_accum = 0.0f;
static uint16_t irms1_avg_count = 0;

/* FRECUENCIA */
volatile float measured_line_freq = 0.0f;
volatile float line_freq_min = 9999.0f;
volatile float line_freq_max = 0.0f;
#define ZC_HYSTERESIS   3.0f   // volts; ajustable segun ruido observado
#define MIN_SAMPLES_PER_CYCLE  95    // ~52.6Hz máximo plausible (+5%)
#define MAX_SAMPLES_PER_CYCLE  105   // ~47.6Hz mínimo plausible (-5%)

/* ARMONICOS */
#define MAX_HARMONIC   25   // armónico más alto a calcular (ajustable, hasta ~40-45 con margen)
float voltage1_harmonics[MAX_HARMONIC + 1]; // [1]=fundamental, [2]=2do armonico, etc. [0] no se usa
float voltage1_thd = 0.0f;

/* POTENCIA */
volatile float p_active1 = 0.0f;
volatile float p_apparent1 = 0.0f;
volatile float p_reactive1 = 0.0f;
volatile float power_factor1 = 0.0f;

/* EVENTOS: SAG-SWELL */
typedef enum { EVENT_NONE = 0, EVENT_SAG, EVENT_SWELL } event_type_t;
typedef struct {
    event_type_t type;
    uint32_t start_time_ms;
    uint32_t duration_ms;
    float extreme_value;   // valor minimo (sag) o maximo (swell) alcanzado
} power_event_t;
#define MAX_EVENTS_LOG   20
power_event_t events_log[MAX_EVENTS_LOG];
volatile uint8_t events_count = 0;
static event_type_t current_event_type = EVENT_NONE;
static uint32_t current_event_start = 0;
static float current_event_extreme = 0.0f;
#define NOMINAL_VOLTAGE       220.0f
#define SAG_THRESHOLD_LOW     (0.90f * NOMINAL_VOLTAGE)  // entra en sag
#define SAG_THRESHOLD_HIGH    (0.92f * NOMINAL_VOLTAGE)  // sale del sag (histeresis)
#define SWELL_THRESHOLD_HIGH  (1.10f * NOMINAL_VOLTAGE)  // entra en swell
#define SWELL_THRESHOLD_LOW   (1.08f * NOMINAL_VOLTAGE)  // sale del swell (histeresis)


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
float GoertzelMagnitude(float *signal, uint16_t N, uint16_t k);
void CalculateHarmonics(float *signal);
float MeasureLineFrequency(float *signal, uint16_t N, float fs);
void CalculatePower(float *voltage_ac, float *current_ac, float vrms, float irms);
void DetectVoltageEvents(float vrms);

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


/******************************* ADQUISICÓN Y PROCESAMIENTO DE MUESTRAS ***************************/
/* Callback de buffer completo */
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
	/* Descartar buffers iniciales, todavia no calibrar ni medir */
    if (buffer_count < WARMUP_BUFFERS)
    {
        buffer_count++;
        return;
    }

    /* CALIBRACION */
    if (!calibration_done)
    {
        CalibrateOffset();
        calibration_done = 1;
    }
    ApplyCalibration();

    /* FRECUENCIA */
    measured_line_freq = MeasureLineFrequency(voltage1_ac, HALF_BUFFER_SAMPLES, 5000.0f);
    if (measured_line_freq > 0.0f)  // descartar el caso de "no se pudo medir"
    {
        if (measured_line_freq < line_freq_min) line_freq_min = measured_line_freq;
        if (measured_line_freq > line_freq_max) line_freq_max = measured_line_freq;
    }

    /* TENSION RMS */
	vrms1 = CalculateRMS(voltage1_ac);
    vrms1_accum += vrms1;
    vrms1_avg_count++;
    if (vrms1_avg_count >= VRMS_AVG_SAMPLES)
    {
        vrms1_display = vrms1_accum / VRMS_AVG_SAMPLES;
        vrms1_accum = 0.0f;
        vrms1_avg_count = 0;
    }

    /* CORRIENTE RMS */
    irms1 = CalculateRMS(current1_ac);
    irms1_accum += irms1;
    irms1_avg_count++;
    if (irms1_avg_count >= VRMS_AVG_SAMPLES)
    {
        irms1_display = irms1_accum / VRMS_AVG_SAMPLES;
        irms1_accum = 0.0f;
        irms1_avg_count = 0;
    }

    /* POTENCIA */
    CalculatePower(voltage1_ac, current1_ac, vrms1, irms1);

    /* ARMONICOS */
	CalculateHarmonics(voltage1_ac);

	/* DETECCION DE EVENTOS */
	DetectVoltageEvents(vrms1);

}

/*******************************   CALIBRACION ***************************/
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

/*******************************   CALCULO DE MAGNITUDES ***************************/
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

float MeasureLineFrequency(float *signal, uint16_t N, float fs)
{
    int16_t first_crossing = -1;
    int16_t second_crossing = -1;
    uint8_t armed = 0; // se "arma" cuando la señal estuvo claramente negativa

    for (uint16_t i = 0; i < N; i++)
    {
        if (signal[i] < -ZC_HYSTERESIS)
        {
            armed = 1; // confirmamos que venimos de la parte negativa del ciclo
        }
        else if (armed && signal[i] > ZC_HYSTERESIS)
        {
            // cruce ascendente válido: veniamos de <-hist y ahora estamos en >+hist
            if (first_crossing == -1)
            {
                first_crossing = i;
            }
            else
            {
                second_crossing = i;
                break;
            }
            armed = 0; // hay que volver a "armar" antes del próximo cruce
        }
    }

    if (first_crossing >= 0 && second_crossing > first_crossing)
    {
        uint16_t samples_per_cycle_real = second_crossing - first_crossing;

        // Descartar resultados fuera de rango plausible (indican ruido/glitch, no un ciclo real)
        if (samples_per_cycle_real >= MIN_SAMPLES_PER_CYCLE &&
            samples_per_cycle_real <= MAX_SAMPLES_PER_CYCLE)
        {
            return fs / (float)samples_per_cycle_real;
        }
    }

    return 0.0f; // no se pudo medir un ciclo plausible
}

void CalculatePower(float *voltage_ac, float *current_ac, float vrms, float irms)
{
    float sum_inst = 0.0f;

    for (uint16_t i = 0; i < SAMPLES_PER_CYCLE; i++)
    {
        sum_inst += voltage_ac[i] * current_ac[i];
    }

    p_active1 = sum_inst / SAMPLES_PER_CYCLE;   // Potencia activa (W)
    p_apparent1 = vrms * irms;                   // Potencia aparente (VA)

    float q_sq = (p_apparent1 * p_apparent1) - (p_active1 * p_active1);
    p_reactive1 = (q_sq > 0.0f) ? sqrtf(q_sq) : 0.0f;   // Potencia no-activa (VAR)

    power_factor1 = (p_apparent1 > 0.0f) ? (p_active1 / p_apparent1) : 0.0f;
}

/*******************************   ARMONICOS ***************************/
/* Calcula la amplitud del armonico "k" (k=1 es la fundamental) sobre un buffer de N muestras */
float GoertzelMagnitude(float *signal, uint16_t N, uint16_t k)
{
    float w = 2.0f * 3.14159265f * k / N;
    float coeff = 2.0f * cosf(w);

    float s_prev = 0.0f;
    float s_prev2 = 0.0f;

    for (uint16_t i = 0; i < N; i++)
    {
        float s = signal[i] + coeff * s_prev - s_prev2;
        s_prev2 = s_prev;
        s_prev = s;
    }

    float real = s_prev - s_prev2 * cosf(w);
    float imag = s_prev2 * sinf(w);

    // Amplitud normalizada (factor 2/N para amplitud de pico de una senoidal real)
    return (2.0f / N) * sqrtf(real * real + imag * imag);
}

void CalculateHarmonics(float *signal)
{
    for (uint16_t k = 1; k <= MAX_HARMONIC; k++)
    {
        voltage1_harmonics[k] = GoertzelMagnitude(signal, SAMPLES_PER_CYCLE, k);
    }

    float sum_sq_harmonics = 0.0f;
    for (uint16_t k = 2; k <= MAX_HARMONIC; k++)
    {
        sum_sq_harmonics += voltage1_harmonics[k] * voltage1_harmonics[k];
    }

    voltage1_thd = (voltage1_harmonics[1] > 0.0f)
        ? (sqrtf(sum_sq_harmonics) / voltage1_harmonics[1]) * 100.0f
        : 0.0f;
}

/*******************************   EVENTOS SAG-SWELL ***************************/
void DetectVoltageEvents(float vrms)
{
    if (current_event_type == EVENT_NONE)
    {
        if (vrms < SAG_THRESHOLD_LOW)
        {
            current_event_type = EVENT_SAG;
            current_event_start = HAL_GetTick();
            current_event_extreme = vrms;
        }
        else if (vrms > SWELL_THRESHOLD_HIGH)
        {
            current_event_type = EVENT_SWELL;
            current_event_start = HAL_GetTick();
            current_event_extreme = vrms;
        }
    }
    else if (current_event_type == EVENT_SAG)
    {
        if (vrms < current_event_extreme) current_event_extreme = vrms;

        if (vrms >= SAG_THRESHOLD_HIGH)
        {
            if (events_count < MAX_EVENTS_LOG)
            {
                events_log[events_count].type = EVENT_SAG;
                events_log[events_count].start_time_ms = current_event_start;
                events_log[events_count].duration_ms = HAL_GetTick() - current_event_start;
                events_log[events_count].extreme_value = current_event_extreme;
                events_count++;
            }
            current_event_type = EVENT_NONE;
        }
    }
    else // EVENT_SWELL
    {
        if (vrms > current_event_extreme) current_event_extreme = vrms;

        if (vrms <= SWELL_THRESHOLD_LOW)
        {
            if (events_count < MAX_EVENTS_LOG)
            {
                events_log[events_count].type = EVENT_SWELL;
                events_log[events_count].start_time_ms = current_event_start;
                events_log[events_count].duration_ms = HAL_GetTick() - current_event_start;
                events_log[events_count].extreme_value = current_event_extreme;
                events_count++;
            }
            current_event_type = EVENT_NONE;
        }
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
