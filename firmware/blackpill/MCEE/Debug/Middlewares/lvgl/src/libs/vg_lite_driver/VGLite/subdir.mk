################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite.c \
../Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_image.c \
../Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_matrix.c \
../Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_path.c \
../Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_stroke.c 

OBJS += \
./Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite.o \
./Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_image.o \
./Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_matrix.o \
./Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_path.o \
./Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_stroke.o 

C_DEPS += \
./Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite.d \
./Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_image.d \
./Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_matrix.d \
./Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_path.d \
./Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_stroke.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/%.o Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/%.su Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/%.cyclo: ../Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/%.c Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl-2f-src-2f-libs-2f-vg_lite_driver-2f-VGLite

clean-Middlewares-2f-lvgl-2f-src-2f-libs-2f-vg_lite_driver-2f-VGLite:
	-$(RM) ./Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite.cyclo ./Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite.d ./Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite.o ./Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite.su ./Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_image.cyclo ./Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_image.d ./Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_image.o ./Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_image.su ./Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_matrix.cyclo ./Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_matrix.d ./Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_matrix.o ./Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_matrix.su ./Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_path.cyclo ./Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_path.d ./Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_path.o ./Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_path.su ./Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_stroke.cyclo ./Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_stroke.d ./Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_stroke.o ./Middlewares/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_stroke.su

.PHONY: clean-Middlewares-2f-lvgl-2f-src-2f-libs-2f-vg_lite_driver-2f-VGLite

