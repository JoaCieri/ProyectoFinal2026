################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl/src/drivers/windows/lv_windows_context.c \
../Middlewares/lvgl/src/drivers/windows/lv_windows_display.c \
../Middlewares/lvgl/src/drivers/windows/lv_windows_input.c 

OBJS += \
./Middlewares/lvgl/src/drivers/windows/lv_windows_context.o \
./Middlewares/lvgl/src/drivers/windows/lv_windows_display.o \
./Middlewares/lvgl/src/drivers/windows/lv_windows_input.o 

C_DEPS += \
./Middlewares/lvgl/src/drivers/windows/lv_windows_context.d \
./Middlewares/lvgl/src/drivers/windows/lv_windows_display.d \
./Middlewares/lvgl/src/drivers/windows/lv_windows_input.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl/src/drivers/windows/%.o Middlewares/lvgl/src/drivers/windows/%.su Middlewares/lvgl/src/drivers/windows/%.cyclo: ../Middlewares/lvgl/src/drivers/windows/%.c Middlewares/lvgl/src/drivers/windows/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl-2f-src-2f-drivers-2f-windows

clean-Middlewares-2f-lvgl-2f-src-2f-drivers-2f-windows:
	-$(RM) ./Middlewares/lvgl/src/drivers/windows/lv_windows_context.cyclo ./Middlewares/lvgl/src/drivers/windows/lv_windows_context.d ./Middlewares/lvgl/src/drivers/windows/lv_windows_context.o ./Middlewares/lvgl/src/drivers/windows/lv_windows_context.su ./Middlewares/lvgl/src/drivers/windows/lv_windows_display.cyclo ./Middlewares/lvgl/src/drivers/windows/lv_windows_display.d ./Middlewares/lvgl/src/drivers/windows/lv_windows_display.o ./Middlewares/lvgl/src/drivers/windows/lv_windows_display.su ./Middlewares/lvgl/src/drivers/windows/lv_windows_input.cyclo ./Middlewares/lvgl/src/drivers/windows/lv_windows_input.d ./Middlewares/lvgl/src/drivers/windows/lv_windows_input.o ./Middlewares/lvgl/src/drivers/windows/lv_windows_input.su

.PHONY: clean-Middlewares-2f-lvgl-2f-src-2f-drivers-2f-windows

