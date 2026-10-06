################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/misc/cache/class/lv_cache_lru_ll.c \
../Libs/lvgl/src/misc/cache/class/lv_cache_lru_rb.c \
../Libs/lvgl/src/misc/cache/class/lv_cache_sc_da.c 

OBJS += \
./Libs/lvgl/src/misc/cache/class/lv_cache_lru_ll.o \
./Libs/lvgl/src/misc/cache/class/lv_cache_lru_rb.o \
./Libs/lvgl/src/misc/cache/class/lv_cache_sc_da.o 

C_DEPS += \
./Libs/lvgl/src/misc/cache/class/lv_cache_lru_ll.d \
./Libs/lvgl/src/misc/cache/class/lv_cache_lru_rb.d \
./Libs/lvgl/src/misc/cache/class/lv_cache_sc_da.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/misc/cache/class/%.o Libs/lvgl/src/misc/cache/class/%.su Libs/lvgl/src/misc/cache/class/%.cyclo: ../Libs/lvgl/src/misc/cache/class/%.c Libs/lvgl/src/misc/cache/class/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-misc-2f-cache-2f-class

clean-Libs-2f-lvgl-2f-src-2f-misc-2f-cache-2f-class:
	-$(RM) ./Libs/lvgl/src/misc/cache/class/lv_cache_lru_ll.cyclo ./Libs/lvgl/src/misc/cache/class/lv_cache_lru_ll.d ./Libs/lvgl/src/misc/cache/class/lv_cache_lru_ll.o ./Libs/lvgl/src/misc/cache/class/lv_cache_lru_ll.su ./Libs/lvgl/src/misc/cache/class/lv_cache_lru_rb.cyclo ./Libs/lvgl/src/misc/cache/class/lv_cache_lru_rb.d ./Libs/lvgl/src/misc/cache/class/lv_cache_lru_rb.o ./Libs/lvgl/src/misc/cache/class/lv_cache_lru_rb.su ./Libs/lvgl/src/misc/cache/class/lv_cache_sc_da.cyclo ./Libs/lvgl/src/misc/cache/class/lv_cache_sc_da.d ./Libs/lvgl/src/misc/cache/class/lv_cache_sc_da.o ./Libs/lvgl/src/misc/cache/class/lv_cache_sc_da.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-misc-2f-cache-2f-class

