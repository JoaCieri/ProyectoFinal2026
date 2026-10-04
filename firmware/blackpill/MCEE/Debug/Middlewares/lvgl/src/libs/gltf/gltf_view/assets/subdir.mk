################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl/src/libs/gltf/gltf_view/assets/chromatic.c \
../Middlewares/lvgl/src/libs/gltf/gltf_view/assets/lv_gltf_view_shader.c 

OBJS += \
./Middlewares/lvgl/src/libs/gltf/gltf_view/assets/chromatic.o \
./Middlewares/lvgl/src/libs/gltf/gltf_view/assets/lv_gltf_view_shader.o 

C_DEPS += \
./Middlewares/lvgl/src/libs/gltf/gltf_view/assets/chromatic.d \
./Middlewares/lvgl/src/libs/gltf/gltf_view/assets/lv_gltf_view_shader.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl/src/libs/gltf/gltf_view/assets/%.o Middlewares/lvgl/src/libs/gltf/gltf_view/assets/%.su Middlewares/lvgl/src/libs/gltf/gltf_view/assets/%.cyclo: ../Middlewares/lvgl/src/libs/gltf/gltf_view/assets/%.c Middlewares/lvgl/src/libs/gltf/gltf_view/assets/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl-2f-src-2f-libs-2f-gltf-2f-gltf_view-2f-assets

clean-Middlewares-2f-lvgl-2f-src-2f-libs-2f-gltf-2f-gltf_view-2f-assets:
	-$(RM) ./Middlewares/lvgl/src/libs/gltf/gltf_view/assets/chromatic.cyclo ./Middlewares/lvgl/src/libs/gltf/gltf_view/assets/chromatic.d ./Middlewares/lvgl/src/libs/gltf/gltf_view/assets/chromatic.o ./Middlewares/lvgl/src/libs/gltf/gltf_view/assets/chromatic.su ./Middlewares/lvgl/src/libs/gltf/gltf_view/assets/lv_gltf_view_shader.cyclo ./Middlewares/lvgl/src/libs/gltf/gltf_view/assets/lv_gltf_view_shader.d ./Middlewares/lvgl/src/libs/gltf/gltf_view/assets/lv_gltf_view_shader.o ./Middlewares/lvgl/src/libs/gltf/gltf_view/assets/lv_gltf_view_shader.su

.PHONY: clean-Middlewares-2f-lvgl-2f-src-2f-libs-2f-gltf-2f-gltf_view-2f-assets

