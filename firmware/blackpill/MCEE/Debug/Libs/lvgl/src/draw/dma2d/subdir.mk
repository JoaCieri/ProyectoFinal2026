################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/draw/dma2d/lv_draw_dma2d.c \
../Libs/lvgl/src/draw/dma2d/lv_draw_dma2d_fill.c \
../Libs/lvgl/src/draw/dma2d/lv_draw_dma2d_img.c 

OBJS += \
./Libs/lvgl/src/draw/dma2d/lv_draw_dma2d.o \
./Libs/lvgl/src/draw/dma2d/lv_draw_dma2d_fill.o \
./Libs/lvgl/src/draw/dma2d/lv_draw_dma2d_img.o 

C_DEPS += \
./Libs/lvgl/src/draw/dma2d/lv_draw_dma2d.d \
./Libs/lvgl/src/draw/dma2d/lv_draw_dma2d_fill.d \
./Libs/lvgl/src/draw/dma2d/lv_draw_dma2d_img.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/draw/dma2d/%.o Libs/lvgl/src/draw/dma2d/%.su Libs/lvgl/src/draw/dma2d/%.cyclo: ../Libs/lvgl/src/draw/dma2d/%.c Libs/lvgl/src/draw/dma2d/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-draw-2f-dma2d

clean-Libs-2f-lvgl-2f-src-2f-draw-2f-dma2d:
	-$(RM) ./Libs/lvgl/src/draw/dma2d/lv_draw_dma2d.cyclo ./Libs/lvgl/src/draw/dma2d/lv_draw_dma2d.d ./Libs/lvgl/src/draw/dma2d/lv_draw_dma2d.o ./Libs/lvgl/src/draw/dma2d/lv_draw_dma2d.su ./Libs/lvgl/src/draw/dma2d/lv_draw_dma2d_fill.cyclo ./Libs/lvgl/src/draw/dma2d/lv_draw_dma2d_fill.d ./Libs/lvgl/src/draw/dma2d/lv_draw_dma2d_fill.o ./Libs/lvgl/src/draw/dma2d/lv_draw_dma2d_fill.su ./Libs/lvgl/src/draw/dma2d/lv_draw_dma2d_img.cyclo ./Libs/lvgl/src/draw/dma2d/lv_draw_dma2d_img.d ./Libs/lvgl/src/draw/dma2d/lv_draw_dma2d_img.o ./Libs/lvgl/src/draw/dma2d/lv_draw_dma2d_img.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-draw-2f-dma2d

