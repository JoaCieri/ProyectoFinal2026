################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl/src/stdlib/clib/lv_mem_core_clib.c \
../Middlewares/lvgl/src/stdlib/clib/lv_sprintf_clib.c \
../Middlewares/lvgl/src/stdlib/clib/lv_string_clib.c 

OBJS += \
./Middlewares/lvgl/src/stdlib/clib/lv_mem_core_clib.o \
./Middlewares/lvgl/src/stdlib/clib/lv_sprintf_clib.o \
./Middlewares/lvgl/src/stdlib/clib/lv_string_clib.o 

C_DEPS += \
./Middlewares/lvgl/src/stdlib/clib/lv_mem_core_clib.d \
./Middlewares/lvgl/src/stdlib/clib/lv_sprintf_clib.d \
./Middlewares/lvgl/src/stdlib/clib/lv_string_clib.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl/src/stdlib/clib/%.o Middlewares/lvgl/src/stdlib/clib/%.su Middlewares/lvgl/src/stdlib/clib/%.cyclo: ../Middlewares/lvgl/src/stdlib/clib/%.c Middlewares/lvgl/src/stdlib/clib/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl-2f-src-2f-stdlib-2f-clib

clean-Middlewares-2f-lvgl-2f-src-2f-stdlib-2f-clib:
	-$(RM) ./Middlewares/lvgl/src/stdlib/clib/lv_mem_core_clib.cyclo ./Middlewares/lvgl/src/stdlib/clib/lv_mem_core_clib.d ./Middlewares/lvgl/src/stdlib/clib/lv_mem_core_clib.o ./Middlewares/lvgl/src/stdlib/clib/lv_mem_core_clib.su ./Middlewares/lvgl/src/stdlib/clib/lv_sprintf_clib.cyclo ./Middlewares/lvgl/src/stdlib/clib/lv_sprintf_clib.d ./Middlewares/lvgl/src/stdlib/clib/lv_sprintf_clib.o ./Middlewares/lvgl/src/stdlib/clib/lv_sprintf_clib.su ./Middlewares/lvgl/src/stdlib/clib/lv_string_clib.cyclo ./Middlewares/lvgl/src/stdlib/clib/lv_string_clib.d ./Middlewares/lvgl/src/stdlib/clib/lv_string_clib.o ./Middlewares/lvgl/src/stdlib/clib/lv_string_clib.su

.PHONY: clean-Middlewares-2f-lvgl-2f-src-2f-stdlib-2f-clib

