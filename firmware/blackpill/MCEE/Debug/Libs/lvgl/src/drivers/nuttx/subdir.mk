################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/drivers/nuttx/lv_nuttx_cache.c \
../Libs/lvgl/src/drivers/nuttx/lv_nuttx_entry.c \
../Libs/lvgl/src/drivers/nuttx/lv_nuttx_fbdev.c \
../Libs/lvgl/src/drivers/nuttx/lv_nuttx_image_cache.c \
../Libs/lvgl/src/drivers/nuttx/lv_nuttx_lcd.c \
../Libs/lvgl/src/drivers/nuttx/lv_nuttx_libuv.c \
../Libs/lvgl/src/drivers/nuttx/lv_nuttx_mouse.c \
../Libs/lvgl/src/drivers/nuttx/lv_nuttx_profiler.c \
../Libs/lvgl/src/drivers/nuttx/lv_nuttx_touchscreen.c 

OBJS += \
./Libs/lvgl/src/drivers/nuttx/lv_nuttx_cache.o \
./Libs/lvgl/src/drivers/nuttx/lv_nuttx_entry.o \
./Libs/lvgl/src/drivers/nuttx/lv_nuttx_fbdev.o \
./Libs/lvgl/src/drivers/nuttx/lv_nuttx_image_cache.o \
./Libs/lvgl/src/drivers/nuttx/lv_nuttx_lcd.o \
./Libs/lvgl/src/drivers/nuttx/lv_nuttx_libuv.o \
./Libs/lvgl/src/drivers/nuttx/lv_nuttx_mouse.o \
./Libs/lvgl/src/drivers/nuttx/lv_nuttx_profiler.o \
./Libs/lvgl/src/drivers/nuttx/lv_nuttx_touchscreen.o 

C_DEPS += \
./Libs/lvgl/src/drivers/nuttx/lv_nuttx_cache.d \
./Libs/lvgl/src/drivers/nuttx/lv_nuttx_entry.d \
./Libs/lvgl/src/drivers/nuttx/lv_nuttx_fbdev.d \
./Libs/lvgl/src/drivers/nuttx/lv_nuttx_image_cache.d \
./Libs/lvgl/src/drivers/nuttx/lv_nuttx_lcd.d \
./Libs/lvgl/src/drivers/nuttx/lv_nuttx_libuv.d \
./Libs/lvgl/src/drivers/nuttx/lv_nuttx_mouse.d \
./Libs/lvgl/src/drivers/nuttx/lv_nuttx_profiler.d \
./Libs/lvgl/src/drivers/nuttx/lv_nuttx_touchscreen.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/drivers/nuttx/%.o Libs/lvgl/src/drivers/nuttx/%.su Libs/lvgl/src/drivers/nuttx/%.cyclo: ../Libs/lvgl/src/drivers/nuttx/%.c Libs/lvgl/src/drivers/nuttx/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-drivers-2f-nuttx

clean-Libs-2f-lvgl-2f-src-2f-drivers-2f-nuttx:
	-$(RM) ./Libs/lvgl/src/drivers/nuttx/lv_nuttx_cache.cyclo ./Libs/lvgl/src/drivers/nuttx/lv_nuttx_cache.d ./Libs/lvgl/src/drivers/nuttx/lv_nuttx_cache.o ./Libs/lvgl/src/drivers/nuttx/lv_nuttx_cache.su ./Libs/lvgl/src/drivers/nuttx/lv_nuttx_entry.cyclo ./Libs/lvgl/src/drivers/nuttx/lv_nuttx_entry.d ./Libs/lvgl/src/drivers/nuttx/lv_nuttx_entry.o ./Libs/lvgl/src/drivers/nuttx/lv_nuttx_entry.su ./Libs/lvgl/src/drivers/nuttx/lv_nuttx_fbdev.cyclo ./Libs/lvgl/src/drivers/nuttx/lv_nuttx_fbdev.d ./Libs/lvgl/src/drivers/nuttx/lv_nuttx_fbdev.o ./Libs/lvgl/src/drivers/nuttx/lv_nuttx_fbdev.su ./Libs/lvgl/src/drivers/nuttx/lv_nuttx_image_cache.cyclo ./Libs/lvgl/src/drivers/nuttx/lv_nuttx_image_cache.d ./Libs/lvgl/src/drivers/nuttx/lv_nuttx_image_cache.o ./Libs/lvgl/src/drivers/nuttx/lv_nuttx_image_cache.su ./Libs/lvgl/src/drivers/nuttx/lv_nuttx_lcd.cyclo ./Libs/lvgl/src/drivers/nuttx/lv_nuttx_lcd.d ./Libs/lvgl/src/drivers/nuttx/lv_nuttx_lcd.o ./Libs/lvgl/src/drivers/nuttx/lv_nuttx_lcd.su ./Libs/lvgl/src/drivers/nuttx/lv_nuttx_libuv.cyclo ./Libs/lvgl/src/drivers/nuttx/lv_nuttx_libuv.d ./Libs/lvgl/src/drivers/nuttx/lv_nuttx_libuv.o ./Libs/lvgl/src/drivers/nuttx/lv_nuttx_libuv.su ./Libs/lvgl/src/drivers/nuttx/lv_nuttx_mouse.cyclo ./Libs/lvgl/src/drivers/nuttx/lv_nuttx_mouse.d ./Libs/lvgl/src/drivers/nuttx/lv_nuttx_mouse.o ./Libs/lvgl/src/drivers/nuttx/lv_nuttx_mouse.su ./Libs/lvgl/src/drivers/nuttx/lv_nuttx_profiler.cyclo ./Libs/lvgl/src/drivers/nuttx/lv_nuttx_profiler.d ./Libs/lvgl/src/drivers/nuttx/lv_nuttx_profiler.o ./Libs/lvgl/src/drivers/nuttx/lv_nuttx_profiler.su ./Libs/lvgl/src/drivers/nuttx/lv_nuttx_touchscreen.cyclo ./Libs/lvgl/src/drivers/nuttx/lv_nuttx_touchscreen.d ./Libs/lvgl/src/drivers/nuttx/lv_nuttx_touchscreen.o ./Libs/lvgl/src/drivers/nuttx/lv_nuttx_touchscreen.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-drivers-2f-nuttx

