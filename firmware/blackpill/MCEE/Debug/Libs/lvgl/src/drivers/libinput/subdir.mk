################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/drivers/libinput/lv_libinput.c \
../Libs/lvgl/src/drivers/libinput/lv_xkb.c 

OBJS += \
./Libs/lvgl/src/drivers/libinput/lv_libinput.o \
./Libs/lvgl/src/drivers/libinput/lv_xkb.o 

C_DEPS += \
./Libs/lvgl/src/drivers/libinput/lv_libinput.d \
./Libs/lvgl/src/drivers/libinput/lv_xkb.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/drivers/libinput/%.o Libs/lvgl/src/drivers/libinput/%.su Libs/lvgl/src/drivers/libinput/%.cyclo: ../Libs/lvgl/src/drivers/libinput/%.c Libs/lvgl/src/drivers/libinput/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-drivers-2f-libinput

clean-Libs-2f-lvgl-2f-src-2f-drivers-2f-libinput:
	-$(RM) ./Libs/lvgl/src/drivers/libinput/lv_libinput.cyclo ./Libs/lvgl/src/drivers/libinput/lv_libinput.d ./Libs/lvgl/src/drivers/libinput/lv_libinput.o ./Libs/lvgl/src/drivers/libinput/lv_libinput.su ./Libs/lvgl/src/drivers/libinput/lv_xkb.cyclo ./Libs/lvgl/src/drivers/libinput/lv_xkb.d ./Libs/lvgl/src/drivers/libinput/lv_xkb.o ./Libs/lvgl/src/drivers/libinput/lv_xkb.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-drivers-2f-libinput

