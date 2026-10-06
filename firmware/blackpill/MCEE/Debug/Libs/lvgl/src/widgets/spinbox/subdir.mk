################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/widgets/spinbox/lv_spinbox.c 

OBJS += \
./Libs/lvgl/src/widgets/spinbox/lv_spinbox.o 

C_DEPS += \
./Libs/lvgl/src/widgets/spinbox/lv_spinbox.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/widgets/spinbox/%.o Libs/lvgl/src/widgets/spinbox/%.su Libs/lvgl/src/widgets/spinbox/%.cyclo: ../Libs/lvgl/src/widgets/spinbox/%.c Libs/lvgl/src/widgets/spinbox/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-widgets-2f-spinbox

clean-Libs-2f-lvgl-2f-src-2f-widgets-2f-spinbox:
	-$(RM) ./Libs/lvgl/src/widgets/spinbox/lv_spinbox.cyclo ./Libs/lvgl/src/widgets/spinbox/lv_spinbox.d ./Libs/lvgl/src/widgets/spinbox/lv_spinbox.o ./Libs/lvgl/src/widgets/spinbox/lv_spinbox.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-widgets-2f-spinbox

