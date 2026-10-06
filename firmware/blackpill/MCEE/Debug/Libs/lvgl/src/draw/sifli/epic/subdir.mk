################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/draw/sifli/epic/lv_draw_buf_sifli_epic.c \
../Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic.c \
../Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_border.c \
../Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_fill.c \
../Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_img.c \
../Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_label.c \
../Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_layer.c \
../Libs/lvgl/src/draw/sifli/epic/lv_sifli_epic_cfg.c \
../Libs/lvgl/src/draw/sifli/epic/lv_sifli_epic_osa.c \
../Libs/lvgl/src/draw/sifli/epic/lv_sifli_epic_utils.c 

OBJS += \
./Libs/lvgl/src/draw/sifli/epic/lv_draw_buf_sifli_epic.o \
./Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic.o \
./Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_border.o \
./Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_fill.o \
./Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_img.o \
./Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_label.o \
./Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_layer.o \
./Libs/lvgl/src/draw/sifli/epic/lv_sifli_epic_cfg.o \
./Libs/lvgl/src/draw/sifli/epic/lv_sifli_epic_osa.o \
./Libs/lvgl/src/draw/sifli/epic/lv_sifli_epic_utils.o 

C_DEPS += \
./Libs/lvgl/src/draw/sifli/epic/lv_draw_buf_sifli_epic.d \
./Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic.d \
./Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_border.d \
./Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_fill.d \
./Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_img.d \
./Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_label.d \
./Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_layer.d \
./Libs/lvgl/src/draw/sifli/epic/lv_sifli_epic_cfg.d \
./Libs/lvgl/src/draw/sifli/epic/lv_sifli_epic_osa.d \
./Libs/lvgl/src/draw/sifli/epic/lv_sifli_epic_utils.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/draw/sifli/epic/%.o Libs/lvgl/src/draw/sifli/epic/%.su Libs/lvgl/src/draw/sifli/epic/%.cyclo: ../Libs/lvgl/src/draw/sifli/epic/%.c Libs/lvgl/src/draw/sifli/epic/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-draw-2f-sifli-2f-epic

clean-Libs-2f-lvgl-2f-src-2f-draw-2f-sifli-2f-epic:
	-$(RM) ./Libs/lvgl/src/draw/sifli/epic/lv_draw_buf_sifli_epic.cyclo ./Libs/lvgl/src/draw/sifli/epic/lv_draw_buf_sifli_epic.d ./Libs/lvgl/src/draw/sifli/epic/lv_draw_buf_sifli_epic.o ./Libs/lvgl/src/draw/sifli/epic/lv_draw_buf_sifli_epic.su ./Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic.cyclo ./Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic.d ./Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic.o ./Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic.su ./Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_border.cyclo ./Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_border.d ./Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_border.o ./Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_border.su ./Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_fill.cyclo ./Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_fill.d ./Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_fill.o ./Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_fill.su ./Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_img.cyclo ./Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_img.d ./Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_img.o ./Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_img.su ./Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_label.cyclo ./Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_label.d ./Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_label.o ./Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_label.su ./Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_layer.cyclo ./Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_layer.d ./Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_layer.o ./Libs/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_layer.su ./Libs/lvgl/src/draw/sifli/epic/lv_sifli_epic_cfg.cyclo ./Libs/lvgl/src/draw/sifli/epic/lv_sifli_epic_cfg.d ./Libs/lvgl/src/draw/sifli/epic/lv_sifli_epic_cfg.o ./Libs/lvgl/src/draw/sifli/epic/lv_sifli_epic_cfg.su ./Libs/lvgl/src/draw/sifli/epic/lv_sifli_epic_osa.cyclo ./Libs/lvgl/src/draw/sifli/epic/lv_sifli_epic_osa.d ./Libs/lvgl/src/draw/sifli/epic/lv_sifli_epic_osa.o ./Libs/lvgl/src/draw/sifli/epic/lv_sifli_epic_osa.su ./Libs/lvgl/src/draw/sifli/epic/lv_sifli_epic_utils.cyclo ./Libs/lvgl/src/draw/sifli/epic/lv_sifli_epic_utils.d ./Libs/lvgl/src/draw/sifli/epic/lv_sifli_epic_utils.o ./Libs/lvgl/src/draw/sifli/epic/lv_sifli_epic_utils.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-draw-2f-sifli-2f-epic

