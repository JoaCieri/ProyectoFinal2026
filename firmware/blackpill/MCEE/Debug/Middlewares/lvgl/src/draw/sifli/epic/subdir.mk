################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl/src/draw/sifli/epic/lv_draw_buf_sifli_epic.c \
../Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic.c \
../Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_border.c \
../Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_fill.c \
../Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_img.c \
../Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_label.c \
../Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_layer.c \
../Middlewares/lvgl/src/draw/sifli/epic/lv_sifli_epic_cfg.c \
../Middlewares/lvgl/src/draw/sifli/epic/lv_sifli_epic_osa.c \
../Middlewares/lvgl/src/draw/sifli/epic/lv_sifli_epic_utils.c 

OBJS += \
./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_buf_sifli_epic.o \
./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic.o \
./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_border.o \
./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_fill.o \
./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_img.o \
./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_label.o \
./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_layer.o \
./Middlewares/lvgl/src/draw/sifli/epic/lv_sifli_epic_cfg.o \
./Middlewares/lvgl/src/draw/sifli/epic/lv_sifli_epic_osa.o \
./Middlewares/lvgl/src/draw/sifli/epic/lv_sifli_epic_utils.o 

C_DEPS += \
./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_buf_sifli_epic.d \
./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic.d \
./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_border.d \
./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_fill.d \
./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_img.d \
./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_label.d \
./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_layer.d \
./Middlewares/lvgl/src/draw/sifli/epic/lv_sifli_epic_cfg.d \
./Middlewares/lvgl/src/draw/sifli/epic/lv_sifli_epic_osa.d \
./Middlewares/lvgl/src/draw/sifli/epic/lv_sifli_epic_utils.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl/src/draw/sifli/epic/%.o Middlewares/lvgl/src/draw/sifli/epic/%.su Middlewares/lvgl/src/draw/sifli/epic/%.cyclo: ../Middlewares/lvgl/src/draw/sifli/epic/%.c Middlewares/lvgl/src/draw/sifli/epic/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl-2f-src-2f-draw-2f-sifli-2f-epic

clean-Middlewares-2f-lvgl-2f-src-2f-draw-2f-sifli-2f-epic:
	-$(RM) ./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_buf_sifli_epic.cyclo ./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_buf_sifli_epic.d ./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_buf_sifli_epic.o ./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_buf_sifli_epic.su ./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic.cyclo ./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic.d ./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic.o ./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic.su ./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_border.cyclo ./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_border.d ./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_border.o ./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_border.su ./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_fill.cyclo ./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_fill.d ./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_fill.o ./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_fill.su ./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_img.cyclo ./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_img.d ./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_img.o ./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_img.su ./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_label.cyclo ./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_label.d ./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_label.o ./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_label.su ./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_layer.cyclo ./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_layer.d ./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_layer.o ./Middlewares/lvgl/src/draw/sifli/epic/lv_draw_sifli_epic_layer.su ./Middlewares/lvgl/src/draw/sifli/epic/lv_sifli_epic_cfg.cyclo ./Middlewares/lvgl/src/draw/sifli/epic/lv_sifli_epic_cfg.d ./Middlewares/lvgl/src/draw/sifli/epic/lv_sifli_epic_cfg.o ./Middlewares/lvgl/src/draw/sifli/epic/lv_sifli_epic_cfg.su ./Middlewares/lvgl/src/draw/sifli/epic/lv_sifli_epic_osa.cyclo ./Middlewares/lvgl/src/draw/sifli/epic/lv_sifli_epic_osa.d ./Middlewares/lvgl/src/draw/sifli/epic/lv_sifli_epic_osa.o ./Middlewares/lvgl/src/draw/sifli/epic/lv_sifli_epic_osa.su ./Middlewares/lvgl/src/draw/sifli/epic/lv_sifli_epic_utils.cyclo ./Middlewares/lvgl/src/draw/sifli/epic/lv_sifli_epic_utils.d ./Middlewares/lvgl/src/draw/sifli/epic/lv_sifli_epic_utils.o ./Middlewares/lvgl/src/draw/sifli/epic/lv_sifli_epic_utils.su

.PHONY: clean-Middlewares-2f-lvgl-2f-src-2f-draw-2f-sifli-2f-epic

