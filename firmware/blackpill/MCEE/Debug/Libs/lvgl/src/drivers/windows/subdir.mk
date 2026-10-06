################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/drivers/windows/lv_windows_context.c \
../Libs/lvgl/src/drivers/windows/lv_windows_display.c \
../Libs/lvgl/src/drivers/windows/lv_windows_input.c 

OBJS += \
./Libs/lvgl/src/drivers/windows/lv_windows_context.o \
./Libs/lvgl/src/drivers/windows/lv_windows_display.o \
./Libs/lvgl/src/drivers/windows/lv_windows_input.o 

C_DEPS += \
./Libs/lvgl/src/drivers/windows/lv_windows_context.d \
./Libs/lvgl/src/drivers/windows/lv_windows_display.d \
./Libs/lvgl/src/drivers/windows/lv_windows_input.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/drivers/windows/%.o Libs/lvgl/src/drivers/windows/%.su Libs/lvgl/src/drivers/windows/%.cyclo: ../Libs/lvgl/src/drivers/windows/%.c Libs/lvgl/src/drivers/windows/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-drivers-2f-windows

clean-Libs-2f-lvgl-2f-src-2f-drivers-2f-windows:
	-$(RM) ./Libs/lvgl/src/drivers/windows/lv_windows_context.cyclo ./Libs/lvgl/src/drivers/windows/lv_windows_context.d ./Libs/lvgl/src/drivers/windows/lv_windows_context.o ./Libs/lvgl/src/drivers/windows/lv_windows_context.su ./Libs/lvgl/src/drivers/windows/lv_windows_display.cyclo ./Libs/lvgl/src/drivers/windows/lv_windows_display.d ./Libs/lvgl/src/drivers/windows/lv_windows_display.o ./Libs/lvgl/src/drivers/windows/lv_windows_display.su ./Libs/lvgl/src/drivers/windows/lv_windows_input.cyclo ./Libs/lvgl/src/drivers/windows/lv_windows_input.d ./Libs/lvgl/src/drivers/windows/lv_windows_input.o ./Libs/lvgl/src/drivers/windows/lv_windows_input.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-drivers-2f-windows

