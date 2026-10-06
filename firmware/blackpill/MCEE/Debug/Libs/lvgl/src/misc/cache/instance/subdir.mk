################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/misc/cache/instance/lv_image_cache.c \
../Libs/lvgl/src/misc/cache/instance/lv_image_header_cache.c 

OBJS += \
./Libs/lvgl/src/misc/cache/instance/lv_image_cache.o \
./Libs/lvgl/src/misc/cache/instance/lv_image_header_cache.o 

C_DEPS += \
./Libs/lvgl/src/misc/cache/instance/lv_image_cache.d \
./Libs/lvgl/src/misc/cache/instance/lv_image_header_cache.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/misc/cache/instance/%.o Libs/lvgl/src/misc/cache/instance/%.su Libs/lvgl/src/misc/cache/instance/%.cyclo: ../Libs/lvgl/src/misc/cache/instance/%.c Libs/lvgl/src/misc/cache/instance/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-misc-2f-cache-2f-instance

clean-Libs-2f-lvgl-2f-src-2f-misc-2f-cache-2f-instance:
	-$(RM) ./Libs/lvgl/src/misc/cache/instance/lv_image_cache.cyclo ./Libs/lvgl/src/misc/cache/instance/lv_image_cache.d ./Libs/lvgl/src/misc/cache/instance/lv_image_cache.o ./Libs/lvgl/src/misc/cache/instance/lv_image_cache.su ./Libs/lvgl/src/misc/cache/instance/lv_image_header_cache.cyclo ./Libs/lvgl/src/misc/cache/instance/lv_image_header_cache.d ./Libs/lvgl/src/misc/cache/instance/lv_image_header_cache.o ./Libs/lvgl/src/misc/cache/instance/lv_image_header_cache.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-misc-2f-cache-2f-instance

