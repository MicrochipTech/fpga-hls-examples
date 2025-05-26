# Interrupt Generator Module

This SmartHLS project implements a basic interrupt generator that triggers an interrupt signal every second.

## Files

- `interrupt_generator.cpp` - Main HLS module implementation
- `interrupt_generator.h` - Header file with function declarations
- `interrupt_generator_tb.cpp` - Testbench for software simulation
- `config.tcl` - SmartHLS configuration file
- `Makefile` - Build configuration

## Functionality

The interrupt generator module:
- Uses a 32-bit counter to track clock cycles
- Assumes a 50 MHz clock frequency (as specified in prompt)
- Generates an interrupt pulse every 50,000,000 cycles (1 second)
- Resets the counter after each interrupt

## Usage

### Software Simulation
```bash
shls sw -a
```

### Hardware Synthesis
```bash
shls hw -a
```

## Output

The software simulation shows the interrupt being triggered at the correct cycle:
```
Interrupt triggered at cycle: 49999999
```

This corresponds to exactly 1 second at 50 MHz clock frequency.

## Interface

- `interrupt_out`: Output signal that goes high for one cycle every second
- The signal can be connected to an interrupt controller or processor in your FPGA design 