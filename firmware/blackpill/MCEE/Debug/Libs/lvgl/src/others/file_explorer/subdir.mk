################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/others/file_explorer/lv_file_explorer.c 

OBJS += \
./Libs/lvgl/src/others/file_explorer/lv_file_explorer.o 

C_DEPS += \
./Libs/lvgl/src/others/file_explorer/lv_file_explorer.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/others/file_explorer/%.o Libs/lvgl/src/others/file_explorer/%.su Libs/lvgl/src/others/file_explorer/%.cyclo: ../Libs/lvgl/src/others/file_explorer/%.c Libs/lvgl/src/others/file_explorer/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-others-2f-file_explorer

clean-Libs-2f-lvgl-2f-src-2f-others-2f-file_explorer:
	-$(RM) ./Libs/lvgl/src/others/file_explorer/lv_file_explorer.cyclo ./Libs/lvgl/src/others/file_explorer/lv_file_explorer.d ./Libs/lvgl/src/others/file_explorer/lv_file_explorer.o ./Libs/lvgl/src/others/file_explorer/lv_file_explorer.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-others-2f-file_explorer

