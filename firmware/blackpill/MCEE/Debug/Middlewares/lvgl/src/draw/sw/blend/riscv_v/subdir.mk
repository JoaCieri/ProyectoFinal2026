################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl/src/draw/sw/blend/riscv_v/lv_draw_sw_blend_riscv_v_to_rgb888.c 

OBJS += \
./Middlewares/lvgl/src/draw/sw/blend/riscv_v/lv_draw_sw_blend_riscv_v_to_rgb888.o 

C_DEPS += \
./Middlewares/lvgl/src/draw/sw/blend/riscv_v/lv_draw_sw_blend_riscv_v_to_rgb888.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl/src/draw/sw/blend/riscv_v/%.o Middlewares/lvgl/src/draw/sw/blend/riscv_v/%.su Middlewares/lvgl/src/draw/sw/blend/riscv_v/%.cyclo: ../Middlewares/lvgl/src/draw/sw/blend/riscv_v/%.c Middlewares/lvgl/src/draw/sw/blend/riscv_v/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl-2f-src-2f-draw-2f-sw-2f-blend-2f-riscv_v

clean-Middlewares-2f-lvgl-2f-src-2f-draw-2f-sw-2f-blend-2f-riscv_v:
	-$(RM) ./Middlewares/lvgl/src/draw/sw/blend/riscv_v/lv_draw_sw_blend_riscv_v_to_rgb888.cyclo ./Middlewares/lvgl/src/draw/sw/blend/riscv_v/lv_draw_sw_blend_riscv_v_to_rgb888.d ./Middlewares/lvgl/src/draw/sw/blend/riscv_v/lv_draw_sw_blend_riscv_v_to_rgb888.o ./Middlewares/lvgl/src/draw/sw/blend/riscv_v/lv_draw_sw_blend_riscv_v_to_rgb888.su

.PHONY: clean-Middlewares-2f-lvgl-2f-src-2f-draw-2f-sw-2f-blend-2f-riscv_v

