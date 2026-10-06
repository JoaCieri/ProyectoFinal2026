################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/osal/lv_cmsis_rtos2.c \
../Libs/lvgl/src/osal/lv_freertos.c \
../Libs/lvgl/src/osal/lv_linux.c \
../Libs/lvgl/src/osal/lv_mqx.c \
../Libs/lvgl/src/osal/lv_os.c \
../Libs/lvgl/src/osal/lv_os_none.c \
../Libs/lvgl/src/osal/lv_pthread.c \
../Libs/lvgl/src/osal/lv_rtthread.c \
../Libs/lvgl/src/osal/lv_sdl2.c \
../Libs/lvgl/src/osal/lv_windows.c 

OBJS += \
./Libs/lvgl/src/osal/lv_cmsis_rtos2.o \
./Libs/lvgl/src/osal/lv_freertos.o \
./Libs/lvgl/src/osal/lv_linux.o \
./Libs/lvgl/src/osal/lv_mqx.o \
./Libs/lvgl/src/osal/lv_os.o \
./Libs/lvgl/src/osal/lv_os_none.o \
./Libs/lvgl/src/osal/lv_pthread.o \
./Libs/lvgl/src/osal/lv_rtthread.o \
./Libs/lvgl/src/osal/lv_sdl2.o \
./Libs/lvgl/src/osal/lv_windows.o 

C_DEPS += \
./Libs/lvgl/src/osal/lv_cmsis_rtos2.d \
./Libs/lvgl/src/osal/lv_freertos.d \
./Libs/lvgl/src/osal/lv_linux.d \
./Libs/lvgl/src/osal/lv_mqx.d \
./Libs/lvgl/src/osal/lv_os.d \
./Libs/lvgl/src/osal/lv_os_none.d \
./Libs/lvgl/src/osal/lv_pthread.d \
./Libs/lvgl/src/osal/lv_rtthread.d \
./Libs/lvgl/src/osal/lv_sdl2.d \
./Libs/lvgl/src/osal/lv_windows.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/osal/%.o Libs/lvgl/src/osal/%.su Libs/lvgl/src/osal/%.cyclo: ../Libs/lvgl/src/osal/%.c Libs/lvgl/src/osal/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-osal

clean-Libs-2f-lvgl-2f-src-2f-osal:
	-$(RM) ./Libs/lvgl/src/osal/lv_cmsis_rtos2.cyclo ./Libs/lvgl/src/osal/lv_cmsis_rtos2.d ./Libs/lvgl/src/osal/lv_cmsis_rtos2.o ./Libs/lvgl/src/osal/lv_cmsis_rtos2.su ./Libs/lvgl/src/osal/lv_freertos.cyclo ./Libs/lvgl/src/osal/lv_freertos.d ./Libs/lvgl/src/osal/lv_freertos.o ./Libs/lvgl/src/osal/lv_freertos.su ./Libs/lvgl/src/osal/lv_linux.cyclo ./Libs/lvgl/src/osal/lv_linux.d ./Libs/lvgl/src/osal/lv_linux.o ./Libs/lvgl/src/osal/lv_linux.su ./Libs/lvgl/src/osal/lv_mqx.cyclo ./Libs/lvgl/src/osal/lv_mqx.d ./Libs/lvgl/src/osal/lv_mqx.o ./Libs/lvgl/src/osal/lv_mqx.su ./Libs/lvgl/src/osal/lv_os.cyclo ./Libs/lvgl/src/osal/lv_os.d ./Libs/lvgl/src/osal/lv_os.o ./Libs/lvgl/src/osal/lv_os.su ./Libs/lvgl/src/osal/lv_os_none.cyclo ./Libs/lvgl/src/osal/lv_os_none.d ./Libs/lvgl/src/osal/lv_os_none.o ./Libs/lvgl/src/osal/lv_os_none.su ./Libs/lvgl/src/osal/lv_pthread.cyclo ./Libs/lvgl/src/osal/lv_pthread.d ./Libs/lvgl/src/osal/lv_pthread.o ./Libs/lvgl/src/osal/lv_pthread.su ./Libs/lvgl/src/osal/lv_rtthread.cyclo ./Libs/lvgl/src/osal/lv_rtthread.d ./Libs/lvgl/src/osal/lv_rtthread.o ./Libs/lvgl/src/osal/lv_rtthread.su ./Libs/lvgl/src/osal/lv_sdl2.cyclo ./Libs/lvgl/src/osal/lv_sdl2.d ./Libs/lvgl/src/osal/lv_sdl2.o ./Libs/lvgl/src/osal/lv_sdl2.su ./Libs/lvgl/src/osal/lv_windows.cyclo ./Libs/lvgl/src/osal/lv_windows.d ./Libs/lvgl/src/osal/lv_windows.o ./Libs/lvgl/src/osal/lv_windows.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-osal

