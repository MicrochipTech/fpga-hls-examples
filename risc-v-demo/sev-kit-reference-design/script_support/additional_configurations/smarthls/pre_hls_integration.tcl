puts "TCL_BEGIN: [info script]"

# 
# Detect where SmartHLS and bash interpreter are located
#
set pathList [getHlsPaths]
set bash_path [lindex $pathList 0]
set shls_path [lindex $pathList 1]


################################################################################
# Changes to clocks and resets
################################################################################

# Add a 170MHz clock for the HLS subsystem
source ./script_support/additional_configurations/smarthls/pf_ccc_c0.mod.tcl
# Synchronize the reset
create_and_configure_core -core_vlnv {Actel:DirectCore:CORERESET_PF:2.3.100} -component_name {CORERESET_CLK_170MHz} -params {} 
sd_instantiate_component -sd_name {CLOCKS_AND_RESETS} -component_name {CORERESET_CLK_170MHz} -instance_name {} 
sd_connect_pins -sd_name {CLOCKS_AND_RESETS} -pin_names {"CORERESET_CLK_170MHz_0:CLK" "PF_CCC_C0_0:OUT2_FABCLK_0"} 
sd_connect_pins -sd_name {CLOCKS_AND_RESETS} -pin_names {"CORERESET_CLK_170MHz_0:EXT_RST_N" "EXT_RST_N"} 
sd_connect_pins -sd_name {CLOCKS_AND_RESETS} -pin_names {"AND2_0:Y" "CORERESET_CLK_170MHz_0:PLL_LOCK"} 
sd_connect_pins -sd_name {CLOCKS_AND_RESETS} -pin_names {"CORERESET_CLK_170MHz_0:INIT_DONE" "INIT_MONITOR_0:DEVICE_INIT_DONE"} 
sd_connect_pins -sd_name {CLOCKS_AND_RESETS} -pin_names {"CORERESET_CLK_170MHz_0:FPGA_POR_N" "INIT_MONITOR_0:FABRIC_POR_N"} 
sd_create_scalar_port -sd_name {CLOCKS_AND_RESETS} -port_name {RESETN_170MHz} -port_direction {OUT} 
sd_connect_pins -sd_name {CLOCKS_AND_RESETS} -pin_names {"CORERESET_CLK_170MHz_0:FABRIC_RESET_N" "RESETN_170MHz"} 
sd_connect_pins_to_constant -sd_name {CLOCKS_AND_RESETS} -pin_names {CORERESET_CLK_170MHz_0:BANK_x_VDDI_STATUS} -value {VCC} 
sd_connect_pins_to_constant -sd_name {CLOCKS_AND_RESETS} -pin_names {CORERESET_CLK_170MHz_0:BANK_y_VDDI_STATUS} -value {VCC} 
sd_connect_pins_to_constant -sd_name {CLOCKS_AND_RESETS} -pin_names {CORERESET_CLK_170MHz_0:SS_BUSY} -value {GND} 
sd_connect_pins_to_constant -sd_name {CLOCKS_AND_RESETS} -pin_names {CORERESET_CLK_170MHz_0:FF_US_RESTORE} -value {GND} 
sd_mark_pins_unused -sd_name {CLOCKS_AND_RESETS} -pin_names {CORERESET_CLK_170MHz_0:PLL_POWERDOWN_B} 
sd_connect_pin_to_port -sd_name {CLOCKS_AND_RESETS} -pin_name {PF_CCC_C0_0:OUT2_FABCLK_0} -port_name {CLK_170MHz} 
generate_component -component_name {CLOCKS_AND_RESETS}
save_smartdesign -sd_name {CLOCKS_AND_RESETS}

################################################################################
# Changes to the Video Pipeline
################################################################################
sd_create_scalar_port -sd_name {Video_Pipeline} -port_name {CLK_170MHz_i} -port_direction {IN} 
sd_create_scalar_port -sd_name {Video_Pipeline} -port_name {RESETN_170MHz_i} -port_direction {IN} 
sd_create_scalar_port -sd_name {Video_Pipeline} -port_name {hls_reset} -port_direction {IN} 

