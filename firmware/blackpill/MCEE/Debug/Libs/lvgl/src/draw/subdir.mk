################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/draw/lv_draw.c \
../Libs/lvgl/src/draw/lv_draw_3d.c \
../Libs/lvgl/src/draw/lv_draw_arc.c \
../Libs/lvgl/src/draw/lv_draw_blur.c \
../Libs/lvgl/src/draw/lv_draw_buf.c \
../Libs/lvgl/src/draw/lv_draw_image.c \
../Libs/lvgl/src/draw/lv_draw_label.c \
../Libs/lvgl/src/draw/lv_draw_line.c \
../Libs/lvgl/src/draw/lv_draw_mask.c \
../Libs/lvgl/src/draw/lv_draw_rect.c \
../Libs/lvgl/src/draw/lv_draw_triangle.c \
../Libs/lvgl/src/draw/lv_draw_utils.c \
../Libs/lvgl/src/draw/lv_draw_vector.c 

OBJS += \
./Libs/lvgl/src/draw/lv_draw.o \
./Libs/lvgl/src/draw/lv_draw_3d.o \
./Libs/lvgl/src/draw/lv_draw_arc.o \
./Libs/lvgl/src/draw/lv_draw_blur.o \
./Libs/lvgl/src/draw/lv_draw_buf.o \
./Libs/lvgl/src/draw/lv_draw_image.o \
./Libs/lvgl/src/draw/lv_draw_label.o \
./Libs/lvgl/src/draw/lv_draw_line.o \
./Libs/lvgl/src/draw/lv_draw_mask.o \
./Libs/lvgl/src/draw/lv_draw_rect.o \
./Libs/lvgl/src/draw/lv_draw_triangle.o \
./Libs/lvgl/src/draw/lv_draw_utils.o \
./Libs/lvgl/src/draw/lv_draw_vector.o 

C_DEPS += \
./Libs/lvgl/src/draw/lv_draw.d \
./Libs/lvgl/src/draw/lv_draw_3d.d \
./Libs/lvgl/src/draw/lv_draw_arc.d \
./Libs/lvgl/src/draw/lv_draw_blur.d \
./Libs/lvgl/src/draw/lv_draw_buf.d \
./Libs/lvgl/src/draw/lv_draw_image.d \
./Libs/lvgl/src/draw/lv_draw_label.d \
./Libs/lvgl/src/draw/lv_draw_line.d \
./Libs/lvgl/src/draw/lv_draw_mask.d \
./Libs/lvgl/src/draw/lv_draw_rect.d \
./Libs/lvgl/src/draw/lv_draw_triangle.d \
./Libs/lvgl/src/draw/lv_draw_utils.d \
./Libs/lvgl/src/draw/lv_draw_vector.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/draw/%.o Libs/lvgl/src/draw/%.su Libs/lvgl/src/draw/%.cyclo: ../Libs/lvgl/src/draw/%.c Libs/lvgl/src/draw/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-draw

clean-Libs-2f-lvgl-2f-src-2f-draw:
	-$(RM) ./Libs/lvgl/src/draw/lv_draw.cyclo ./Libs/lvgl/src/draw/lv_draw.d ./Libs/lvgl/src/draw/lv_draw.o ./Libs/lvgl/src/draw/lv_draw.su ./Libs/lvgl/src/draw/lv_draw_3d.cyclo ./Libs/lvgl/src/draw/lv_draw_3d.d ./Libs/lvgl/src/draw/lv_draw_3d.o ./Libs/lvgl/src/draw/lv_draw_3d.su ./Libs/lvgl/src/draw/lv_draw_arc.cyclo ./Libs/lvgl/src/draw/lv_draw_arc.d ./Libs/lvgl/src/draw/lv_draw_arc.o ./Libs/lvgl/src/draw/lv_draw_arc.su ./Libs/lvgl/src/draw/lv_draw_blur.cyclo ./Libs/lvgl/src/draw/lv_draw_blur.d ./Libs/lvgl/src/draw/lv_draw_blur.o ./Libs/lvgl/src/draw/lv_draw_blur.su ./Libs/lvgl/src/draw/lv_draw_buf.cyclo ./Libs/lvgl/src/draw/lv_draw_buf.d ./Libs/lvgl/src/draw/lv_draw_buf.o ./Libs/lvgl/src/draw/lv_draw_buf.su ./Libs/lvgl/src/draw/lv_draw_image.cyclo ./Libs/lvgl/src/draw/lv_draw_image.d ./Libs/lvgl/src/draw/lv_draw_image.o ./Libs/lvgl/src/draw/lv_draw_image.su ./Libs/lvgl/src/draw/lv_draw_label.cyclo ./Libs/lvgl/src/draw/lv_draw_label.d ./Libs/lvgl/src/draw/lv_draw_label.o ./Libs/lvgl/src/draw/lv_draw_label.su ./Libs/lvgl/src/draw/lv_draw_line.cyclo ./Libs/lvgl/src/draw/lv_draw_line.d ./Libs/lvgl/src/draw/lv_draw_line.o ./Libs/lvgl/src/draw/lv_draw_line.su ./Libs/lvgl/src/draw/lv_draw_mask.cyclo ./Libs/lvgl/src/draw/lv_draw_mask.d ./Libs/lvgl/src/draw/lv_draw_mask.o ./Libs/lvgl/src/draw/lv_draw_mask.su ./Libs/lvgl/src/draw/lv_draw_rect.cyclo ./Libs/lvgl/src/draw/lv_draw_rect.d ./Libs/lvgl/src/draw/lv_draw_rect.o ./Libs/lvgl/src/draw/lv_draw_rect.su ./Libs/lvgl/src/draw/lv_draw_triangle.cyclo ./Libs/lvgl/src/draw/lv_draw_triangle.d ./Libs/lvgl/src/draw/lv_draw_triangle.o ./Libs/lvgl/src/draw/lv_draw_triangle.su ./Libs/lvgl/src/draw/lv_draw_utils.cyclo ./Libs/lvgl/src/draw/lv_draw_utils.d ./Libs/lvgl/src/draw/lv_draw_utils.o ./Libs/lvgl/src/draw/lv_draw_utils.su ./Libs/lvgl/src/draw/lv_draw_vector.cyclo ./Libs/lvgl/src/draw/lv_draw_vector.d ./Libs/lvgl/src/draw/lv_draw_vector.o ./Libs/lvgl/src/draw/lv_draw_vector.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-draw

