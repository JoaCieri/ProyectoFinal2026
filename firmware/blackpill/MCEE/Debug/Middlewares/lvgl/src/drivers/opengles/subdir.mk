################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl/src/drivers/opengles/lv_opengles_debug.c \
../Middlewares/lvgl/src/drivers/opengles/lv_opengles_driver.c \
../Middlewares/lvgl/src/drivers/opengles/lv_opengles_egl.c \
../Middlewares/lvgl/src/drivers/opengles/lv_opengles_glfw.c \
../Middlewares/lvgl/src/drivers/opengles/lv_opengles_pbuffer.c \
../Middlewares/lvgl/src/drivers/opengles/lv_opengles_texture.c 

OBJS += \
./Middlewares/lvgl/src/drivers/opengles/lv_opengles_debug.o \
./Middlewares/lvgl/src/drivers/opengles/lv_opengles_driver.o \
./Middlewares/lvgl/src/drivers/opengles/lv_opengles_egl.o \
./Middlewares/lvgl/src/drivers/opengles/lv_opengles_glfw.o \
./Middlewares/lvgl/src/drivers/opengles/lv_opengles_pbuffer.o \
./Middlewares/lvgl/src/drivers/opengles/lv_opengles_texture.o 

C_DEPS += \
./Middlewares/lvgl/src/drivers/opengles/lv_opengles_debug.d \
./Middlewares/lvgl/src/drivers/opengles/lv_opengles_driver.d \
./Middlewares/lvgl/src/drivers/opengles/lv_opengles_egl.d \
./Middlewares/lvgl/src/drivers/opengles/lv_opengles_glfw.d \
./Middlewares/lvgl/src/drivers/opengles/lv_opengles_pbuffer.d \
./Middlewares/lvgl/src/drivers/opengles/lv_opengles_texture.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl/src/drivers/opengles/%.o Middlewares/lvgl/src/drivers/opengles/%.su Middlewares/lvgl/src/drivers/opengles/%.cyclo: ../Middlewares/lvgl/src/drivers/opengles/%.c Middlewares/lvgl/src/drivers/opengles/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl-2f-src-2f-drivers-2f-opengles

clean-Middlewares-2f-lvgl-2f-src-2f-drivers-2f-opengles:
	-$(RM) ./Middlewares/lvgl/src/drivers/opengles/lv_opengles_debug.cyclo ./Middlewares/lvgl/src/drivers/opengles/lv_opengles_debug.d ./Middlewares/lvgl/src/drivers/opengles/lv_opengles_debug.o ./Middlewares/lvgl/src/drivers/opengles/lv_opengles_debug.su ./Middlewares/lvgl/src/drivers/opengles/lv_opengles_driver.cyclo ./Middlewares/lvgl/src/drivers/opengles/lv_opengles_driver.d ./Middlewares/lvgl/src/drivers/opengles/lv_opengles_driver.o ./Middlewares/lvgl/src/drivers/opengles/lv_opengles_driver.su ./Middlewares/lvgl/src/drivers/opengles/lv_opengles_egl.cyclo ./Middlewares/lvgl/src/drivers/opengles/lv_opengles_egl.d ./Middlewares/lvgl/src/drivers/opengles/lv_opengles_egl.o ./Middlewares/lvgl/src/drivers/opengles/lv_opengles_egl.su ./Middlewares/lvgl/src/drivers/opengles/lv_opengles_glfw.cyclo ./Middlewares/lvgl/src/drivers/opengles/lv_opengles_glfw.d ./Middlewares/lvgl/src/drivers/opengles/lv_opengles_glfw.o ./Middlewares/lvgl/src/drivers/opengles/lv_opengles_glfw.su ./Middlewares/lvgl/src/drivers/opengles/lv_opengles_pbuffer.cyclo ./Middlewares/lvgl/src/drivers/opengles/lv_opengles_pbuffer.d ./Middlewares/lvgl/src/drivers/opengles/lv_opengles_pbuffer.o ./Middlewares/lvgl/src/drivers/opengles/lv_opengles_pbuffer.su ./Middlewares/lvgl/src/drivers/opengles/lv_opengles_texture.cyclo ./Middlewares/lvgl/src/drivers/opengles/lv_opengles_texture.d ./Middlewares/lvgl/src/drivers/opengles/lv_opengles_texture.o ./Middlewares/lvgl/src/drivers/opengles/lv_opengles_texture.su

.PHONY: clean-Middlewares-2f-lvgl-2f-src-2f-drivers-2f-opengles

