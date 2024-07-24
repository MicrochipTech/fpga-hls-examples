# Compiling the SmartHLS + RISC-V + H264 over Ethernet Example 

This readme explains how to compile the different aspects of the example. It covers 
how to compile the HLS modules, compile the Libero project to generate a bitstream,
compile the application software and update the example webpage on the board.

## Requirements To Recompile the Example:

- Use the latest Libero/SmartHLS release
- Use the PolarFireSoC Video Kit with Production Silicon.  For boards with 
  Engineering Sample silicon you would need to change the project parameters in 
  the `sev-kit-reference-design/MPFS_SEV_KIT_REFERENCE_DESIGN.tcl` file. 

## Example Setup

Before compiling the example make sure you can run the it on the board using the 
pre-compiled binaries, and that you can see the video streaming. This will ensure
you have all the necessary connections and that you assigned an IPv4 address to 
the board.  See [Readme.md](./Readme.md).

**NOTE:** After the example is up and running, make sure to export the ``BOARD_IP`` 
variable with the assigned IPv4 value and connect to the right Ethernet port on 
the board. This will be required to copy files over to the board from your Host PC.

If you are using Linux, open a terminal and run:
```
export BOARD_IP=192.168.2.1
```

If you are using Windows, open Powershell and run:
```
$env:BOARD_IP="192.168.2.1"
```
 
## Source Code Directory Structure

Overall this is the directory tree of the Libero project:
```
.
├── MPFS_SEV_KIT_REFERENCE_DESIGN.tcl
└── script_support
    ├── additional_configurations
    │   ├── functions.tcl
    │   └── smarthls
    ├── components
    │   ├── apb3_if.tcl
    │   ├── Bayer_Interpolation_C0.tcl
    │   ...
    ├── constraint
    │   ├── fp
    │   ├── io
    │   └── user.sdc
    ├── hdl
    │   ├── ddr_write_controller_enc.v
    │   ├── frame_controls_gen.v
    │   ├── H264
    │   ├── intensity_average.vhd
    │   ├── ram2port.vhd
    │   └── video_fifo.vhd
    ├── hdl_source.tcl
    ├── hss-envm-wrapper.mpfs-sev-kit.hex
    └── MSS_SEV
        ├── ENVM.cfg
        └── MSS_SEV.cfg
```

The `MPFS_SEV_KIT_REFERENCE_DESIGN.tcl` file drives the Libero flow, it will 
eventually call SmartHLS to generate the verilog modules and include them in the
design. 

The `script_support` includes all the necessary files for the project, including 
all the SmartDesign components described as .tcl  files, constraints, additional
HDL sources and HSS firmware.

