################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/misc/lv_anim.c \
../Libs/lvgl/src/misc/lv_anim_timeline.c \
../Libs/lvgl/src/misc/lv_area.c \
../Libs/lvgl/src/misc/lv_array.c \
../Libs/lvgl/src/misc/lv_async.c \
../Libs/lvgl/src/misc/lv_bidi.c \
../Libs/lvgl/src/misc/lv_bidi_common.c \
../Libs/lvgl/src/misc/lv_circle_buf.c \
../Libs/lvgl/src/misc/lv_color.c \
../Libs/lvgl/src/misc/lv_color_op.c \
../Libs/lvgl/src/misc/lv_event.c \
../Libs/lvgl/src/misc/lv_grad.c \
../Libs/lvgl/src/misc/lv_iter.c \
../Libs/lvgl/src/misc/lv_ll.c \
../Libs/lvgl/src/misc/lv_lru.c \
../Libs/lvgl/src/misc/lv_math.c \
../Libs/lvgl/src/misc/lv_matrix.c \
../Libs/lvgl/src/misc/lv_palette.c \
../Libs/lvgl/src/misc/lv_pending.c \
../Libs/lvgl/src/misc/lv_rb.c \
../Libs/lvgl/src/misc/lv_style.c \
../Libs/lvgl/src/misc/lv_style_gen.c \
../Libs/lvgl/src/misc/lv_templ.c \
../Libs/lvgl/src/misc/lv_text.c \
../Libs/lvgl/src/misc/lv_text_ap.c \
../Libs/lvgl/src/misc/lv_timer.c \
../Libs/lvgl/src/misc/lv_tree.c \
../Libs/lvgl/src/misc/lv_utils.c 

OBJS += \
./Libs/lvgl/src/misc/lv_anim.o \
./Libs/lvgl/src/misc/lv_anim_timeline.o \
./Libs/lvgl/src/misc/lv_area.o \
./Libs/lvgl/src/misc/lv_array.o \
./Libs/lvgl/src/misc/lv_async.o \
./Libs/lvgl/src/misc/lv_bidi.o \
./Libs/lvgl/src/misc/lv_bidi_common.o \
./Libs/lvgl/src/misc/lv_circle_buf.o \
./Libs/lvgl/src/misc/lv_color.o \
./Libs/lvgl/src/misc/lv_color_op.o \
./Libs/lvgl/src/misc/lv_event.o \
./Libs/lvgl/src/misc/lv_grad.o \
./Libs/lvgl/src/misc/lv_iter.o \
./Libs/lvgl/src/misc/lv_ll.o \
./Libs/lvgl/src/misc/lv_lru.o \
./Libs/lvgl/src/misc/lv_math.o \
./Libs/lvgl/src/misc/lv_matrix.o \
./Libs/lvgl/src/misc/lv_palette.o \
./Libs/lvgl/src/misc/lv_pending.o \
./Libs/lvgl/src/misc/lv_rb.o \
./Libs/lvgl/src/misc/lv_style.o \
./Libs/lvgl/src/misc/lv_style_gen.o \
./Libs/lvgl/src/misc/lv_templ.o \
./Libs/lvgl/src/misc/lv_text.o \
./Libs/lvgl/src/misc/lv_text_ap.o \
./Libs/lvgl/src/misc/lv_timer.o \
./Libs/lvgl/src/misc/lv_tree.o \
./Libs/lvgl/src/misc/lv_utils.o 

