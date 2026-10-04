################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl/src/libs/gif/gif.c 

OBJS += \
./Middlewares/lvgl/src/libs/gif/gif.o 

C_DEPS += \
./Middlewares/lvgl/src/libs/gif/gif.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl/src/libs/gif/%.o Middlewares/lvgl/src/libs/gif/%.su Middlewares/lvgl/src/libs/gif/%.cyclo: ../Middlewares/lvgl/src/libs/gif/%.c Middlewares/lvgl/src/libs/gif/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl-2f-src-2f-libs-2f-gif

clean-Middlewares-2f-lvgl-2f-src-2f-libs-2f-gif:
	-$(RM) ./Middlewares/lvgl/src/libs/gif/gif.cyclo ./Middlewares/lvgl/src/libs/gif/gif.d ./Middlewares/lvgl/src/libs/gif/gif.o ./Middlewares/lvgl/src/libs/gif/gif.su

.PHONY: clean-Middlewares-2f-lvgl-2f-src-2f-libs-2f-gif

