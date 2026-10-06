################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx.c \
../Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_arc.c \
../Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_border.c \
../Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_cache.c \
../Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_fill.c \
../Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_img.c \
../Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_label.c \
../Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_layer.c \
../Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_line.c \
../Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_stm32_hal.c \
../Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_triangle.c \
../Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_utils.c \
../Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_vector.c \
../Libs/lvgl/src/draw/nema_gfx/lv_nema_gfx_path.c 

OBJS += \
./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx.o \
./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_arc.o \
./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_border.o \
./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_cache.o \
./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_fill.o \
./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_img.o \
./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_label.o \
./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_layer.o \
./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_line.o \
./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_stm32_hal.o \
./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_triangle.o \
./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_utils.o \
./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_vector.o \
./Libs/lvgl/src/draw/nema_gfx/lv_nema_gfx_path.o 

C_DEPS += \
./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx.d \
./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_arc.d \
./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_border.d \
./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_cache.d \
./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_fill.d \
./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_img.d \
./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_label.d \
./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_layer.d \
./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_line.d \
./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_stm32_hal.d \
./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_triangle.d \
./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_utils.d \
./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_vector.d \
./Libs/lvgl/src/draw/nema_gfx/lv_nema_gfx_path.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/draw/nema_gfx/%.o Libs/lvgl/src/draw/nema_gfx/%.su Libs/lvgl/src/draw/nema_gfx/%.cyclo: ../Libs/lvgl/src/draw/nema_gfx/%.c Libs/lvgl/src/draw/nema_gfx/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-draw-2f-nema_gfx

clean-Libs-2f-lvgl-2f-src-2f-draw-2f-nema_gfx:
	-$(RM) ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx.cyclo ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx.d ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx.o ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx.su ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_arc.cyclo ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_arc.d ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_arc.o ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_arc.su ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_border.cyclo ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_border.d ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_border.o ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_border.su ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_cache.cyclo ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_cache.d ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_cache.o ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_cache.su ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_fill.cyclo ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_fill.d ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_fill.o ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_fill.su ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_img.cyclo ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_img.d ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_img.o ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_img.su ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_label.cyclo ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_label.d ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_label.o ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_label.su ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_layer.cyclo ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_layer.d ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_layer.o ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_layer.su ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_line.cyclo ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_line.d ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_line.o ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_line.su ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_stm32_hal.cyclo ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_stm32_hal.d ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_stm32_hal.o ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_stm32_hal.su ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_triangle.cyclo ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_triangle.d ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_triangle.o ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_triangle.su ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_utils.cyclo ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_utils.d ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_utils.o ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_utils.su ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_vector.cyclo ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_vector.d ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_vector.o ./Libs/lvgl/src/draw/nema_gfx/lv_draw_nema_gfx_vector.su ./Libs/lvgl/src/draw/nema_gfx/lv_nema_gfx_path.cyclo ./Libs/lvgl/src/draw/nema_gfx/lv_nema_gfx_path.d ./Libs/lvgl/src/draw/nema_gfx/lv_nema_gfx_path.o ./Libs/lvgl/src/draw/nema_gfx/lv_nema_gfx_path.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-draw-2f-nema_gfx

