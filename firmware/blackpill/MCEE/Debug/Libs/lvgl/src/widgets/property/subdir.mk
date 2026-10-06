################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/widgets/property/lv_animimage_properties.c \
../Libs/lvgl/src/widgets/property/lv_arc_properties.c \
../Libs/lvgl/src/widgets/property/lv_bar_properties.c \
../Libs/lvgl/src/widgets/property/lv_buttonmatrix_properties.c \
../Libs/lvgl/src/widgets/property/lv_chart_properties.c \
../Libs/lvgl/src/widgets/property/lv_checkbox_properties.c \
../Libs/lvgl/src/widgets/property/lv_dropdown_properties.c \
../Libs/lvgl/src/widgets/property/lv_image_properties.c \
../Libs/lvgl/src/widgets/property/lv_keyboard_properties.c \
../Libs/lvgl/src/widgets/property/lv_label_properties.c \
../Libs/lvgl/src/widgets/property/lv_led_properties.c \
../Libs/lvgl/src/widgets/property/lv_line_properties.c \
../Libs/lvgl/src/widgets/property/lv_menu_properties.c \
../Libs/lvgl/src/widgets/property/lv_obj_properties.c \
../Libs/lvgl/src/widgets/property/lv_roller_properties.c \
../Libs/lvgl/src/widgets/property/lv_scale_properties.c \
../Libs/lvgl/src/widgets/property/lv_slider_properties.c \
../Libs/lvgl/src/widgets/property/lv_span_properties.c \
../Libs/lvgl/src/widgets/property/lv_spinbox_properties.c \
../Libs/lvgl/src/widgets/property/lv_spinner_properties.c \
../Libs/lvgl/src/widgets/property/lv_style_properties.c \
../Libs/lvgl/src/widgets/property/lv_switch_properties.c \
../Libs/lvgl/src/widgets/property/lv_table_properties.c \
../Libs/lvgl/src/widgets/property/lv_tabview_properties.c \
../Libs/lvgl/src/widgets/property/lv_textarea_properties.c 

OBJS += \
./Libs/lvgl/src/widgets/property/lv_animimage_properties.o \
./Libs/lvgl/src/widgets/property/lv_arc_properties.o \
./Libs/lvgl/src/widgets/property/lv_bar_properties.o \
./Libs/lvgl/src/widgets/property/lv_buttonmatrix_properties.o \
./Libs/lvgl/src/widgets/property/lv_chart_properties.o \
./Libs/lvgl/src/widgets/property/lv_checkbox_properties.o \
./Libs/lvgl/src/widgets/property/lv_dropdown_properties.o \
./Libs/lvgl/src/widgets/property/lv_image_properties.o \
./Libs/lvgl/src/widgets/property/lv_keyboard_properties.o \
./Libs/lvgl/src/widgets/property/lv_label_properties.o \
./Libs/lvgl/src/widgets/property/lv_led_properties.o \
./Libs/lvgl/src/widgets/property/lv_line_properties.o \
./Libs/lvgl/src/widgets/property/lv_menu_properties.o \
./Libs/lvgl/src/widgets/property/lv_obj_properties.o \
./Libs/lvgl/src/widgets/property/lv_roller_properties.o \
./Libs/lvgl/src/widgets/property/lv_scale_properties.o \
./Libs/lvgl/src/widgets/property/lv_slider_properties.o \
./Libs/lvgl/src/widgets/property/lv_span_properties.o \
./Libs/lvgl/src/widgets/property/lv_spinbox_properties.o \
./Libs/lvgl/src/widgets/property/lv_spinner_properties.o \
./Libs/lvgl/src/widgets/property/lv_style_properties.o \
./Libs/lvgl/src/widgets/property/lv_switch_properties.o \
./Libs/lvgl/src/widgets/property/lv_table_properties.o \
./Libs/lvgl/src/widgets/property/lv_tabview_properties.o \
./Libs/lvgl/src/widgets/property/lv_textarea_properties.o 

