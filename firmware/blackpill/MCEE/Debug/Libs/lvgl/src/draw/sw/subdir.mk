################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/draw/sw/lv_draw_sw.c \
../Libs/lvgl/src/draw/sw/lv_draw_sw_arc.c \
../Libs/lvgl/src/draw/sw/lv_draw_sw_blur.c \
../Libs/lvgl/src/draw/sw/lv_draw_sw_border.c \
../Libs/lvgl/src/draw/sw/lv_draw_sw_box_shadow.c \
../Libs/lvgl/src/draw/sw/lv_draw_sw_fill.c \
../Libs/lvgl/src/draw/sw/lv_draw_sw_grad.c \
../Libs/lvgl/src/draw/sw/lv_draw_sw_img.c \
../Libs/lvgl/src/draw/sw/lv_draw_sw_letter.c \
../Libs/lvgl/src/draw/sw/lv_draw_sw_line.c \
../Libs/lvgl/src/draw/sw/lv_draw_sw_mask.c \
../Libs/lvgl/src/draw/sw/lv_draw_sw_mask_rect.c \
../Libs/lvgl/src/draw/sw/lv_draw_sw_transform.c \
../Libs/lvgl/src/draw/sw/lv_draw_sw_triangle.c \
../Libs/lvgl/src/draw/sw/lv_draw_sw_vector.c 

OBJS += \
./Libs/lvgl/src/draw/sw/lv_draw_sw.o \
./Libs/lvgl/src/draw/sw/lv_draw_sw_arc.o \
./Libs/lvgl/src/draw/sw/lv_draw_sw_blur.o \
./Libs/lvgl/src/draw/sw/lv_draw_sw_border.o \
./Libs/lvgl/src/draw/sw/lv_draw_sw_box_shadow.o \
./Libs/lvgl/src/draw/sw/lv_draw_sw_fill.o \
./Libs/lvgl/src/draw/sw/lv_draw_sw_grad.o \
./Libs/lvgl/src/draw/sw/lv_draw_sw_img.o \
./Libs/lvgl/src/draw/sw/lv_draw_sw_letter.o \
./Libs/lvgl/src/draw/sw/lv_draw_sw_line.o \
./Libs/lvgl/src/draw/sw/lv_draw_sw_mask.o \
./Libs/lvgl/src/draw/sw/lv_draw_sw_mask_rect.o \
./Libs/lvgl/src/draw/sw/lv_draw_sw_transform.o \
./Libs/lvgl/src/draw/sw/lv_draw_sw_triangle.o \
./Libs/lvgl/src/draw/sw/lv_draw_sw_vector.o 

C_DEPS += \
./Libs/lvgl/src/draw/sw/lv_draw_sw.d \
./Libs/lvgl/src/draw/sw/lv_draw_sw_arc.d \
./Libs/lvgl/src/draw/sw/lv_draw_sw_blur.d \
./Libs/lvgl/src/draw/sw/lv_draw_sw_border.d \
./Libs/lvgl/src/draw/sw/lv_draw_sw_box_shadow.d \
./Libs/lvgl/src/draw/sw/lv_draw_sw_fill.d \
./Libs/lvgl/src/draw/sw/lv_draw_sw_grad.d \
./Libs/lvgl/src/draw/sw/lv_draw_sw_img.d \
./Libs/lvgl/src/draw/sw/lv_draw_sw_letter.d \
./Libs/lvgl/src/draw/sw/lv_draw_sw_line.d \
./Libs/lvgl/src/draw/sw/lv_draw_sw_mask.d \
./Libs/lvgl/src/draw/sw/lv_draw_sw_mask_rect.d \
./Libs/lvgl/src/draw/sw/lv_draw_sw_transform.d \
./Libs/lvgl/src/draw/sw/lv_draw_sw_triangle.d \
./Libs/lvgl/src/draw/sw/lv_draw_sw_vector.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/draw/sw/%.o Libs/lvgl/src/draw/sw/%.su Libs/lvgl/src/draw/sw/%.cyclo: ../Libs/lvgl/src/draw/sw/%.c Libs/lvgl/src/draw/sw/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-draw-2f-sw

