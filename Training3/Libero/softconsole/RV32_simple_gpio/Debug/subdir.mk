################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../main.c 

OBJS += \
./main.o 

C_DEPS += \
./main.d 


# Each subdirectory must supply rules for building sources it contributes
%.o: ../%.c subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv64-unknown-elf-gcc -march=rv32imc -mabi=ilp32 -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -DMIV_RV32IMC -I"C:\legup\examples\github_example\training_libero_projects\training3\softconsole\RV32_simple_gpio" -I"C:\legup\examples\github_example\training_libero_projects\training3\softconsole\RV32_simple_gpio\hal" -I"C:\legup\examples\github_example\training_libero_projects\training3\softconsole\RV32_simple_gpio\riscv_hal" -I"C:\legup\examples\github_example\training_libero_projects\training3\softconsole\RV32_simple_gpio\drivers\CoreUARTapb" -I"C:\legup\examples\github_example\training_libero_projects\training3\softconsole\RV32_simple_gpio\drivers\CoreI2C" -I"C:\legup\examples\github_example\training_libero_projects\training3\softconsole\RV32_simple_gpio\drivers\CoreGPIO" -I"C:\legup\examples\github_example\training_libero_projects\training3\softconsole\RV32_simple_gpio\application\hdmi_config" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


