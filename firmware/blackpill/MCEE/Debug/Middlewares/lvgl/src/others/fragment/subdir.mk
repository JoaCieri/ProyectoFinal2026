################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl/src/others/fragment/lv_fragment.c \
../Middlewares/lvgl/src/others/fragment/lv_fragment_manager.c 

OBJS += \
./Middlewares/lvgl/src/others/fragment/lv_fragment.o \
./Middlewares/lvgl/src/others/fragment/lv_fragment_manager.o 

C_DEPS += \
./Middlewares/lvgl/src/others/fragment/lv_fragment.d \
./Middlewares/lvgl/src/others/fragment/lv_fragment_manager.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl/src/others/fragment/%.o Middlewares/lvgl/src/others/fragment/%.su Middlewares/lvgl/src/others/fragment/%.cyclo: ../Middlewares/lvgl/src/others/fragment/%.c Middlewares/lvgl/src/others/fragment/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl-2f-src-2f-others-2f-fragment

clean-Middlewares-2f-lvgl-2f-src-2f-others-2f-fragment:
	-$(RM) ./Middlewares/lvgl/src/others/fragment/lv_fragment.cyclo ./Middlewares/lvgl/src/others/fragment/lv_fragment.d ./Middlewares/lvgl/src/others/fragment/lv_fragment.o ./Middlewares/lvgl/src/others/fragment/lv_fragment.su ./Middlewares/lvgl/src/others/fragment/lv_fragment_manager.cyclo ./Middlewares/lvgl/src/others/fragment/lv_fragment_manager.d ./Middlewares/lvgl/src/others/fragment/lv_fragment_manager.o ./Middlewares/lvgl/src/others/fragment/lv_fragment_manager.su

.PHONY: clean-Middlewares-2f-lvgl-2f-src-2f-others-2f-fragment

