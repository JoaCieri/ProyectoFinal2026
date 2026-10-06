################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/draw/nxp/pxp/lv_draw_buf_pxp.c \
../Libs/lvgl/src/draw/nxp/pxp/lv_draw_pxp.c \
../Libs/lvgl/src/draw/nxp/pxp/lv_draw_pxp_fill.c \
../Libs/lvgl/src/draw/nxp/pxp/lv_draw_pxp_img.c \
../Libs/lvgl/src/draw/nxp/pxp/lv_draw_pxp_layer.c \
../Libs/lvgl/src/draw/nxp/pxp/lv_pxp_cfg.c \
../Libs/lvgl/src/draw/nxp/pxp/lv_pxp_osa.c \
../Libs/lvgl/src/draw/nxp/pxp/lv_pxp_utils.c 

OBJS += \
./Libs/lvgl/src/draw/nxp/pxp/lv_draw_buf_pxp.o \
./Libs/lvgl/src/draw/nxp/pxp/lv_draw_pxp.o \
./Libs/lvgl/src/draw/nxp/pxp/lv_draw_pxp_fill.o \
./Libs/lvgl/src/draw/nxp/pxp/lv_draw_pxp_img.o \
./Libs/lvgl/src/draw/nxp/pxp/lv_draw_pxp_layer.o \
./Libs/lvgl/src/draw/nxp/pxp/lv_pxp_cfg.o \
./Libs/lvgl/src/draw/nxp/pxp/lv_pxp_osa.o \
./Libs/lvgl/src/draw/nxp/pxp/lv_pxp_utils.o 

C_DEPS += \
./Libs/lvgl/src/draw/nxp/pxp/lv_draw_buf_pxp.d \
./Libs/lvgl/src/draw/nxp/pxp/lv_draw_pxp.d \
./Libs/lvgl/src/draw/nxp/pxp/lv_draw_pxp_fill.d \
./Libs/lvgl/src/draw/nxp/pxp/lv_draw_pxp_img.d \
./Libs/lvgl/src/draw/nxp/pxp/lv_draw_pxp_layer.d \
./Libs/lvgl/src/draw/nxp/pxp/lv_pxp_cfg.d \
./Libs/lvgl/src/draw/nxp/pxp/lv_pxp_osa.d \
./Libs/lvgl/src/draw/nxp/pxp/lv_pxp_utils.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/draw/nxp/pxp/%.o Libs/lvgl/src/draw/nxp/pxp/%.su Libs/lvgl/src/draw/nxp/pxp/%.cyclo: ../Libs/lvgl/src/draw/nxp/pxp/%.c Libs/lvgl/src/draw/nxp/pxp/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-draw-2f-nxp-2f-pxp

clean-Libs-2f-lvgl-2f-src-2f-draw-2f-nxp-2f-pxp:
	-$(RM) ./Libs/lvgl/src/draw/nxp/pxp/lv_draw_buf_pxp.cyclo ./Libs/lvgl/src/draw/nxp/pxp/lv_draw_buf_pxp.d ./Libs/lvgl/src/draw/nxp/pxp/lv_draw_buf_pxp.o ./Libs/lvgl/src/draw/nxp/pxp/lv_draw_buf_pxp.su ./Libs/lvgl/src/draw/nxp/pxp/lv_draw_pxp.cyclo ./Libs/lvgl/src/draw/nxp/pxp/lv_draw_pxp.d ./Libs/lvgl/src/draw/nxp/pxp/lv_draw_pxp.o ./Libs/lvgl/src/draw/nxp/pxp/lv_draw_pxp.su ./Libs/lvgl/src/draw/nxp/pxp/lv_draw_pxp_fill.cyclo ./Libs/lvgl/src/draw/nxp/pxp/lv_draw_pxp_fill.d ./Libs/lvgl/src/draw/nxp/pxp/lv_draw_pxp_fill.o ./Libs/lvgl/src/draw/nxp/pxp/lv_draw_pxp_fill.su ./Libs/lvgl/src/draw/nxp/pxp/lv_draw_pxp_img.cyclo ./Libs/lvgl/src/draw/nxp/pxp/lv_draw_pxp_img.d ./Libs/lvgl/src/draw/nxp/pxp/lv_draw_pxp_img.o ./Libs/lvgl/src/draw/nxp/pxp/lv_draw_pxp_img.su ./Libs/lvgl/src/draw/nxp/pxp/lv_draw_pxp_layer.cyclo ./Libs/lvgl/src/draw/nxp/pxp/lv_draw_pxp_layer.d ./Libs/lvgl/src/draw/nxp/pxp/lv_draw_pxp_layer.o ./Libs/lvgl/src/draw/nxp/pxp/lv_draw_pxp_layer.su ./Libs/lvgl/src/draw/nxp/pxp/lv_pxp_cfg.cyclo ./Libs/lvgl/src/draw/nxp/pxp/lv_pxp_cfg.d ./Libs/lvgl/src/draw/nxp/pxp/lv_pxp_cfg.o ./Libs/lvgl/src/draw/nxp/pxp/lv_pxp_cfg.su ./Libs/lvgl/src/draw/nxp/pxp/lv_pxp_osa.cyclo ./Libs/lvgl/src/draw/nxp/pxp/lv_pxp_osa.d ./Libs/lvgl/src/draw/nxp/pxp/lv_pxp_osa.o ./Libs/lvgl/src/draw/nxp/pxp/lv_pxp_osa.su ./Libs/lvgl/src/draw/nxp/pxp/lv_pxp_utils.cyclo ./Libs/lvgl/src/draw/nxp/pxp/lv_pxp_utils.d ./Libs/lvgl/src/draw/nxp/pxp/lv_pxp_utils.o ./Libs/lvgl/src/draw/nxp/pxp/lv_pxp_utils.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-draw-2f-nxp-2f-pxp

