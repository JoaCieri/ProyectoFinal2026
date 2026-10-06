################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.c \
../Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.c \
../Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.c \
../Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.c \
../Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.c \
../Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.c \
../Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.c \
../Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.c \
../Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.c \
../Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.c 

OBJS += \
./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.o \
./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.o \
./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.o \
./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.o \
./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.o \
./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.o \
./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.o \
./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.o \
./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.o \
./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.o 

C_DEPS += \
./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.d \
./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.d \
./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.d \
./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.d \
./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.d \
./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.d \
./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.d \
./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.d \
./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.d \
./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/draw/renesas/dave2d/%.o Libs/lvgl/src/draw/renesas/dave2d/%.su Libs/lvgl/src/draw/renesas/dave2d/%.cyclo: ../Libs/lvgl/src/draw/renesas/dave2d/%.c Libs/lvgl/src/draw/renesas/dave2d/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-draw-2f-renesas-2f-dave2d

clean-Libs-2f-lvgl-2f-src-2f-draw-2f-renesas-2f-dave2d:
	-$(RM) ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.cyclo ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.d ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.o ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.su ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.cyclo ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.d ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.o ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.su ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.cyclo ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.d ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.o ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.su ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.cyclo ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.d ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.o ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.su ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.cyclo ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.d ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.o ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.su ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.cyclo ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.d ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.o ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.su ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.cyclo ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.d ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.o ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.su ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.cyclo ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.d ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.o ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.su ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.cyclo ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.d ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.o ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.su ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.cyclo ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.d ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.o ./Libs/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-draw-2f-renesas-2f-dave2d

