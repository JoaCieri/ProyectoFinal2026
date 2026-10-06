################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/lvgl/src/drivers/wayland/lv_wayland.c \
../Libs/lvgl/src/drivers/wayland/lv_wayland_backend.c \
../Libs/lvgl/src/drivers/wayland/lv_wayland_backend_dmabuf.c \
../Libs/lvgl/src/drivers/wayland/lv_wayland_backend_egl.c \
../Libs/lvgl/src/drivers/wayland/lv_wayland_backend_g2d.c \
../Libs/lvgl/src/drivers/wayland/lv_wayland_backend_shm.c \
../Libs/lvgl/src/drivers/wayland/lv_wayland_dmabuf.c \
../Libs/lvgl/src/drivers/wayland/lv_wayland_keyboard.c \
../Libs/lvgl/src/drivers/wayland/lv_wayland_pointer.c \
../Libs/lvgl/src/drivers/wayland/lv_wayland_seat.c \
../Libs/lvgl/src/drivers/wayland/lv_wayland_touch.c \
../Libs/lvgl/src/drivers/wayland/lv_wayland_window.c \
../Libs/lvgl/src/drivers/wayland/lv_wayland_xdg_shell.c 

OBJS += \
./Libs/lvgl/src/drivers/wayland/lv_wayland.o \
./Libs/lvgl/src/drivers/wayland/lv_wayland_backend.o \
./Libs/lvgl/src/drivers/wayland/lv_wayland_backend_dmabuf.o \
./Libs/lvgl/src/drivers/wayland/lv_wayland_backend_egl.o \
./Libs/lvgl/src/drivers/wayland/lv_wayland_backend_g2d.o \
./Libs/lvgl/src/drivers/wayland/lv_wayland_backend_shm.o \
./Libs/lvgl/src/drivers/wayland/lv_wayland_dmabuf.o \
./Libs/lvgl/src/drivers/wayland/lv_wayland_keyboard.o \
./Libs/lvgl/src/drivers/wayland/lv_wayland_pointer.o \
./Libs/lvgl/src/drivers/wayland/lv_wayland_seat.o \
./Libs/lvgl/src/drivers/wayland/lv_wayland_touch.o \
./Libs/lvgl/src/drivers/wayland/lv_wayland_window.o \
./Libs/lvgl/src/drivers/wayland/lv_wayland_xdg_shell.o 

C_DEPS += \
./Libs/lvgl/src/drivers/wayland/lv_wayland.d \
./Libs/lvgl/src/drivers/wayland/lv_wayland_backend.d \
./Libs/lvgl/src/drivers/wayland/lv_wayland_backend_dmabuf.d \
./Libs/lvgl/src/drivers/wayland/lv_wayland_backend_egl.d \
./Libs/lvgl/src/drivers/wayland/lv_wayland_backend_g2d.d \
./Libs/lvgl/src/drivers/wayland/lv_wayland_backend_shm.d \
./Libs/lvgl/src/drivers/wayland/lv_wayland_dmabuf.d \
./Libs/lvgl/src/drivers/wayland/lv_wayland_keyboard.d \
./Libs/lvgl/src/drivers/wayland/lv_wayland_pointer.d \
./Libs/lvgl/src/drivers/wayland/lv_wayland_seat.d \
./Libs/lvgl/src/drivers/wayland/lv_wayland_touch.d \
./Libs/lvgl/src/drivers/wayland/lv_wayland_window.d \
./Libs/lvgl/src/drivers/wayland/lv_wayland_xdg_shell.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/lvgl/src/drivers/wayland/%.o Libs/lvgl/src/drivers/wayland/%.su Libs/lvgl/src/drivers/wayland/%.cyclo: ../Libs/lvgl/src/drivers/wayland/%.c Libs/lvgl/src/drivers/wayland/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Libs/lvgl/include" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-lvgl-2f-src-2f-drivers-2f-wayland

