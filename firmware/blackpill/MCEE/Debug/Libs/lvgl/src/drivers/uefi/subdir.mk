################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/drivers/uefi/lv_uefi_context.c \
../Libs/lvgl/src/drivers/uefi/lv_uefi_display.c \
../Libs/lvgl/src/drivers/uefi/lv_uefi_indev_keyboard.c \
../Libs/lvgl/src/drivers/uefi/lv_uefi_indev_pointer.c \
../Libs/lvgl/src/drivers/uefi/lv_uefi_indev_touch.c \
../Libs/lvgl/src/drivers/uefi/lv_uefi_private.c 

OBJS += \
./Libs/lvgl/src/drivers/uefi/lv_uefi_context.o \
./Libs/lvgl/src/drivers/uefi/lv_uefi_display.o \
./Libs/lvgl/src/drivers/uefi/lv_uefi_indev_keyboard.o \
./Libs/lvgl/src/drivers/uefi/lv_uefi_indev_pointer.o \
./Libs/lvgl/src/drivers/uefi/lv_uefi_indev_touch.o \
./Libs/lvgl/src/drivers/uefi/lv_uefi_private.o 

C_DEPS += \
./Libs/lvgl/src/drivers/uefi/lv_uefi_context.d \
./Libs/lvgl/src/drivers/uefi/lv_uefi_display.d \
./Libs/lvgl/src/drivers/uefi/lv_uefi_indev_keyboard.d \
./Libs/lvgl/src/drivers/uefi/lv_uefi_indev_pointer.d \
./Libs/lvgl/src/drivers/uefi/lv_uefi_indev_touch.d \
./Libs/lvgl/src/drivers/uefi/lv_uefi_private.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/drivers/uefi/%.o Libs/lvgl/src/drivers/uefi/%.su Libs/lvgl/src/drivers/uefi/%.cyclo: ../Libs/lvgl/src/drivers/uefi/%.c Libs/lvgl/src/drivers/uefi/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-drivers-2f-uefi

clean-Libs-2f-lvgl-2f-src-2f-drivers-2f-uefi:
	-$(RM) ./Libs/lvgl/src/drivers/uefi/lv_uefi_context.cyclo ./Libs/lvgl/src/drivers/uefi/lv_uefi_context.d ./Libs/lvgl/src/drivers/uefi/lv_uefi_context.o ./Libs/lvgl/src/drivers/uefi/lv_uefi_context.su ./Libs/lvgl/src/drivers/uefi/lv_uefi_display.cyclo ./Libs/lvgl/src/drivers/uefi/lv_uefi_display.d ./Libs/lvgl/src/drivers/uefi/lv_uefi_display.o ./Libs/lvgl/src/drivers/uefi/lv_uefi_display.su ./Libs/lvgl/src/drivers/uefi/lv_uefi_indev_keyboard.cyclo ./Libs/lvgl/src/drivers/uefi/lv_uefi_indev_keyboard.d ./Libs/lvgl/src/drivers/uefi/lv_uefi_indev_keyboard.o ./Libs/lvgl/src/drivers/uefi/lv_uefi_indev_keyboard.su ./Libs/lvgl/src/drivers/uefi/lv_uefi_indev_pointer.cyclo ./Libs/lvgl/src/drivers/uefi/lv_uefi_indev_pointer.d ./Libs/lvgl/src/drivers/uefi/lv_uefi_indev_pointer.o ./Libs/lvgl/src/drivers/uefi/lv_uefi_indev_pointer.su ./Libs/lvgl/src/drivers/uefi/lv_uefi_indev_touch.cyclo ./Libs/lvgl/src/drivers/uefi/lv_uefi_indev_touch.d ./Libs/lvgl/src/drivers/uefi/lv_uefi_indev_touch.o ./Libs/lvgl/src/drivers/uefi/lv_uefi_indev_touch.su ./Libs/lvgl/src/drivers/uefi/lv_uefi_private.cyclo ./Libs/lvgl/src/drivers/uefi/lv_uefi_private.d ./Libs/lvgl/src/drivers/uefi/lv_uefi_private.o ./Libs/lvgl/src/drivers/uefi/lv_uefi_private.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-drivers-2f-uefi

