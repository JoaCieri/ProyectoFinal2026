################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_UPPER_SRCS += \
../Libs/lvgl/src/draw/sw/blend/helium/lv_blend_helium.S 

OBJS += \
./Libs/lvgl/src/draw/sw/blend/helium/lv_blend_helium.o 

S_UPPER_DEPS += \
./Libs/lvgl/src/draw/sw/blend/helium/lv_blend_helium.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/draw/sw/blend/helium/%.o: ../Libs/lvgl/src/draw/sw/blend/helium/%.S Libs/lvgl/src/draw/sw/blend/helium/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-Libs-2f-lvgl-2f-src-2f-draw-2f-sw-2f-blend-2f-helium

clean-Libs-2f-lvgl-2f-src-2f-draw-2f-sw-2f-blend-2f-helium:
	-$(RM) ./Libs/lvgl/src/draw/sw/blend/helium/lv_blend_helium.d ./Libs/lvgl/src/draw/sw/blend/helium/lv_blend_helium.o

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-draw-2f-sw-2f-blend-2f-helium

