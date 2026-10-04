################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl/src/draw/nxp/g2d/lv_draw_buf_g2d.c \
../Middlewares/lvgl/src/draw/nxp/g2d/lv_draw_g2d.c \
../Middlewares/lvgl/src/draw/nxp/g2d/lv_draw_g2d_fill.c \
../Middlewares/lvgl/src/draw/nxp/g2d/lv_draw_g2d_img.c \
../Middlewares/lvgl/src/draw/nxp/g2d/lv_g2d_buf_map.c \
../Middlewares/lvgl/src/draw/nxp/g2d/lv_g2d_utils.c 

OBJS += \
./Middlewares/lvgl/src/draw/nxp/g2d/lv_draw_buf_g2d.o \
./Middlewares/lvgl/src/draw/nxp/g2d/lv_draw_g2d.o \
./Middlewares/lvgl/src/draw/nxp/g2d/lv_draw_g2d_fill.o \
./Middlewares/lvgl/src/draw/nxp/g2d/lv_draw_g2d_img.o \
./Middlewares/lvgl/src/draw/nxp/g2d/lv_g2d_buf_map.o \
./Middlewares/lvgl/src/draw/nxp/g2d/lv_g2d_utils.o 

C_DEPS += \
./Middlewares/lvgl/src/draw/nxp/g2d/lv_draw_buf_g2d.d \
./Middlewares/lvgl/src/draw/nxp/g2d/lv_draw_g2d.d \
./Middlewares/lvgl/src/draw/nxp/g2d/lv_draw_g2d_fill.d \
./Middlewares/lvgl/src/draw/nxp/g2d/lv_draw_g2d_img.d \
./Middlewares/lvgl/src/draw/nxp/g2d/lv_g2d_buf_map.d \
./Middlewares/lvgl/src/draw/nxp/g2d/lv_g2d_utils.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl/src/draw/nxp/g2d/%.o Middlewares/lvgl/src/draw/nxp/g2d/%.su Middlewares/lvgl/src/draw/nxp/g2d/%.cyclo: ../Middlewares/lvgl/src/draw/nxp/g2d/%.c Middlewares/lvgl/src/draw/nxp/g2d/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl-2f-src-2f-draw-2f-nxp-2f-g2d

clean-Middlewares-2f-lvgl-2f-src-2f-draw-2f-nxp-2f-g2d:
	-$(RM) ./Middlewares/lvgl/src/draw/nxp/g2d/lv_draw_buf_g2d.cyclo ./Middlewares/lvgl/src/draw/nxp/g2d/lv_draw_buf_g2d.d ./Middlewares/lvgl/src/draw/nxp/g2d/lv_draw_buf_g2d.o ./Middlewares/lvgl/src/draw/nxp/g2d/lv_draw_buf_g2d.su ./Middlewares/lvgl/src/draw/nxp/g2d/lv_draw_g2d.cyclo ./Middlewares/lvgl/src/draw/nxp/g2d/lv_draw_g2d.d ./Middlewares/lvgl/src/draw/nxp/g2d/lv_draw_g2d.o ./Middlewares/lvgl/src/draw/nxp/g2d/lv_draw_g2d.su ./Middlewares/lvgl/src/draw/nxp/g2d/lv_draw_g2d_fill.cyclo ./Middlewares/lvgl/src/draw/nxp/g2d/lv_draw_g2d_fill.d ./Middlewares/lvgl/src/draw/nxp/g2d/lv_draw_g2d_fill.o ./Middlewares/lvgl/src/draw/nxp/g2d/lv_draw_g2d_fill.su ./Middlewares/lvgl/src/draw/nxp/g2d/lv_draw_g2d_img.cyclo ./Middlewares/lvgl/src/draw/nxp/g2d/lv_draw_g2d_img.d ./Middlewares/lvgl/src/draw/nxp/g2d/lv_draw_g2d_img.o ./Middlewares/lvgl/src/draw/nxp/g2d/lv_draw_g2d_img.su ./Middlewares/lvgl/src/draw/nxp/g2d/lv_g2d_buf_map.cyclo ./Middlewares/lvgl/src/draw/nxp/g2d/lv_g2d_buf_map.d ./Middlewares/lvgl/src/draw/nxp/g2d/lv_g2d_buf_map.o ./Middlewares/lvgl/src/draw/nxp/g2d/lv_g2d_buf_map.su ./Middlewares/lvgl/src/draw/nxp/g2d/lv_g2d_utils.cyclo ./Middlewares/lvgl/src/draw/nxp/g2d/lv_g2d_utils.d ./Middlewares/lvgl/src/draw/nxp/g2d/lv_g2d_utils.o ./Middlewares/lvgl/src/draw/nxp/g2d/lv_g2d_utils.su

.PHONY: clean-Middlewares-2f-lvgl-2f-src-2f-draw-2f-nxp-2f-g2d

