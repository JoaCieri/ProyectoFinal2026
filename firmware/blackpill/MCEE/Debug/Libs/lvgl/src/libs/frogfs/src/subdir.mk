################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/libs/frogfs/src/decomp_raw.c \
../Libs/lvgl/src/libs/frogfs/src/frogfs.c 

OBJS += \
./Libs/lvgl/src/libs/frogfs/src/decomp_raw.o \
./Libs/lvgl/src/libs/frogfs/src/frogfs.o 

C_DEPS += \
./Libs/lvgl/src/libs/frogfs/src/decomp_raw.d \
./Libs/lvgl/src/libs/frogfs/src/frogfs.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/libs/frogfs/src/%.o Libs/lvgl/src/libs/frogfs/src/%.su Libs/lvgl/src/libs/frogfs/src/%.cyclo: ../Libs/lvgl/src/libs/frogfs/src/%.c Libs/lvgl/src/libs/frogfs/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-libs-2f-frogfs-2f-src

clean-Libs-2f-lvgl-2f-src-2f-libs-2f-frogfs-2f-src:
	-$(RM) ./Libs/lvgl/src/libs/frogfs/src/decomp_raw.cyclo ./Libs/lvgl/src/libs/frogfs/src/decomp_raw.d ./Libs/lvgl/src/libs/frogfs/src/decomp_raw.o ./Libs/lvgl/src/libs/frogfs/src/decomp_raw.su ./Libs/lvgl/src/libs/frogfs/src/frogfs.cyclo ./Libs/lvgl/src/libs/frogfs/src/frogfs.d ./Libs/lvgl/src/libs/frogfs/src/frogfs.o ./Libs/lvgl/src/libs/frogfs/src/frogfs.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-libs-2f-frogfs-2f-src

