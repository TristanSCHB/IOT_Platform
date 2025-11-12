################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/BSP/Components/lps22hb/lps22hb.c \
../Drivers/BSP/Components/lps22hb/lps22hb_reg.c 

OBJS += \
./Drivers/BSP/Components/lps22hb/lps22hb.o \
./Drivers/BSP/Components/lps22hb/lps22hb_reg.o 

C_DEPS += \
./Drivers/BSP/Components/lps22hb/lps22hb.d \
./Drivers/BSP/Components/lps22hb/lps22hb_reg.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/Components/lps22hb/%.o Drivers/BSP/Components/lps22hb/%.su Drivers/BSP/Components/lps22hb/%.cyclo: ../Drivers/BSP/Components/lps22hb/%.c Drivers/BSP/Components/lps22hb/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L053xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../BlueNRG_MS/App -I../BlueNRG_MS/Target -I../X-CUBE-MEMS1/Target -I../Drivers/BSP/STM32L0xx_Nucleo -I../Drivers/BSP/Components/Common -I../Middlewares/ST/BlueNRG-MS/utils -I../Middlewares/ST/BlueNRG-MS/includes -I../Middlewares/ST/BlueNRG-MS/hci/hci_tl_patterns/Basic -I../Drivers/BSP/Components/lsm6dsl -I../Drivers/BSP/Components/lsm303agr -I../Drivers/BSP/Components/hts221 -I../Drivers/BSP/Components/lps22hb -I../Drivers/BSP/IKS01A2 -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Drivers-2f-BSP-2f-Components-2f-lps22hb

clean-Drivers-2f-BSP-2f-Components-2f-lps22hb:
	-$(RM) ./Drivers/BSP/Components/lps22hb/lps22hb.cyclo ./Drivers/BSP/Components/lps22hb/lps22hb.d ./Drivers/BSP/Components/lps22hb/lps22hb.o ./Drivers/BSP/Components/lps22hb/lps22hb.su ./Drivers/BSP/Components/lps22hb/lps22hb_reg.cyclo ./Drivers/BSP/Components/lps22hb/lps22hb_reg.d ./Drivers/BSP/Components/lps22hb/lps22hb_reg.o ./Drivers/BSP/Components/lps22hb/lps22hb_reg.su

.PHONY: clean-Drivers-2f-BSP-2f-Components-2f-lps22hb