The SmartHLS project files under the `smarthls` directory are described in 
[SmartHLS Directory Structure](#smarthls-directory-structure) section.

There are a few things that can be changed in this example:

1. The C++ code to generate the HLS modules in the FPGA.
2. The C++ application code that control the HLS modules (runs on RISC-V CPU)
3. The website: HTML and scripts to control the GUI appearance and behavior.
4. The Libero project itself.

## Compiling the SmartHLS Modules and Libero Project

To compile the example from the command line make sure Libero, Synplify Pro, and SmartHLS are
in the PATH in your terminal. On Linux, you can confirm this by typing the following commands:

```
which shls
```

```
which synplify_pro
```

```
which libero 
```

On Windows, you can confirm this by typing the following commands:
```
Get-Command shls
```

```
Get-Command synplify_pro
```

```
Get-Command libero
```


and compile by typing the following commands.

On Linux, use:
```
cd sev-kit-reference-design
./script_support/additional_configurations/smarthls/run_libero.sh
```

On Windows, use:
```
cd sev-kit-reference-design
.\script_support\additional_configurations\smarthls\run_libero.ps1
```

Notice the relative path from which the script has to be executed.  The compilation
process may take about 40 min. depending on how fast the machine is. 

The `run_libero` script calls Libero and passes the `MPFS_SEV_KIT_REFERENCE_DESIGN.tcl`
script along with some arguments. It is this TCL file that drives the compilation flow. 
One of the steps in the flow is to call SmartHLS to compile the C++ code into 
Verilog and integrate the HLS cores into the overall Libero design. 

When this is done you can find the bitstream in the following location and the 
FPGA can be programmed using Microchip's FPExpress tool:
```
./SEVPFSOC_H264/SEVPFSOC_H264.job
```

**NOTEs:**
- Place-and-route has been configured to run up to 16 times in case it fails to 
  meet timing. You can also adjust the P&R seed once you find a good value after 
  you have made some changes to the design.
  These settings can be found in this file: 
  `sev-kit-reference-design/script_support/additional_configurations/smarthls/pre_hls_integration.tcl`

## Compiling the C++ Application Software

Before compiling and updating the software application make sure to click the
`Stop` button to allow the binaries (.elf files) to be updated. 

There are two main executables binaries that need to be compiled. One is 
executed when the frames flow trough the CPU data path, and the other when the frames 
flow through the FPGA fabric. In the CPU data path case, only the get_frame() and
put_frame() HLS functions are used to move frames to/from DDR. In the FPGA data 
path all the HLS functions are used.

To compile the example from the command line, make sure the RISC-V GNU Cross-Compiler, located at `[SMARTHLS INSTALLATION DIR]/swtools/binutils/riscv-gnu-toolchain/bin` is in the PATH.

On Linux, you can confirm this by typing the following command:
```
which riscv64-unknown-linux-gnu-g++
```

On Windows, you must also add `<SHLS_INSTALLATION_DIR>\dependencies\lib\cygwin` to your path. 
Then, also confirm the RISC-V GNU Cross-Compiler is in the PATH:
```
Get-Command riscv64-unknown-linux-gnu-g++
```

Now you can run script that compiles the executables for both paths by typing the 
following.

On Linux, type:
```
cd sev-kit-reference-design/script_support/additional_configurations/smarthls/hls_pipeline
./compile_all.sh
```

On Windows, type:
```
cd sev-kit-reference-design\script_support\additional_configurations\smarthls\hls_pipeline
.\compile_all.ps1
```


This will compile the code and copy the .elf files over to the board using `scp`. 
Make sure the `BOARD_IP` environment variable has been setup as described in the 
[Example Setup](#example_setup) section

If all goes well, then you should see the text `"ALL_DONE"` at the end.  At this
point you can click on the `Start` button and the updated .elf files will be used. 

The `compile_all` script calls twice another script, `compile_and_copy`, 
that has all the steps to compile the application. You can use it to
only compile one path. For example, to compile only the FPGA data path type
this from the command line:
```
datapath=fpga arch=riscv_64 ./compile_and_copy.sh
```

or 
```
.\compile_and_copy.ps1 fpga riscv_64 
```
if you're on Windows.

## Updating the On-board Website

The website files are located under the 
`sev-kit-reference-design/script_support/additional_configurations/smarthls/www`
directory and has the following structure:

## Website Files

The `www` directory include the files required by the web server that runs on the 
on-board embedded Linux, and it has the following structure:

```
./www
├── h264
│   ├── 0001_daemon
│   ├── ffmpeg.sh
│   ├── footer_h264.png
│   ├── header_h264.png
│   ├── index.htm
│   ├── mchp_logo2.png
│   ├── microchip_100x56.bmp
│   ├── microchip_202x114.bmp
│   ├── microchip.ico
│   ├── microchip_logo.png
│   ├── microchip_riscv_1280x720.bmp
│   ├── pfsoc.css
│   ├── reset.png
│   ├── setup_vars.sh
│   ├── start.php
│   ├── stop.php
│   ├── stop.sh
│   ├── update.php
│   └── update.sh
└── update_website.sh
```
The entry point is the `index.htm` page, which calls the rest of the scripts as 
needed.  The web server uses a mix of Javascript and PHP code to run code on the 
client and server side, respectively. 

On the client side, the Javascript code is used to set event for clicking the 
"start", "update", "stop", update the Frames-per-second label on the webpage, and
to call the PHP scripts.

On the server side, the PHP scripts call BASH scripts to start, update and stop 
the FFMPEG program to transfer the frames over the network, and the SmartHLS 
applications that control the video pipeline modules described in C++.

You can change any of these files on the host machine and then copy the updated 
files to the board. This can be easily done by typing the following command
(make sure the `BOARD_IP` variable is defined). If you're using Linux, type:
```
cd sev-kit-reference-design/script_support/additional_configurations/smarthls/www
./update_website.sh
```
If you're using Windows, type:
```
cd sev-kit-reference-design\script_support\additional_configurations\smarthls\www
.\update_website.ps1
```

## SmartHLS Directory Structure

Inside the `script_support/additional_configurations/smarthls` the structure is 
as follows:

```
smarthls
├── common
│   ├── bmp.hpp
│   ├── sev.hpp
│   ├── toronto_100x56.bmp
│   └── toronto_1280x720.bmp
├── compile_and_integrate_shls_to_refdesign.tcl
├── hdl
│   ├── async_fifo
│   ├── axis-video
│   └── video-axis
├── hls_pipeline
│   ├── app_hls_pipeline.cpu.cpp
│   ├── app_hls_pipeline.fpga.cpp
│   ├── compile_all.sh
│   ├── compile_and_copy.sh
│   ├── config.tcl
│   ├── hls_pipeline.cpp
│   └── Makefile
├── hls.sdc
├── identify_instrument.tcl
├── MSS
│   └── MSS_SEV.cfg
├── pf_ccc_c0.mod.tcl
├── pre_hls_integration.tcl
├── rotozoom
│   ├── config.tcl
│   ├── Makefile
│   ├── rotozoom.cpp
│   ├── rotozoom.hpp
│   └── SinCosTables.hpp
├── run_libero.sh
├── sd_add_aximm_mirror.tcl
├── sd_add_axis_converters.tcl
├── synplify_enable_dbg_mode.tcl
└── www
    ├── h264
    └── update_website.sh
```

In this structure, the `hls_pipeline` directory contains the SmartHLS project. This
includes the two main() software programs `app_hls_pipeline.cpu.cpp` and 
`app_hls_pipeline.fpga.cpp` that will be compiled to two different `.elf` files. 
One for each datapath: CPU and FPGA, respectively.  These programs are meant to 
be executed by RISC-V processor.

The C++ functions that will be converted into verilog are described in the 
`hls_pipeline.cpp` file. This file also includes another `main()` function, but
this is used as a testbench for the functions when compiled on the host machine, 
not for the actual software that will run RISC-V processor.

The rotozoom module is an example of how other functions can be defined in their
own directory and have a separate testbench, and yet be able to be included into 
the main `hls_pipeline.cpp` file by just including the `rotozoom.hpp` header file
to import the core functionality.

The `pre_hls_integration.tcl` file contains TCL commands that make modifications 
to the original reference design in preparation for the SmartHLS module integration.
This script is needed 

The `compile_and_integrate_shls_to_refdesign.tcl` is the script that calls SmartHLS
as part of the overall Libero flow. This is know as the SmartHLS `"Custom flow"` 
because it uses SmartHLS as a *plug-in*. In this particular case, the script
calls the SmartHLS `hw` target from the command line, which will do three things:
1. Generate the Verilog code from the C++ description
2. Generate the SmartDesign HDL+ components from the Verilog code and integrate 
   them into the Libero project making the HLS modules available to the RISC-V 
   processor.
3. Generate the C++ API driver to be included in the RISC-V application software.

The `Makefile` and `config.tcl` are the SmartHLS project files. If you need to 
define additional compilation constants for the SmartHLS project you can do so 
in this `Makefile`. 

Finally, the `common` directory has some common bitmaps and helper code.

## References:

[SmartHLS User Guide](https://onlinedocs.microchip.com/v2/keyword-lookup?keyword=fpgahls&redirect=true&version=latest)

[PolarFire_SoC_FPGA_H264_Video_Streaming_Over_Ethernet_Application_Note_AN4529.pdf](https://ww1.microchip.com/downloads/aemDocuments/documents/FPGA/ApplicationNotes/ApplicationNotes/PolarFire_SoC_FPGA_H264_Video_Streaming_Over_Ethernet_Application_Note_AN4529.pdf)



