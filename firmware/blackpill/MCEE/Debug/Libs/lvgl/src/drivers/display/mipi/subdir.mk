################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/drivers/display/mipi/lv_ili9341.c \
../Libs/lvgl/src/drivers/display/mipi/lv_lcd_generic_mipi.c \
../Libs/lvgl/src/drivers/display/mipi/lv_nv3007.c \
../Libs/lvgl/src/drivers/display/mipi/lv_st7735.c \
../Libs/lvgl/src/drivers/display/mipi/lv_st7789.c \
../Libs/lvgl/src/drivers/display/mipi/lv_st7796.c 

OBJS += \
./Libs/lvgl/src/drivers/display/mipi/lv_ili9341.o \
./Libs/lvgl/src/drivers/display/mipi/lv_lcd_generic_mipi.o \
./Libs/lvgl/src/drivers/display/mipi/lv_nv3007.o \
./Libs/lvgl/src/drivers/display/mipi/lv_st7735.o \
./Libs/lvgl/src/drivers/display/mipi/lv_st7789.o \
./Libs/lvgl/src/drivers/display/mipi/lv_st7796.o 

C_DEPS += \
./Libs/lvgl/src/drivers/display/mipi/lv_ili9341.d \
./Libs/lvgl/src/drivers/display/mipi/lv_lcd_generic_mipi.d \
./Libs/lvgl/src/drivers/display/mipi/lv_nv3007.d \
./Libs/lvgl/src/drivers/display/mipi/lv_st7735.d \
./Libs/lvgl/src/drivers/display/mipi/lv_st7789.d \
./Libs/lvgl/src/drivers/display/mipi/lv_st7796.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/drivers/display/mipi/%.o Libs/lvgl/src/drivers/display/mipi/%.su Libs/lvgl/src/drivers/display/mipi/%.cyclo: ../Libs/lvgl/src/drivers/display/mipi/%.c Libs/lvgl/src/drivers/display/mipi/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-drivers-2f-display-2f-mipi

clean-Libs-2f-lvgl-2f-src-2f-drivers-2f-display-2f-mipi:
	-$(RM) ./Libs/lvgl/src/drivers/display/mipi/lv_ili9341.cyclo ./Libs/lvgl/src/drivers/display/mipi/lv_ili9341.d ./Libs/lvgl/src/drivers/display/mipi/lv_ili9341.o ./Libs/lvgl/src/drivers/display/mipi/lv_ili9341.su ./Libs/lvgl/src/drivers/display/mipi/lv_lcd_generic_mipi.cyclo ./Libs/lvgl/src/drivers/display/mipi/lv_lcd_generic_mipi.d ./Libs/lvgl/src/drivers/display/mipi/lv_lcd_generic_mipi.o ./Libs/lvgl/src/drivers/display/mipi/lv_lcd_generic_mipi.su ./Libs/lvgl/src/drivers/display/mipi/lv_nv3007.cyclo ./Libs/lvgl/src/drivers/display/mipi/lv_nv3007.d ./Libs/lvgl/src/drivers/display/mipi/lv_nv3007.o ./Libs/lvgl/src/drivers/display/mipi/lv_nv3007.su ./Libs/lvgl/src/drivers/display/mipi/lv_st7735.cyclo ./Libs/lvgl/src/drivers/display/mipi/lv_st7735.d ./Libs/lvgl/src/drivers/display/mipi/lv_st7735.o ./Libs/lvgl/src/drivers/display/mipi/lv_st7735.su ./Libs/lvgl/src/drivers/display/mipi/lv_st7789.cyclo ./Libs/lvgl/src/drivers/display/mipi/lv_st7789.d ./Libs/lvgl/src/drivers/display/mipi/lv_st7789.o ./Libs/lvgl/src/drivers/display/mipi/lv_st7789.su ./Libs/lvgl/src/drivers/display/mipi/lv_st7796.cyclo ./Libs/lvgl/src/drivers/display/mipi/lv_st7796.d ./Libs/lvgl/src/drivers/display/mipi/lv_st7796.o ./Libs/lvgl/src/drivers/display/mipi/lv_st7796.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-drivers-2f-display-2f-mipi

