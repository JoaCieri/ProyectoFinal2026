################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend.c \
../Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_a8.c \
../Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_al88.c \
../Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888.c \
../Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888_premultiplied.c \
../Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_i1.c \
../Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_l8.c \
../Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565.c \
../Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565_swapped.c \
../Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb888.c 

OBJS += \
./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend.o \
./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_a8.o \
./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_al88.o \
./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888.o \
./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888_premultiplied.o \
./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_i1.o \
./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_l8.o \
./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565.o \
./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565_swapped.o \
./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb888.o 

C_DEPS += \
./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend.d \
./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_a8.d \
./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_al88.d \
./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888.d \
./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888_premultiplied.d \
./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_i1.d \
./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_l8.d \
./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565.d \
./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565_swapped.d \
./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb888.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/draw/sw/blend/%.o Libs/lvgl/src/draw/sw/blend/%.su Libs/lvgl/src/draw/sw/blend/%.cyclo: ../Libs/lvgl/src/draw/sw/blend/%.c Libs/lvgl/src/draw/sw/blend/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-draw-2f-sw-2f-blend

clean-Libs-2f-lvgl-2f-src-2f-draw-2f-sw-2f-blend:
	-$(RM) ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend.cyclo ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend.d ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend.o ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend.su ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_a8.cyclo ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_a8.d ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_a8.o ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_a8.su ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_al88.cyclo ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_al88.d ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_al88.o ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_al88.su ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888.cyclo ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888.d ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888.o ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888.su ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888_premultiplied.cyclo ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888_premultiplied.d ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888_premultiplied.o ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888_premultiplied.su ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_i1.cyclo ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_i1.d ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_i1.o ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_i1.su ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_l8.cyclo ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_l8.d ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_l8.o ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_l8.su ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565.cyclo ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565.d ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565.o ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565.su ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565_swapped.cyclo ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565_swapped.d ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565_swapped.o ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565_swapped.su ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb888.cyclo ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb888.d ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb888.o ./Libs/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb888.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-draw-2f-sw-2f-blend

