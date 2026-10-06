################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/image/svg/lv_svg.c \
../Libs/lvgl/src/image/svg/lv_svg_decoder.c \
../Libs/lvgl/src/image/svg/lv_svg_parser.c \
../Libs/lvgl/src/image/svg/lv_svg_render.c \
../Libs/lvgl/src/image/svg/lv_svg_token.c 

OBJS += \
./Libs/lvgl/src/image/svg/lv_svg.o \
./Libs/lvgl/src/image/svg/lv_svg_decoder.o \
./Libs/lvgl/src/image/svg/lv_svg_parser.o \
./Libs/lvgl/src/image/svg/lv_svg_render.o \
./Libs/lvgl/src/image/svg/lv_svg_token.o 

C_DEPS += \
./Libs/lvgl/src/image/svg/lv_svg.d \
./Libs/lvgl/src/image/svg/lv_svg_decoder.d \
./Libs/lvgl/src/image/svg/lv_svg_parser.d \
./Libs/lvgl/src/image/svg/lv_svg_render.d \
./Libs/lvgl/src/image/svg/lv_svg_token.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/image/svg/%.o Libs/lvgl/src/image/svg/%.su Libs/lvgl/src/image/svg/%.cyclo: ../Libs/lvgl/src/image/svg/%.c Libs/lvgl/src/image/svg/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-image-2f-svg

clean-Libs-2f-lvgl-2f-src-2f-image-2f-svg:
	-$(RM) ./Libs/lvgl/src/image/svg/lv_svg.cyclo ./Libs/lvgl/src/image/svg/lv_svg.d ./Libs/lvgl/src/image/svg/lv_svg.o ./Libs/lvgl/src/image/svg/lv_svg.su ./Libs/lvgl/src/image/svg/lv_svg_decoder.cyclo ./Libs/lvgl/src/image/svg/lv_svg_decoder.d ./Libs/lvgl/src/image/svg/lv_svg_decoder.o ./Libs/lvgl/src/image/svg/lv_svg_decoder.su ./Libs/lvgl/src/image/svg/lv_svg_parser.cyclo ./Libs/lvgl/src/image/svg/lv_svg_parser.d ./Libs/lvgl/src/image/svg/lv_svg_parser.o ./Libs/lvgl/src/image/svg/lv_svg_parser.su ./Libs/lvgl/src/image/svg/lv_svg_render.cyclo ./Libs/lvgl/src/image/svg/lv_svg_render.d ./Libs/lvgl/src/image/svg/lv_svg_render.o ./Libs/lvgl/src/image/svg/lv_svg_render.su ./Libs/lvgl/src/image/svg/lv_svg_token.cyclo ./Libs/lvgl/src/image/svg/lv_svg_token.d ./Libs/lvgl/src/image/svg/lv_svg_token.o ./Libs/lvgl/src/image/svg/lv_svg_token.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-image-2f-svg

