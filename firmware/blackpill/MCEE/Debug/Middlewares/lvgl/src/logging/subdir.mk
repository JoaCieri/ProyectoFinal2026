################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl/src/logging/lv_log.c 

OBJS += \
./Middlewares/lvgl/src/logging/lv_log.o 

C_DEPS += \
./Middlewares/lvgl/src/logging/lv_log.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl/src/logging/%.o Middlewares/lvgl/src/logging/%.su Middlewares/lvgl/src/logging/%.cyclo: ../Middlewares/lvgl/src/logging/%.c Middlewares/lvgl/src/logging/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl-2f-src-2f-logging

clean-Middlewares-2f-lvgl-2f-src-2f-logging:
	-$(RM) ./Middlewares/lvgl/src/logging/lv_log.cyclo ./Middlewares/lvgl/src/logging/lv_log.d ./Middlewares/lvgl/src/logging/lv_log.o ./Middlewares/lvgl/src/logging/lv_log.su

.PHONY: clean-Middlewares-2f-lvgl-2f-src-2f-logging

