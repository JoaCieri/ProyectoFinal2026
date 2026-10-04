################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl/src/draw/espressif/ppa/lv_draw_ppa.c \
../Middlewares/lvgl/src/draw/espressif/ppa/lv_draw_ppa_buf.c \
../Middlewares/lvgl/src/draw/espressif/ppa/lv_draw_ppa_fill.c \
../Middlewares/lvgl/src/draw/espressif/ppa/lv_draw_ppa_img.c 

OBJS += \
./Middlewares/lvgl/src/draw/espressif/ppa/lv_draw_ppa.o \
./Middlewares/lvgl/src/draw/espressif/ppa/lv_draw_ppa_buf.o \
./Middlewares/lvgl/src/draw/espressif/ppa/lv_draw_ppa_fill.o \
./Middlewares/lvgl/src/draw/espressif/ppa/lv_draw_ppa_img.o 

C_DEPS += \
./Middlewares/lvgl/src/draw/espressif/ppa/lv_draw_ppa.d \
./Middlewares/lvgl/src/draw/espressif/ppa/lv_draw_ppa_buf.d \
./Middlewares/lvgl/src/draw/espressif/ppa/lv_draw_ppa_fill.d \
./Middlewares/lvgl/src/draw/espressif/ppa/lv_draw_ppa_img.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl/src/draw/espressif/ppa/%.o Middlewares/lvgl/src/draw/espressif/ppa/%.su Middlewares/lvgl/src/draw/espressif/ppa/%.cyclo: ../Middlewares/lvgl/src/draw/espressif/ppa/%.c Middlewares/lvgl/src/draw/espressif/ppa/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl-2f-src-2f-draw-2f-espressif-2f-ppa

clean-Middlewares-2f-lvgl-2f-src-2f-draw-2f-espressif-2f-ppa:
	-$(RM) ./Middlewares/lvgl/src/draw/espressif/ppa/lv_draw_ppa.cyclo ./Middlewares/lvgl/src/draw/espressif/ppa/lv_draw_ppa.d ./Middlewares/lvgl/src/draw/espressif/ppa/lv_draw_ppa.o ./Middlewares/lvgl/src/draw/espressif/ppa/lv_draw_ppa.su ./Middlewares/lvgl/src/draw/espressif/ppa/lv_draw_ppa_buf.cyclo ./Middlewares/lvgl/src/draw/espressif/ppa/lv_draw_ppa_buf.d ./Middlewares/lvgl/src/draw/espressif/ppa/lv_draw_ppa_buf.o ./Middlewares/lvgl/src/draw/espressif/ppa/lv_draw_ppa_buf.su ./Middlewares/lvgl/src/draw/espressif/ppa/lv_draw_ppa_fill.cyclo ./Middlewares/lvgl/src/draw/espressif/ppa/lv_draw_ppa_fill.d ./Middlewares/lvgl/src/draw/espressif/ppa/lv_draw_ppa_fill.o ./Middlewares/lvgl/src/draw/espressif/ppa/lv_draw_ppa_fill.su ./Middlewares/lvgl/src/draw/espressif/ppa/lv_draw_ppa_img.cyclo ./Middlewares/lvgl/src/draw/espressif/ppa/lv_draw_ppa_img.d ./Middlewares/lvgl/src/draw/espressif/ppa/lv_draw_ppa_img.o ./Middlewares/lvgl/src/draw/espressif/ppa/lv_draw_ppa_img.su

.PHONY: clean-Middlewares-2f-lvgl-2f-src-2f-draw-2f-espressif-2f-ppa

