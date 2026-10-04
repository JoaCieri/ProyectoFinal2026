################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_cache.c \
../Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_entry.c \
../Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_fbdev.c \
../Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_image_cache.c \
../Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_lcd.c \
../Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_libuv.c \
../Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_mouse.c \
../Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_profiler.c \
../Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_touchscreen.c 

OBJS += \
./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_cache.o \
./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_entry.o \
./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_fbdev.o \
./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_image_cache.o \
./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_lcd.o \
./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_libuv.o \
./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_mouse.o \
./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_profiler.o \
./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_touchscreen.o 

C_DEPS += \
./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_cache.d \
./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_entry.d \
./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_fbdev.d \
./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_image_cache.d \
./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_lcd.d \
./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_libuv.d \
./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_mouse.d \
./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_profiler.d \
./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_touchscreen.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl/src/drivers/nuttx/%.o Middlewares/lvgl/src/drivers/nuttx/%.su Middlewares/lvgl/src/drivers/nuttx/%.cyclo: ../Middlewares/lvgl/src/drivers/nuttx/%.c Middlewares/lvgl/src/drivers/nuttx/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl-2f-src-2f-drivers-2f-nuttx

clean-Middlewares-2f-lvgl-2f-src-2f-drivers-2f-nuttx:
	-$(RM) ./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_cache.cyclo ./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_cache.d ./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_cache.o ./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_cache.su ./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_entry.cyclo ./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_entry.d ./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_entry.o ./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_entry.su ./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_fbdev.cyclo ./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_fbdev.d ./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_fbdev.o ./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_fbdev.su ./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_image_cache.cyclo ./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_image_cache.d ./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_image_cache.o ./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_image_cache.su ./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_lcd.cyclo ./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_lcd.d ./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_lcd.o ./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_lcd.su ./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_libuv.cyclo ./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_libuv.d ./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_libuv.o ./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_libuv.su ./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_mouse.cyclo ./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_mouse.d ./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_mouse.o ./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_mouse.su ./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_profiler.cyclo ./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_profiler.d ./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_profiler.o ./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_profiler.su ./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_touchscreen.cyclo ./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_touchscreen.d ./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_touchscreen.o ./Middlewares/lvgl/src/drivers/nuttx/lv_nuttx_touchscreen.su

.PHONY: clean-Middlewares-2f-lvgl-2f-src-2f-drivers-2f-nuttx

