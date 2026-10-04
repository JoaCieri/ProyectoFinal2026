################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.c \
../Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.c \
../Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.c \
../Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.c \
../Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.c \
../Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.c \
../Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.c \
../Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.c \
../Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.c \
../Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.c 

OBJS += \
./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.o \
./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.o \
./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.o \
./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.o \
./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.o \
./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.o \
./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.o \
./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.o \
./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.o \
./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.o 

C_DEPS += \
./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.d \
./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.d \
./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.d \
./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.d \
./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.d \
./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.d \
./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.d \
./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.d \
./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.d \
./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl/src/draw/renesas/dave2d/%.o Middlewares/lvgl/src/draw/renesas/dave2d/%.su Middlewares/lvgl/src/draw/renesas/dave2d/%.cyclo: ../Middlewares/lvgl/src/draw/renesas/dave2d/%.c Middlewares/lvgl/src/draw/renesas/dave2d/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl-2f-src-2f-draw-2f-renesas-2f-dave2d

clean-Middlewares-2f-lvgl-2f-src-2f-draw-2f-renesas-2f-dave2d:
	-$(RM) ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.cyclo ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.d ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.o ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.su ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.cyclo ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.d ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.o ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.su ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.cyclo ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.d ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.o ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.su ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.cyclo ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.d ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.o ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.su ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.cyclo ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.d ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.o ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.su ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.cyclo ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.d ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.o ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.su ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.cyclo ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.d ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.o ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.su ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.cyclo ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.d ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.o ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.su ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.cyclo ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.d ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.o ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.su ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.cyclo ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.d ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.o ./Middlewares/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.su

.PHONY: clean-Middlewares-2f-lvgl-2f-src-2f-draw-2f-renesas-2f-dave2d