C_DEPS += \
./Libs/lvgl/src/widgets/property/lv_animimage_properties.d \
./Libs/lvgl/src/widgets/property/lv_arc_properties.d \
./Libs/lvgl/src/widgets/property/lv_bar_properties.d \
./Libs/lvgl/src/widgets/property/lv_buttonmatrix_properties.d \
./Libs/lvgl/src/widgets/property/lv_chart_properties.d \
./Libs/lvgl/src/widgets/property/lv_checkbox_properties.d \
./Libs/lvgl/src/widgets/property/lv_dropdown_properties.d \
./Libs/lvgl/src/widgets/property/lv_image_properties.d \
./Libs/lvgl/src/widgets/property/lv_keyboard_properties.d \
./Libs/lvgl/src/widgets/property/lv_label_properties.d \
./Libs/lvgl/src/widgets/property/lv_led_properties.d \
./Libs/lvgl/src/widgets/property/lv_line_properties.d \
./Libs/lvgl/src/widgets/property/lv_menu_properties.d \
./Libs/lvgl/src/widgets/property/lv_obj_properties.d \
./Libs/lvgl/src/widgets/property/lv_roller_properties.d \
./Libs/lvgl/src/widgets/property/lv_scale_properties.d \
./Libs/lvgl/src/widgets/property/lv_slider_properties.d \
./Libs/lvgl/src/widgets/property/lv_span_properties.d \
./Libs/lvgl/src/widgets/property/lv_spinbox_properties.d \
./Libs/lvgl/src/widgets/property/lv_spinner_properties.d \
./Libs/lvgl/src/widgets/property/lv_style_properties.d \
./Libs/lvgl/src/widgets/property/lv_switch_properties.d \
./Libs/lvgl/src/widgets/property/lv_table_properties.d \
./Libs/lvgl/src/widgets/property/lv_tabview_properties.d \
./Libs/lvgl/src/widgets/property/lv_textarea_properties.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/widgets/property/%.o Libs/lvgl/src/widgets/property/%.su Libs/lvgl/src/widgets/property/%.cyclo: ../Libs/lvgl/src/widgets/property/%.c Libs/lvgl/src/widgets/property/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-widgets-2f-property

