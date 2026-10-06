################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/layouts/lv_layout.c 

OBJS += \
./Libs/lvgl/src/layouts/lv_layout.o 

C_DEPS += \
./Libs/lvgl/src/layouts/lv_layout.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/layouts/%.o Libs/lvgl/src/layouts/%.su Libs/lvgl/src/layouts/%.cyclo: ../Libs/lvgl/src/layouts/%.c Libs/lvgl/src/layouts/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-layouts

clean-Libs-2f-lvgl-2f-src-2f-layouts:
	-$(RM) ./Libs/lvgl/src/layouts/lv_layout.cyclo ./Libs/lvgl/src/layouts/lv_layout.d ./Libs/lvgl/src/layouts/lv_layout.o ./Libs/lvgl/src/layouts/lv_layout.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-layouts

