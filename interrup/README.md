# Interrupt Generator Module

This SmartHLS project implements a basic interrupt generator that triggers an interrupt signal for every 20 iterations.

## Files

- `interrupt_generator.cpp` - Main HLS module implementation
- `interrupt_generator.h` - Header file with function declarations
- `interrupt_generator_tb.cpp` - Testbench for software simulation
- `config.tcl` - SmartHLS configuration file
- `Makefile` - Build configuration

## Functionality

The interrupt generator module:
- Generates an interrupt pulse in a for loop after every 20 iterations
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

### Testing
```bash
shls cosim -a
```

## Interface

- `interrupt_out`: Output signal that goes high for once 20 iterations
- The signal can be connected to an interrupt controller or processor in your FPGA design 
