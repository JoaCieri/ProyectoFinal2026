################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite.c \
../Libs/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_image.c \
../Libs/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_matrix.c \
../Libs/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_path.c \
../Libs/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_stroke.c 

OBJS += \
./Libs/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite.o \
./Libs/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_image.o \
./Libs/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_matrix.o \
./Libs/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_path.o \
./Libs/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_stroke.o 

C_DEPS += \
./Libs/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite.d \
./Libs/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_image.d \
./Libs/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_matrix.d \
./Libs/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_path.d \
./Libs/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_stroke.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/libs/vg_lite_driver/VGLite/%.o Libs/lvgl/src/libs/vg_lite_driver/VGLite/%.su Libs/lvgl/src/libs/vg_lite_driver/VGLite/%.cyclo: ../Libs/lvgl/src/libs/vg_lite_driver/VGLite/%.c Libs/lvgl/src/libs/vg_lite_driver/VGLite/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-libs-2f-vg_lite_driver-2f-VGLite

clean-Libs-2f-lvgl-2f-src-2f-libs-2f-vg_lite_driver-2f-VGLite:
	-$(RM) ./Libs/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite.cyclo ./Libs/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite.d ./Libs/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite.o ./Libs/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite.su ./Libs/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_image.cyclo ./Libs/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_image.d ./Libs/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_image.o ./Libs/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_image.su ./Libs/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_matrix.cyclo ./Libs/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_matrix.d ./Libs/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_matrix.o ./Libs/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_matrix.su ./Libs/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_path.cyclo ./Libs/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_path.d ./Libs/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_path.o ./Libs/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_path.su ./Libs/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_stroke.cyclo ./Libs/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_stroke.d ./Libs/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_stroke.o ./Libs/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_stroke.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-libs-2f-vg_lite_driver-2f-VGLite