clean-Libs-2f-lvgl-2f-src-2f-draw-2f-sw:
	-$(RM) ./Libs/lvgl/src/draw/sw/lv_draw_sw.cyclo ./Libs/lvgl/src/draw/sw/lv_draw_sw.d ./Libs/lvgl/src/draw/sw/lv_draw_sw.o ./Libs/lvgl/src/draw/sw/lv_draw_sw.su ./Libs/lvgl/src/draw/sw/lv_draw_sw_arc.cyclo ./Libs/lvgl/src/draw/sw/lv_draw_sw_arc.d ./Libs/lvgl/src/draw/sw/lv_draw_sw_arc.o ./Libs/lvgl/src/draw/sw/lv_draw_sw_arc.su ./Libs/lvgl/src/draw/sw/lv_draw_sw_blur.cyclo ./Libs/lvgl/src/draw/sw/lv_draw_sw_blur.d ./Libs/lvgl/src/draw/sw/lv_draw_sw_blur.o ./Libs/lvgl/src/draw/sw/lv_draw_sw_blur.su ./Libs/lvgl/src/draw/sw/lv_draw_sw_border.cyclo ./Libs/lvgl/src/draw/sw/lv_draw_sw_border.d ./Libs/lvgl/src/draw/sw/lv_draw_sw_border.o ./Libs/lvgl/src/draw/sw/lv_draw_sw_border.su ./Libs/lvgl/src/draw/sw/lv_draw_sw_box_shadow.cyclo ./Libs/lvgl/src/draw/sw/lv_draw_sw_box_shadow.d ./Libs/lvgl/src/draw/sw/lv_draw_sw_box_shadow.o ./Libs/lvgl/src/draw/sw/lv_draw_sw_box_shadow.su ./Libs/lvgl/src/draw/sw/lv_draw_sw_fill.cyclo ./Libs/lvgl/src/draw/sw/lv_draw_sw_fill.d ./Libs/lvgl/src/draw/sw/lv_draw_sw_fill.o ./Libs/lvgl/src/draw/sw/lv_draw_sw_fill.su ./Libs/lvgl/src/draw/sw/lv_draw_sw_grad.cyclo ./Libs/lvgl/src/draw/sw/lv_draw_sw_grad.d ./Libs/lvgl/src/draw/sw/lv_draw_sw_grad.o ./Libs/lvgl/src/draw/sw/lv_draw_sw_grad.su ./Libs/lvgl/src/draw/sw/lv_draw_sw_img.cyclo ./Libs/lvgl/src/draw/sw/lv_draw_sw_img.d ./Libs/lvgl/src/draw/sw/lv_draw_sw_img.o ./Libs/lvgl/src/draw/sw/lv_draw_sw_img.su ./Libs/lvgl/src/draw/sw/lv_draw_sw_letter.cyclo ./Libs/lvgl/src/draw/sw/lv_draw_sw_letter.d ./Libs/lvgl/src/draw/sw/lv_draw_sw_letter.o ./Libs/lvgl/src/draw/sw/lv_draw_sw_letter.su ./Libs/lvgl/src/draw/sw/lv_draw_sw_line.cyclo ./Libs/lvgl/src/draw/sw/lv_draw_sw_line.d ./Libs/lvgl/src/draw/sw/lv_draw_sw_line.o ./Libs/lvgl/src/draw/sw/lv_draw_sw_line.su ./Libs/lvgl/src/draw/sw/lv_draw_sw_mask.cyclo ./Libs/lvgl/src/draw/sw/lv_draw_sw_mask.d ./Libs/lvgl/src/draw/sw/lv_draw_sw_mask.o ./Libs/lvgl/src/draw/sw/lv_draw_sw_mask.su ./Libs/lvgl/src/draw/sw/lv_draw_sw_mask_rect.cyclo ./Libs/lvgl/src/draw/sw/lv_draw_sw_mask_rect.d ./Libs/lvgl/src/draw/sw/lv_draw_sw_mask_rect.o ./Libs/lvgl/src/draw/sw/lv_draw_sw_mask_rect.su ./Libs/lvgl/src/draw/sw/lv_draw_sw_transform.cyclo ./Libs/lvgl/src/draw/sw/lv_draw_sw_transform.d ./Libs/lvgl/src/draw/sw/lv_draw_sw_transform.o ./Libs/lvgl/src/draw/sw/lv_draw_sw_transform.su ./Libs/lvgl/src/draw/sw/lv_draw_sw_triangle.cyclo ./Libs/lvgl/src/draw/sw/lv_draw_sw_triangle.d ./Libs/lvgl/src/draw/sw/lv_draw_sw_triangle.o ./Libs/lvgl/src/draw/sw/lv_draw_sw_triangle.su ./Libs/lvgl/src/draw/sw/lv_draw_sw_vector.cyclo ./Libs/lvgl/src/draw/sw/lv_draw_sw_vector.d ./Libs/lvgl/src/draw/sw/lv_draw_sw_vector.o ./Libs/lvgl/src/draw/sw/lv_draw_sw_vector.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-draw-2f-sw

