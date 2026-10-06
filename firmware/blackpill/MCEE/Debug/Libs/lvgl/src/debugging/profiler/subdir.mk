################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/debugging/profiler/lv_profiler_builtin.c \
../Libs/lvgl/src/debugging/profiler/lv_profiler_builtin_posix.c 

OBJS += \
./Libs/lvgl/src/debugging/profiler/lv_profiler_builtin.o \
./Libs/lvgl/src/debugging/profiler/lv_profiler_builtin_posix.o 

C_DEPS += \
./Libs/lvgl/src/debugging/profiler/lv_profiler_builtin.d \
./Libs/lvgl/src/debugging/profiler/lv_profiler_builtin_posix.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/debugging/profiler/%.o Libs/lvgl/src/debugging/profiler/%.su Libs/lvgl/src/debugging/profiler/%.cyclo: ../Libs/lvgl/src/debugging/profiler/%.c Libs/lvgl/src/debugging/profiler/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-debugging-2f-profiler

clean-Libs-2f-lvgl-2f-src-2f-debugging-2f-profiler:
	-$(RM) ./Libs/lvgl/src/debugging/profiler/lv_profiler_builtin.cyclo ./Libs/lvgl/src/debugging/profiler/lv_profiler_builtin.d ./Libs/lvgl/src/debugging/profiler/lv_profiler_builtin.o ./Libs/lvgl/src/debugging/profiler/lv_profiler_builtin.su ./Libs/lvgl/src/debugging/profiler/lv_profiler_builtin_posix.cyclo ./Libs/lvgl/src/debugging/profiler/lv_profiler_builtin_posix.d ./Libs/lvgl/src/debugging/profiler/lv_profiler_builtin_posix.o ./Libs/lvgl/src/debugging/profiler/lv_profiler_builtin_posix.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-debugging-2f-profiler

