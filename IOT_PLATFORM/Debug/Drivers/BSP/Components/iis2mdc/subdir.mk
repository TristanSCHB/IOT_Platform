################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/BSP/Components/iis2mdc/iis2mdc.c \
../Drivers/BSP/Components/iis2mdc/iis2mdc_reg.c 

OBJS += \
./Drivers/BSP/Components/iis2mdc/iis2mdc.o \
./Drivers/BSP/Components/iis2mdc/iis2mdc_reg.o 

C_DEPS += \
./Drivers/BSP/Components/iis2mdc/iis2mdc.d \
./Drivers/BSP/Components/iis2mdc/iis2mdc_reg.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/Components/iis2mdc/%.o Drivers/BSP/Components/iis2mdc/%.su Drivers/BSP/Components/iis2mdc/%.cyclo: ../Drivers/BSP/Components/iis2mdc/%.c Drivers/BSP/Components/iis2mdc/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L053xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../BlueNRG_MS/App -I../BlueNRG_MS/Target -I../X-CUBE-MEMS1/Target -I../Drivers/BSP/STM32L0xx_Nucleo -I../Drivers/BSP/Components/iis2dlpc -I../Drivers/BSP/Components/iis2mdc -I../Drivers/BSP/Components/ism330dhcx -I../Drivers/BSP/IKS02A1 -I../Drivers/BSP/Components/Common -I../Middlewares/ST/BlueNRG-MS/utils -I../Middlewares/ST/BlueNRG-MS/includes -I../Middlewares/ST/BlueNRG-MS/hci/hci_tl_patterns/Basic -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Drivers-2f-BSP-2f-Components-2f-iis2mdc

clean-Drivers-2f-BSP-2f-Components-2f-iis2mdc:
	-$(RM) ./Drivers/BSP/Components/iis2mdc/iis2mdc.cyclo ./Drivers/BSP/Components/iis2mdc/iis2mdc.d ./Drivers/BSP/Components/iis2mdc/iis2mdc.o ./Drivers/BSP/Components/iis2mdc/iis2mdc.su ./Drivers/BSP/Components/iis2mdc/iis2mdc_reg.cyclo ./Drivers/BSP/Components/iis2mdc/iis2mdc_reg.d ./Drivers/BSP/Components/iis2mdc/iis2mdc_reg.o ./Drivers/BSP/Components/iis2mdc/iis2mdc_reg.su

.PHONY: clean-Drivers-2f-BSP-2f-Components-2f-iis2mdc