C_DEPS += \
./Libs/lvgl/src/misc/lv_anim.d \
./Libs/lvgl/src/misc/lv_anim_timeline.d \
./Libs/lvgl/src/misc/lv_area.d \
./Libs/lvgl/src/misc/lv_array.d \
./Libs/lvgl/src/misc/lv_async.d \
./Libs/lvgl/src/misc/lv_bidi.d \
./Libs/lvgl/src/misc/lv_bidi_common.d \
./Libs/lvgl/src/misc/lv_circle_buf.d \
./Libs/lvgl/src/misc/lv_color.d \
./Libs/lvgl/src/misc/lv_color_op.d \
./Libs/lvgl/src/misc/lv_event.d \
./Libs/lvgl/src/misc/lv_grad.d \
./Libs/lvgl/src/misc/lv_iter.d \
./Libs/lvgl/src/misc/lv_ll.d \
./Libs/lvgl/src/misc/lv_lru.d \
./Libs/lvgl/src/misc/lv_math.d \
./Libs/lvgl/src/misc/lv_matrix.d \
./Libs/lvgl/src/misc/lv_palette.d \
./Libs/lvgl/src/misc/lv_pending.d \
./Libs/lvgl/src/misc/lv_rb.d \
./Libs/lvgl/src/misc/lv_style.d \
./Libs/lvgl/src/misc/lv_style_gen.d \
./Libs/lvgl/src/misc/lv_templ.d \
./Libs/lvgl/src/misc/lv_text.d \
./Libs/lvgl/src/misc/lv_text_ap.d \
./Libs/lvgl/src/misc/lv_timer.d \
./Libs/lvgl/src/misc/lv_tree.d \
./Libs/lvgl/src/misc/lv_utils.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/misc/%.o Libs/lvgl/src/misc/%.su Libs/lvgl/src/misc/%.cyclo: ../Libs/lvgl/src/misc/%.c Libs/lvgl/src/misc/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-misc

