################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl/src/image/svg/lv_svg.c \
../Middlewares/lvgl/src/image/svg/lv_svg_decoder.c \
../Middlewares/lvgl/src/image/svg/lv_svg_parser.c \
../Middlewares/lvgl/src/image/svg/lv_svg_render.c \
../Middlewares/lvgl/src/image/svg/lv_svg_token.c 

OBJS += \
./Middlewares/lvgl/src/image/svg/lv_svg.o \
./Middlewares/lvgl/src/image/svg/lv_svg_decoder.o \
./Middlewares/lvgl/src/image/svg/lv_svg_parser.o \
./Middlewares/lvgl/src/image/svg/lv_svg_render.o \
./Middlewares/lvgl/src/image/svg/lv_svg_token.o 

C_DEPS += \
./Middlewares/lvgl/src/image/svg/lv_svg.d \
./Middlewares/lvgl/src/image/svg/lv_svg_decoder.d \
./Middlewares/lvgl/src/image/svg/lv_svg_parser.d \
./Middlewares/lvgl/src/image/svg/lv_svg_render.d \
./Middlewares/lvgl/src/image/svg/lv_svg_token.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl/src/image/svg/%.o Middlewares/lvgl/src/image/svg/%.su Middlewares/lvgl/src/image/svg/%.cyclo: ../Middlewares/lvgl/src/image/svg/%.c Middlewares/lvgl/src/image/svg/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl-2f-src-2f-image-2f-svg

clean-Middlewares-2f-lvgl-2f-src-2f-image-2f-svg:
	-$(RM) ./Middlewares/lvgl/src/image/svg/lv_svg.cyclo ./Middlewares/lvgl/src/image/svg/lv_svg.d ./Middlewares/lvgl/src/image/svg/lv_svg.o ./Middlewares/lvgl/src/image/svg/lv_svg.su ./Middlewares/lvgl/src/image/svg/lv_svg_decoder.cyclo ./Middlewares/lvgl/src/image/svg/lv_svg_decoder.d ./Middlewares/lvgl/src/image/svg/lv_svg_decoder.o ./Middlewares/lvgl/src/image/svg/lv_svg_decoder.su ./Middlewares/lvgl/src/image/svg/lv_svg_parser.cyclo ./Middlewares/lvgl/src/image/svg/lv_svg_parser.d ./Middlewares/lvgl/src/image/svg/lv_svg_parser.o ./Middlewares/lvgl/src/image/svg/lv_svg_parser.su ./Middlewares/lvgl/src/image/svg/lv_svg_render.cyclo ./Middlewares/lvgl/src/image/svg/lv_svg_render.d ./Middlewares/lvgl/src/image/svg/lv_svg_render.o ./Middlewares/lvgl/src/image/svg/lv_svg_render.su ./Middlewares/lvgl/src/image/svg/lv_svg_token.cyclo ./Middlewares/lvgl/src/image/svg/lv_svg_token.d ./Middlewares/lvgl/src/image/svg/lv_svg_token.o ./Middlewares/lvgl/src/image/svg/lv_svg_token.su

.PHONY: clean-Middlewares-2f-lvgl-2f-src-2f-image-2f-svg

