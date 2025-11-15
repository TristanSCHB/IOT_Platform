################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../BlueNRG_MS/App/app_bluenrg_ms.c \
../BlueNRG_MS/App/gatt_db.c \
../BlueNRG_MS/App/sensor.c 

OBJS += \
./BlueNRG_MS/App/app_bluenrg_ms.o \
./BlueNRG_MS/App/gatt_db.o \
./BlueNRG_MS/App/sensor.o 

C_DEPS += \
./BlueNRG_MS/App/app_bluenrg_ms.d \
./BlueNRG_MS/App/gatt_db.d \
./BlueNRG_MS/App/sensor.d 


# Each subdirectory must supply rules for building sources it contributes
BlueNRG_MS/App/%.o BlueNRG_MS/App/%.su BlueNRG_MS/App/%.cyclo: ../BlueNRG_MS/App/%.c BlueNRG_MS/App/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L053xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../BlueNRG_MS/App -I../BlueNRG_MS/Target -I../X-CUBE-MEMS1/Target -I../Drivers/BSP/STM32L0xx_Nucleo -I../Drivers/BSP/Components/Common -I../Middlewares/ST/BlueNRG-MS/utils -I../Middlewares/ST/BlueNRG-MS/includes -I../Middlewares/ST/BlueNRG-MS/hci/hci_tl_patterns/Basic -I../Drivers/BSP/Components/lsm6dsl -I../Drivers/BSP/Components/lsm303agr -I../Drivers/BSP/Components/hts221 -I../Drivers/BSP/Components/lps22hb -I../Drivers/BSP/IKS01A2 -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-BlueNRG_MS-2f-App

clean-BlueNRG_MS-2f-App:
	-$(RM) ./BlueNRG_MS/App/app_bluenrg_ms.cyclo ./BlueNRG_MS/App/app_bluenrg_ms.d ./BlueNRG_MS/App/app_bluenrg_ms.o ./BlueNRG_MS/App/app_bluenrg_ms.su ./BlueNRG_MS/App/gatt_db.cyclo ./BlueNRG_MS/App/gatt_db.d ./BlueNRG_MS/App/gatt_db.o ./BlueNRG_MS/App/gatt_db.su ./BlueNRG_MS/App/sensor.cyclo ./BlueNRG_MS/App/sensor.d ./BlueNRG_MS/App/sensor.o ./BlueNRG_MS/App/sensor.su

.PHONY: clean-BlueNRG_MS-2f-App

