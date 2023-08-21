#This Tcl file sources other Tcl files to build the design(on which recursive export is run) in a bottom-up fashion

#Sourcing the Tcl file in which all the HDL source files used in the design are imported or linked
source ./src/hdl_source.tcl
build_design_hierarchy

set sd_name {TOP}
create_smartdesign -sd_name ${sd_name}
set_root -module TOP::work

#Sourcing the Tcl files in which HDL+ core definitions are created for HDL modules
source ./src/components/delay_chain.tcl
# The order of the component generation below should not matter but if texture_mapper is 
# generated first, a .mem file texture_frame.mem in that hls project directory is not found.
# If the order is switched and texture_mapper is generated second, the .mem file is found.
# This is because only one MEM_INIT_DIR can be specified:
#   configure_tool -name {SYNTHESIZE} -params {SYNPLIFY_OPTIONS:set_option -hdl_define -set MEM_INIT_DIR="..."}
# So it will always use the last one.
source ../wide_mult_axi/hls_output/scripts/libero/create_hdl_plus.tcl
source ../texture_mapper/hls_output/scripts/libero/create_hdl_plus.tcl
source ./src/components/counter.tcl 
build_design_hierarchy

#Sourcing the Tcl files for creating individual components under the top level
source ./src/components/CORERESET_PF_C0.tcl 
source ./src/components/PF_CCC_C0.tcl 
source ./src/components/PF_CCC_C1.tcl 
source ./src/components/PF_INIT_MONITOR_C0.tcl 
source ./src/components/CLOCK_RESET.tcl 
source ./src/components/COREI2C_C0.tcl 
source ./src/components/COREJTAGDEBUG_C0.tcl 
source ./src/components/CoreAPB3_C0.tcl 
source ./src/components/CoreGPIO_C0.tcl 
source ./src/components/CoreUARTapb_C0.tcl 
source ./src/components/MIV_RAM_64K.tcl 
source ./src/components/MIV_RV32_C0.tcl 
source ./src/components/CPU_SYS.tcl 
source ./src/components/COREFIFO_C0.tcl 
source ./src/components/DISPLAY_CONTROLLER.tcl 
source ./src/components/COREAXI4INTERCONNECT_C0.tcl 
source ./src/components/COREAXI4INTERCONNECT_C1.tcl 
source ./src/components/COREAXITOAXICONNECT_C1.tcl 
source ./src/components/LEGUP_PROCESSING.tcl 
source ./src/components/PF_DDR4_C0.tcl 
source ./src/components/TOP.tcl 
build_design_hierarchy
