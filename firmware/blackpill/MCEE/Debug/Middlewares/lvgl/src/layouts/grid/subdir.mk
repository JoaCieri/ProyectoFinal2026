################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl/src/layouts/grid/lv_grid.c 

OBJS += \
./Middlewares/lvgl/src/layouts/grid/lv_grid.o 

C_DEPS += \
./Middlewares/lvgl/src/layouts/grid/lv_grid.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl/src/layouts/grid/%.o Middlewares/lvgl/src/layouts/grid/%.su Middlewares/lvgl/src/layouts/grid/%.cyclo: ../Middlewares/lvgl/src/layouts/grid/%.c Middlewares/lvgl/src/layouts/grid/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl-2f-src-2f-layouts-2f-grid

clean-Middlewares-2f-lvgl-2f-src-2f-layouts-2f-grid:
	-$(RM) ./Middlewares/lvgl/src/layouts/grid/lv_grid.cyclo ./Middlewares/lvgl/src/layouts/grid/lv_grid.d ./Middlewares/lvgl/src/layouts/grid/lv_grid.o ./Middlewares/lvgl/src/layouts/grid/lv_grid.su

.PHONY: clean-Middlewares-2f-lvgl-2f-src-2f-layouts-2f-grid

