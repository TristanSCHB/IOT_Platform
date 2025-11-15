################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include Middlewares/ST/BlueNRG-MS/utils/subdir.mk
-include Middlewares/ST/BlueNRG-MS/hci/hci_tl_patterns/Basic/subdir.mk
-include Middlewares/ST/BlueNRG-MS/hci/controller/subdir.mk
-include Middlewares/ST/BlueNRG-MS/hci/subdir.mk
-include Drivers/STM32L0xx_HAL_Driver/Src/subdir.mk
-include Drivers/BSP/STM32L0xx_Nucleo/subdir.mk
-include Drivers/BSP/IKS01A2/subdir.mk
-include Drivers/BSP/Components/lsm6dsl/subdir.mk
-include Drivers/BSP/Components/lsm303agr/subdir.mk
-include Drivers/BSP/Components/lps22hb/subdir.mk
-include Drivers/BSP/Components/hts221/subdir.mk
-include Core/Startup/subdir.mk
-include Core/Src/subdir.mk
-include BlueNRG_MS/Target/subdir.mk
-include BlueNRG_MS/App/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

OPTIONAL_TOOL_DEPS := \
$(wildcard ../makefile.defs) \
$(wildcard ../makefile.init) \
$(wildcard ../makefile.targets) \


BUILD_ARTIFACT_NAME := ACACIO
BUILD_ARTIFACT_EXTENSION := elf
BUILD_ARTIFACT_PREFIX :=
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME)$(if $(BUILD_ARTIFACT_EXTENSION),.$(BUILD_ARTIFACT_EXTENSION),)

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
ACACIO.elf \

MAP_FILES += \
ACACIO.map \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
ACACIO.list \


# All Target
all: main-build

# Main-build Target
main-build: ACACIO.elf secondary-outputs

# Tool invocations
ACACIO.elf ACACIO.map: $(OBJS) $(USER_OBJS) C:\Users\trist\STM32CubeIDE\workspace_1.18.0\ACACIO\STM32L053R8TX_FLASH.ld makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-gcc -o "ACACIO.elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m0plus -T"C:\Users\trist\STM32CubeIDE\workspace_1.18.0\ACACIO\STM32L053R8TX_FLASH.ld" --specs=nosys.specs -Wl,-Map="ACACIO.map" -Wl,--gc-sections -static --specs=nano.specs -mfloat-abi=soft -mthumb -Wl,--start-group -lc -lm -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

ACACIO.list: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "ACACIO.list"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) ACACIO.elf ACACIO.list ACACIO.map default.size.stdout
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST)

fail-specified-linker-script-missing:
	@echo 'Error: Cannot find the specified linker script. Check the linker settings in the build configuration.'
	@exit 2

warn-no-linker-script-specified:
	@echo 'Warning: No linker script specified. Check the linker settings in the build configuration.'

.PHONY: all clean dependents main-build fail-specified-linker-script-missing warn-no-linker-script-specified

-include ../makefile.targets
