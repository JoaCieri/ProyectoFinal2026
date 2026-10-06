################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/debugging/test/lv_test_display.c \
../Libs/lvgl/src/debugging/test/lv_test_display_egl.c \
../Libs/lvgl/src/debugging/test/lv_test_fs.c \
../Libs/lvgl/src/debugging/test/lv_test_helpers.c \
../Libs/lvgl/src/debugging/test/lv_test_indev.c \
../Libs/lvgl/src/debugging/test/lv_test_indev_gesture.c \
../Libs/lvgl/src/debugging/test/lv_test_screenshot_compare.c 

OBJS += \
./Libs/lvgl/src/debugging/test/lv_test_display.o \
./Libs/lvgl/src/debugging/test/lv_test_display_egl.o \
./Libs/lvgl/src/debugging/test/lv_test_fs.o \
./Libs/lvgl/src/debugging/test/lv_test_helpers.o \
./Libs/lvgl/src/debugging/test/lv_test_indev.o \
./Libs/lvgl/src/debugging/test/lv_test_indev_gesture.o \
./Libs/lvgl/src/debugging/test/lv_test_screenshot_compare.o 

C_DEPS += \
./Libs/lvgl/src/debugging/test/lv_test_display.d \
./Libs/lvgl/src/debugging/test/lv_test_display_egl.d \
./Libs/lvgl/src/debugging/test/lv_test_fs.d \
./Libs/lvgl/src/debugging/test/lv_test_helpers.d \
./Libs/lvgl/src/debugging/test/lv_test_indev.d \
./Libs/lvgl/src/debugging/test/lv_test_indev_gesture.d \
./Libs/lvgl/src/debugging/test/lv_test_screenshot_compare.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/debugging/test/%.o Libs/lvgl/src/debugging/test/%.su Libs/lvgl/src/debugging/test/%.cyclo: ../Libs/lvgl/src/debugging/test/%.c Libs/lvgl/src/debugging/test/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-debugging-2f-test

clean-Libs-2f-lvgl-2f-src-2f-debugging-2f-test:
	-$(RM) ./Libs/lvgl/src/debugging/test/lv_test_display.cyclo ./Libs/lvgl/src/debugging/test/lv_test_display.d ./Libs/lvgl/src/debugging/test/lv_test_display.o ./Libs/lvgl/src/debugging/test/lv_test_display.su ./Libs/lvgl/src/debugging/test/lv_test_display_egl.cyclo ./Libs/lvgl/src/debugging/test/lv_test_display_egl.d ./Libs/lvgl/src/debugging/test/lv_test_display_egl.o ./Libs/lvgl/src/debugging/test/lv_test_display_egl.su ./Libs/lvgl/src/debugging/test/lv_test_fs.cyclo ./Libs/lvgl/src/debugging/test/lv_test_fs.d ./Libs/lvgl/src/debugging/test/lv_test_fs.o ./Libs/lvgl/src/debugging/test/lv_test_fs.su ./Libs/lvgl/src/debugging/test/lv_test_helpers.cyclo ./Libs/lvgl/src/debugging/test/lv_test_helpers.d ./Libs/lvgl/src/debugging/test/lv_test_helpers.o ./Libs/lvgl/src/debugging/test/lv_test_helpers.su ./Libs/lvgl/src/debugging/test/lv_test_indev.cyclo ./Libs/lvgl/src/debugging/test/lv_test_indev.d ./Libs/lvgl/src/debugging/test/lv_test_indev.o ./Libs/lvgl/src/debugging/test/lv_test_indev.su ./Libs/lvgl/src/debugging/test/lv_test_indev_gesture.cyclo ./Libs/lvgl/src/debugging/test/lv_test_indev_gesture.d ./Libs/lvgl/src/debugging/test/lv_test_indev_gesture.o ./Libs/lvgl/src/debugging/test/lv_test_indev_gesture.su ./Libs/lvgl/src/debugging/test/lv_test_screenshot_compare.cyclo ./Libs/lvgl/src/debugging/test/lv_test_screenshot_compare.d ./Libs/lvgl/src/debugging/test/lv_test_screenshot_compare.o ./Libs/lvgl/src/debugging/test/lv_test_screenshot_compare.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-debugging-2f-test

