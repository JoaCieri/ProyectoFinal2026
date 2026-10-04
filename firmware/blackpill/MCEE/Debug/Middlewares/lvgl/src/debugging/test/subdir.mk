################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl/src/debugging/test/lv_test_display.c \
../Middlewares/lvgl/src/debugging/test/lv_test_display_egl.c \
../Middlewares/lvgl/src/debugging/test/lv_test_fs.c \
../Middlewares/lvgl/src/debugging/test/lv_test_helpers.c \
../Middlewares/lvgl/src/debugging/test/lv_test_indev.c \
../Middlewares/lvgl/src/debugging/test/lv_test_indev_gesture.c \
../Middlewares/lvgl/src/debugging/test/lv_test_screenshot_compare.c 

OBJS += \
./Middlewares/lvgl/src/debugging/test/lv_test_display.o \
./Middlewares/lvgl/src/debugging/test/lv_test_display_egl.o \
./Middlewares/lvgl/src/debugging/test/lv_test_fs.o \
./Middlewares/lvgl/src/debugging/test/lv_test_helpers.o \
./Middlewares/lvgl/src/debugging/test/lv_test_indev.o \
./Middlewares/lvgl/src/debugging/test/lv_test_indev_gesture.o \
./Middlewares/lvgl/src/debugging/test/lv_test_screenshot_compare.o 

C_DEPS += \
./Middlewares/lvgl/src/debugging/test/lv_test_display.d \
./Middlewares/lvgl/src/debugging/test/lv_test_display_egl.d \
./Middlewares/lvgl/src/debugging/test/lv_test_fs.d \
./Middlewares/lvgl/src/debugging/test/lv_test_helpers.d \
./Middlewares/lvgl/src/debugging/test/lv_test_indev.d \
./Middlewares/lvgl/src/debugging/test/lv_test_indev_gesture.d \
./Middlewares/lvgl/src/debugging/test/lv_test_screenshot_compare.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl/src/debugging/test/%.o Middlewares/lvgl/src/debugging/test/%.su Middlewares/lvgl/src/debugging/test/%.cyclo: ../Middlewares/lvgl/src/debugging/test/%.c Middlewares/lvgl/src/debugging/test/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl-2f-src-2f-debugging-2f-test

clean-Middlewares-2f-lvgl-2f-src-2f-debugging-2f-test:
	-$(RM) ./Middlewares/lvgl/src/debugging/test/lv_test_display.cyclo ./Middlewares/lvgl/src/debugging/test/lv_test_display.d ./Middlewares/lvgl/src/debugging/test/lv_test_display.o ./Middlewares/lvgl/src/debugging/test/lv_test_display.su ./Middlewares/lvgl/src/debugging/test/lv_test_display_egl.cyclo ./Middlewares/lvgl/src/debugging/test/lv_test_display_egl.d ./Middlewares/lvgl/src/debugging/test/lv_test_display_egl.o ./Middlewares/lvgl/src/debugging/test/lv_test_display_egl.su ./Middlewares/lvgl/src/debugging/test/lv_test_fs.cyclo ./Middlewares/lvgl/src/debugging/test/lv_test_fs.d ./Middlewares/lvgl/src/debugging/test/lv_test_fs.o ./Middlewares/lvgl/src/debugging/test/lv_test_fs.su ./Middlewares/lvgl/src/debugging/test/lv_test_helpers.cyclo ./Middlewares/lvgl/src/debugging/test/lv_test_helpers.d ./Middlewares/lvgl/src/debugging/test/lv_test_helpers.o ./Middlewares/lvgl/src/debugging/test/lv_test_helpers.su ./Middlewares/lvgl/src/debugging/test/lv_test_indev.cyclo ./Middlewares/lvgl/src/debugging/test/lv_test_indev.d ./Middlewares/lvgl/src/debugging/test/lv_test_indev.o ./Middlewares/lvgl/src/debugging/test/lv_test_indev.su ./Middlewares/lvgl/src/debugging/test/lv_test_indev_gesture.cyclo ./Middlewares/lvgl/src/debugging/test/lv_test_indev_gesture.d ./Middlewares/lvgl/src/debugging/test/lv_test_indev_gesture.o ./Middlewares/lvgl/src/debugging/test/lv_test_indev_gesture.su ./Middlewares/lvgl/src/debugging/test/lv_test_screenshot_compare.cyclo ./Middlewares/lvgl/src/debugging/test/lv_test_screenshot_compare.d ./Middlewares/lvgl/src/debugging/test/lv_test_screenshot_compare.o ./Middlewares/lvgl/src/debugging/test/lv_test_screenshot_compare.su

.PHONY: clean-Middlewares-2f-lvgl-2f-src-2f-debugging-2f-test

