################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/drivers/sdl/lv_sdl_egl.c \
../Libs/lvgl/src/drivers/sdl/lv_sdl_keyboard.c \
../Libs/lvgl/src/drivers/sdl/lv_sdl_mouse.c \
../Libs/lvgl/src/drivers/sdl/lv_sdl_mousewheel.c \
../Libs/lvgl/src/drivers/sdl/lv_sdl_sw.c \
../Libs/lvgl/src/drivers/sdl/lv_sdl_texture.c \
../Libs/lvgl/src/drivers/sdl/lv_sdl_window.c 

OBJS += \
./Libs/lvgl/src/drivers/sdl/lv_sdl_egl.o \
./Libs/lvgl/src/drivers/sdl/lv_sdl_keyboard.o \
./Libs/lvgl/src/drivers/sdl/lv_sdl_mouse.o \
./Libs/lvgl/src/drivers/sdl/lv_sdl_mousewheel.o \
./Libs/lvgl/src/drivers/sdl/lv_sdl_sw.o \
./Libs/lvgl/src/drivers/sdl/lv_sdl_texture.o \
./Libs/lvgl/src/drivers/sdl/lv_sdl_window.o 

C_DEPS += \
./Libs/lvgl/src/drivers/sdl/lv_sdl_egl.d \
./Libs/lvgl/src/drivers/sdl/lv_sdl_keyboard.d \
./Libs/lvgl/src/drivers/sdl/lv_sdl_mouse.d \
./Libs/lvgl/src/drivers/sdl/lv_sdl_mousewheel.d \
./Libs/lvgl/src/drivers/sdl/lv_sdl_sw.d \
./Libs/lvgl/src/drivers/sdl/lv_sdl_texture.d \
./Libs/lvgl/src/drivers/sdl/lv_sdl_window.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/drivers/sdl/%.o Libs/lvgl/src/drivers/sdl/%.su Libs/lvgl/src/drivers/sdl/%.cyclo: ../Libs/lvgl/src/drivers/sdl/%.c Libs/lvgl/src/drivers/sdl/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-drivers-2f-sdl

clean-Libs-2f-lvgl-2f-src-2f-drivers-2f-sdl:
	-$(RM) ./Libs/lvgl/src/drivers/sdl/lv_sdl_egl.cyclo ./Libs/lvgl/src/drivers/sdl/lv_sdl_egl.d ./Libs/lvgl/src/drivers/sdl/lv_sdl_egl.o ./Libs/lvgl/src/drivers/sdl/lv_sdl_egl.su ./Libs/lvgl/src/drivers/sdl/lv_sdl_keyboard.cyclo ./Libs/lvgl/src/drivers/sdl/lv_sdl_keyboard.d ./Libs/lvgl/src/drivers/sdl/lv_sdl_keyboard.o ./Libs/lvgl/src/drivers/sdl/lv_sdl_keyboard.su ./Libs/lvgl/src/drivers/sdl/lv_sdl_mouse.cyclo ./Libs/lvgl/src/drivers/sdl/lv_sdl_mouse.d ./Libs/lvgl/src/drivers/sdl/lv_sdl_mouse.o ./Libs/lvgl/src/drivers/sdl/lv_sdl_mouse.su ./Libs/lvgl/src/drivers/sdl/lv_sdl_mousewheel.cyclo ./Libs/lvgl/src/drivers/sdl/lv_sdl_mousewheel.d ./Libs/lvgl/src/drivers/sdl/lv_sdl_mousewheel.o ./Libs/lvgl/src/drivers/sdl/lv_sdl_mousewheel.su ./Libs/lvgl/src/drivers/sdl/lv_sdl_sw.cyclo ./Libs/lvgl/src/drivers/sdl/lv_sdl_sw.d ./Libs/lvgl/src/drivers/sdl/lv_sdl_sw.o ./Libs/lvgl/src/drivers/sdl/lv_sdl_sw.su ./Libs/lvgl/src/drivers/sdl/lv_sdl_texture.cyclo ./Libs/lvgl/src/drivers/sdl/lv_sdl_texture.d ./Libs/lvgl/src/drivers/sdl/lv_sdl_texture.o ./Libs/lvgl/src/drivers/sdl/lv_sdl_texture.su ./Libs/lvgl/src/drivers/sdl/lv_sdl_window.cyclo ./Libs/lvgl/src/drivers/sdl/lv_sdl_window.d ./Libs/lvgl/src/drivers/sdl/lv_sdl_window.o ./Libs/lvgl/src/drivers/sdl/lv_sdl_window.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-drivers-2f-sdl

