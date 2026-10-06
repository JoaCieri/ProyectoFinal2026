################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/indev/lv_gridnav.c \
../Libs/lvgl/src/indev/lv_indev.c \
../Libs/lvgl/src/indev/lv_indev_gesture.c \
../Libs/lvgl/src/indev/lv_indev_scroll.c 

OBJS += \
./Libs/lvgl/src/indev/lv_gridnav.o \
./Libs/lvgl/src/indev/lv_indev.o \
./Libs/lvgl/src/indev/lv_indev_gesture.o \
./Libs/lvgl/src/indev/lv_indev_scroll.o 

C_DEPS += \
./Libs/lvgl/src/indev/lv_gridnav.d \
./Libs/lvgl/src/indev/lv_indev.d \
./Libs/lvgl/src/indev/lv_indev_gesture.d \
./Libs/lvgl/src/indev/lv_indev_scroll.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/indev/%.o Libs/lvgl/src/indev/%.su Libs/lvgl/src/indev/%.cyclo: ../Libs/lvgl/src/indev/%.c Libs/lvgl/src/indev/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-indev

clean-Libs-2f-lvgl-2f-src-2f-indev:
	-$(RM) ./Libs/lvgl/src/indev/lv_gridnav.cyclo ./Libs/lvgl/src/indev/lv_gridnav.d ./Libs/lvgl/src/indev/lv_gridnav.o ./Libs/lvgl/src/indev/lv_gridnav.su ./Libs/lvgl/src/indev/lv_indev.cyclo ./Libs/lvgl/src/indev/lv_indev.d ./Libs/lvgl/src/indev/lv_indev.o ./Libs/lvgl/src/indev/lv_indev.su ./Libs/lvgl/src/indev/lv_indev_gesture.cyclo ./Libs/lvgl/src/indev/lv_indev_gesture.d ./Libs/lvgl/src/indev/lv_indev_gesture.o ./Libs/lvgl/src/indev/lv_indev_gesture.su ./Libs/lvgl/src/indev/lv_indev_scroll.cyclo ./Libs/lvgl/src/indev/lv_indev_scroll.d ./Libs/lvgl/src/indev/lv_indev_scroll.o ./Libs/lvgl/src/indev/lv_indev_scroll.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-indev

