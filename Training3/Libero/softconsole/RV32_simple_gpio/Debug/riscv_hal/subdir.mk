################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../riscv_hal/init.c \
../riscv_hal/riscv_hal.c \
../riscv_hal/riscv_hal_stubs.c \
../riscv_hal/syscall.c 

S_UPPER_SRCS += \
../riscv_hal/entry.S 

OBJS += \
./riscv_hal/entry.o \
./riscv_hal/init.o \
./riscv_hal/riscv_hal.o \
./riscv_hal/riscv_hal_stubs.o \
./riscv_hal/syscall.o 

S_UPPER_DEPS += \
./riscv_hal/entry.d 

C_DEPS += \
./riscv_hal/init.d \
./riscv_hal/riscv_hal.d \
./riscv_hal/riscv_hal_stubs.d \
./riscv_hal/syscall.d 


# Each subdirectory must supply rules for building sources it contributes
riscv_hal/%.o: ../riscv_hal/%.S riscv_hal/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross Assembler'
	riscv64-unknown-elf-gcc -march=rv32imc -mabi=ilp32 -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -x assembler-with-cpp -DMIV_RV32IMC -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

riscv_hal/%.o: ../riscv_hal/%.c riscv_hal/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv64-unknown-elf-gcc -march=rv32imc -mabi=ilp32 -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -DMIV_RV32IMC -I"C:\legup\examples\github_example\training_libero_projects\training3\softconsole\RV32_simple_gpio" -I"C:\legup\examples\github_example\training_libero_projects\training3\softconsole\RV32_simple_gpio\hal" -I"C:\legup\examples\github_example\training_libero_projects\training3\softconsole\RV32_simple_gpio\riscv_hal" -I"C:\legup\examples\github_example\training_libero_projects\training3\softconsole\RV32_simple_gpio\drivers\CoreUARTapb" -I"C:\legup\examples\github_example\training_libero_projects\training3\softconsole\RV32_simple_gpio\drivers\CoreI2C" -I"C:\legup\examples\github_example\training_libero_projects\training3\softconsole\RV32_simple_gpio\drivers\CoreGPIO" -I"C:\legup\examples\github_example\training_libero_projects\training3\softconsole\RV32_simple_gpio\application\hdmi_config" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


