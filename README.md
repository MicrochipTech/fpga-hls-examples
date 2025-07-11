# fpga-hls-examples
This repository contains open-source (MIT license) high-level synthesis (HLS) C++ Examples for Microchip FPGAs. 

The homepage for the Microchip HLS integrated development environment is:
 - https://www.microchip.com/en-us/products/fpgas-and-plds/fpga-and-soc-design-tools/smarthls-compiler

You can find the Microchip HLS software user guide here:
 - https://onlinedocs.microchip.com/v2/keyword-lookup?keyword=fpgahls&redirect=true&version=latest

# Note:
To download the precompiled binaries, go to "Releases" then "Assets" or run the following code

Linux:
<pre> bash setup.sh </pre>

Windows:
<pre> ./setup.ps1 </pre>

(**if needed**)

By default, Windows restricts script execution. To allow scripts, right-click the PowerShell icon and select "Run as administrator" then run
<pre> Set-ExecutionPolicy Unrestricted </pre>
or set execution policy for current user only
<pre> Set-ExecutionPolicy Unrestricted -Scope CurrentUser </pre>



## Tutorials and Trainings
Example | Description
--------|------------
[sobel_tutorial](./sobel_tutorial)|HLS Tutorial: Sobel Filter Edge Detection Example.
[Training1](./Training1)|SmartHLS™ Training Session 1: Image Processing on the PolarFire® Video Kit 
[Training2](./Training2)|SmartHLS™ Training Session 2: Multi-threaded Digit Recognition on the PolarFire® Video Kit 
[Training3](./Training3)|SmartHLS™ Training Session 3: AXI Interfaces to DDR & Mi-V Soft Processor on the PolarFire® Video Kit 
[Training4](./Training4)|SmartHLS™ Training Session 4: SmartHLS™ Training for Microchip PolarFire® SoC Flow  

## Examples of HLS Features

Example | Description
--------|------------
[axi_initiator](./axi_initiator)|Example of an AXI4-Initiator top-level interface.
[axi_target](./axi_target)|Example of an AXI4-Target top-level interface.
[Canny_RISCV](./Canny_RISCV)|Integrating a SmartHLS module created using the IP Flow into the RISC-V subsystem.
[ECC_demo](./ECC_demo)|Example of Error Correction Code feature.
[auto_instrument](./auto_instrument/)|Example of Automatic On-Chip Instrumentation feature.

## Simple Examples
Example | Description
--------|------------
[udp_tx](./udp_tx)|Simple UDP Transmit (TX) core from a network stack.
[fp_mult](./fp_mult)|Arbitrary precision floating-point multiplication core.

## Advanced Examples
Example | Description
--------|------------
[RISC-V example](./risc-v-demo)|End-to-end SmartHLS + RISC-V + H264 over Ethernet Example.
