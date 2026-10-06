################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/image/lv_bin_decoder.c \
../Libs/lvgl/src/image/lv_bmp.c \
../Libs/lvgl/src/image/lv_image_decoder.c \
../Libs/lvgl/src/image/lv_libjpeg_turbo.c \
../Libs/lvgl/src/image/lv_libpng.c \
../Libs/lvgl/src/image/lv_libwebp.c \
../Libs/lvgl/src/image/lv_lodepng.c \
../Libs/lvgl/src/image/lv_tjpgd.c 

OBJS += \
./Libs/lvgl/src/image/lv_bin_decoder.o \
./Libs/lvgl/src/image/lv_bmp.o \
./Libs/lvgl/src/image/lv_image_decoder.o \
./Libs/lvgl/src/image/lv_libjpeg_turbo.o \
./Libs/lvgl/src/image/lv_libpng.o \
./Libs/lvgl/src/image/lv_libwebp.o \
./Libs/lvgl/src/image/lv_lodepng.o \
./Libs/lvgl/src/image/lv_tjpgd.o 

C_DEPS += \
./Libs/lvgl/src/image/lv_bin_decoder.d \
./Libs/lvgl/src/image/lv_bmp.d \
./Libs/lvgl/src/image/lv_image_decoder.d \
./Libs/lvgl/src/image/lv_libjpeg_turbo.d \
./Libs/lvgl/src/image/lv_libpng.d \
./Libs/lvgl/src/image/lv_libwebp.d \
./Libs/lvgl/src/image/lv_lodepng.d \
./Libs/lvgl/src/image/lv_tjpgd.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/image/%.o Libs/lvgl/src/image/%.su Libs/lvgl/src/image/%.cyclo: ../Libs/lvgl/src/image/%.c Libs/lvgl/src/image/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-image

clean-Libs-2f-lvgl-2f-src-2f-image:
	-$(RM) ./Libs/lvgl/src/image/lv_bin_decoder.cyclo ./Libs/lvgl/src/image/lv_bin_decoder.d ./Libs/lvgl/src/image/lv_bin_decoder.o ./Libs/lvgl/src/image/lv_bin_decoder.su ./Libs/lvgl/src/image/lv_bmp.cyclo ./Libs/lvgl/src/image/lv_bmp.d ./Libs/lvgl/src/image/lv_bmp.o ./Libs/lvgl/src/image/lv_bmp.su ./Libs/lvgl/src/image/lv_image_decoder.cyclo ./Libs/lvgl/src/image/lv_image_decoder.d ./Libs/lvgl/src/image/lv_image_decoder.o ./Libs/lvgl/src/image/lv_image_decoder.su ./Libs/lvgl/src/image/lv_libjpeg_turbo.cyclo ./Libs/lvgl/src/image/lv_libjpeg_turbo.d ./Libs/lvgl/src/image/lv_libjpeg_turbo.o ./Libs/lvgl/src/image/lv_libjpeg_turbo.su ./Libs/lvgl/src/image/lv_libpng.cyclo ./Libs/lvgl/src/image/lv_libpng.d ./Libs/lvgl/src/image/lv_libpng.o ./Libs/lvgl/src/image/lv_libpng.su ./Libs/lvgl/src/image/lv_libwebp.cyclo ./Libs/lvgl/src/image/lv_libwebp.d ./Libs/lvgl/src/image/lv_libwebp.o ./Libs/lvgl/src/image/lv_libwebp.su ./Libs/lvgl/src/image/lv_lodepng.cyclo ./Libs/lvgl/src/image/lv_lodepng.d ./Libs/lvgl/src/image/lv_lodepng.o ./Libs/lvgl/src/image/lv_lodepng.su ./Libs/lvgl/src/image/lv_tjpgd.cyclo ./Libs/lvgl/src/image/lv_tjpgd.d ./Libs/lvgl/src/image/lv_tjpgd.o ./Libs/lvgl/src/image/lv_tjpgd.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-image

