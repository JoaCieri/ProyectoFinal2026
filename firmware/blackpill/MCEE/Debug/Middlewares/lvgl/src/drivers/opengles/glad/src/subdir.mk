################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl/src/drivers/opengles/glad/src/egl.c \
../Middlewares/lvgl/src/drivers/opengles/glad/src/gl.c \
../Middlewares/lvgl/src/drivers/opengles/glad/src/gles2.c 

OBJS += \
./Middlewares/lvgl/src/drivers/opengles/glad/src/egl.o \
./Middlewares/lvgl/src/drivers/opengles/glad/src/gl.o \
./Middlewares/lvgl/src/drivers/opengles/glad/src/gles2.o 

C_DEPS += \
./Middlewares/lvgl/src/drivers/opengles/glad/src/egl.d \
./Middlewares/lvgl/src/drivers/opengles/glad/src/gl.d \
./Middlewares/lvgl/src/drivers/opengles/glad/src/gles2.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl/src/drivers/opengles/glad/src/%.o Middlewares/lvgl/src/drivers/opengles/glad/src/%.su Middlewares/lvgl/src/drivers/opengles/glad/src/%.cyclo: ../Middlewares/lvgl/src/drivers/opengles/glad/src/%.c Middlewares/lvgl/src/drivers/opengles/glad/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl-2f-src-2f-drivers-2f-opengles-2f-glad-2f-src

clean-Middlewares-2f-lvgl-2f-src-2f-drivers-2f-opengles-2f-glad-2f-src:
	-$(RM) ./Middlewares/lvgl/src/drivers/opengles/glad/src/egl.cyclo ./Middlewares/lvgl/src/drivers/opengles/glad/src/egl.d ./Middlewares/lvgl/src/drivers/opengles/glad/src/egl.o ./Middlewares/lvgl/src/drivers/opengles/glad/src/egl.su ./Middlewares/lvgl/src/drivers/opengles/glad/src/gl.cyclo ./Middlewares/lvgl/src/drivers/opengles/glad/src/gl.d ./Middlewares/lvgl/src/drivers/opengles/glad/src/gl.o ./Middlewares/lvgl/src/drivers/opengles/glad/src/gl.su ./Middlewares/lvgl/src/drivers/opengles/glad/src/gles2.cyclo ./Middlewares/lvgl/src/drivers/opengles/glad/src/gles2.d ./Middlewares/lvgl/src/drivers/opengles/glad/src/gles2.o ./Middlewares/lvgl/src/drivers/opengles/glad/src/gles2.su

.PHONY: clean-Middlewares-2f-lvgl-2f-src-2f-drivers-2f-opengles-2f-glad-2f-src

