################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/font/tiny_ttf/lv_tiny_ttf.c 

OBJS += \
./Libs/lvgl/src/font/tiny_ttf/lv_tiny_ttf.o 

C_DEPS += \
./Libs/lvgl/src/font/tiny_ttf/lv_tiny_ttf.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/font/tiny_ttf/%.o Libs/lvgl/src/font/tiny_ttf/%.su Libs/lvgl/src/font/tiny_ttf/%.cyclo: ../Libs/lvgl/src/font/tiny_ttf/%.c Libs/lvgl/src/font/tiny_ttf/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-font-2f-tiny_ttf

clean-Libs-2f-lvgl-2f-src-2f-font-2f-tiny_ttf:
	-$(RM) ./Libs/lvgl/src/font/tiny_ttf/lv_tiny_ttf.cyclo ./Libs/lvgl/src/font/tiny_ttf/lv_tiny_ttf.d ./Libs/lvgl/src/font/tiny_ttf/lv_tiny_ttf.o ./Libs/lvgl/src/font/tiny_ttf/lv_tiny_ttf.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-font-2f-tiny_ttf

