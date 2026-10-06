################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/draw/sw/blend/sve2/lv_draw_sw_blend_sve2_to_rgb888.c 

OBJS += \
./Libs/lvgl/src/draw/sw/blend/sve2/lv_draw_sw_blend_sve2_to_rgb888.o 

C_DEPS += \
./Libs/lvgl/src/draw/sw/blend/sve2/lv_draw_sw_blend_sve2_to_rgb888.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/draw/sw/blend/sve2/%.o Libs/lvgl/src/draw/sw/blend/sve2/%.su Libs/lvgl/src/draw/sw/blend/sve2/%.cyclo: ../Libs/lvgl/src/draw/sw/blend/sve2/%.c Libs/lvgl/src/draw/sw/blend/sve2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-draw-2f-sw-2f-blend-2f-sve2

clean-Libs-2f-lvgl-2f-src-2f-draw-2f-sw-2f-blend-2f-sve2:
	-$(RM) ./Libs/lvgl/src/draw/sw/blend/sve2/lv_draw_sw_blend_sve2_to_rgb888.cyclo ./Libs/lvgl/src/draw/sw/blend/sve2/lv_draw_sw_blend_sve2_to_rgb888.d ./Libs/lvgl/src/draw/sw/blend/sve2/lv_draw_sw_blend_sve2_to_rgb888.o ./Libs/lvgl/src/draw/sw/blend/sve2/lv_draw_sw_blend_sve2_to_rgb888.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-draw-2f-sw-2f-blend-2f-sve2

