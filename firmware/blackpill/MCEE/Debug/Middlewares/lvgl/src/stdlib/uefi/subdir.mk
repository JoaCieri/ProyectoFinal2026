################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl/src/stdlib/uefi/lv_mem_core_uefi.c 

OBJS += \
./Middlewares/lvgl/src/stdlib/uefi/lv_mem_core_uefi.o 

C_DEPS += \
./Middlewares/lvgl/src/stdlib/uefi/lv_mem_core_uefi.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl/src/stdlib/uefi/%.o Middlewares/lvgl/src/stdlib/uefi/%.su Middlewares/lvgl/src/stdlib/uefi/%.cyclo: ../Middlewares/lvgl/src/stdlib/uefi/%.c Middlewares/lvgl/src/stdlib/uefi/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl-2f-src-2f-stdlib-2f-uefi

clean-Middlewares-2f-lvgl-2f-src-2f-stdlib-2f-uefi:
	-$(RM) ./Middlewares/lvgl/src/stdlib/uefi/lv_mem_core_uefi.cyclo ./Middlewares/lvgl/src/stdlib/uefi/lv_mem_core_uefi.d ./Middlewares/lvgl/src/stdlib/uefi/lv_mem_core_uefi.o ./Middlewares/lvgl/src/stdlib/uefi/lv_mem_core_uefi.su

.PHONY: clean-Middlewares-2f-lvgl-2f-src-2f-stdlib-2f-uefi