# Combine the system reset and CPU-generated reset (via GPIO2). 
# Note hls_reset is active high.
sd_instantiate_macro -sd_name {Video_Pipeline} -macro_name {AND2} -instance_name {HLS_PIPELINE_RESETN} 
sd_connect_pins -sd_name {Video_Pipeline} -pin_names {"hls_reset"       "HLS_PIPELINE_RESETN:A"}
sd_connect_pins -sd_name {Video_Pipeline} -pin_names {"RESETN_170MHz_i" "HLS_PIPELINE_RESETN:B"}
sd_invert_pins -sd_name {Video_Pipeline} -pin_names {"HLS_PIPELINE_RESETN:A"} 

source ./script_support/additional_configurations/smarthls/sd_add_axis_converters.tcl
# Create an AXI interface in the Video Pipeline block to be used by SmartHLS later 
# Connect the newly created AXI interface to the MSS
source ./script_support/additional_configurations/smarthls/sd_add_aximm_mirror.tcl
create_axim_mirror_ifce {Video_Pipeline} {hls_}
generate_component -component_name {Video_Pipeline}
save_smartdesign -sd_name {Video_Pipeline}

################################################################################
# Changes to the top level
################################################################################
open_smartdesign -sd_name {SEVPFSOC_TOP} 

sd_update_instance -sd_name {SEVPFSOC_TOP} -instance_name {Video_Pipeline_0}
sd_update_instance -sd_name {SEVPFSOC_TOP} -instance_name {CLOCKS_AND_RESETS}

sd_connect_pins -sd_name {SEVPFSOC_TOP} -pin_names {"MSS:FIC_0_AXI4_INITIATOR"          "Video_Pipeline_0:hls_axi_initiator"} 
sd_connect_pins -sd_name {SEVPFSOC_TOP} -pin_names {"MSS:FIC_0_AXI4_TARGET"             "Video_Pipeline_0:hls_axi_target"} 
sd_connect_pins -sd_name {SEVPFSOC_TOP} -pin_names {"CLOCKS_AND_RESETS:RESETN_170MHz"   "Video_Pipeline_0:RESETN_170MHz_i"}
sd_connect_pins -sd_name {SEVPFSOC_TOP} -pin_names {"CLOCKS_AND_RESETS:CLK_170MHz"      "Video_Pipeline_0:CLK_170MHz_i"\
                                                                                        "MSS:FIC_0_ACLK"}

# CPU.GPIO2_M2F_1 pin is used as user reset. 
# GPIO2_F2M_25 is just a monitoring input to the CPU to read reset state
sd_connect_pins -sd_name {SEVPFSOC_TOP} -pin_names {"MSS:GPIO_2_M2F_1" \
                                                    "MSS:GPIO_2_F2M_25" \
                                                    "Video_Pipeline_0:hls_reset"}

generate_component -component_name {SEVPFSOC_TOP}
save_smartdesign -sd_name {SEVPFSOC_TOP}

build_design_hierarchy
save_project

################################################################################
# Tool settings for SmartHLS 
################################################################################

# Enable FPGA Hardware Breakpoint (FHB)
# set_option -synth 1 -fhb 1 -physynth 0 -module {SEVPFSOC_TOP::work} 


# Synthesis option could be added here. For example:
# configure_tool -name {SYNTHESIZE} \
#     -params {RETIMING:true} \
#     -params {ROM_TO_LOGIC:false}


# Additional constraints
create_links -sdc ./script_support/additional_configurations/smarthls/hls.sdc

# By default try up to 16 times to place and route if timing is not met.
# Set the HLS_PLACEROUTE_MAX_ITERATIONS TCL variable to override the default.
set pnrIterations 16
if { [info exists HLS_PLACEROUTE_MAX_ITERATIONS] } {
    set pnrIterations $HLS_PLACEROUTE_MAX_ITERATIONS
}
puts "Maximum place and route iterations:$pnrIterations"

configure_tool -name {PLACEROUTE} \
    -params {EFFORT_LEVEL:true} \
    -params {MULTI_PASS_CRITERIA:VIOLATIONS} \
    -params {MULTI_PASS_LAYOUT:true} \
    -params "NUM_MULTI_PASSES:$pnrIterations"  \
    -params {START_SEED_INDEX:19} \
    -params {STOP_ON_FIRST_PASS:true}
    
# Options to verify timing can be added here:
# configure_tool -name {VERIFYTIMING} \
#     -params {CONSTRAINTS_COVERAGE:1}

puts "TCL_END: [info script]"
