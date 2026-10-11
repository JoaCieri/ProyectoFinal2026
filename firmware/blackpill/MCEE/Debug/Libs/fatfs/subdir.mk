################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/fatfs/diskio.c \
../Libs/fatfs/ff.c \
../Libs/fatfs/ffsystem.c \
../Libs/fatfs/ffunicode.c 

OBJS += \
./Libs/fatfs/diskio.o \
./Libs/fatfs/ff.o \
./Libs/fatfs/ffsystem.o \
./Libs/fatfs/ffunicode.o 

C_DEPS += \
./Libs/fatfs/diskio.d \
./Libs/fatfs/ff.d \
./Libs/fatfs/ffsystem.d \
./Libs/fatfs/ffunicode.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/fatfs/%.o Libs/fatfs/%.su Libs/fatfs/%.cyclo: ../Libs/fatfs/%.c Libs/fatfs/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/fatfs" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-fatfs

clean-Libs-2f-fatfs:
	-$(RM) ./Libs/fatfs/diskio.cyclo ./Libs/fatfs/diskio.d ./Libs/fatfs/diskio.o ./Libs/fatfs/diskio.su ./Libs/fatfs/ff.cyclo ./Libs/fatfs/ff.d ./Libs/fatfs/ff.o ./Libs/fatfs/ff.su ./Libs/fatfs/ffsystem.cyclo ./Libs/fatfs/ffsystem.d ./Libs/fatfs/ffsystem.o ./Libs/fatfs/ffsystem.su ./Libs/fatfs/ffunicode.cyclo ./Libs/fatfs/ffunicode.d ./Libs/fatfs/ffunicode.o ./Libs/fatfs/ffunicode.su

.PHONY: clean-Libs-2f-fatfs

