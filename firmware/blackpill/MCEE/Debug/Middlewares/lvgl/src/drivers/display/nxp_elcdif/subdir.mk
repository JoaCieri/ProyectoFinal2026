################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl/src/drivers/display/nxp_elcdif/lv_nxp_elcdif.c 

OBJS += \
./Middlewares/lvgl/src/drivers/display/nxp_elcdif/lv_nxp_elcdif.o 

C_DEPS += \
./Middlewares/lvgl/src/drivers/display/nxp_elcdif/lv_nxp_elcdif.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl/src/drivers/display/nxp_elcdif/%.o Middlewares/lvgl/src/drivers/display/nxp_elcdif/%.su Middlewares/lvgl/src/drivers/display/nxp_elcdif/%.cyclo: ../Middlewares/lvgl/src/drivers/display/nxp_elcdif/%.c Middlewares/lvgl/src/drivers/display/nxp_elcdif/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl-2f-src-2f-drivers-2f-display-2f-nxp_elcdif

clean-Middlewares-2f-lvgl-2f-src-2f-drivers-2f-display-2f-nxp_elcdif:
	-$(RM) ./Middlewares/lvgl/src/drivers/display/nxp_elcdif/lv_nxp_elcdif.cyclo ./Middlewares/lvgl/src/drivers/display/nxp_elcdif/lv_nxp_elcdif.d ./Middlewares/lvgl/src/drivers/display/nxp_elcdif/lv_nxp_elcdif.o ./Middlewares/lvgl/src/drivers/display/nxp_elcdif/lv_nxp_elcdif.su

.PHONY: clean-Middlewares-2f-lvgl-2f-src-2f-drivers-2f-display-2f-nxp_elcdif

