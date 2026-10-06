################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/widgets/button/lv_button.c 

OBJS += \
./Libs/lvgl/src/widgets/button/lv_button.o 

C_DEPS += \
./Libs/lvgl/src/widgets/button/lv_button.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/widgets/button/%.o Libs/lvgl/src/widgets/button/%.su Libs/lvgl/src/widgets/button/%.cyclo: ../Libs/lvgl/src/widgets/button/%.c Libs/lvgl/src/widgets/button/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-widgets-2f-button

clean-Libs-2f-lvgl-2f-src-2f-widgets-2f-button:
	-$(RM) ./Libs/lvgl/src/widgets/button/lv_button.cyclo ./Libs/lvgl/src/widgets/button/lv_button.d ./Libs/lvgl/src/widgets/button/lv_button.o ./Libs/lvgl/src/widgets/button/lv_button.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-widgets-2f-button

