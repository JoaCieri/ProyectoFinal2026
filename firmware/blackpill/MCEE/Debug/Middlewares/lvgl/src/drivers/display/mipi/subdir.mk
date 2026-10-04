################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl/src/drivers/display/mipi/lv_ili9341.c \
../Middlewares/lvgl/src/drivers/display/mipi/lv_lcd_generic_mipi.c \
../Middlewares/lvgl/src/drivers/display/mipi/lv_nv3007.c \
../Middlewares/lvgl/src/drivers/display/mipi/lv_st7735.c \
../Middlewares/lvgl/src/drivers/display/mipi/lv_st7789.c \
../Middlewares/lvgl/src/drivers/display/mipi/lv_st7796.c 

OBJS += \
./Middlewares/lvgl/src/drivers/display/mipi/lv_ili9341.o \
./Middlewares/lvgl/src/drivers/display/mipi/lv_lcd_generic_mipi.o \
./Middlewares/lvgl/src/drivers/display/mipi/lv_nv3007.o \
./Middlewares/lvgl/src/drivers/display/mipi/lv_st7735.o \
./Middlewares/lvgl/src/drivers/display/mipi/lv_st7789.o \
./Middlewares/lvgl/src/drivers/display/mipi/lv_st7796.o 

C_DEPS += \
./Middlewares/lvgl/src/drivers/display/mipi/lv_ili9341.d \
./Middlewares/lvgl/src/drivers/display/mipi/lv_lcd_generic_mipi.d \
./Middlewares/lvgl/src/drivers/display/mipi/lv_nv3007.d \
./Middlewares/lvgl/src/drivers/display/mipi/lv_st7735.d \
./Middlewares/lvgl/src/drivers/display/mipi/lv_st7789.d \
./Middlewares/lvgl/src/drivers/display/mipi/lv_st7796.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl/src/drivers/display/mipi/%.o Middlewares/lvgl/src/drivers/display/mipi/%.su Middlewares/lvgl/src/drivers/display/mipi/%.cyclo: ../Middlewares/lvgl/src/drivers/display/mipi/%.c Middlewares/lvgl/src/drivers/display/mipi/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl-2f-src-2f-drivers-2f-display-2f-mipi

clean-Middlewares-2f-lvgl-2f-src-2f-drivers-2f-display-2f-mipi:
	-$(RM) ./Middlewares/lvgl/src/drivers/display/mipi/lv_ili9341.cyclo ./Middlewares/lvgl/src/drivers/display/mipi/lv_ili9341.d ./Middlewares/lvgl/src/drivers/display/mipi/lv_ili9341.o ./Middlewares/lvgl/src/drivers/display/mipi/lv_ili9341.su ./Middlewares/lvgl/src/drivers/display/mipi/lv_lcd_generic_mipi.cyclo ./Middlewares/lvgl/src/drivers/display/mipi/lv_lcd_generic_mipi.d ./Middlewares/lvgl/src/drivers/display/mipi/lv_lcd_generic_mipi.o ./Middlewares/lvgl/src/drivers/display/mipi/lv_lcd_generic_mipi.su ./Middlewares/lvgl/src/drivers/display/mipi/lv_nv3007.cyclo ./Middlewares/lvgl/src/drivers/display/mipi/lv_nv3007.d ./Middlewares/lvgl/src/drivers/display/mipi/lv_nv3007.o ./Middlewares/lvgl/src/drivers/display/mipi/lv_nv3007.su ./Middlewares/lvgl/src/drivers/display/mipi/lv_st7735.cyclo ./Middlewares/lvgl/src/drivers/display/mipi/lv_st7735.d ./Middlewares/lvgl/src/drivers/display/mipi/lv_st7735.o ./Middlewares/lvgl/src/drivers/display/mipi/lv_st7735.su ./Middlewares/lvgl/src/drivers/display/mipi/lv_st7789.cyclo ./Middlewares/lvgl/src/drivers/display/mipi/lv_st7789.d ./Middlewares/lvgl/src/drivers/display/mipi/lv_st7789.o ./Middlewares/lvgl/src/drivers/display/mipi/lv_st7789.su ./Middlewares/lvgl/src/drivers/display/mipi/lv_st7796.cyclo ./Middlewares/lvgl/src/drivers/display/mipi/lv_st7796.d ./Middlewares/lvgl/src/drivers/display/mipi/lv_st7796.o ./Middlewares/lvgl/src/drivers/display/mipi/lv_st7796.su

.PHONY: clean-Middlewares-2f-lvgl-2f-src-2f-drivers-2f-display-2f-mipi

