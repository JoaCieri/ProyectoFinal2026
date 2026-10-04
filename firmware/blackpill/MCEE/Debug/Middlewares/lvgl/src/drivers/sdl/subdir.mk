################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl/src/drivers/sdl/lv_sdl_egl.c \
../Middlewares/lvgl/src/drivers/sdl/lv_sdl_keyboard.c \
../Middlewares/lvgl/src/drivers/sdl/lv_sdl_mouse.c \
../Middlewares/lvgl/src/drivers/sdl/lv_sdl_mousewheel.c \
../Middlewares/lvgl/src/drivers/sdl/lv_sdl_sw.c \
../Middlewares/lvgl/src/drivers/sdl/lv_sdl_texture.c \
../Middlewares/lvgl/src/drivers/sdl/lv_sdl_window.c 

OBJS += \
./Middlewares/lvgl/src/drivers/sdl/lv_sdl_egl.o \
./Middlewares/lvgl/src/drivers/sdl/lv_sdl_keyboard.o \
./Middlewares/lvgl/src/drivers/sdl/lv_sdl_mouse.o \
./Middlewares/lvgl/src/drivers/sdl/lv_sdl_mousewheel.o \
./Middlewares/lvgl/src/drivers/sdl/lv_sdl_sw.o \
./Middlewares/lvgl/src/drivers/sdl/lv_sdl_texture.o \
./Middlewares/lvgl/src/drivers/sdl/lv_sdl_window.o 

C_DEPS += \
./Middlewares/lvgl/src/drivers/sdl/lv_sdl_egl.d \
./Middlewares/lvgl/src/drivers/sdl/lv_sdl_keyboard.d \
./Middlewares/lvgl/src/drivers/sdl/lv_sdl_mouse.d \
./Middlewares/lvgl/src/drivers/sdl/lv_sdl_mousewheel.d \
./Middlewares/lvgl/src/drivers/sdl/lv_sdl_sw.d \
./Middlewares/lvgl/src/drivers/sdl/lv_sdl_texture.d \
./Middlewares/lvgl/src/drivers/sdl/lv_sdl_window.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl/src/drivers/sdl/%.o Middlewares/lvgl/src/drivers/sdl/%.su Middlewares/lvgl/src/drivers/sdl/%.cyclo: ../Middlewares/lvgl/src/drivers/sdl/%.c Middlewares/lvgl/src/drivers/sdl/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl-2f-src-2f-drivers-2f-sdl

clean-Middlewares-2f-lvgl-2f-src-2f-drivers-2f-sdl:
	-$(RM) ./Middlewares/lvgl/src/drivers/sdl/lv_sdl_egl.cyclo ./Middlewares/lvgl/src/drivers/sdl/lv_sdl_egl.d ./Middlewares/lvgl/src/drivers/sdl/lv_sdl_egl.o ./Middlewares/lvgl/src/drivers/sdl/lv_sdl_egl.su ./Middlewares/lvgl/src/drivers/sdl/lv_sdl_keyboard.cyclo ./Middlewares/lvgl/src/drivers/sdl/lv_sdl_keyboard.d ./Middlewares/lvgl/src/drivers/sdl/lv_sdl_keyboard.o ./Middlewares/lvgl/src/drivers/sdl/lv_sdl_keyboard.su ./Middlewares/lvgl/src/drivers/sdl/lv_sdl_mouse.cyclo ./Middlewares/lvgl/src/drivers/sdl/lv_sdl_mouse.d ./Middlewares/lvgl/src/drivers/sdl/lv_sdl_mouse.o ./Middlewares/lvgl/src/drivers/sdl/lv_sdl_mouse.su ./Middlewares/lvgl/src/drivers/sdl/lv_sdl_mousewheel.cyclo ./Middlewares/lvgl/src/drivers/sdl/lv_sdl_mousewheel.d ./Middlewares/lvgl/src/drivers/sdl/lv_sdl_mousewheel.o ./Middlewares/lvgl/src/drivers/sdl/lv_sdl_mousewheel.su ./Middlewares/lvgl/src/drivers/sdl/lv_sdl_sw.cyclo ./Middlewares/lvgl/src/drivers/sdl/lv_sdl_sw.d ./Middlewares/lvgl/src/drivers/sdl/lv_sdl_sw.o ./Middlewares/lvgl/src/drivers/sdl/lv_sdl_sw.su ./Middlewares/lvgl/src/drivers/sdl/lv_sdl_texture.cyclo ./Middlewares/lvgl/src/drivers/sdl/lv_sdl_texture.d ./Middlewares/lvgl/src/drivers/sdl/lv_sdl_texture.o ./Middlewares/lvgl/src/drivers/sdl/lv_sdl_texture.su ./Middlewares/lvgl/src/drivers/sdl/lv_sdl_window.cyclo ./Middlewares/lvgl/src/drivers/sdl/lv_sdl_window.d ./Middlewares/lvgl/src/drivers/sdl/lv_sdl_window.o ./Middlewares/lvgl/src/drivers/sdl/lv_sdl_window.su

.PHONY: clean-Middlewares-2f-lvgl-2f-src-2f-drivers-2f-sdl

