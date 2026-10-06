################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/drivers/opengles/lv_opengles_debug.c \
../Libs/lvgl/src/drivers/opengles/lv_opengles_driver.c \
../Libs/lvgl/src/drivers/opengles/lv_opengles_egl.c \
../Libs/lvgl/src/drivers/opengles/lv_opengles_glfw.c \
../Libs/lvgl/src/drivers/opengles/lv_opengles_pbuffer.c \
../Libs/lvgl/src/drivers/opengles/lv_opengles_texture.c 

OBJS += \
./Libs/lvgl/src/drivers/opengles/lv_opengles_debug.o \
./Libs/lvgl/src/drivers/opengles/lv_opengles_driver.o \
./Libs/lvgl/src/drivers/opengles/lv_opengles_egl.o \
./Libs/lvgl/src/drivers/opengles/lv_opengles_glfw.o \
./Libs/lvgl/src/drivers/opengles/lv_opengles_pbuffer.o \
./Libs/lvgl/src/drivers/opengles/lv_opengles_texture.o 

C_DEPS += \
./Libs/lvgl/src/drivers/opengles/lv_opengles_debug.d \
./Libs/lvgl/src/drivers/opengles/lv_opengles_driver.d \
./Libs/lvgl/src/drivers/opengles/lv_opengles_egl.d \
./Libs/lvgl/src/drivers/opengles/lv_opengles_glfw.d \
./Libs/lvgl/src/drivers/opengles/lv_opengles_pbuffer.d \
./Libs/lvgl/src/drivers/opengles/lv_opengles_texture.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/drivers/opengles/%.o Libs/lvgl/src/drivers/opengles/%.su Libs/lvgl/src/drivers/opengles/%.cyclo: ../Libs/lvgl/src/drivers/opengles/%.c Libs/lvgl/src/drivers/opengles/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-drivers-2f-opengles

clean-Libs-2f-lvgl-2f-src-2f-drivers-2f-opengles:
	-$(RM) ./Libs/lvgl/src/drivers/opengles/lv_opengles_debug.cyclo ./Libs/lvgl/src/drivers/opengles/lv_opengles_debug.d ./Libs/lvgl/src/drivers/opengles/lv_opengles_debug.o ./Libs/lvgl/src/drivers/opengles/lv_opengles_debug.su ./Libs/lvgl/src/drivers/opengles/lv_opengles_driver.cyclo ./Libs/lvgl/src/drivers/opengles/lv_opengles_driver.d ./Libs/lvgl/src/drivers/opengles/lv_opengles_driver.o ./Libs/lvgl/src/drivers/opengles/lv_opengles_driver.su ./Libs/lvgl/src/drivers/opengles/lv_opengles_egl.cyclo ./Libs/lvgl/src/drivers/opengles/lv_opengles_egl.d ./Libs/lvgl/src/drivers/opengles/lv_opengles_egl.o ./Libs/lvgl/src/drivers/opengles/lv_opengles_egl.su ./Libs/lvgl/src/drivers/opengles/lv_opengles_glfw.cyclo ./Libs/lvgl/src/drivers/opengles/lv_opengles_glfw.d ./Libs/lvgl/src/drivers/opengles/lv_opengles_glfw.o ./Libs/lvgl/src/drivers/opengles/lv_opengles_glfw.su ./Libs/lvgl/src/drivers/opengles/lv_opengles_pbuffer.cyclo ./Libs/lvgl/src/drivers/opengles/lv_opengles_pbuffer.d ./Libs/lvgl/src/drivers/opengles/lv_opengles_pbuffer.o ./Libs/lvgl/src/drivers/opengles/lv_opengles_pbuffer.su ./Libs/lvgl/src/drivers/opengles/lv_opengles_texture.cyclo ./Libs/lvgl/src/drivers/opengles/lv_opengles_texture.d ./Libs/lvgl/src/drivers/opengles/lv_opengles_texture.o ./Libs/lvgl/src/drivers/opengles/lv_opengles_texture.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-drivers-2f-opengles

