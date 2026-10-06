################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/draw/vg_lite/lv_draw_buf_vg_lite.c \
../Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite.c \
../Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_arc.c \
../Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_border.c \
../Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_box_shadow.c \
../Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_fill.c \
../Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_img.c \
../Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_label.c \
../Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_layer.c \
../Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_line.c \
../Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_mask_rect.c \
../Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_triangle.c \
../Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_vector.c \
../Libs/lvgl/src/draw/vg_lite/lv_vg_lite_bitmap_font_cache.c \
../Libs/lvgl/src/draw/vg_lite/lv_vg_lite_decoder.c \
../Libs/lvgl/src/draw/vg_lite/lv_vg_lite_grad.c \
../Libs/lvgl/src/draw/vg_lite/lv_vg_lite_math.c \
../Libs/lvgl/src/draw/vg_lite/lv_vg_lite_path.c \
../Libs/lvgl/src/draw/vg_lite/lv_vg_lite_pending.c \
../Libs/lvgl/src/draw/vg_lite/lv_vg_lite_stroke.c \
../Libs/lvgl/src/draw/vg_lite/lv_vg_lite_utils.c 

OBJS += \
./Libs/lvgl/src/draw/vg_lite/lv_draw_buf_vg_lite.o \
./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite.o \
./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_arc.o \
./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_border.o \
./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_box_shadow.o \
./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_fill.o \
./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_img.o \
./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_label.o \
./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_layer.o \
./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_line.o \
./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_mask_rect.o \
./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_triangle.o \
./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_vector.o \
./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_bitmap_font_cache.o \
./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_decoder.o \
./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_grad.o \
./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_math.o \
./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_path.o \
./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_pending.o \
./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_stroke.o \
./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_utils.o 

C_DEPS += \
./Libs/lvgl/src/draw/vg_lite/lv_draw_buf_vg_lite.d \
./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite.d \
./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_arc.d \
./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_border.d \
./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_box_shadow.d \
./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_fill.d \
./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_img.d \
./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_label.d \
./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_layer.d \
./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_line.d \
./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_mask_rect.d \
./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_triangle.d \
./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_vector.d \
./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_bitmap_font_cache.d \
./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_decoder.d \
./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_grad.d \
./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_math.d \
./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_path.d \
./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_pending.d \
./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_stroke.d \
./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_utils.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/draw/vg_lite/%.o Libs/lvgl/src/draw/vg_lite/%.su Libs/lvgl/src/draw/vg_lite/%.cyclo: ../Libs/lvgl/src/draw/vg_lite/%.c Libs/lvgl/src/draw/vg_lite/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-draw-2f-vg_lite

clean-Libs-2f-lvgl-2f-src-2f-draw-2f-vg_lite:
	-$(RM) ./Libs/lvgl/src/draw/vg_lite/lv_draw_buf_vg_lite.cyclo ./Libs/lvgl/src/draw/vg_lite/lv_draw_buf_vg_lite.d ./Libs/lvgl/src/draw/vg_lite/lv_draw_buf_vg_lite.o ./Libs/lvgl/src/draw/vg_lite/lv_draw_buf_vg_lite.su ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite.cyclo ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite.d ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite.o ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite.su ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_arc.cyclo ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_arc.d ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_arc.o ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_arc.su ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_border.cyclo ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_border.d ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_border.o ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_border.su ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_box_shadow.cyclo ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_box_shadow.d ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_box_shadow.o ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_box_shadow.su ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_fill.cyclo ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_fill.d ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_fill.o ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_fill.su ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_img.cyclo ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_img.d ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_img.o ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_img.su ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_label.cyclo ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_label.d ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_label.o ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_label.su ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_layer.cyclo ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_layer.d ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_layer.o ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_layer.su ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_line.cyclo ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_line.d ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_line.o ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_line.su ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_mask_rect.cyclo ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_mask_rect.d ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_mask_rect.o ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_mask_rect.su ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_triangle.cyclo ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_triangle.d ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_triangle.o ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_triangle.su ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_vector.cyclo ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_vector.d ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_vector.o ./Libs/lvgl/src/draw/vg_lite/lv_draw_vg_lite_vector.su ./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_bitmap_font_cache.cyclo ./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_bitmap_font_cache.d ./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_bitmap_font_cache.o ./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_bitmap_font_cache.su ./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_decoder.cyclo ./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_decoder.d ./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_decoder.o ./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_decoder.su ./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_grad.cyclo ./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_grad.d ./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_grad.o ./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_grad.su ./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_math.cyclo ./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_math.d ./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_math.o ./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_math.su ./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_path.cyclo ./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_path.d ./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_path.o ./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_path.su ./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_pending.cyclo ./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_pending.d ./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_pending.o ./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_pending.su ./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_stroke.cyclo ./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_stroke.d ./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_stroke.o ./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_stroke.su ./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_utils.cyclo ./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_utils.d ./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_utils.o ./Libs/lvgl/src/draw/vg_lite/lv_vg_lite_utils.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-draw-2f-vg_lite

