LegUp Rotozoom (Texture Mapping) Demo Design V1.2
20210114 MCHP, Chr. Rudel

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

Description:

This Video example design displays a rotated & scaled 512x512 grayscale image.
Purpose of the example is performance evaluation of the HDL code generated by the LegUp High-Level Synthesis tool.
Four-Point (arbitrary) texture mapping is used, with reference to: https://www.flipcode.com/archives/The_Art_of_Demomaking-Issue_10_Roto-Zooming.shtml
Initialisation data for the large SRAM containing the 512x512 bytes of texture data is fetched from the external SPI flash at power-up (System controller design initialization, gv_0_inst).

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

Demo Setup using MPF300-VIDEO-KIT:
- open Project with Libero SoC 12.6
- Run PROGRAM Action
- Run PROGRAM_SPI_IMAGE Action, Yes (takes about 1 Minute, J15:Open, J17:Open)
- power-off board
- connect HDMI TV to HDMI1.4 TX Transmitter connector (J2), Output Resolution will be 640x480x60Hz
- powr-on board

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

LegUp Process Flow:

LegUp Tool Version used: LegUp 9.0 (internal FAE release)
LegUp Workspace Project: "LegUp9d0_workspace_texture_mapper_512x512_Fixed_dxdx_dxdy_20210114_0903.zip"

Step 1) Frame Start (VSYNC_START) -> MiV Interrupt:

MiV ISR:
- LegUp Control Registers (start points & delta values) are written to LegUp Function through AXI
- rotation phase & scale value is updated

Step 2) At start of every active video line (DE Start)	-> repeated 480 Times:

- <Process_Start> Pulse sets DFN-FF, used to keep run_loop[0] signal enabled until Legup function completes (run_done_writedata[0]=1)
- Note that DATA_TRIGGER is generated one line ahead of first active video line, to calculate output data one line in advance
- LegUp Function calculates all 640 output pixels of one line (8-bit/pixel) and writes them into the output FIFO

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

Known Issues:

- Remaining min timing violations, need to work on improving constraint files

- MPF300-VIDEO-KIT board requires a Design Initialization\SPI Clock divider setting of 6 (13.33MHz),
  RAM init from SPI Flash fails with setting of 2 (40MHz) SPI Clock. VectorBlox Demo Design also uses clock divider setting of 6 (13.33MHz). 
  Likely a board issue due to the levelshifters in the signal path.
   
- sometimes the displayed motion is not "smooth", seems to be caused by missed VSYNC interrupts by Soft MiV ?

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

Change History

== == == == == == == == == == == == == == == == == == == == == == == == == ==
2022-9-20: Version 1.2
== == == == == == == == == == == == == == == == == == == == == == == == == ==
1.) Added signal_synchronizer before CPU_SYS\EXT_IRQ input, to avoid crashing
    of soft MIV CPU
2.) Disabled Systick Interrupt in SoftConsole project to avoid missed EXT_IRQ
    interrupts (leading to incorrect output frames)

Prior to change 1, the Rotozoom would stop working after a few seconds and
the UART/MiV became unresponsive at the same time. The solution was to add a 
synchronizer module between the 25.2 MHz Display Controller and 50 MHz
CPU_SYS (MiV) External Interrupt input (EXT_IRQ).

Even with the fix of change 1, there were still some distorted frames. Making
change 2 fixes these so that the demo runs the same as before. This is the 
easiest solution to have a stable demo. It could probably be fixed more
elegantly by using the “Vectored Interrupts” option of the MIV_RV32 core.

These problems were in the design from the beginning, but only showed up
recently after certain components were updated to the latest Libero versions,
for example PF_CCC.

== == == == == == == == == == == == == == == == == == == == == == == == == ==
20210114: V1.1BETA
== == == == == == == == == == == == == == == == == == == == == == == == == ==

updated LegUp Project:
"LegUp9d0_workspace_texture_mapper_512x512_Fixed_dxdx_dxdy_20210114_0903.zip"

LegUp-1.) updated LegUp texture_mapper() function, corrected calculation for dxdx & dydx


Line 98++, old:
		// compute deltas for interpolation along X
		// hardcoded for texture size 512 -> divide by 512
		// use multiple of 2 texture sizes to simplify division
//	  dxdx = ((int32) bx - (int32) ax) / image_width;
//	  dydx = ((int32) by - (int32) ay) / image_width;
		dxdx = ((int32) bx - (int32) ax) >>9;
		dydx = ((int32) by - (int32) ay) >>9;

changed to:

		// compute deltas for interpolation along X
		dxdx = ((int32) bx - (int32) ax) / image_width;
		dydx = ((int32) by - (int32) ay) / image_width;

=> higher resource utilization (~2x LUT4, ~2x DFF)

Module name: texture_mapper_top_0

Fabric 4LUT/DFF		: 3351/2596	-> changes to: 5334/4778
Interface 4LUT/DFF	: 4824/4824	-> no change
uSRAM			: 6		-> no change
LSRAM			: 128		-> no change
Math			: 4		-> no change

== == == == == == == == == == == == ==

MiV Software Changes:

MiV-1.) add H/V aspect ratio correction for generation of four corner points, to correct distortions when rotating image,
        see use of texture_size_div2_arx_corrected, texture_size_div2_ary_corrected

== == == == == == == == == == == == ==

updated Libero Project:

"Videokit_PF_LegUp_Rotozoom_VGA_v1d1BETA_L12d6_20210114_xxxx

Libero-1.) replaced LegUp texture_mapper core with new version
Libero-2.) Timing Constraining file added, user.sdc -> remaining min timing violations ?
Libero-3.) replaced MiV Software file with new version

== == == == == == == == == == == == == == == == == == == == == == == == == ==
2021-1-13: Initial Version 1.0, Beta Version for review
== == == == == == == == == == == == == == == == == == == == == == == == == ==
== == == == == == == == == == == == == == == == == == == == == == == == == ==
