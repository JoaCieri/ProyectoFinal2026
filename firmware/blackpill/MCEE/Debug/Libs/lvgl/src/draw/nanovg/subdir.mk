################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/draw/nanovg/lv_draw_nanovg.c \
../Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_3d.c \
../Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_arc.c \
../Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_blur.c \
../Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_border.c \
../Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_box_shadow.c \
../Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_fill.c \
../Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_grad.c \
../Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_image.c \
../Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_label.c \
../Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_layer.c \
../Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_line.c \
../Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_mask_rect.c \
../Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_triangle.c \
../Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_vector.c \
../Libs/lvgl/src/draw/nanovg/lv_nanovg_fbo_cache.c \
../Libs/lvgl/src/draw/nanovg/lv_nanovg_image_cache.c \
../Libs/lvgl/src/draw/nanovg/lv_nanovg_utils.c 

OBJS += \
./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg.o \
./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_3d.o \
./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_arc.o \
./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_blur.o \
./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_border.o \
./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_box_shadow.o \
./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_fill.o \
./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_grad.o \
./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_image.o \
./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_label.o \
./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_layer.o \
./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_line.o \
./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_mask_rect.o \
./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_triangle.o \
./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_vector.o \
./Libs/lvgl/src/draw/nanovg/lv_nanovg_fbo_cache.o \
./Libs/lvgl/src/draw/nanovg/lv_nanovg_image_cache.o \
./Libs/lvgl/src/draw/nanovg/lv_nanovg_utils.o 

C_DEPS += \
./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg.d \
./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_3d.d \
./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_arc.d \
./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_blur.d \
./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_border.d \
./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_box_shadow.d \
./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_fill.d \
./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_grad.d \
./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_image.d \
./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_label.d \
./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_layer.d \
./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_line.d \
./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_mask_rect.d \
./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_triangle.d \
./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_vector.d \
./Libs/lvgl/src/draw/nanovg/lv_nanovg_fbo_cache.d \
./Libs/lvgl/src/draw/nanovg/lv_nanovg_image_cache.d \
./Libs/lvgl/src/draw/nanovg/lv_nanovg_utils.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/draw/nanovg/%.o Libs/lvgl/src/draw/nanovg/%.su Libs/lvgl/src/draw/nanovg/%.cyclo: ../Libs/lvgl/src/draw/nanovg/%.c Libs/lvgl/src/draw/nanovg/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-draw-2f-nanovg

clean-Libs-2f-lvgl-2f-src-2f-draw-2f-nanovg:
	-$(RM) ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg.cyclo ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg.d ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg.o ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg.su ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_3d.cyclo ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_3d.d ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_3d.o ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_3d.su ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_arc.cyclo ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_arc.d ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_arc.o ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_arc.su ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_blur.cyclo ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_blur.d ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_blur.o ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_blur.su ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_border.cyclo ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_border.d ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_border.o ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_border.su ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_box_shadow.cyclo ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_box_shadow.d ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_box_shadow.o ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_box_shadow.su ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_fill.cyclo ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_fill.d ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_fill.o ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_fill.su ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_grad.cyclo ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_grad.d ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_grad.o ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_grad.su ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_image.cyclo ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_image.d ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_image.o ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_image.su ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_label.cyclo ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_label.d ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_label.o ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_label.su ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_layer.cyclo ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_layer.d ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_layer.o ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_layer.su ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_line.cyclo ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_line.d ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_line.o ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_line.su ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_mask_rect.cyclo ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_mask_rect.d ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_mask_rect.o ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_mask_rect.su ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_triangle.cyclo ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_triangle.d ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_triangle.o ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_triangle.su ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_vector.cyclo ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_vector.d ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_vector.o ./Libs/lvgl/src/draw/nanovg/lv_draw_nanovg_vector.su ./Libs/lvgl/src/draw/nanovg/lv_nanovg_fbo_cache.cyclo ./Libs/lvgl/src/draw/nanovg/lv_nanovg_fbo_cache.d ./Libs/lvgl/src/draw/nanovg/lv_nanovg_fbo_cache.o ./Libs/lvgl/src/draw/nanovg/lv_nanovg_fbo_cache.su ./Libs/lvgl/src/draw/nanovg/lv_nanovg_image_cache.cyclo ./Libs/lvgl/src/draw/nanovg/lv_nanovg_image_cache.d ./Libs/lvgl/src/draw/nanovg/lv_nanovg_image_cache.o ./Libs/lvgl/src/draw/nanovg/lv_nanovg_image_cache.su ./Libs/lvgl/src/draw/nanovg/lv_nanovg_utils.cyclo ./Libs/lvgl/src/draw/nanovg/lv_nanovg_utils.d ./Libs/lvgl/src/draw/nanovg/lv_nanovg_utils.o ./Libs/lvgl/src/draw/nanovg/lv_nanovg_utils.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-draw-2f-nanovg

