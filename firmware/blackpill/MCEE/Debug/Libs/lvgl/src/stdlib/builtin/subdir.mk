################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/stdlib/builtin/lv_mem_core_builtin.c \
../Libs/lvgl/src/stdlib/builtin/lv_sprintf_builtin.c \
../Libs/lvgl/src/stdlib/builtin/lv_string_builtin.c \
../Libs/lvgl/src/stdlib/builtin/lv_tlsf.c 

OBJS += \
./Libs/lvgl/src/stdlib/builtin/lv_mem_core_builtin.o \
./Libs/lvgl/src/stdlib/builtin/lv_sprintf_builtin.o \
./Libs/lvgl/src/stdlib/builtin/lv_string_builtin.o \
./Libs/lvgl/src/stdlib/builtin/lv_tlsf.o 

C_DEPS += \
./Libs/lvgl/src/stdlib/builtin/lv_mem_core_builtin.d \
./Libs/lvgl/src/stdlib/builtin/lv_sprintf_builtin.d \
./Libs/lvgl/src/stdlib/builtin/lv_string_builtin.d \
./Libs/lvgl/src/stdlib/builtin/lv_tlsf.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/stdlib/builtin/%.o Libs/lvgl/src/stdlib/builtin/%.su Libs/lvgl/src/stdlib/builtin/%.cyclo: ../Libs/lvgl/src/stdlib/builtin/%.c Libs/lvgl/src/stdlib/builtin/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-stdlib-2f-builtin

clean-Libs-2f-lvgl-2f-src-2f-stdlib-2f-builtin:
	-$(RM) ./Libs/lvgl/src/stdlib/builtin/lv_mem_core_builtin.cyclo ./Libs/lvgl/src/stdlib/builtin/lv_mem_core_builtin.d ./Libs/lvgl/src/stdlib/builtin/lv_mem_core_builtin.o ./Libs/lvgl/src/stdlib/builtin/lv_mem_core_builtin.su ./Libs/lvgl/src/stdlib/builtin/lv_sprintf_builtin.cyclo ./Libs/lvgl/src/stdlib/builtin/lv_sprintf_builtin.d ./Libs/lvgl/src/stdlib/builtin/lv_sprintf_builtin.o ./Libs/lvgl/src/stdlib/builtin/lv_sprintf_builtin.su ./Libs/lvgl/src/stdlib/builtin/lv_string_builtin.cyclo ./Libs/lvgl/src/stdlib/builtin/lv_string_builtin.d ./Libs/lvgl/src/stdlib/builtin/lv_string_builtin.o ./Libs/lvgl/src/stdlib/builtin/lv_string_builtin.su ./Libs/lvgl/src/stdlib/builtin/lv_tlsf.cyclo ./Libs/lvgl/src/stdlib/builtin/lv_tlsf.d ./Libs/lvgl/src/stdlib/builtin/lv_tlsf.o ./Libs/lvgl/src/stdlib/builtin/lv_tlsf.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-stdlib-2f-builtin

