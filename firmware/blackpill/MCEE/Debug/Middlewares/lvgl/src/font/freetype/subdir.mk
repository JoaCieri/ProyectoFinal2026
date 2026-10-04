################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl/src/font/freetype/lv_freetype.c \
../Middlewares/lvgl/src/font/freetype/lv_freetype_glyph.c \
../Middlewares/lvgl/src/font/freetype/lv_freetype_image.c \
../Middlewares/lvgl/src/font/freetype/lv_freetype_outline.c \
../Middlewares/lvgl/src/font/freetype/lv_ftsystem.c 

OBJS += \
./Middlewares/lvgl/src/font/freetype/lv_freetype.o \
./Middlewares/lvgl/src/font/freetype/lv_freetype_glyph.o \
./Middlewares/lvgl/src/font/freetype/lv_freetype_image.o \
./Middlewares/lvgl/src/font/freetype/lv_freetype_outline.o \
./Middlewares/lvgl/src/font/freetype/lv_ftsystem.o 

C_DEPS += \
./Middlewares/lvgl/src/font/freetype/lv_freetype.d \
./Middlewares/lvgl/src/font/freetype/lv_freetype_glyph.d \
./Middlewares/lvgl/src/font/freetype/lv_freetype_image.d \
./Middlewares/lvgl/src/font/freetype/lv_freetype_outline.d \
./Middlewares/lvgl/src/font/freetype/lv_ftsystem.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl/src/font/freetype/%.o Middlewares/lvgl/src/font/freetype/%.su Middlewares/lvgl/src/font/freetype/%.cyclo: ../Middlewares/lvgl/src/font/freetype/%.c Middlewares/lvgl/src/font/freetype/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl-2f-src-2f-font-2f-freetype

clean-Middlewares-2f-lvgl-2f-src-2f-font-2f-freetype:
	-$(RM) ./Middlewares/lvgl/src/font/freetype/lv_freetype.cyclo ./Middlewares/lvgl/src/font/freetype/lv_freetype.d ./Middlewares/lvgl/src/font/freetype/lv_freetype.o ./Middlewares/lvgl/src/font/freetype/lv_freetype.su ./Middlewares/lvgl/src/font/freetype/lv_freetype_glyph.cyclo ./Middlewares/lvgl/src/font/freetype/lv_freetype_glyph.d ./Middlewares/lvgl/src/font/freetype/lv_freetype_glyph.o ./Middlewares/lvgl/src/font/freetype/lv_freetype_glyph.su ./Middlewares/lvgl/src/font/freetype/lv_freetype_image.cyclo ./Middlewares/lvgl/src/font/freetype/lv_freetype_image.d ./Middlewares/lvgl/src/font/freetype/lv_freetype_image.o ./Middlewares/lvgl/src/font/freetype/lv_freetype_image.su ./Middlewares/lvgl/src/font/freetype/lv_freetype_outline.cyclo ./Middlewares/lvgl/src/font/freetype/lv_freetype_outline.d ./Middlewares/lvgl/src/font/freetype/lv_freetype_outline.o ./Middlewares/lvgl/src/font/freetype/lv_freetype_outline.su ./Middlewares/lvgl/src/font/freetype/lv_ftsystem.cyclo ./Middlewares/lvgl/src/font/freetype/lv_ftsystem.d ./Middlewares/lvgl/src/font/freetype/lv_ftsystem.o ./Middlewares/lvgl/src/font/freetype/lv_ftsystem.su

.PHONY: clean-Middlewares-2f-lvgl-2f-src-2f-font-2f-freetype

