################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/core/lv_group.c \
../Libs/lvgl/src/core/lv_obj.c \
../Libs/lvgl/src/core/lv_obj_class.c \
../Libs/lvgl/src/core/lv_obj_draw.c \
../Libs/lvgl/src/core/lv_obj_event.c \
../Libs/lvgl/src/core/lv_obj_id_builtin.c \
../Libs/lvgl/src/core/lv_obj_pos.c \
../Libs/lvgl/src/core/lv_obj_property.c \
../Libs/lvgl/src/core/lv_obj_scroll.c \
../Libs/lvgl/src/core/lv_obj_style.c \
../Libs/lvgl/src/core/lv_obj_style_gen.c \
../Libs/lvgl/src/core/lv_obj_tree.c \
../Libs/lvgl/src/core/lv_observer.c \
../Libs/lvgl/src/core/lv_refr.c 

OBJS += \
./Libs/lvgl/src/core/lv_group.o \
./Libs/lvgl/src/core/lv_obj.o \
./Libs/lvgl/src/core/lv_obj_class.o \
./Libs/lvgl/src/core/lv_obj_draw.o \
./Libs/lvgl/src/core/lv_obj_event.o \
./Libs/lvgl/src/core/lv_obj_id_builtin.o \
./Libs/lvgl/src/core/lv_obj_pos.o \
./Libs/lvgl/src/core/lv_obj_property.o \
./Libs/lvgl/src/core/lv_obj_scroll.o \
./Libs/lvgl/src/core/lv_obj_style.o \
./Libs/lvgl/src/core/lv_obj_style_gen.o \
./Libs/lvgl/src/core/lv_obj_tree.o \
./Libs/lvgl/src/core/lv_observer.o \
./Libs/lvgl/src/core/lv_refr.o 

C_DEPS += \
./Libs/lvgl/src/core/lv_group.d \
./Libs/lvgl/src/core/lv_obj.d \
./Libs/lvgl/src/core/lv_obj_class.d \
./Libs/lvgl/src/core/lv_obj_draw.d \
./Libs/lvgl/src/core/lv_obj_event.d \
./Libs/lvgl/src/core/lv_obj_id_builtin.d \
./Libs/lvgl/src/core/lv_obj_pos.d \
./Libs/lvgl/src/core/lv_obj_property.d \
./Libs/lvgl/src/core/lv_obj_scroll.d \
./Libs/lvgl/src/core/lv_obj_style.d \
./Libs/lvgl/src/core/lv_obj_style_gen.d \
./Libs/lvgl/src/core/lv_obj_tree.d \
./Libs/lvgl/src/core/lv_observer.d \
./Libs/lvgl/src/core/lv_refr.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/core/%.o Libs/lvgl/src/core/%.su Libs/lvgl/src/core/%.cyclo: ../Libs/lvgl/src/core/%.c Libs/lvgl/src/core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-core

clean-Libs-2f-lvgl-2f-src-2f-core:
	-$(RM) ./Libs/lvgl/src/core/lv_group.cyclo ./Libs/lvgl/src/core/lv_group.d ./Libs/lvgl/src/core/lv_group.o ./Libs/lvgl/src/core/lv_group.su ./Libs/lvgl/src/core/lv_obj.cyclo ./Libs/lvgl/src/core/lv_obj.d ./Libs/lvgl/src/core/lv_obj.o ./Libs/lvgl/src/core/lv_obj.su ./Libs/lvgl/src/core/lv_obj_class.cyclo ./Libs/lvgl/src/core/lv_obj_class.d ./Libs/lvgl/src/core/lv_obj_class.o ./Libs/lvgl/src/core/lv_obj_class.su ./Libs/lvgl/src/core/lv_obj_draw.cyclo ./Libs/lvgl/src/core/lv_obj_draw.d ./Libs/lvgl/src/core/lv_obj_draw.o ./Libs/lvgl/src/core/lv_obj_draw.su ./Libs/lvgl/src/core/lv_obj_event.cyclo ./Libs/lvgl/src/core/lv_obj_event.d ./Libs/lvgl/src/core/lv_obj_event.o ./Libs/lvgl/src/core/lv_obj_event.su ./Libs/lvgl/src/core/lv_obj_id_builtin.cyclo ./Libs/lvgl/src/core/lv_obj_id_builtin.d ./Libs/lvgl/src/core/lv_obj_id_builtin.o ./Libs/lvgl/src/core/lv_obj_id_builtin.su ./Libs/lvgl/src/core/lv_obj_pos.cyclo ./Libs/lvgl/src/core/lv_obj_pos.d ./Libs/lvgl/src/core/lv_obj_pos.o ./Libs/lvgl/src/core/lv_obj_pos.su ./Libs/lvgl/src/core/lv_obj_property.cyclo ./Libs/lvgl/src/core/lv_obj_property.d ./Libs/lvgl/src/core/lv_obj_property.o ./Libs/lvgl/src/core/lv_obj_property.su ./Libs/lvgl/src/core/lv_obj_scroll.cyclo ./Libs/lvgl/src/core/lv_obj_scroll.d ./Libs/lvgl/src/core/lv_obj_scroll.o ./Libs/lvgl/src/core/lv_obj_scroll.su ./Libs/lvgl/src/core/lv_obj_style.cyclo ./Libs/lvgl/src/core/lv_obj_style.d ./Libs/lvgl/src/core/lv_obj_style.o ./Libs/lvgl/src/core/lv_obj_style.su ./Libs/lvgl/src/core/lv_obj_style_gen.cyclo ./Libs/lvgl/src/core/lv_obj_style_gen.d ./Libs/lvgl/src/core/lv_obj_style_gen.o ./Libs/lvgl/src/core/lv_obj_style_gen.su ./Libs/lvgl/src/core/lv_obj_tree.cyclo ./Libs/lvgl/src/core/lv_obj_tree.d ./Libs/lvgl/src/core/lv_obj_tree.o ./Libs/lvgl/src/core/lv_obj_tree.su ./Libs/lvgl/src/core/lv_observer.cyclo ./Libs/lvgl/src/core/lv_observer.d ./Libs/lvgl/src/core/lv_observer.o ./Libs/lvgl/src/core/lv_observer.su ./Libs/lvgl/src/core/lv_refr.cyclo ./Libs/lvgl/src/core/lv_refr.d ./Libs/lvgl/src/core/lv_refr.o ./Libs/lvgl/src/core/lv_refr.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-core