clean-Libs-2f-lvgl-2f-src-2f-drivers-2f-wayland:
	-$(RM) ./Libs/lvgl/src/drivers/wayland/lv_wayland.cyclo ./Libs/lvgl/src/drivers/wayland/lv_wayland.d ./Libs/lvgl/src/drivers/wayland/lv_wayland.o ./Libs/lvgl/src/drivers/wayland/lv_wayland.su ./Libs/lvgl/src/drivers/wayland/lv_wayland_backend.cyclo ./Libs/lvgl/src/drivers/wayland/lv_wayland_backend.d ./Libs/lvgl/src/drivers/wayland/lv_wayland_backend.o ./Libs/lvgl/src/drivers/wayland/lv_wayland_backend.su ./Libs/lvgl/src/drivers/wayland/lv_wayland_backend_dmabuf.cyclo ./Libs/lvgl/src/drivers/wayland/lv_wayland_backend_dmabuf.d ./Libs/lvgl/src/drivers/wayland/lv_wayland_backend_dmabuf.o ./Libs/lvgl/src/drivers/wayland/lv_wayland_backend_dmabuf.su ./Libs/lvgl/src/drivers/wayland/lv_wayland_backend_egl.cyclo ./Libs/lvgl/src/drivers/wayland/lv_wayland_backend_egl.d ./Libs/lvgl/src/drivers/wayland/lv_wayland_backend_egl.o ./Libs/lvgl/src/drivers/wayland/lv_wayland_backend_egl.su ./Libs/lvgl/src/drivers/wayland/lv_wayland_backend_g2d.cyclo ./Libs/lvgl/src/drivers/wayland/lv_wayland_backend_g2d.d ./Libs/lvgl/src/drivers/wayland/lv_wayland_backend_g2d.o ./Libs/lvgl/src/drivers/wayland/lv_wayland_backend_g2d.su ./Libs/lvgl/src/drivers/wayland/lv_wayland_backend_shm.cyclo ./Libs/lvgl/src/drivers/wayland/lv_wayland_backend_shm.d ./Libs/lvgl/src/drivers/wayland/lv_wayland_backend_shm.o ./Libs/lvgl/src/drivers/wayland/lv_wayland_backend_shm.su ./Libs/lvgl/src/drivers/wayland/lv_wayland_dmabuf.cyclo ./Libs/lvgl/src/drivers/wayland/lv_wayland_dmabuf.d ./Libs/lvgl/src/drivers/wayland/lv_wayland_dmabuf.o ./Libs/lvgl/src/drivers/wayland/lv_wayland_dmabuf.su ./Libs/lvgl/src/drivers/wayland/lv_wayland_keyboard.cyclo ./Libs/lvgl/src/drivers/wayland/lv_wayland_keyboard.d ./Libs/lvgl/src/drivers/wayland/lv_wayland_keyboard.o ./Libs/lvgl/src/drivers/wayland/lv_wayland_keyboard.su ./Libs/lvgl/src/drivers/wayland/lv_wayland_pointer.cyclo ./Libs/lvgl/src/drivers/wayland/lv_wayland_pointer.d ./Libs/lvgl/src/drivers/wayland/lv_wayland_pointer.o ./Libs/lvgl/src/drivers/wayland/lv_wayland_pointer.su ./Libs/lvgl/src/drivers/wayland/lv_wayland_seat.cyclo ./Libs/lvgl/src/drivers/wayland/lv_wayland_seat.d ./Libs/lvgl/src/drivers/wayland/lv_wayland_seat.o ./Libs/lvgl/src/drivers/wayland/lv_wayland_seat.su ./Libs/lvgl/src/drivers/wayland/lv_wayland_touch.cyclo ./Libs/lvgl/src/drivers/wayland/lv_wayland_touch.d ./Libs/lvgl/src/drivers/wayland/lv_wayland_touch.o ./Libs/lvgl/src/drivers/wayland/lv_wayland_touch.su ./Libs/lvgl/src/drivers/wayland/lv_wayland_window.cyclo ./Libs/lvgl/src/drivers/wayland/lv_wayland_window.d ./Libs/lvgl/src/drivers/wayland/lv_wayland_window.o ./Libs/lvgl/src/drivers/wayland/lv_wayland_window.su ./Libs/lvgl/src/drivers/wayland/lv_wayland_xdg_shell.cyclo ./Libs/lvgl/src/drivers/wayland/lv_wayland_xdg_shell.d ./Libs/lvgl/src/drivers/wayland/lv_wayland_xdg_shell.o ./Libs/lvgl/src/drivers/wayland/lv_wayland_xdg_shell.su

.PHONY: clean-Libs-2f-lvgl-2f-src-2f-drivers-2f-wayland

