################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/drivers/opengles/glad/src/egl.c \
../Libs/lvgl/src/drivers/opengles/glad/src/gl.c \
../Libs/lvgl/src/drivers/opengles/glad/src/gles2.c 

OBJS += \
./Libs/lvgl/src/drivers/opengles/glad/src/egl.o \
./Libs/lvgl/src/drivers/opengles/glad/src/gl.o \
./Libs/lvgl/src/drivers/opengles/glad/src/gles2.o 

C_DEPS += \
./Libs/lvgl/src/drivers/opengles/glad/src/egl.d \
./Libs/lvgl/src/drivers/opengles/glad/src/gl.d \
./Libs/lvgl/src/drivers/opengles/glad/src/gles2.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/drivers/opengles/glad/src/%.o Libs/lvgl/src/drivers/opengles/glad/src/%.su Libs/lvgl/src/drivers/opengles/glad/src/%.cyclo: ../Libs/lvgl/src/drivers/opengles/glad/src/%.c Libs/lvgl/src/drivers/opengles/glad/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-drivers-2f-opengles-2f-glad-2f-src

clean-Libs-2f-lvgl-2f-src-2f-drivers-2f-opengles-2f-glad-2f-src:
	-$(RM) ./Libs/lvgl/src/drivers/opengles/glad/src/egl.cyclo ./Libs/lvgl/src/drivers/opengles/glad/src/egl.d ./Libs/lvgl/src/drivers/opengles/glad/src/egl.o ./Libs/lvgl/src/drivers/opengles/glad/src/egl.su ./Libs/lvgl/src/drivers/opengles/glad/src/gl.cyclo ./Libs/lvgl/src/drivers/opengles/glad/src/gl.d ./Libs/lvgl/src/drivers/opengles/glad/src/gl.o ./Libs/lvgl/src/drivers/opengles/glad/src/gl.su ./Libs/lvgl/src/drivers/opengles/glad/src/gles2.cyclo ./Libs/lvgl/src/drivers/opengles/glad/src/gles2.d ./Libs/lvgl/src/drivers/opengles/glad/src/gles2.o ./Libs/lvgl/src/drivers/opengles/glad/src/gles2.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-drivers-2f-opengles-2f-glad-2f-src

