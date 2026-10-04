################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl/src/indev/lv_gridnav.c \
../Middlewares/lvgl/src/indev/lv_indev.c \
../Middlewares/lvgl/src/indev/lv_indev_gesture.c \
../Middlewares/lvgl/src/indev/lv_indev_scroll.c 

OBJS += \
./Middlewares/lvgl/src/indev/lv_gridnav.o \
./Middlewares/lvgl/src/indev/lv_indev.o \
./Middlewares/lvgl/src/indev/lv_indev_gesture.o \
./Middlewares/lvgl/src/indev/lv_indev_scroll.o 

C_DEPS += \
./Middlewares/lvgl/src/indev/lv_gridnav.d \
./Middlewares/lvgl/src/indev/lv_indev.d \
./Middlewares/lvgl/src/indev/lv_indev_gesture.d \
./Middlewares/lvgl/src/indev/lv_indev_scroll.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl/src/indev/%.o Middlewares/lvgl/src/indev/%.su Middlewares/lvgl/src/indev/%.cyclo: ../Middlewares/lvgl/src/indev/%.c Middlewares/lvgl/src/indev/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl-2f-src-2f-indev

clean-Middlewares-2f-lvgl-2f-src-2f-indev:
	-$(RM) ./Middlewares/lvgl/src/indev/lv_gridnav.cyclo ./Middlewares/lvgl/src/indev/lv_gridnav.d ./Middlewares/lvgl/src/indev/lv_gridnav.o ./Middlewares/lvgl/src/indev/lv_gridnav.su ./Middlewares/lvgl/src/indev/lv_indev.cyclo ./Middlewares/lvgl/src/indev/lv_indev.d ./Middlewares/lvgl/src/indev/lv_indev.o ./Middlewares/lvgl/src/indev/lv_indev.su ./Middlewares/lvgl/src/indev/lv_indev_gesture.cyclo ./Middlewares/lvgl/src/indev/lv_indev_gesture.d ./Middlewares/lvgl/src/indev/lv_indev_gesture.o ./Middlewares/lvgl/src/indev/lv_indev_gesture.su ./Middlewares/lvgl/src/indev/lv_indev_scroll.cyclo ./Middlewares/lvgl/src/indev/lv_indev_scroll.d ./Middlewares/lvgl/src/indev/lv_indev_scroll.o ./Middlewares/lvgl/src/indev/lv_indev_scroll.su

.PHONY: clean-Middlewares-2f-lvgl-2f-src-2f-indev

