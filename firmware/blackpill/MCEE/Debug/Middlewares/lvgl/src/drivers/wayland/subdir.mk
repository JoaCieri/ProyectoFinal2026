################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl/src/drivers/wayland/lv_wayland.c \
../Middlewares/lvgl/src/drivers/wayland/lv_wayland_backend.c \
../Middlewares/lvgl/src/drivers/wayland/lv_wayland_backend_dmabuf.c \
../Middlewares/lvgl/src/drivers/wayland/lv_wayland_backend_egl.c \
../Middlewares/lvgl/src/drivers/wayland/lv_wayland_backend_g2d.c \
../Middlewares/lvgl/src/drivers/wayland/lv_wayland_backend_shm.c \
../Middlewares/lvgl/src/drivers/wayland/lv_wayland_dmabuf.c \
../Middlewares/lvgl/src/drivers/wayland/lv_wayland_keyboard.c \
../Middlewares/lvgl/src/drivers/wayland/lv_wayland_pointer.c \
../Middlewares/lvgl/src/drivers/wayland/lv_wayland_seat.c \
../Middlewares/lvgl/src/drivers/wayland/lv_wayland_touch.c \
../Middlewares/lvgl/src/drivers/wayland/lv_wayland_window.c \
../Middlewares/lvgl/src/drivers/wayland/lv_wayland_xdg_shell.c 

OBJS += \
./Middlewares/lvgl/src/drivers/wayland/lv_wayland.o \
./Middlewares/lvgl/src/drivers/wayland/lv_wayland_backend.o \
./Middlewares/lvgl/src/drivers/wayland/lv_wayland_backend_dmabuf.o \
./Middlewares/lvgl/src/drivers/wayland/lv_wayland_backend_egl.o \
./Middlewares/lvgl/src/drivers/wayland/lv_wayland_backend_g2d.o \
./Middlewares/lvgl/src/drivers/wayland/lv_wayland_backend_shm.o \
./Middlewares/lvgl/src/drivers/wayland/lv_wayland_dmabuf.o \
./Middlewares/lvgl/src/drivers/wayland/lv_wayland_keyboard.o \
./Middlewares/lvgl/src/drivers/wayland/lv_wayland_pointer.o \
./Middlewares/lvgl/src/drivers/wayland/lv_wayland_seat.o \
./Middlewares/lvgl/src/drivers/wayland/lv_wayland_touch.o \
./Middlewares/lvgl/src/drivers/wayland/lv_wayland_window.o \
./Middlewares/lvgl/src/drivers/wayland/lv_wayland_xdg_shell.o 

C_DEPS += \
./Middlewares/lvgl/src/drivers/wayland/lv_wayland.d \
./Middlewares/lvgl/src/drivers/wayland/lv_wayland_backend.d \
./Middlewares/lvgl/src/drivers/wayland/lv_wayland_backend_dmabuf.d \
./Middlewares/lvgl/src/drivers/wayland/lv_wayland_backend_egl.d \
./Middlewares/lvgl/src/drivers/wayland/lv_wayland_backend_g2d.d \
./Middlewares/lvgl/src/drivers/wayland/lv_wayland_backend_shm.d \
./Middlewares/lvgl/src/drivers/wayland/lv_wayland_dmabuf.d \
./Middlewares/lvgl/src/drivers/wayland/lv_wayland_keyboard.d \
./Middlewares/lvgl/src/drivers/wayland/lv_wayland_pointer.d \
./Middlewares/lvgl/src/drivers/wayland/lv_wayland_seat.d \
./Middlewares/lvgl/src/drivers/wayland/lv_wayland_touch.d \
./Middlewares/lvgl/src/drivers/wayland/lv_wayland_window.d \
./Middlewares/lvgl/src/drivers/wayland/lv_wayland_xdg_shell.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl/src/drivers/wayland/%.o Middlewares/lvgl/src/drivers/wayland/%.su Middlewares/lvgl/src/drivers/wayland/%.cyclo: ../Middlewares/lvgl/src/drivers/wayland/%.c Middlewares/lvgl/src/drivers/wayland/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -DLV_CONF_INCLUDE_SIMPLE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl" -I"C:/Users/igles/Documents/Github/ProyectoFinal2026/firmware/blackpill/MCEE/Middlewares/lvgl/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl-2f-src-2f-drivers-2f-wayland

clean-Middlewares-2f-lvgl-2f-src-2f-drivers-2f-wayland:
	-$(RM) ./Middlewares/lvgl/src/drivers/wayland/lv_wayland.cyclo ./Middlewares/lvgl/src/drivers/wayland/lv_wayland.d ./Middlewares/lvgl/src/drivers/wayland/lv_wayland.o ./Middlewares/lvgl/src/drivers/wayland/lv_wayland.su ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_backend.cyclo ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_backend.d ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_backend.o ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_backend.su ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_backend_dmabuf.cyclo ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_backend_dmabuf.d ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_backend_dmabuf.o ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_backend_dmabuf.su ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_backend_egl.cyclo ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_backend_egl.d ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_backend_egl.o ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_backend_egl.su ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_backend_g2d.cyclo ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_backend_g2d.d ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_backend_g2d.o ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_backend_g2d.su ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_backend_shm.cyclo ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_backend_shm.d ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_backend_shm.o ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_backend_shm.su ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_dmabuf.cyclo ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_dmabuf.d ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_dmabuf.o ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_dmabuf.su ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_keyboard.cyclo ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_keyboard.d ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_keyboard.o ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_keyboard.su ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_pointer.cyclo ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_pointer.d ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_pointer.o ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_pointer.su ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_seat.cyclo ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_seat.d ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_seat.o ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_seat.su ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_touch.cyclo ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_touch.d ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_touch.o ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_touch.su ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_window.cyclo ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_window.d ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_window.o ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_window.su ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_xdg_shell.cyclo ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_xdg_shell.d ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_xdg_shell.o ./Middlewares/lvgl/src/drivers/wayland/lv_wayland_xdg_shell.su

.PHONY: clean-Middlewares-2f-lvgl-2f-src-2f-drivers-2f-wayland

