################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/font/freetype/lv_freetype.c \
../Libs/lvgl/src/font/freetype/lv_freetype_glyph.c \
../Libs/lvgl/src/font/freetype/lv_freetype_image.c \
../Libs/lvgl/src/font/freetype/lv_freetype_outline.c \
../Libs/lvgl/src/font/freetype/lv_ftsystem.c 

OBJS += \
./Libs/lvgl/src/font/freetype/lv_freetype.o \
./Libs/lvgl/src/font/freetype/lv_freetype_glyph.o \
./Libs/lvgl/src/font/freetype/lv_freetype_image.o \
./Libs/lvgl/src/font/freetype/lv_freetype_outline.o \
./Libs/lvgl/src/font/freetype/lv_ftsystem.o 

C_DEPS += \
./Libs/lvgl/src/font/freetype/lv_freetype.d \
./Libs/lvgl/src/font/freetype/lv_freetype_glyph.d \
./Libs/lvgl/src/font/freetype/lv_freetype_image.d \
./Libs/lvgl/src/font/freetype/lv_freetype_outline.d \
./Libs/lvgl/src/font/freetype/lv_ftsystem.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/font/freetype/%.o Libs/lvgl/src/font/freetype/%.su Libs/lvgl/src/font/freetype/%.cyclo: ../Libs/lvgl/src/font/freetype/%.c Libs/lvgl/src/font/freetype/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-font-2f-freetype

clean-Libs-2f-lvgl-2f-src-2f-font-2f-freetype:
	-$(RM) ./Libs/lvgl/src/font/freetype/lv_freetype.cyclo ./Libs/lvgl/src/font/freetype/lv_freetype.d ./Libs/lvgl/src/font/freetype/lv_freetype.o ./Libs/lvgl/src/font/freetype/lv_freetype.su ./Libs/lvgl/src/font/freetype/lv_freetype_glyph.cyclo ./Libs/lvgl/src/font/freetype/lv_freetype_glyph.d ./Libs/lvgl/src/font/freetype/lv_freetype_glyph.o ./Libs/lvgl/src/font/freetype/lv_freetype_glyph.su ./Libs/lvgl/src/font/freetype/lv_freetype_image.cyclo ./Libs/lvgl/src/font/freetype/lv_freetype_image.d ./Libs/lvgl/src/font/freetype/lv_freetype_image.o ./Libs/lvgl/src/font/freetype/lv_freetype_image.su ./Libs/lvgl/src/font/freetype/lv_freetype_outline.cyclo ./Libs/lvgl/src/font/freetype/lv_freetype_outline.d ./Libs/lvgl/src/font/freetype/lv_freetype_outline.o ./Libs/lvgl/src/font/freetype/lv_freetype_outline.su ./Libs/lvgl/src/font/freetype/lv_ftsystem.cyclo ./Libs/lvgl/src/font/freetype/lv_ftsystem.d ./Libs/lvgl/src/font/freetype/lv_ftsystem.o ./Libs/lvgl/src/font/freetype/lv_ftsystem.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-font-2f-freetype

