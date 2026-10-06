################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/font/fmt_txt/lv_font_fmt_txt.c 

OBJS += \
./Libs/lvgl/src/font/fmt_txt/lv_font_fmt_txt.o 

C_DEPS += \
./Libs/lvgl/src/font/fmt_txt/lv_font_fmt_txt.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/font/fmt_txt/%.o Libs/lvgl/src/font/fmt_txt/%.su Libs/lvgl/src/font/fmt_txt/%.cyclo: ../Libs/lvgl/src/font/fmt_txt/%.c Libs/lvgl/src/font/fmt_txt/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-font-2f-fmt_txt

clean-Libs-2f-lvgl-2f-src-2f-font-2f-fmt_txt:
	-$(RM) ./Libs/lvgl/src/font/fmt_txt/lv_font_fmt_txt.cyclo ./Libs/lvgl/src/font/fmt_txt/lv_font_fmt_txt.d ./Libs/lvgl/src/font/fmt_txt/lv_font_fmt_txt.o ./Libs/lvgl/src/font/fmt_txt/lv_font_fmt_txt.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-font-2f-fmt_txt

