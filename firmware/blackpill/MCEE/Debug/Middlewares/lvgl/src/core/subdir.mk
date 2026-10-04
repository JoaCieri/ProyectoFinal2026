################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl/src/core/lv_group.c \
../Middlewares/lvgl/src/core/lv_obj.c \
../Middlewares/lvgl/src/core/lv_obj_class.c \
../Middlewares/lvgl/src/core/lv_obj_draw.c \
../Middlewares/lvgl/src/core/lv_obj_event.c \
../Middlewares/lvgl/src/core/lv_obj_id_builtin.c \
../Middlewares/lvgl/src/core/lv_obj_pos.c \
../Middlewares/lvgl/src/core/lv_obj_property.c \
../Middlewares/lvgl/src/core/lv_obj_scroll.c \
../Middlewares/lvgl/src/core/lv_obj_style.c \
../Middlewares/lvgl/src/core/lv_obj_style_gen.c \
../Middlewares/lvgl/src/core/lv_obj_tree.c \
../Middlewares/lvgl/src/core/lv_observer.c \
../Middlewares/lvgl/src/core/lv_refr.c 

OBJS += \
./Middlewares/lvgl/src/core/lv_group.o \
./Middlewares/lvgl/src/core/lv_obj.o \
./Middlewares/lvgl/src/core/lv_obj_class.o \
./Middlewares/lvgl/src/core/lv_obj_draw.o \
./Middlewares/lvgl/src/core/lv_obj_event.o \
./Middlewares/lvgl/src/core/lv_obj_id_builtin.o \
./Middlewares/lvgl/src/core/lv_obj_pos.o \
./Middlewares/lvgl/src/core/lv_obj_property.o \
./Middlewares/lvgl/src/core/lv_obj_scroll.o \
./Middlewares/lvgl/src/core/lv_obj_style.o \
./Middlewares/lvgl/src/core/lv_obj_style_gen.o \
./Middlewares/lvgl/src/core/lv_obj_tree.o \
./Middlewares/lvgl/src/core/lv_observer.o \
./Middlewares/lvgl/src/core/lv_refr.o 

C_DEPS += \
./Middlewares/lvgl/src/core/lv_group.d \
./Middlewares/lvgl/src/core/lv_obj.d \
./Middlewares/lvgl/src/core/lv_obj_class.d \
./Middlewares/lvgl/src/core/lv_obj_draw.d \
./Middlewares/lvgl/src/core/lv_obj_event.d \
./Middlewares/lvgl/src/core/lv_obj_id_builtin.d \
./Middlewares/lvgl/src/core/lv_obj_pos.d \
./Middlewares/lvgl/src/core/lv_obj_property.d \
./Middlewares/lvgl/src/core/lv_obj_scroll.d \
./Middlewares/lvgl/src/core/lv_obj_style.d \
./Middlewares/lvgl/src/core/lv_obj_style_gen.d \
./Middlewares/lvgl/src/core/lv_obj_tree.d \
./Middlewares/lvgl/src/core/lv_observer.d \
./Middlewares/lvgl/src/core/lv_refr.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl/src/core/%.o Middlewares/lvgl/src/core/%.su Middlewares/lvgl/src/core/%.cyclo: ../Middlewares/lvgl/src/core/%.c Middlewares/lvgl/src/core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl-2f-src-2f-core

clean-Middlewares-2f-lvgl-2f-src-2f-core:
	-$(RM) ./Middlewares/lvgl/src/core/lv_group.cyclo ./Middlewares/lvgl/src/core/lv_group.d ./Middlewares/lvgl/src/core/lv_group.o ./Middlewares/lvgl/src/core/lv_group.su ./Middlewares/lvgl/src/core/lv_obj.cyclo ./Middlewares/lvgl/src/core/lv_obj.d ./Middlewares/lvgl/src/core/lv_obj.o ./Middlewares/lvgl/src/core/lv_obj.su ./Middlewares/lvgl/src/core/lv_obj_class.cyclo ./Middlewares/lvgl/src/core/lv_obj_class.d ./Middlewares/lvgl/src/core/lv_obj_class.o ./Middlewares/lvgl/src/core/lv_obj_class.su ./Middlewares/lvgl/src/core/lv_obj_draw.cyclo ./Middlewares/lvgl/src/core/lv_obj_draw.d ./Middlewares/lvgl/src/core/lv_obj_draw.o ./Middlewares/lvgl/src/core/lv_obj_draw.su ./Middlewares/lvgl/src/core/lv_obj_event.cyclo ./Middlewares/lvgl/src/core/lv_obj_event.d ./Middlewares/lvgl/src/core/lv_obj_event.o ./Middlewares/lvgl/src/core/lv_obj_event.su ./Middlewares/lvgl/src/core/lv_obj_id_builtin.cyclo ./Middlewares/lvgl/src/core/lv_obj_id_builtin.d ./Middlewares/lvgl/src/core/lv_obj_id_builtin.o ./Middlewares/lvgl/src/core/lv_obj_id_builtin.su ./Middlewares/lvgl/src/core/lv_obj_pos.cyclo ./Middlewares/lvgl/src/core/lv_obj_pos.d ./Middlewares/lvgl/src/core/lv_obj_pos.o ./Middlewares/lvgl/src/core/lv_obj_pos.su ./Middlewares/lvgl/src/core/lv_obj_property.cyclo ./Middlewares/lvgl/src/core/lv_obj_property.d ./Middlewares/lvgl/src/core/lv_obj_property.o ./Middlewares/lvgl/src/core/lv_obj_property.su ./Middlewares/lvgl/src/core/lv_obj_scroll.cyclo ./Middlewares/lvgl/src/core/lv_obj_scroll.d ./Middlewares/lvgl/src/core/lv_obj_scroll.o ./Middlewares/lvgl/src/core/lv_obj_scroll.su ./Middlewares/lvgl/src/core/lv_obj_style.cyclo ./Middlewares/lvgl/src/core/lv_obj_style.d ./Middlewares/lvgl/src/core/lv_obj_style.o ./Middlewares/lvgl/src/core/lv_obj_style.su ./Middlewares/lvgl/src/core/lv_obj_style_gen.cyclo ./Middlewares/lvgl/src/core/lv_obj_style_gen.d ./Middlewares/lvgl/src/core/lv_obj_style_gen.o ./Middlewares/lvgl/src/core/lv_obj_style_gen.su ./Middlewares/lvgl/src/core/lv_obj_tree.cyclo ./Middlewares/lvgl/src/core/lv_obj_tree.d ./Middlewares/lvgl/src/core/lv_obj_tree.o ./Middlewares/lvgl/src/core/lv_obj_tree.su ./Middlewares/lvgl/src/core/lv_observer.cyclo ./Middlewares/lvgl/src/core/lv_observer.d ./Middlewares/lvgl/src/core/lv_observer.o ./Middlewares/lvgl/src/core/lv_observer.su ./Middlewares/lvgl/src/core/lv_refr.cyclo ./Middlewares/lvgl/src/core/lv_refr.d ./Middlewares/lvgl/src/core/lv_refr.o ./Middlewares/lvgl/src/core/lv_refr.su

.PHONY: clean-Middlewares-2f-lvgl-2f-src-2f-core

