################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/widgets/calendar/lv_calendar.c \
../Libs/lvgl/src/widgets/calendar/lv_calendar_chinese.c \
../Libs/lvgl/src/widgets/calendar/lv_calendar_header_arrow.c \
../Libs/lvgl/src/widgets/calendar/lv_calendar_header_dropdown.c 

OBJS += \
./Libs/lvgl/src/widgets/calendar/lv_calendar.o \
./Libs/lvgl/src/widgets/calendar/lv_calendar_chinese.o \
./Libs/lvgl/src/widgets/calendar/lv_calendar_header_arrow.o \
./Libs/lvgl/src/widgets/calendar/lv_calendar_header_dropdown.o 

C_DEPS += \
./Libs/lvgl/src/widgets/calendar/lv_calendar.d \
./Libs/lvgl/src/widgets/calendar/lv_calendar_chinese.d \
./Libs/lvgl/src/widgets/calendar/lv_calendar_header_arrow.d \
./Libs/lvgl/src/widgets/calendar/lv_calendar_header_dropdown.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/widgets/calendar/%.o Libs/lvgl/src/widgets/calendar/%.su Libs/lvgl/src/widgets/calendar/%.cyclo: ../Libs/lvgl/src/widgets/calendar/%.c Libs/lvgl/src/widgets/calendar/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-widgets-2f-calendar

clean-Libs-2f-lvgl-2f-src-2f-widgets-2f-calendar:
	-$(RM) ./Libs/lvgl/src/widgets/calendar/lv_calendar.cyclo ./Libs/lvgl/src/widgets/calendar/lv_calendar.d ./Libs/lvgl/src/widgets/calendar/lv_calendar.o ./Libs/lvgl/src/widgets/calendar/lv_calendar.su ./Libs/lvgl/src/widgets/calendar/lv_calendar_chinese.cyclo ./Libs/lvgl/src/widgets/calendar/lv_calendar_chinese.d ./Libs/lvgl/src/widgets/calendar/lv_calendar_chinese.o ./Libs/lvgl/src/widgets/calendar/lv_calendar_chinese.su ./Libs/lvgl/src/widgets/calendar/lv_calendar_header_arrow.cyclo ./Libs/lvgl/src/widgets/calendar/lv_calendar_header_arrow.d ./Libs/lvgl/src/widgets/calendar/lv_calendar_header_arrow.o ./Libs/lvgl/src/widgets/calendar/lv_calendar_header_arrow.su ./Libs/lvgl/src/widgets/calendar/lv_calendar_header_dropdown.cyclo ./Libs/lvgl/src/widgets/calendar/lv_calendar_header_dropdown.d ./Libs/lvgl/src/widgets/calendar/lv_calendar_header_dropdown.o ./Libs/lvgl/src/widgets/calendar/lv_calendar_header_dropdown.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-widgets-2f-calendar