clean-Libs-2f-lvgl-2f-src-2f-misc:
	-$(RM) ./Libs/lvgl/src/misc/lv_anim.cyclo ./Libs/lvgl/src/misc/lv_anim.d ./Libs/lvgl/src/misc/lv_anim.o ./Libs/lvgl/src/misc/lv_anim.su ./Libs/lvgl/src/misc/lv_anim_timeline.cyclo ./Libs/lvgl/src/misc/lv_anim_timeline.d ./Libs/lvgl/src/misc/lv_anim_timeline.o ./Libs/lvgl/src/misc/lv_anim_timeline.su ./Libs/lvgl/src/misc/lv_area.cyclo ./Libs/lvgl/src/misc/lv_area.d ./Libs/lvgl/src/misc/lv_area.o ./Libs/lvgl/src/misc/lv_area.su ./Libs/lvgl/src/misc/lv_array.cyclo ./Libs/lvgl/src/misc/lv_array.d ./Libs/lvgl/src/misc/lv_array.o ./Libs/lvgl/src/misc/lv_array.su ./Libs/lvgl/src/misc/lv_async.cyclo ./Libs/lvgl/src/misc/lv_async.d ./Libs/lvgl/src/misc/lv_async.o ./Libs/lvgl/src/misc/lv_async.su ./Libs/lvgl/src/misc/lv_bidi.cyclo ./Libs/lvgl/src/misc/lv_bidi.d ./Libs/lvgl/src/misc/lv_bidi.o ./Libs/lvgl/src/misc/lv_bidi.su ./Libs/lvgl/src/misc/lv_bidi_common.cyclo ./Libs/lvgl/src/misc/lv_bidi_common.d ./Libs/lvgl/src/misc/lv_bidi_common.o ./Libs/lvgl/src/misc/lv_bidi_common.su ./Libs/lvgl/src/misc/lv_circle_buf.cyclo ./Libs/lvgl/src/misc/lv_circle_buf.d ./Libs/lvgl/src/misc/lv_circle_buf.o ./Libs/lvgl/src/misc/lv_circle_buf.su ./Libs/lvgl/src/misc/lv_color.cyclo ./Libs/lvgl/src/misc/lv_color.d ./Libs/lvgl/src/misc/lv_color.o ./Libs/lvgl/src/misc/lv_color.su ./Libs/lvgl/src/misc/lv_color_op.cyclo ./Libs/lvgl/src/misc/lv_color_op.d ./Libs/lvgl/src/misc/lv_color_op.o ./Libs/lvgl/src/misc/lv_color_op.su ./Libs/lvgl/src/misc/lv_event.cyclo ./Libs/lvgl/src/misc/lv_event.d ./Libs/lvgl/src/misc/lv_event.o ./Libs/lvgl/src/misc/lv_event.su ./Libs/lvgl/src/misc/lv_grad.cyclo ./Libs/lvgl/src/misc/lv_grad.d ./Libs/lvgl/src/misc/lv_grad.o ./Libs/lvgl/src/misc/lv_grad.su ./Libs/lvgl/src/misc/lv_iter.cyclo ./Libs/lvgl/src/misc/lv_iter.d ./Libs/lvgl/src/misc/lv_iter.o ./Libs/lvgl/src/misc/lv_iter.su ./Libs/lvgl/src/misc/lv_ll.cyclo ./Libs/lvgl/src/misc/lv_ll.d ./Libs/lvgl/src/misc/lv_ll.o ./Libs/lvgl/src/misc/lv_ll.su ./Libs/lvgl/src/misc/lv_lru.cyclo ./Libs/lvgl/src/misc/lv_lru.d ./Libs/lvgl/src/misc/lv_lru.o ./Libs/lvgl/src/misc/lv_lru.su ./Libs/lvgl/src/misc/lv_math.cyclo ./Libs/lvgl/src/misc/lv_math.d ./Libs/lvgl/src/misc/lv_math.o ./Libs/lvgl/src/misc/lv_math.su ./Libs/lvgl/src/misc/lv_matrix.cyclo ./Libs/lvgl/src/misc/lv_matrix.d ./Libs/lvgl/src/misc/lv_matrix.o ./Libs/lvgl/src/misc/lv_matrix.su ./Libs/lvgl/src/misc/lv_palette.cyclo ./Libs/lvgl/src/misc/lv_palette.d ./Libs/lvgl/src/misc/lv_palette.o ./Libs/lvgl/src/misc/lv_palette.su ./Libs/lvgl/src/misc/lv_pending.cyclo ./Libs/lvgl/src/misc/lv_pending.d ./Libs/lvgl/src/misc/lv_pending.o ./Libs/lvgl/src/misc/lv_pending.su ./Libs/lvgl/src/misc/lv_rb.cyclo ./Libs/lvgl/src/misc/lv_rb.d ./Libs/lvgl/src/misc/lv_rb.o ./Libs/lvgl/src/misc/lv_rb.su ./Libs/lvgl/src/misc/lv_style.cyclo ./Libs/lvgl/src/misc/lv_style.d ./Libs/lvgl/src/misc/lv_style.o ./Libs/lvgl/src/misc/lv_style.su ./Libs/lvgl/src/misc/lv_style_gen.cyclo ./Libs/lvgl/src/misc/lv_style_gen.d ./Libs/lvgl/src/misc/lv_style_gen.o ./Libs/lvgl/src/misc/lv_style_gen.su ./Libs/lvgl/src/misc/lv_templ.cyclo ./Libs/lvgl/src/misc/lv_templ.d ./Libs/lvgl/src/misc/lv_templ.o ./Libs/lvgl/src/misc/lv_templ.su ./Libs/lvgl/src/misc/lv_text.cyclo ./Libs/lvgl/src/misc/lv_text.d ./Libs/lvgl/src/misc/lv_text.o ./Libs/lvgl/src/misc/lv_text.su ./Libs/lvgl/src/misc/lv_text_ap.cyclo ./Libs/lvgl/src/misc/lv_text_ap.d ./Libs/lvgl/src/misc/lv_text_ap.o ./Libs/lvgl/src/misc/lv_text_ap.su ./Libs/lvgl/src/misc/lv_timer.cyclo ./Libs/lvgl/src/misc/lv_timer.d ./Libs/lvgl/src/misc/lv_timer.o ./Libs/lvgl/src/misc/lv_timer.su ./Libs/lvgl/src/misc/lv_tree.cyclo ./Libs/lvgl/src/misc/lv_tree.d ./Libs/lvgl/src/misc/lv_tree.o ./Libs/lvgl/src/misc/lv_tree.su ./Libs/lvgl/src/misc/lv_utils.cyclo ./Libs/lvgl/src/misc/lv_utils.d ./Libs/lvgl/src/misc/lv_utils.o ./Libs/lvgl/src/misc/lv_utils.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-misc

