################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/draw/eve/lv_draw_eve.c \
../Libs/lvgl/src/draw/eve/lv_draw_eve_arc.c \
../Libs/lvgl/src/draw/eve/lv_draw_eve_fill.c \
../Libs/lvgl/src/draw/eve/lv_draw_eve_image.c \
../Libs/lvgl/src/draw/eve/lv_draw_eve_letter.c \
../Libs/lvgl/src/draw/eve/lv_draw_eve_line.c \
../Libs/lvgl/src/draw/eve/lv_draw_eve_ram_g.c \
../Libs/lvgl/src/draw/eve/lv_draw_eve_triangle.c \
../Libs/lvgl/src/draw/eve/lv_eve.c 

OBJS += \
./Libs/lvgl/src/draw/eve/lv_draw_eve.o \
./Libs/lvgl/src/draw/eve/lv_draw_eve_arc.o \
./Libs/lvgl/src/draw/eve/lv_draw_eve_fill.o \
./Libs/lvgl/src/draw/eve/lv_draw_eve_image.o \
./Libs/lvgl/src/draw/eve/lv_draw_eve_letter.o \
./Libs/lvgl/src/draw/eve/lv_draw_eve_line.o \
./Libs/lvgl/src/draw/eve/lv_draw_eve_ram_g.o \
./Libs/lvgl/src/draw/eve/lv_draw_eve_triangle.o \
./Libs/lvgl/src/draw/eve/lv_eve.o 

C_DEPS += \
./Libs/lvgl/src/draw/eve/lv_draw_eve.d \
./Libs/lvgl/src/draw/eve/lv_draw_eve_arc.d \
./Libs/lvgl/src/draw/eve/lv_draw_eve_fill.d \
./Libs/lvgl/src/draw/eve/lv_draw_eve_image.d \
./Libs/lvgl/src/draw/eve/lv_draw_eve_letter.d \
./Libs/lvgl/src/draw/eve/lv_draw_eve_line.d \
./Libs/lvgl/src/draw/eve/lv_draw_eve_ram_g.d \
./Libs/lvgl/src/draw/eve/lv_draw_eve_triangle.d \
./Libs/lvgl/src/draw/eve/lv_eve.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/draw/eve/%.o Libs/lvgl/src/draw/eve/%.su Libs/lvgl/src/draw/eve/%.cyclo: ../Libs/lvgl/src/draw/eve/%.c Libs/lvgl/src/draw/eve/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-draw-2f-eve

clean-Libs-2f-lvgl-2f-src-2f-draw-2f-eve:
	-$(RM) ./Libs/lvgl/src/draw/eve/lv_draw_eve.cyclo ./Libs/lvgl/src/draw/eve/lv_draw_eve.d ./Libs/lvgl/src/draw/eve/lv_draw_eve.o ./Libs/lvgl/src/draw/eve/lv_draw_eve.su ./Libs/lvgl/src/draw/eve/lv_draw_eve_arc.cyclo ./Libs/lvgl/src/draw/eve/lv_draw_eve_arc.d ./Libs/lvgl/src/draw/eve/lv_draw_eve_arc.o ./Libs/lvgl/src/draw/eve/lv_draw_eve_arc.su ./Libs/lvgl/src/draw/eve/lv_draw_eve_fill.cyclo ./Libs/lvgl/src/draw/eve/lv_draw_eve_fill.d ./Libs/lvgl/src/draw/eve/lv_draw_eve_fill.o ./Libs/lvgl/src/draw/eve/lv_draw_eve_fill.su ./Libs/lvgl/src/draw/eve/lv_draw_eve_image.cyclo ./Libs/lvgl/src/draw/eve/lv_draw_eve_image.d ./Libs/lvgl/src/draw/eve/lv_draw_eve_image.o ./Libs/lvgl/src/draw/eve/lv_draw_eve_image.su ./Libs/lvgl/src/draw/eve/lv_draw_eve_letter.cyclo ./Libs/lvgl/src/draw/eve/lv_draw_eve_letter.d ./Libs/lvgl/src/draw/eve/lv_draw_eve_letter.o ./Libs/lvgl/src/draw/eve/lv_draw_eve_letter.su ./Libs/lvgl/src/draw/eve/lv_draw_eve_line.cyclo ./Libs/lvgl/src/draw/eve/lv_draw_eve_line.d ./Libs/lvgl/src/draw/eve/lv_draw_eve_line.o ./Libs/lvgl/src/draw/eve/lv_draw_eve_line.su ./Libs/lvgl/src/draw/eve/lv_draw_eve_ram_g.cyclo ./Libs/lvgl/src/draw/eve/lv_draw_eve_ram_g.d ./Libs/lvgl/src/draw/eve/lv_draw_eve_ram_g.o ./Libs/lvgl/src/draw/eve/lv_draw_eve_ram_g.su ./Libs/lvgl/src/draw/eve/lv_draw_eve_triangle.cyclo ./Libs/lvgl/src/draw/eve/lv_draw_eve_triangle.d ./Libs/lvgl/src/draw/eve/lv_draw_eve_triangle.o ./Libs/lvgl/src/draw/eve/lv_draw_eve_triangle.su ./Libs/lvgl/src/draw/eve/lv_eve.cyclo ./Libs/lvgl/src/draw/eve/lv_eve.d ./Libs/lvgl/src/draw/eve/lv_eve.o ./Libs/lvgl/src/draw/eve/lv_eve.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-draw-2f-eve

