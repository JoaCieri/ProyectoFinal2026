################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/widgets/list/lv_list.c 

OBJS += \
./Libs/lvgl/src/widgets/list/lv_list.o 

C_DEPS += \
./Libs/lvgl/src/widgets/list/lv_list.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/widgets/list/%.o Libs/lvgl/src/widgets/list/%.su Libs/lvgl/src/widgets/list/%.cyclo: ../Libs/lvgl/src/widgets/list/%.c Libs/lvgl/src/widgets/list/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-widgets-2f-list

clean-Libs-2f-lvgl-2f-src-2f-widgets-2f-list:
	-$(RM) ./Libs/lvgl/src/widgets/list/lv_list.cyclo ./Libs/lvgl/src/widgets/list/lv_list.d ./Libs/lvgl/src/widgets/list/lv_list.o ./Libs/lvgl/src/widgets/list/lv_list.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-widgets-2f-list

