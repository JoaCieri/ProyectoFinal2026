################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/display/lv_display.c 

OBJS += \
./Libs/lvgl/src/display/lv_display.o 

C_DEPS += \
./Libs/lvgl/src/display/lv_display.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/display/%.o Libs/lvgl/src/display/%.su Libs/lvgl/src/display/%.cyclo: ../Libs/lvgl/src/display/%.c Libs/lvgl/src/display/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-display

clean-Libs-2f-lvgl-2f-src-2f-display:
	-$(RM) ./Libs/lvgl/src/display/lv_display.cyclo ./Libs/lvgl/src/display/lv_display.d ./Libs/lvgl/src/display/lv_display.o ./Libs/lvgl/src/display/lv_display.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-display

