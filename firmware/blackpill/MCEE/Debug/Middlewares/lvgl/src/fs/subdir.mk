################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl/src/fs/lv_fs.c \
../Middlewares/lvgl/src/fs/lv_fs_fatfs.c \
../Middlewares/lvgl/src/fs/lv_fs_frogfs.c \
../Middlewares/lvgl/src/fs/lv_fs_littlefs.c \
../Middlewares/lvgl/src/fs/lv_fs_memfs.c \
../Middlewares/lvgl/src/fs/lv_fs_posix.c \
../Middlewares/lvgl/src/fs/lv_fs_stdio.c \
../Middlewares/lvgl/src/fs/lv_fs_uefi.c \
../Middlewares/lvgl/src/fs/lv_fs_win32.c 

OBJS += \
./Middlewares/lvgl/src/fs/lv_fs.o \
./Middlewares/lvgl/src/fs/lv_fs_fatfs.o \
./Middlewares/lvgl/src/fs/lv_fs_frogfs.o \
./Middlewares/lvgl/src/fs/lv_fs_littlefs.o \
./Middlewares/lvgl/src/fs/lv_fs_memfs.o \
./Middlewares/lvgl/src/fs/lv_fs_posix.o \
./Middlewares/lvgl/src/fs/lv_fs_stdio.o \
./Middlewares/lvgl/src/fs/lv_fs_uefi.o \
./Middlewares/lvgl/src/fs/lv_fs_win32.o 

C_DEPS += \
./Middlewares/lvgl/src/fs/lv_fs.d \
./Middlewares/lvgl/src/fs/lv_fs_fatfs.d \
./Middlewares/lvgl/src/fs/lv_fs_frogfs.d \
./Middlewares/lvgl/src/fs/lv_fs_littlefs.d \
./Middlewares/lvgl/src/fs/lv_fs_memfs.d \
./Middlewares/lvgl/src/fs/lv_fs_posix.d \
./Middlewares/lvgl/src/fs/lv_fs_stdio.d \
./Middlewares/lvgl/src/fs/lv_fs_uefi.d \
./Middlewares/lvgl/src/fs/lv_fs_win32.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl/src/fs/%.o Middlewares/lvgl/src/fs/%.su Middlewares/lvgl/src/fs/%.cyclo: ../Middlewares/lvgl/src/fs/%.c Middlewares/lvgl/src/fs/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl-2f-src-2f-fs

clean-Middlewares-2f-lvgl-2f-src-2f-fs:
	-$(RM) ./Middlewares/lvgl/src/fs/lv_fs.cyclo ./Middlewares/lvgl/src/fs/lv_fs.d ./Middlewares/lvgl/src/fs/lv_fs.o ./Middlewares/lvgl/src/fs/lv_fs.su ./Middlewares/lvgl/src/fs/lv_fs_fatfs.cyclo ./Middlewares/lvgl/src/fs/lv_fs_fatfs.d ./Middlewares/lvgl/src/fs/lv_fs_fatfs.o ./Middlewares/lvgl/src/fs/lv_fs_fatfs.su ./Middlewares/lvgl/src/fs/lv_fs_frogfs.cyclo ./Middlewares/lvgl/src/fs/lv_fs_frogfs.d ./Middlewares/lvgl/src/fs/lv_fs_frogfs.o ./Middlewares/lvgl/src/fs/lv_fs_frogfs.su ./Middlewares/lvgl/src/fs/lv_fs_littlefs.cyclo ./Middlewares/lvgl/src/fs/lv_fs_littlefs.d ./Middlewares/lvgl/src/fs/lv_fs_littlefs.o ./Middlewares/lvgl/src/fs/lv_fs_littlefs.su ./Middlewares/lvgl/src/fs/lv_fs_memfs.cyclo ./Middlewares/lvgl/src/fs/lv_fs_memfs.d ./Middlewares/lvgl/src/fs/lv_fs_memfs.o ./Middlewares/lvgl/src/fs/lv_fs_memfs.su ./Middlewares/lvgl/src/fs/lv_fs_posix.cyclo ./Middlewares/lvgl/src/fs/lv_fs_posix.d ./Middlewares/lvgl/src/fs/lv_fs_posix.o ./Middlewares/lvgl/src/fs/lv_fs_posix.su ./Middlewares/lvgl/src/fs/lv_fs_stdio.cyclo ./Middlewares/lvgl/src/fs/lv_fs_stdio.d ./Middlewares/lvgl/src/fs/lv_fs_stdio.o ./Middlewares/lvgl/src/fs/lv_fs_stdio.su ./Middlewares/lvgl/src/fs/lv_fs_uefi.cyclo ./Middlewares/lvgl/src/fs/lv_fs_uefi.d ./Middlewares/lvgl/src/fs/lv_fs_uefi.o ./Middlewares/lvgl/src/fs/lv_fs_uefi.su ./Middlewares/lvgl/src/fs/lv_fs_win32.cyclo ./Middlewares/lvgl/src/fs/lv_fs_win32.d ./Middlewares/lvgl/src/fs/lv_fs_win32.o ./Middlewares/lvgl/src/fs/lv_fs_win32.su

.PHONY: clean-Middlewares-2f-lvgl-2f-src-2f-fs

