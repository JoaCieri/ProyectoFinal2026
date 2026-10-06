################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/fs/lv_fs.c \
../Libs/lvgl/src/fs/lv_fs_fatfs.c \
../Libs/lvgl/src/fs/lv_fs_frogfs.c \
../Libs/lvgl/src/fs/lv_fs_littlefs.c \
../Libs/lvgl/src/fs/lv_fs_memfs.c \
../Libs/lvgl/src/fs/lv_fs_posix.c \
../Libs/lvgl/src/fs/lv_fs_stdio.c \
../Libs/lvgl/src/fs/lv_fs_uefi.c \
../Libs/lvgl/src/fs/lv_fs_win32.c 

OBJS += \
./Libs/lvgl/src/fs/lv_fs.o \
./Libs/lvgl/src/fs/lv_fs_fatfs.o \
./Libs/lvgl/src/fs/lv_fs_frogfs.o \
./Libs/lvgl/src/fs/lv_fs_littlefs.o \
./Libs/lvgl/src/fs/lv_fs_memfs.o \
./Libs/lvgl/src/fs/lv_fs_posix.o \
./Libs/lvgl/src/fs/lv_fs_stdio.o \
./Libs/lvgl/src/fs/lv_fs_uefi.o \
./Libs/lvgl/src/fs/lv_fs_win32.o 

C_DEPS += \
./Libs/lvgl/src/fs/lv_fs.d \
./Libs/lvgl/src/fs/lv_fs_fatfs.d \
./Libs/lvgl/src/fs/lv_fs_frogfs.d \
./Libs/lvgl/src/fs/lv_fs_littlefs.d \
./Libs/lvgl/src/fs/lv_fs_memfs.d \
./Libs/lvgl/src/fs/lv_fs_posix.d \
./Libs/lvgl/src/fs/lv_fs_stdio.d \
./Libs/lvgl/src/fs/lv_fs_uefi.d \
./Libs/lvgl/src/fs/lv_fs_win32.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/fs/%.o Libs/lvgl/src/fs/%.su Libs/lvgl/src/fs/%.cyclo: ../Libs/lvgl/src/fs/%.c Libs/lvgl/src/fs/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-fs

clean-Libs-2f-lvgl-2f-src-2f-fs:
	-$(RM) ./Libs/lvgl/src/fs/lv_fs.cyclo ./Libs/lvgl/src/fs/lv_fs.d ./Libs/lvgl/src/fs/lv_fs.o ./Libs/lvgl/src/fs/lv_fs.su ./Libs/lvgl/src/fs/lv_fs_fatfs.cyclo ./Libs/lvgl/src/fs/lv_fs_fatfs.d ./Libs/lvgl/src/fs/lv_fs_fatfs.o ./Libs/lvgl/src/fs/lv_fs_fatfs.su ./Libs/lvgl/src/fs/lv_fs_frogfs.cyclo ./Libs/lvgl/src/fs/lv_fs_frogfs.d ./Libs/lvgl/src/fs/lv_fs_frogfs.o ./Libs/lvgl/src/fs/lv_fs_frogfs.su ./Libs/lvgl/src/fs/lv_fs_littlefs.cyclo ./Libs/lvgl/src/fs/lv_fs_littlefs.d ./Libs/lvgl/src/fs/lv_fs_littlefs.o ./Libs/lvgl/src/fs/lv_fs_littlefs.su ./Libs/lvgl/src/fs/lv_fs_memfs.cyclo ./Libs/lvgl/src/fs/lv_fs_memfs.d ./Libs/lvgl/src/fs/lv_fs_memfs.o ./Libs/lvgl/src/fs/lv_fs_memfs.su ./Libs/lvgl/src/fs/lv_fs_posix.cyclo ./Libs/lvgl/src/fs/lv_fs_posix.d ./Libs/lvgl/src/fs/lv_fs_posix.o ./Libs/lvgl/src/fs/lv_fs_posix.su ./Libs/lvgl/src/fs/lv_fs_stdio.cyclo ./Libs/lvgl/src/fs/lv_fs_stdio.d ./Libs/lvgl/src/fs/lv_fs_stdio.o ./Libs/lvgl/src/fs/lv_fs_stdio.su ./Libs/lvgl/src/fs/lv_fs_uefi.cyclo ./Libs/lvgl/src/fs/lv_fs_uefi.d ./Libs/lvgl/src/fs/lv_fs_uefi.o ./Libs/lvgl/src/fs/lv_fs_uefi.su ./Libs/lvgl/src/fs/lv_fs_win32.cyclo ./Libs/lvgl/src/fs/lv_fs_win32.d ./Libs/lvgl/src/fs/lv_fs_win32.o ./Libs/lvgl/src/fs/lv_fs_win32.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-fs