clean-Libs-2f-lvgl-2f-src-2f-widgets-2f-property:
	-$(RM) ./Libs/lvgl/src/widgets/property/lv_animimage_properties.cyclo ./Libs/lvgl/src/widgets/property/lv_animimage_properties.d ./Libs/lvgl/src/widgets/property/lv_animimage_properties.o ./Libs/lvgl/src/widgets/property/lv_animimage_properties.su ./Libs/lvgl/src/widgets/property/lv_arc_properties.cyclo ./Libs/lvgl/src/widgets/property/lv_arc_properties.d ./Libs/lvgl/src/widgets/property/lv_arc_properties.o ./Libs/lvgl/src/widgets/property/lv_arc_properties.su ./Libs/lvgl/src/widgets/property/lv_bar_properties.cyclo ./Libs/lvgl/src/widgets/property/lv_bar_properties.d ./Libs/lvgl/src/widgets/property/lv_bar_properties.o ./Libs/lvgl/src/widgets/property/lv_bar_properties.su ./Libs/lvgl/src/widgets/property/lv_buttonmatrix_properties.cyclo ./Libs/lvgl/src/widgets/property/lv_buttonmatrix_properties.d ./Libs/lvgl/src/widgets/property/lv_buttonmatrix_properties.o ./Libs/lvgl/src/widgets/property/lv_buttonmatrix_properties.su ./Libs/lvgl/src/widgets/property/lv_chart_properties.cyclo ./Libs/lvgl/src/widgets/property/lv_chart_properties.d ./Libs/lvgl/src/widgets/property/lv_chart_properties.o ./Libs/lvgl/src/widgets/property/lv_chart_properties.su ./Libs/lvgl/src/widgets/property/lv_checkbox_properties.cyclo ./Libs/lvgl/src/widgets/property/lv_checkbox_properties.d ./Libs/lvgl/src/widgets/property/lv_checkbox_properties.o ./Libs/lvgl/src/widgets/property/lv_checkbox_properties.su ./Libs/lvgl/src/widgets/property/lv_dropdown_properties.cyclo ./Libs/lvgl/src/widgets/property/lv_dropdown_properties.d ./Libs/lvgl/src/widgets/property/lv_dropdown_properties.o ./Libs/lvgl/src/widgets/property/lv_dropdown_properties.su ./Libs/lvgl/src/widgets/property/lv_image_properties.cyclo ./Libs/lvgl/src/widgets/property/lv_image_properties.d ./Libs/lvgl/src/widgets/property/lv_image_properties.o ./Libs/lvgl/src/widgets/property/lv_image_properties.su ./Libs/lvgl/src/widgets/property/lv_keyboard_properties.cyclo ./Libs/lvgl/src/widgets/property/lv_keyboard_properties.d ./Libs/lvgl/src/widgets/property/lv_keyboard_properties.o ./Libs/lvgl/src/widgets/property/lv_keyboard_properties.su ./Libs/lvgl/src/widgets/property/lv_label_properties.cyclo ./Libs/lvgl/src/widgets/property/lv_label_properties.d ./Libs/lvgl/src/widgets/property/lv_label_properties.o ./Libs/lvgl/src/widgets/property/lv_label_properties.su ./Libs/lvgl/src/widgets/property/lv_led_properties.cyclo ./Libs/lvgl/src/widgets/property/lv_led_properties.d ./Libs/lvgl/src/widgets/property/lv_led_properties.o ./Libs/lvgl/src/widgets/property/lv_led_properties.su ./Libs/lvgl/src/widgets/property/lv_line_properties.cyclo ./Libs/lvgl/src/widgets/property/lv_line_properties.d ./Libs/lvgl/src/widgets/property/lv_line_properties.o ./Libs/lvgl/src/widgets/property/lv_line_properties.su ./Libs/lvgl/src/widgets/property/lv_menu_properties.cyclo ./Libs/lvgl/src/widgets/property/lv_menu_properties.d ./Libs/lvgl/src/widgets/property/lv_menu_properties.o ./Libs/lvgl/src/widgets/property/lv_menu_properties.su ./Libs/lvgl/src/widgets/property/lv_obj_properties.cyclo ./Libs/lvgl/src/widgets/property/lv_obj_properties.d ./Libs/lvgl/src/widgets/property/lv_obj_properties.o ./Libs/lvgl/src/widgets/property/lv_obj_properties.su ./Libs/lvgl/src/widgets/property/lv_roller_properties.cyclo ./Libs/lvgl/src/widgets/property/lv_roller_properties.d ./Libs/lvgl/src/widgets/property/lv_roller_properties.o ./Libs/lvgl/src/widgets/property/lv_roller_properties.su ./Libs/lvgl/src/widgets/property/lv_scale_properties.cyclo ./Libs/lvgl/src/widgets/property/lv_scale_properties.d ./Libs/lvgl/src/widgets/property/lv_scale_properties.o ./Libs/lvgl/src/widgets/property/lv_scale_properties.su ./Libs/lvgl/src/widgets/property/lv_slider_properties.cyclo ./Libs/lvgl/src/widgets/property/lv_slider_properties.d ./Libs/lvgl/src/widgets/property/lv_slider_properties.o ./Libs/lvgl/src/widgets/property/lv_slider_properties.su ./Libs/lvgl/src/widgets/property/lv_span_properties.cyclo ./Libs/lvgl/src/widgets/property/lv_span_properties.d ./Libs/lvgl/src/widgets/property/lv_span_properties.o ./Libs/lvgl/src/widgets/property/lv_span_properties.su ./Libs/lvgl/src/widgets/property/lv_spinbox_properties.cyclo ./Libs/lvgl/src/widgets/property/lv_spinbox_properties.d ./Libs/lvgl/src/widgets/property/lv_spinbox_properties.o ./Libs/lvgl/src/widgets/property/lv_spinbox_properties.su ./Libs/lvgl/src/widgets/property/lv_spinner_properties.cyclo ./Libs/lvgl/src/widgets/property/lv_spinner_properties.d ./Libs/lvgl/src/widgets/property/lv_spinner_properties.o ./Libs/lvgl/src/widgets/property/lv_spinner_properties.su ./Libs/lvgl/src/widgets/property/lv_style_properties.cyclo ./Libs/lvgl/src/widgets/property/lv_style_properties.d ./Libs/lvgl/src/widgets/property/lv_style_properties.o ./Libs/lvgl/src/widgets/property/lv_style_properties.su ./Libs/lvgl/src/widgets/property/lv_switch_properties.cyclo ./Libs/lvgl/src/widgets/property/lv_switch_properties.d ./Libs/lvgl/src/widgets/property/lv_switch_properties.o ./Libs/lvgl/src/widgets/property/lv_switch_properties.su ./Libs/lvgl/src/widgets/property/lv_table_properties.cyclo ./Libs/lvgl/src/widgets/property/lv_table_properties.d ./Libs/lvgl/src/widgets/property/lv_table_properties.o ./Libs/lvgl/src/widgets/property/lv_table_properties.su ./Libs/lvgl/src/widgets/property/lv_tabview_properties.cyclo ./Libs/lvgl/src/widgets/property/lv_tabview_properties.d ./Libs/lvgl/src/widgets/property/lv_tabview_properties.o ./Libs/lvgl/src/widgets/property/lv_tabview_properties.su ./Libs/lvgl/src/widgets/property/lv_textarea_properties.cyclo ./Libs/lvgl/src/widgets/property/lv_textarea_properties.d ./Libs/lvgl/src/widgets/property/lv_textarea_properties.o ./Libs/lvgl/src/widgets/property/lv_textarea_properties.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-widgets-2f-property

