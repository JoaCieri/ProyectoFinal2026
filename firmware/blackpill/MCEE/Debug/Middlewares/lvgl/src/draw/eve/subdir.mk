################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl/src/draw/eve/lv_draw_eve.c \
../Middlewares/lvgl/src/draw/eve/lv_draw_eve_arc.c \
../Middlewares/lvgl/src/draw/eve/lv_draw_eve_fill.c \
../Middlewares/lvgl/src/draw/eve/lv_draw_eve_image.c \
../Middlewares/lvgl/src/draw/eve/lv_draw_eve_letter.c \
../Middlewares/lvgl/src/draw/eve/lv_draw_eve_line.c \
../Middlewares/lvgl/src/draw/eve/lv_draw_eve_ram_g.c \
../Middlewares/lvgl/src/draw/eve/lv_draw_eve_triangle.c \
../Middlewares/lvgl/src/draw/eve/lv_eve.c 

OBJS += \
./Middlewares/lvgl/src/draw/eve/lv_draw_eve.o \
./Middlewares/lvgl/src/draw/eve/lv_draw_eve_arc.o \
./Middlewares/lvgl/src/draw/eve/lv_draw_eve_fill.o \
./Middlewares/lvgl/src/draw/eve/lv_draw_eve_image.o \
./Middlewares/lvgl/src/draw/eve/lv_draw_eve_letter.o \
./Middlewares/lvgl/src/draw/eve/lv_draw_eve_line.o \
./Middlewares/lvgl/src/draw/eve/lv_draw_eve_ram_g.o \
./Middlewares/lvgl/src/draw/eve/lv_draw_eve_triangle.o \
./Middlewares/lvgl/src/draw/eve/lv_eve.o 

C_DEPS += \
./Middlewares/lvgl/src/draw/eve/lv_draw_eve.d \
./Middlewares/lvgl/src/draw/eve/lv_draw_eve_arc.d \
./Middlewares/lvgl/src/draw/eve/lv_draw_eve_fill.d \
./Middlewares/lvgl/src/draw/eve/lv_draw_eve_image.d \
./Middlewares/lvgl/src/draw/eve/lv_draw_eve_letter.d \
./Middlewares/lvgl/src/draw/eve/lv_draw_eve_line.d \
./Middlewares/lvgl/src/draw/eve/lv_draw_eve_ram_g.d \
./Middlewares/lvgl/src/draw/eve/lv_draw_eve_triangle.d \
./Middlewares/lvgl/src/draw/eve/lv_eve.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl/src/draw/eve/%.o Middlewares/lvgl/src/draw/eve/%.su Middlewares/lvgl/src/draw/eve/%.cyclo: ../Middlewares/lvgl/src/draw/eve/%.c Middlewares/lvgl/src/draw/eve/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl-2f-src-2f-draw-2f-eve

clean-Middlewares-2f-lvgl-2f-src-2f-draw-2f-eve:
	-$(RM) ./Middlewares/lvgl/src/draw/eve/lv_draw_eve.cyclo ./Middlewares/lvgl/src/draw/eve/lv_draw_eve.d ./Middlewares/lvgl/src/draw/eve/lv_draw_eve.o ./Middlewares/lvgl/src/draw/eve/lv_draw_eve.su ./Middlewares/lvgl/src/draw/eve/lv_draw_eve_arc.cyclo ./Middlewares/lvgl/src/draw/eve/lv_draw_eve_arc.d ./Middlewares/lvgl/src/draw/eve/lv_draw_eve_arc.o ./Middlewares/lvgl/src/draw/eve/lv_draw_eve_arc.su ./Middlewares/lvgl/src/draw/eve/lv_draw_eve_fill.cyclo ./Middlewares/lvgl/src/draw/eve/lv_draw_eve_fill.d ./Middlewares/lvgl/src/draw/eve/lv_draw_eve_fill.o ./Middlewares/lvgl/src/draw/eve/lv_draw_eve_fill.su ./Middlewares/lvgl/src/draw/eve/lv_draw_eve_image.cyclo ./Middlewares/lvgl/src/draw/eve/lv_draw_eve_image.d ./Middlewares/lvgl/src/draw/eve/lv_draw_eve_image.o ./Middlewares/lvgl/src/draw/eve/lv_draw_eve_image.su ./Middlewares/lvgl/src/draw/eve/lv_draw_eve_letter.cyclo ./Middlewares/lvgl/src/draw/eve/lv_draw_eve_letter.d ./Middlewares/lvgl/src/draw/eve/lv_draw_eve_letter.o ./Middlewares/lvgl/src/draw/eve/lv_draw_eve_letter.su ./Middlewares/lvgl/src/draw/eve/lv_draw_eve_line.cyclo ./Middlewares/lvgl/src/draw/eve/lv_draw_eve_line.d ./Middlewares/lvgl/src/draw/eve/lv_draw_eve_line.o ./Middlewares/lvgl/src/draw/eve/lv_draw_eve_line.su ./Middlewares/lvgl/src/draw/eve/lv_draw_eve_ram_g.cyclo ./Middlewares/lvgl/src/draw/eve/lv_draw_eve_ram_g.d ./Middlewares/lvgl/src/draw/eve/lv_draw_eve_ram_g.o ./Middlewares/lvgl/src/draw/eve/lv_draw_eve_ram_g.su ./Middlewares/lvgl/src/draw/eve/lv_draw_eve_triangle.cyclo ./Middlewares/lvgl/src/draw/eve/lv_draw_eve_triangle.d ./Middlewares/lvgl/src/draw/eve/lv_draw_eve_triangle.o ./Middlewares/lvgl/src/draw/eve/lv_draw_eve_triangle.su ./Middlewares/lvgl/src/draw/eve/lv_eve.cyclo ./Middlewares/lvgl/src/draw/eve/lv_eve.d ./Middlewares/lvgl/src/draw/eve/lv_eve.o ./Middlewares/lvgl/src/draw/eve/lv_eve.su

.PHONY: clean-Middlewares-2f-lvgl-2f-src-2f-draw-2f-eve

