################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/draw/nxp/g2d/lv_draw_buf_g2d.c \
../Libs/lvgl/src/draw/nxp/g2d/lv_draw_g2d.c \
../Libs/lvgl/src/draw/nxp/g2d/lv_draw_g2d_fill.c \
../Libs/lvgl/src/draw/nxp/g2d/lv_draw_g2d_img.c \
../Libs/lvgl/src/draw/nxp/g2d/lv_g2d_buf_map.c \
../Libs/lvgl/src/draw/nxp/g2d/lv_g2d_utils.c 

OBJS += \
./Libs/lvgl/src/draw/nxp/g2d/lv_draw_buf_g2d.o \
./Libs/lvgl/src/draw/nxp/g2d/lv_draw_g2d.o \
./Libs/lvgl/src/draw/nxp/g2d/lv_draw_g2d_fill.o \
./Libs/lvgl/src/draw/nxp/g2d/lv_draw_g2d_img.o \
./Libs/lvgl/src/draw/nxp/g2d/lv_g2d_buf_map.o \
./Libs/lvgl/src/draw/nxp/g2d/lv_g2d_utils.o 

C_DEPS += \
./Libs/lvgl/src/draw/nxp/g2d/lv_draw_buf_g2d.d \
./Libs/lvgl/src/draw/nxp/g2d/lv_draw_g2d.d \
./Libs/lvgl/src/draw/nxp/g2d/lv_draw_g2d_fill.d \
./Libs/lvgl/src/draw/nxp/g2d/lv_draw_g2d_img.d \
./Libs/lvgl/src/draw/nxp/g2d/lv_g2d_buf_map.d \
./Libs/lvgl/src/draw/nxp/g2d/lv_g2d_utils.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/draw/nxp/g2d/%.o Libs/lvgl/src/draw/nxp/g2d/%.su Libs/lvgl/src/draw/nxp/g2d/%.cyclo: ../Libs/lvgl/src/draw/nxp/g2d/%.c Libs/lvgl/src/draw/nxp/g2d/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-draw-2f-nxp-2f-g2d

clean-Libs-2f-lvgl-2f-src-2f-draw-2f-nxp-2f-g2d:
	-$(RM) ./Libs/lvgl/src/draw/nxp/g2d/lv_draw_buf_g2d.cyclo ./Libs/lvgl/src/draw/nxp/g2d/lv_draw_buf_g2d.d ./Libs/lvgl/src/draw/nxp/g2d/lv_draw_buf_g2d.o ./Libs/lvgl/src/draw/nxp/g2d/lv_draw_buf_g2d.su ./Libs/lvgl/src/draw/nxp/g2d/lv_draw_g2d.cyclo ./Libs/lvgl/src/draw/nxp/g2d/lv_draw_g2d.d ./Libs/lvgl/src/draw/nxp/g2d/lv_draw_g2d.o ./Libs/lvgl/src/draw/nxp/g2d/lv_draw_g2d.su ./Libs/lvgl/src/draw/nxp/g2d/lv_draw_g2d_fill.cyclo ./Libs/lvgl/src/draw/nxp/g2d/lv_draw_g2d_fill.d ./Libs/lvgl/src/draw/nxp/g2d/lv_draw_g2d_fill.o ./Libs/lvgl/src/draw/nxp/g2d/lv_draw_g2d_fill.su ./Libs/lvgl/src/draw/nxp/g2d/lv_draw_g2d_img.cyclo ./Libs/lvgl/src/draw/nxp/g2d/lv_draw_g2d_img.d ./Libs/lvgl/src/draw/nxp/g2d/lv_draw_g2d_img.o ./Libs/lvgl/src/draw/nxp/g2d/lv_draw_g2d_img.su ./Libs/lvgl/src/draw/nxp/g2d/lv_g2d_buf_map.cyclo ./Libs/lvgl/src/draw/nxp/g2d/lv_g2d_buf_map.d ./Libs/lvgl/src/draw/nxp/g2d/lv_g2d_buf_map.o ./Libs/lvgl/src/draw/nxp/g2d/lv_g2d_buf_map.su ./Libs/lvgl/src/draw/nxp/g2d/lv_g2d_utils.cyclo ./Libs/lvgl/src/draw/nxp/g2d/lv_g2d_utils.d ./Libs/lvgl/src/draw/nxp/g2d/lv_g2d_utils.o ./Libs/lvgl/src/draw/nxp/g2d/lv_g2d_utils.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-draw-2f-nxp-2f-g2d

