################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl/src/libs/nanovg/nanovg.c 

OBJS += \
./Middlewares/lvgl/src/libs/nanovg/nanovg.o 

C_DEPS += \
./Middlewares/lvgl/src/libs/nanovg/nanovg.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl/src/libs/nanovg/%.o Middlewares/lvgl/src/libs/nanovg/%.su Middlewares/lvgl/src/libs/nanovg/%.cyclo: ../Middlewares/lvgl/src/libs/nanovg/%.c Middlewares/lvgl/src/libs/nanovg/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl-2f-src-2f-libs-2f-nanovg

clean-Middlewares-2f-lvgl-2f-src-2f-libs-2f-nanovg:
	-$(RM) ./Middlewares/lvgl/src/libs/nanovg/nanovg.cyclo ./Middlewares/lvgl/src/libs/nanovg/nanovg.d ./Middlewares/lvgl/src/libs/nanovg/nanovg.o ./Middlewares/lvgl/src/libs/nanovg/nanovg.su

.PHONY: clean-Middlewares-2f-lvgl-2f-src-2f-libs-2f-nanovg

