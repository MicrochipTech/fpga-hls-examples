# PolarFire&reg; SoC Icicle Kit Reference Design Generation Tcl Scripts - Libero&reg; SoC v2022.3+

## Table of Contents

- [PolarFire&reg; SoC Icicle Kit Reference Design Generation Tcl Scripts - Libero&reg; SoC v2022.3+](#polarfire-soc-icicle-kit-reference-design-generation-tcl-scripts---libero-soc-v20222)
  - [Table of Contents](#table-of-contents)
  - [Description](#description)
  - [Using the reference design generation Tcl script](#using-the-reference-design-generation-tcl-script)
    - [Licensing](#licensing)
    - [Standard design generation](#standard-design-generation)
    - [Argument based design generation](#argument-based-design-generation)
    - [Generating designs from the command line - no GUI](#generating-designs-from-the-command-line---no-gui)
  - [Design description](#design-description)
    - [Block diagrams](#block-diagrams)
    - [MSS peripherals](#mss-peripherals)
    - [MSS LPDDR4 configuration](#mss-lpddr4-configuration)
    - [Fabric memory map](#fabric-memory-map)
    - [Interrupt map](#interrupt-map)
    - [GPIO2 connections](#gpio2-connections)
  - [Programming the FPGA](#programming-the-fpga)
  - [Board configuration](#board-configuration)
  - [MSS Configuration](#mss-configuration)
  - [XML](#xml)
  - [BFM Simulation](#bfm-simulation)
  - [Setting the boot mode and programming the eNVM](#setting-the-boot-mode-and-programming-the-envm)
    - [Boot mode 0](#boot-mode-0)
    - [Boot mode 1](#boot-mode-1)
      - [Boot mode 1: SoftConsole](#boot-mode-1-softconsole)
      - [Boot mode 1: Libero SoC](#boot-mode-1-libero-soc)

<a name="description"></a>
## Description

This repository can be used to generate a reference design for the PolarFire SoC Icicle Kit. This reference design will have the same or extended functionality compared to the pre-programmed FPGA design on the Icicle Kit.

A Libero SoC Tcl script is provided to generate the reference design using Libero SoC along with device specific I/O constraints. For Tcl scripts supporting previous versions of Libero SoC see [Releases](https://mi-v-ecosystem.github.io/redirects/releases-icicle-kit-reference-design).

This repository supports Libero SoC v2022.3 and above, which is available for download [here](https://www.microchip.com/en-us/products/fpgas-and-plds/fpga-and-soc-design-tools/fpga/libero-software-later-versions#Documents%20and%20Downloads). The release notes will note the version(s) of Libero that these scripts have been tested on.

<a name="using-the-reference-design-generation-tcl-script"></a>
## Using the reference design generation Tcl script

<a name="licensing"></a>
### Licensing

The Icicle Kit Reference Design can be generated using any of the free or paid Libero licenses. Licensing information is available on the Microchip website [here](https://www.microchip.com/en-us/products/fpgas-and-plds/fpga-and-soc-design-tools/fpga/licensing).

<a name="standard-design-generation"></a>
### Standard design generation

To generate the standard reference design which is capable of running the majority of bare metal example applications and run Linux&reg; the following flow can be used:

1. Clone or download the repository
2. Open Libero
3. Open the execute script dialog (CTRL + U)
4. Execute the "MPFS_ICICLE_KIT_REFERENCE_DESIGN.tcl" script
5. Configure the design if required
6. Run the Libero SoC design flow to program a device

<a name="argument-based-design-generation"></a>
### Argument based design generation

Some bare metal examples and tutorials require a specific fabric configuration which cannot be achieved in the standard base design, for example to test I2C loopback the MSS must be reconfigured to route I2C1 to the fabric and bi directional buffers then need to be instantiated along with additional constraints. These configurations are achieved by passing an argument to Libero when generating the design. Arguments will generate a standard base design and apply design changes on top of that configuration. Supported arguments are:

| Argument       | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| DRI_CCC_DEMO   | Instantiates a Clock Conditioning Circuitry core in the fabric and connects it to the Dynamic Reconfiguration Interface used with the PCIe. The outputs of the CCC are connected to I/Os which can be monitored using a logic analyzer. The clocks generated by the CCC can be controlled by the MSS using the DRI core.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| I2C_LOOPBACK   | Routes I2C0 and I2C1 to the fabric and connects them to bibufs routed to Raspberry Pi® I/Os. <br>Associates I2C loopback constraints for I/O. <br>This design can be used with the I2C loopback bare metal example project and will still boot Linux but the PAC1934 will be inaccessible. <br>I2C0_SCL is routed to pin 29 and I2C1_SCL is routed to pin 31 of the Raspberry Pi I/O header. <br>I2C0_SDA is routed to pin 35 and I2C1_SDA is routed to pin 37 of the Raspberry Pi I/O header. <br>Connecting / closing pins 29 and 31 and pins 35 and 37 of the Raspberry Pi I/O header will achieve I2C loopback.                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| SPI_LOOPBACK   | Routes SPI0 to the fabric and connects the I/Os to the RPI header. Routes SPI1 to MSS I/Os on the MikroBUS header. <br>Associates SPI loopback constraints for I/O. <br>This design can be used with the driver-examples/mss/mss-spi/mpfs-spi-master-slave example from the [bare metal examples](https://mi-v-ecosystem.github.io/redirects/repo-polarfire-soc-bare-metal-examples) repository. This example project and will still boot Linux but QSPI will no longer work. <br>SPI0_MOSI is routed to pin 19 of the RPI header, SPI0_MISO is routed to pin 21 of the RPI header, SPI0_CLK is routed to pin 23 of the RPI header and SPI0_SS is routed to pin 24 of the RPI header. <br>To run the demo: <br> - connect MOSI (pin 6) of the mikroBUS header to SPI0_MOSI (pin 19) of the RPI header <br> - connect MISO (pin 5) of the mikroBUS header to SPI0_MISO (pin 21) of the RPI header <br> - connect SCK (pin 4) of the mikroBUS header to SPI0_CLK (pin 23) of the RPI header <br> - connect CS (pin 3) of the mikroBUS header to SPI0_SS (pin 24) of the RPI header. |
| BFM_SIMULATION | Generates a smart design test bench based on the reference design and imports custom BFM scripts to generate transactions on MSS FICs. <br>A custom DO file is also imported to add waves and run the simulation               
| SMARTHLS       | This flag allows the creation and automatic integration of a hardware module described in C++ using Microchip's SmartHLS tool. The flag accepts one argument indicating the path to a SmartHLS project directory.  For example, to compile the included example, the flag would be like this: ```SMARTHLS:./script_support/additional_configurations/smarthls/invert_and_threshold```. **IMPORTANT:** This flag is part of an Early Access Program for SmartHLS. If you are interested, please contact your local FAE or email us at SmartHLS@microchip.com for more details on how to enable this feature.   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| MSS_BAREMETAL  | This argument generates an MSS configuration which supports the bare metal projects supplied in the bare metal examples repository. The MSS configuration has no additional functionality, in this case the majority of DDR is available in the 1GB address space.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| MSS_LINUX      | This argument generates an MSS configuration which supports PolarFire SoC Linux builds. The MSS configuration has no additional functionality, in this case the majority of DDR is available in the 64GB address space. This configuration is generated by default.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| MICRON_QSPI    | This argument can be used to re-route the MSS QSPI pins to be used with a Micron QSPI flash device on the Raspberry Pi interface, the default configuration supports a Winbond QSPI device on a Flash5 Click Board using a PI3 Click Shield adapter. This has been tested using a Pmod SF3 Board and a Pmod HAT Adapter on the RPi interface. The QSPI device should be connected to JA of the adapter board.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| VECTORBLOX     | This argument will add the Vectorblox CNN to the FPGA fabric and connect it to the FIC 0 domain for control register access and FIC 2 for data transfers from the CNN. Note: a special add on Libero license may be required to use the Vectorblox CNN, for more information check the [product page](https://www.microchip.com/en-us/products/fpgas-and-plds/fpga-and-soc-design-tools/vectorblox) and the [Vectorblox GitHub](https://github.com/Microchip-Vectorblox).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |

Arguments in the table above can only be used exclusively - i.e you cannot pass "I2C_LOOPBACK" and "BFM_SIMULATION" as arguments.

Additional arguments are also supported to modify or configure aspects of the design flow that will be run. Supported arguments are:

| Argument                  | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| :------------------------ | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| HSS_UPDATE                | Downloads the HSS release hex file associated with this release of the reference design. <br>The hex file is added as an eNVM client in Libero. <br>This argument requires wget to be installed. <br>This is installed by default on most Linux systems, on Windows® wget should be installed and added to the system path, steps are shown in the following [guide](https://www.addictivetips.com/windows-tips/install-and-use-wget-in-windows-10/)                                                                                                                                 |
| SYNTHESIZE                | Runs the synthesis step after design generation has completed                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| PLACEROUTE                | Runs the synthesis and place and route steps after design generation has completed                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| VERIFY_TIMING             | Runs the synthesis, place and route and timing verification steps after design generation has completed                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| GENERATE_PROGRAMMING_DATA | Generates the files required to generate a bitstream for programming a device                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| PROGRAM                   | Runs the full design flow after generating a design and programs a connected device. <br>Note: the device must be connected when the "Run PROGRAM Action" stage of the design flow is reached and only one device should be connected                                                                                                                                                                                                                                                                                                                                                |
| EXPORT_FPE                | Runs the full design flow after generating a design and exports a FlashPro Express file to the local directory                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| EXPORT_FPE:PATH           | Runs the full design flow after generating a design and exports a FlashPro Express file to a specified path e.g EXPORT_FPE:/home/user/jobs/                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| AXI4_STREAM_DEMO          | Demonstrates configuring and implementing an AXI4 streaming interface on an CoreAXI4DMAController.<br> Creates the AXI4_STREAM_DATA_GENERATOR module which connects to the CoreAXI4DMAController in the design. The AXI4_STREAM_DATA_GENERATOR module generates AXI4 Stream transactions with incrementing data which can be used to benchmark the performance of the system. Further information regarding this demonstration is available in the following [guide](https://mi-v-ecosystem.github.io/redirects/demo-guides_mpfs-axi4-stream-demo). |

**Note:** The arguments listed in the table above can be used with other arguments - i.e you can pass "I2C_LOOPBACK", "HSS_UPDATE" and "PROGRAM" as arguments.

The design flow for using arguments is the same as the standard flow, ensuring the argument is passed at script execution time:

1. Clone or download the repository
2. Open Libero
3. Open the execute script dialog (CTRL + U)
4. Execute the "MPFS_ICICLE_KIT_REFERENCE_DESIGN.tcl" script
5. Add any required arguments (e.g "I2C_LOOPBACK HSS_UPDATE PROGRAM")

**Note:** arguments should not be put in quotes and are separated by a space when using the GUI.

6. Configure the design if required
7. Run the Libero SoC design flow to program a device

<a name="generating-designs-from-the-command-line---no-gui"></a>
### Generating designs from the command line - no GUI

Libero has support to run Tcl scripts without launching a GUI, this can significantly reduce design generation time. Arguments can also be passed when generating from the command line.

To generate a design from the command line:

1. Clone or download the repository
2. Open a terminal in the directory containing the design generation scripts
3. Execute the command (example arguments shown):
[path to Libero]/libero script:MPFS_ICICLE_KIT_REFERENCE_DESIGN.tcl SCRIPT_ARGS:I2C_LOOPBACK+HSS_UPDATE+PROGRAM logfile: MPFS_ICICLE_KIT_REFERENCE_DESIGN.log

**Note:** Arguments are separated by a "+" symbol when using the command line.

**Note:** The script will automatically generate an MSS component, using the PolarFire SoC MSS Configurator in batch mode, then, generate, instantiate and connect components and top level I/Os. Constraints are imported for top level I/O and floor planning which associated with Place and Route. Timing constraints are then generated and associated with Synthesis, Place and Route and Timing Verification. Some arguments may require part of the design flow to be run while executing the script.

<a name="design-description"></a>
## Design description

<a name="block-diagrams"></a>
### Block diagrams

The diagram below outlines the top level configuration of the FPGA fabric and shows MSS I/Os used in this design:

![Block diagram](./diagrams/block_diagram.svg)

The diagram below shows the Inter Hart Communication (IHC) subsystem configuration used in the reference design:

![IHC subsystem block diagram](./diagrams/IHC_SUBSYSTEM_block_diagram.svg)

<a name="mss-peripherals"></a>
### MSS peripherals

The following MSS peripherals are enabled:

| MSS Peripheral | Route to Device I/O | Board peripheral            | Board Interface              | Notes                                    |
| :------------- | :------------------ | :-------------------------- | :--------------------------- | :--------------------------------------- |
| eMMC           | MSS I/Os BANK 4     | eMMC device                 | N/A                          |                                          |
| USB            | MSS I/Os BANK 2     | USB OTG Phy                 | J16 (Micro USB)              |                                          |
| SD/SDIO        | MSS I/Os BANK 4     | SD card socket              | N/A                          |                                          |
| GEM0           | SGMII I/Os BANK 5   | VSC8662 PHY Port0           | J1 (RJ45 connector)          |                                          |
| GEM1           | SGMII I/Os BANK 5   | VSC8662 PHY Port1           | J2 (RJ45 connector)          | Management through<br> MSS I/Os BANK 2 B |
| QSPI           | Fabric              | N/A                         | J26 (Raspberry Pi connector) |                                          |
| SPI1           | MSS I/Os BANK 2 B   | M/A                         | J44 (mikroBUS socket)        |                                          |
| MMUART0        | Fabric              | USB-UART PHY                | J11 (Micro USB)              |                                          |
| MMUART1        | Fabric              | USB-UART PHY                | J11 (Micro USB)              |                                          |
| MMUART2        | Fabric              | USB-UART PHY                | J11 (Micro USB)              |                                          |
| MMUART3        | Fabric              | USB-UART PHY                | J11 (Micro USB)              |                                          |
| MMUART4        | Fabric              | N/A                         | J8/J44 (mikroBUS socket)     |                                          |
| I2C0           | Fabric              | N/A                         | J8/J44 (mikroBUS socket)     |                                          |
| I2C1           | MSS I/Os BANK 2 B   | PAC1934 sensor              | N/A                          |                                          |
| CAN0           | Fabric              | N/A                         | J27 (Jumper)                 |                                          |
| CAN1           | MSS I/Os BANK 2 B   | N/A                         | J25 (Jumper)                 |                                          |
| GPIO2          | Fabric              | See GPIO2 connections table | N/A                          | See GPIO2 connections table              |

**Note:** “Raspberry Pi is a trademark of the Raspberry Pi Foundation”.

<a name="mss-lpddr4-configuration"></a>
### MSS LPDDR4 configuration

The Icicle Kit has 2GB of LPDDR4 on board and the PolarFire SoC MSS Configurator contains an "MSS_LPDDR4_default_configuration" preset that should be used with the Icicle Kit.

With the PolarFire SoC MSS Configurator v2022.2, the following two settings from the default profile need to updated for the LPDDR4 on the kit to be used.

Note: These settings should be the defaults in the profile from MSS configurator v2022.3 and greater.

| DDR Memory Tab            | Option                    | Default Value | Required Value |
| ------------------------- | ------------------------- | ------------- | -------------- |
| DDR Controller            | DQ ODT                    | 40            | 80             |
| DDR Memory Initialization | Pull-up Calibration Point | VDDQ/3        | VDDQ/2.5       |

<a name="fabric-memory-map"></a>
### Fabric memory map

| Initiator      | Bus                        | Target                      | Board peripheral        | Board interface              | Address range                    |
| :------------- | :------------------------- | :-------------------------- | :---------------------- | :--------------------------- | :------------------------------- |
| MSS: FIC0      | FIC0_INITIATOR             | MSS_LSRAM                   | N/A                     | N/A                          | 0x6000_0000 -> 0x6000_1000       |
| MSS: FIC0      | FIC0_INITIATOR             | DMA_CONTROLLER              | N/A                     | N/A                          | 0x6001_0000 -> 0x6001_FFFF       |
| MSS: FIC1      | FIC1_INITIATOR             | PF_PCIE_C0_0                | N/A                     | PCIe edge connector          | 0x30_0000_0000 -> 0x3F_FFFF_FFFF |
| MSS: FIC3      | FIC_3_ADDRESS_GENERATION   | PWM                         | N/A                     | J8 (mikroBUS socket)         | 0x4000_0000 -> 0x4000_00FF       |
| MSS: FIC3      | FIC_3_ADDRESS_GENERATION   | CoreGPIO                    | LEDs                    | N/A                          | 0x4000_0100 -> 0x4000_01FF       |
| MSS: FIC3      | FIC_3_ADDRESS_GENERATION   | CoreI2C                     | N/A                     | J26 (Raspberry Pi connector) | 0x4000_0200 -> 0x4000_02FF       |
| MSS: FIC3      | FIC_3_ADDRESS_GENERATION   | CoreUART                    | N/A                     | J26 (Raspberry Pi connector) | 0x4000_0300 -> 0x4000_03FF       |
| MSS: FIC3      | FIC_3_ADDRESS_GENERATION   | RPi_ID_I2C                  | N/A                     | J26 (Raspberry Pi connector) | 0x4000_0400 -> 0x4000_04FF       |
| MSS: FIC3      | FIC_3_ADDRESS_GENERATION   | RECONFIGURATION_INTERFACE   | N/A                     | N/A                          | 0x4300_0000 -> 0x43FF_FFFF       |
| MSS: FIC3      | FIC_3_ADDRESS_GENERATION   | RECONFIGURATION_INTERFACE   | N/A                     | N/A                          | 0x4800_0000 -> 0x48FF_FFFF       |
| MSS: FIC3      | FIC_3_ADDRESS_GENERATION   | fabric_sd_emmc_demux_select | U29 & U44 (SDIO de-mux) | N/A                          | 0x4FFF_FF00 -> 0x4FFF_FFFF       |
| MSS: FIC3      | IHC_SUBSYSTEM: APB3mmaster | CHANNEL_E51_TO_U54_1:A      | N/A                     | N/A                          | 0x5000_0000 -> 0x5000_00FF       |
| MSS: FIC3      | IHC_SUBSYSTEM: APB3mmaster | CHANNEL_E51_TO_U54_2:A      | N/A                     | N/A                          | 0x5000_0100 -> 0x5000_01FF       |
| MSS: FIC3      | IHC_SUBSYSTEM: APB3mmaster | CHANNEL_E51_TO_U54_3:A      | N/A                     | N/A                          | 0x5000_0200 -> 0x5000_02FF       |
| MSS: FIC3      | IHC_SUBSYSTEM: APB3mmaster | CHANNEL_E51_TO_U54_4:A      | N/A                     | N/A                          | 0x5000_0300 -> 0x5000_03FF       |
| MSS: FIC3      | IHC_SUBSYSTEM: APB3mmaster | E51_IRQ_AGGREGATOR          | N/A                     | N/A                          | 0x5000_0400 -> 0x5000_04FF       |
| MSS: FIC3      | IHC_SUBSYSTEM: APB3mmaster | CHANNEL_E51_TO_U54_1:B      | N/A                     | N/A                          | 0x5000_0500 -> 0x5000_05FF       |
| MSS: FIC3      | IHC_SUBSYSTEM: APB3mmaster | CHANNEL_U54_1_TO_U54_2:A    | N/A                     | N/A                          | 0x5000_0600 -> 0x5000_06FF       |
| MSS: FIC3      | IHC_SUBSYSTEM: APB3mmaster | CHANNEL_U54_1_TO_U54_3:A    | N/A                     | N/A                          | 0x5000_0700 -> 0x5000_07FF       |
| MSS: FIC3      | IHC_SUBSYSTEM: APB3mmaster | CHANNEL_U54_1_TO_U54_4:A    | N/A                     | N/A                          | 0x5000_0800 -> 0x5000_08FF       |
| MSS: FIC3      | IHC_SUBSYSTEM: APB3mmaster | U54_1_IRQ_AGGREGATOR        | N/A                     | N/A                          | 0x5000_0900 -> 0x5000_09FF       |
| MSS: FIC3      | IHC_SUBSYSTEM: APB3mmaster | CHANNEL_E51_TO_U54_2:B      | N/A                     | N/A                          | 0x5000_0A00 -> 0x5000_0AFF       |
| MSS: FIC3      | IHC_SUBSYSTEM: APB3mmaster | CHANNEL_U54_1_TO_U54_2:B    | N/A                     | N/A                          | 0x5000_0B00 -> 0x5000_0BFF       |
| MSS: FIC3      | IHC_SUBSYSTEM: APB3mmaster | CHANNEL_U54_2_TO_U54_3:A    | N/A                     | N/A                          | 0x5000_0C00 -> 0x5000_0CFF       |
| MSS: FIC3      | IHC_SUBSYSTEM: APB3mmaster | CHANNEL_U54_2_TO_U54_4:A    | N/A                     | N/A                          | 0x5000_0D00 -> 0x5000_0DFF       |
| MSS: FIC3      | IHC_SUBSYSTEM: APB3mmaster | U54_2_IRQ_AGGREGATOR        | N/A                     | N/A                          | 0x5000_0E00 -> 0x5000_0EFF       |
| MSS: FIC3      | IHC_SUBSYSTEM: APB3mmaster | CHANNEL_E51_TO_U54_3:B      | N/A                     | N/A                          | 0x5000_0F00 -> 0x5000_0FFF       |
| MSS: FIC3      | IHC_SUBSYSTEM: APB3mmaster | CHANNEL_U54_1_TO_U54_3:B    | N/A                     | N/A                          | 0x5000_1000 -> 0x5000_10FF       |
| MSS: FIC3      | IHC_SUBSYSTEM: APB3mmaster | CHANNEL_U54_2_TO_U54_3:B    | N/A                     | N/A                          | 0x5000_1100 -> 0x5000_11FF       |
| MSS: FIC3      | IHC_SUBSYSTEM: APB3mmaster | CHANNEL_U54_3_TO_U54_4:A    | N/A                     | N/A                          | 0x5000_1200 -> 0x5000_12FF       |
| MSS: FIC3      | IHC_SUBSYSTEM: APB3mmaster | U54_3_IRQ_AGGREGATOR        | N/A                     | N/A                          | 0x5000_1300 -> 0x5000_13FF       |
| MSS: FIC3      | IHC_SUBSYSTEM: APB3mmaster | CHANNEL_E51_TO_U54_4:B      | N/A                     | N/A                          | 0x5000_1400 -> 0x5000_14FF       |
| MSS: FIC3      | IHC_SUBSYSTEM: APB3mmaster | CHANNEL_U54_1_TO_U54_4:B    | N/A                     | N/A                          | 0x5000_1500 -> 0x5000_15FF       |
| MSS: FIC3      | IHC_SUBSYSTEM: APB3mmaster | CHANNEL_U54_2_TO_U54_4:B    | N/A                     | N/A                          | 0x5000_1600 -> 0x5000_16FF       |
| MSS: FIC3      | IHC_SUBSYSTEM: APB3mmaster | CHANNEL_U54_3_TO_U54_4:B    | N/A                     | N/A                          | 0x5000_1700 -> 0x5000_17FF       |
| MSS: FIC3      | IHC_SUBSYSTEM: APB3mmaster | U54_4_IRQ_AGGREGATOR        | N/A                     | N/A                          | 0x5000_1800 -> 0x5000_18FF       |
| PF_PCIE_C0_0   | PCIE_INITIATOR             | MSS: FIC1                   | N/A                     | N/A                          | 0x10_0000_0000 -> 0x10_FFFF_FFFF |
| DMA_CONTROLLER | DMA_INITIATOR              | MSS: FIC0                   | N/A                     | N/A                          | 0x0000_0000 -> 0xFFFF_FFFF       |

<a name="interrupt-map"></a>
### Interrupt map

| Source                  | IRQ                |
| :---------------------- | :----------------- |
| MSS_GPIO_2_28 OR SW1    | MSS_INT_F2M[0]     |
| PF_PCIE                 | MSS_INT_F2M[1]     |
| DMA_CONTROLLER          | MSS_INT_F3M[2]     |
| mBUS_INT                | MSS_INT_F2M[3]     |
| CoreI2C_INT[0]          | MSS_INT_F2M[4]     |
| RPi_ID_I2C[0]           | MSS_INT_F2M[5]     |
| IHC_SUBSYSTEM:E51_IRQ   | MSS_INT_F2M[63]    |
| IHC_SUBSYSTEM:U54_1_IRQ | MSS_INT_F2M[62]    |
| IHC_SUBSYSTEM:U54_2_IRQ | MSS_INT_F2M[61]    |
| IHC_SUBSYSTEM:U54_3_IRQ | MSS_INT_F2M[60]    |
| IHC_SUBSYSTEM:U54_4_IRQ | MSS_INT_F2M[59]    |
| MSS_GPIO_2_26 OR SW2    | MSS_GPIO_2_INT[30] |
| MSS_GPIO_2_27 OR SW3    | MSS_GPIO_2_INT[31] |

<a name="gpio2-connections"></a>
### GPIO2 connections

| Bit | Direction | Source / sink | Notes         |
| :-- | :-------- | :------------ | :------------ |
| 2   | I/O       | RPi_GPIO12    |               |
| 3   | I/O       | RPi_GPIO13    |               |
| 4   | I/O       | RPi_GPIO16    |               |
| 5   | I/O       | RPi_GPIO17    |               |
| 7   | I/O       | RPi_GPIO19    |               |
| 8   | I/O       | RPi_GPIO20    |               |
| 9   | I/O       | RPi_GPIO21    |               |
| 10  | I/O       | RPi_GPIO22    |               |
| 11  | I/O       | RPi_GPIO23    |               |
| 12  | I/O       | RPi_GPIO24    |               |
| 13  | I/O       | RPi_GPIO25    |               |
| 14  | I/O       | RPi_GPIO26    |               |
| 15  | I/O       | RPi_GPIO27    |               |
| 16  | Out       | LED0          |               |
| 17  | Out       | LED1          |               |
| 18  | Out       | LED2          |               |
| 19  | Out       | LED3          |               |
| 26  | Out       | GPIO2 bit 30  | OR'd with SW2 |
| 27  | Out       | GPIO2 bit 31  | OR'd with SW3 |
| 28  | Out       | MSS INT F2M 0 | OR'd with SW1 |
| 30  | In        | GPIO2 bit 26  |               |
| 31  | In        | GPIO2 bit 27  |               |

<a name="programming-the-fpga"></a>
## Programming the FPGA

Once the script has completed the design can be configured further if needed and the Libero SoC design flow can be run by double clicking on a stage in the design flow on the left hand side of Libero. Selecting an option requiring previous steps to be completed will run the full flow, i.e double clicking "Run Program Action" will run any required steps, such as, "Synthesize", "Place and Route", etc and then program the device.

<a name="board-configuration"></a>
## Board configuration

For Icicle Kit jumper configurations used by this design and Linux images for eMMC and SD Cards see the [MPFS Icicle Kit User Guide](https://mi-v-ecosystem.github.io/redirects/updating-icicle-kit_updating-icicle-kit-design-and-linux).

<a name="mss-configuration"></a>
## MSS Configuration

The Microprocessor Subsystem (MSS) is configured using the PolarFire SoC MSS Configurator.
This software tool takes user inputs and generates an MSS configuration file (.xml) along with an MSS component file (.cxz).
The XML file is used by the PolarFire SoC Configuration Generator to generate configuration header files for bare metal applications.
The MSS component file can be imported into a Libero SoC design and used in the FPGA design flow.

A saved configuration for the PolarFire SoC MSS Configurator is available in the "script_support" folder and can be opened by the PolarFire SoC MSS Configurator. These configurations will match the MSS configuration used in the design and can be used to regenerate XML and a Libero component. For argument based designs, MSS configuration files will be generated in the script_support/additional_configurations/[configuration name] directory when a design is generated.

<a name="xml"></a>
## XML

The Microcontroller Subsystem (MSS) configuration is captured in an XML file that is then used by the PolarFire SoC Configuration Generator to generate configuration header files. These header files are compiled as part of the MPFS HAL startup code to configure the system at power on.

XML generated for all available configurations is provided in the "XML" folder.

<a name="bfm-simulation"></a>
## BFM Simulation

A SmartDesign test bench can be generated along with the SmartDesign containing the reference design by passing the "BFM_SIMULATION" argument when generating the design. This test bench will allow the user to run BFM simulations of the PolarFire SoC MSS. A custom wave.do file is imported to add signals and updated BFM scripts are also imported. To run a BFM simulation:

1. Open the "Stimulus Hierarchy" in Libero SoC
2. Right click on "Test_bench" from the hierarchy
3. Select "Simulate Pre-Synth Design" and "Open Interactively"

Commands for BFM simulations can be updated by editing the ".vec" files in the Simulation folder which is accessible under the "Files" tab of Libero SoC.

<a name="setting-the-boot-mode-and-programming-the-envm"></a>
## Setting the boot mode and programming the eNVM

<a name="boot-mode-0"></a>
### Boot mode 0

Boot mode 0 will put all of the MSS cores into WFI (Wait For Interrupt) mode on power on, the cores will not boot until debugged. SoftConsole v6.5 or later can be used to set the PolarFire SoC boot mode to 0:

1. Connect the board to the PC using the embedded FlashPro6 or an external FlashPro and power on the board
2. In SoftConsole select the "External Tool" drop down menu
3. Select the "PolarFire SoC idle boot mode 0" configuration and run

<a name="boot-mode-1"></a>
### Boot mode 1

Boot mode 1 configures all of the MSS cores to boot from the eNVM, when setting the boot mode to 1 an eNVM client must also be provided An eNVM client can be a zero stage boot loader, such as the HSS, or a bare metal application. SoftConsole v6.4 and above or Libero SoC v12.6 and above can be used to set the boot mode and program the eNVM.

Build the bare metal application using the reference XML provided to configure the MPFS HAL (XML will also be generated in the script_support/components/[target] folder when an MSS component is generated as part of the flow).

<a name="boot-mode-1-softconsole"></a>
#### Boot mode 1: SoftConsole

To set the PolarFire SoC boot mode to 1 and program an eNVM client in SoftConsole:

1. Select the project folder of the application to be used as an eNVM client in the project explorer
2. Connect the board to the PC using the embedded FlashPro6 or an external FlashPro and power on the board
3. In SoftConsole select the "External Tool" drop down menu
4. Select the "PolarFire SoC non-secure boot mode 1" configuration and run

<a name="boot-mode-1-libero-soc"></a>
#### Boot mode 1: Libero SoC

To set the PolarFire SoC boot mode to 1 and program and eNVM client in Libero:

1. Run the Libero SoC design flow so that "Generate FPGA Array Data" has completed and open the "Configure Design Initialization Data and Memories" tool
2. Select the "eNVM" tab
3. Select the "Add ..." option and select "Add Boot Mode 1" client
4. Navigate to the binary file to be used as a client and select ok
5. Save and add the client
6. Run the remainder of the Libero SoC design flow and program the device

Linux® is the registered trademark of Linus Torvalds in the U.S. and other countries.
Raspberry Pi is a trademark of the Raspberry Pi Foundation.
All other trademarks are the property of their respective owners.
