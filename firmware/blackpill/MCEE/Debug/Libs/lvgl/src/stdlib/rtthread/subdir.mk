################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/stdlib/rtthread/lv_mem_core_rtthread.c \
../Libs/lvgl/src/stdlib/rtthread/lv_sprintf_rtthread.c \
../Libs/lvgl/src/stdlib/rtthread/lv_string_rtthread.c 

OBJS += \
./Libs/lvgl/src/stdlib/rtthread/lv_mem_core_rtthread.o \
./Libs/lvgl/src/stdlib/rtthread/lv_sprintf_rtthread.o \
./Libs/lvgl/src/stdlib/rtthread/lv_string_rtthread.o 

C_DEPS += \
./Libs/lvgl/src/stdlib/rtthread/lv_mem_core_rtthread.d \
./Libs/lvgl/src/stdlib/rtthread/lv_sprintf_rtthread.d \
./Libs/lvgl/src/stdlib/rtthread/lv_string_rtthread.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/stdlib/rtthread/%.o Libs/lvgl/src/stdlib/rtthread/%.su Libs/lvgl/src/stdlib/rtthread/%.cyclo: ../Libs/lvgl/src/stdlib/rtthread/%.c Libs/lvgl/src/stdlib/rtthread/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-stdlib-2f-rtthread

clean-Libs-2f-lvgl-2f-src-2f-stdlib-2f-rtthread:
	-$(RM) ./Libs/lvgl/src/stdlib/rtthread/lv_mem_core_rtthread.cyclo ./Libs/lvgl/src/stdlib/rtthread/lv_mem_core_rtthread.d ./Libs/lvgl/src/stdlib/rtthread/lv_mem_core_rtthread.o ./Libs/lvgl/src/stdlib/rtthread/lv_mem_core_rtthread.su ./Libs/lvgl/src/stdlib/rtthread/lv_sprintf_rtthread.cyclo ./Libs/lvgl/src/stdlib/rtthread/lv_sprintf_rtthread.d ./Libs/lvgl/src/stdlib/rtthread/lv_sprintf_rtthread.o ./Libs/lvgl/src/stdlib/rtthread/lv_sprintf_rtthread.su ./Libs/lvgl/src/stdlib/rtthread/lv_string_rtthread.cyclo ./Libs/lvgl/src/stdlib/rtthread/lv_string_rtthread.d ./Libs/lvgl/src/stdlib/rtthread/lv_string_rtthread.o ./Libs/lvgl/src/stdlib/rtthread/lv_string_rtthread.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-stdlib-2f-rtthread

