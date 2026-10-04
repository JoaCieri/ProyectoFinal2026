################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl/src/image/lv_bin_decoder.c \
../Middlewares/lvgl/src/image/lv_bmp.c \
../Middlewares/lvgl/src/image/lv_image_decoder.c \
../Middlewares/lvgl/src/image/lv_libjpeg_turbo.c \
../Middlewares/lvgl/src/image/lv_libpng.c \
../Middlewares/lvgl/src/image/lv_libwebp.c \
../Middlewares/lvgl/src/image/lv_lodepng.c \
../Middlewares/lvgl/src/image/lv_tjpgd.c 

OBJS += \
./Middlewares/lvgl/src/image/lv_bin_decoder.o \
./Middlewares/lvgl/src/image/lv_bmp.o \
./Middlewares/lvgl/src/image/lv_image_decoder.o \
./Middlewares/lvgl/src/image/lv_libjpeg_turbo.o \
./Middlewares/lvgl/src/image/lv_libpng.o \
./Middlewares/lvgl/src/image/lv_libwebp.o \
./Middlewares/lvgl/src/image/lv_lodepng.o \
./Middlewares/lvgl/src/image/lv_tjpgd.o 

C_DEPS += \
./Middlewares/lvgl/src/image/lv_bin_decoder.d \
./Middlewares/lvgl/src/image/lv_bmp.d \
./Middlewares/lvgl/src/image/lv_image_decoder.d \
./Middlewares/lvgl/src/image/lv_libjpeg_turbo.d \
./Middlewares/lvgl/src/image/lv_libpng.d \
./Middlewares/lvgl/src/image/lv_libwebp.d \
./Middlewares/lvgl/src/image/lv_lodepng.d \
./Middlewares/lvgl/src/image/lv_tjpgd.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl/src/image/%.o Middlewares/lvgl/src/image/%.su Middlewares/lvgl/src/image/%.cyclo: ../Middlewares/lvgl/src/image/%.c Middlewares/lvgl/src/image/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl-2f-src-2f-image

clean-Middlewares-2f-lvgl-2f-src-2f-image:
	-$(RM) ./Middlewares/lvgl/src/image/lv_bin_decoder.cyclo ./Middlewares/lvgl/src/image/lv_bin_decoder.d ./Middlewares/lvgl/src/image/lv_bin_decoder.o ./Middlewares/lvgl/src/image/lv_bin_decoder.su ./Middlewares/lvgl/src/image/lv_bmp.cyclo ./Middlewares/lvgl/src/image/lv_bmp.d ./Middlewares/lvgl/src/image/lv_bmp.o ./Middlewares/lvgl/src/image/lv_bmp.su ./Middlewares/lvgl/src/image/lv_image_decoder.cyclo ./Middlewares/lvgl/src/image/lv_image_decoder.d ./Middlewares/lvgl/src/image/lv_image_decoder.o ./Middlewares/lvgl/src/image/lv_image_decoder.su ./Middlewares/lvgl/src/image/lv_libjpeg_turbo.cyclo ./Middlewares/lvgl/src/image/lv_libjpeg_turbo.d ./Middlewares/lvgl/src/image/lv_libjpeg_turbo.o ./Middlewares/lvgl/src/image/lv_libjpeg_turbo.su ./Middlewares/lvgl/src/image/lv_libpng.cyclo ./Middlewares/lvgl/src/image/lv_libpng.d ./Middlewares/lvgl/src/image/lv_libpng.o ./Middlewares/lvgl/src/image/lv_libpng.su ./Middlewares/lvgl/src/image/lv_libwebp.cyclo ./Middlewares/lvgl/src/image/lv_libwebp.d ./Middlewares/lvgl/src/image/lv_libwebp.o ./Middlewares/lvgl/src/image/lv_libwebp.su ./Middlewares/lvgl/src/image/lv_lodepng.cyclo ./Middlewares/lvgl/src/image/lv_lodepng.d ./Middlewares/lvgl/src/image/lv_lodepng.o ./Middlewares/lvgl/src/image/lv_lodepng.su ./Middlewares/lvgl/src/image/lv_tjpgd.cyclo ./Middlewares/lvgl/src/image/lv_tjpgd.d ./Middlewares/lvgl/src/image/lv_tjpgd.o ./Middlewares/lvgl/src/image/lv_tjpgd.su

.PHONY: clean-Middlewares-2f-lvgl-2f-src-2f-image

