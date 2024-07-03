puts "TCL_BEGIN: [info script]"

# HLS module is connected inside the FIC_0_PERIPHERALS block
set hls_sd_name FIC_0_PERIPHERALS
puts "hls_sd_name:$hls_sd_name"
open_smartdesign -sd_name $hls_sd_name

set hlsScriptDir [file normalize [file dirname [info script]]]

source $hlsScriptDir/FIC0_INITIATOR.mod.tcl
sd_update_instance -sd_name $hls_sd_name -instance_name {FIC0_INITIATOR} 

source $hlsScriptDir/DMA_INITIATOR.mod.tcl
sd_update_instance -sd_name $hls_sd_name -instance_name {DMA_INITIATOR} 

# AXI2AXI Slave ID Width = log 2 [UPSTREAM_AXIXBAR_NUM_MASTERS]+ID_WIDTH
download_core -vlnv {Actel:DirectCore:COREAXITOAXICONNECT:2.0.101} -location {www.microchip-ip.com/repositories/DirectCore}
create_and_configure_core -core_vlnv {Actel:DirectCore:COREAXITOAXICONNECT:2.0.101} -component_name {AXI2AXI} -params {\
    SLAVE_ADDR_WIDTH:32 SLAVE_DATA_WIDTH:64 SLAVE_ID_WIDTH:1 SLAVE_TYPE:0 SLAVE_USER_WIDTH:1}

sd_instantiate_component -sd_name $hls_sd_name -component_name {AXI2AXI} -instance_name {AXI2AXI_TO_HLS}
sd_instantiate_component -sd_name $hls_sd_name -component_name {AXI2AXI} -instance_name {AXI2AXI_FROM_HLS}

# FIC0_INITIATOR --> AXI2AXI_TO_HLS
sd_connect_pins -sd_name $hls_sd_name -pin_names {FIC0_INITIATOR:AXI4mslave2 AXI2AXI_TO_HLS:AXI4_SLAVE}
sd_mark_pins_unused -sd_name $hls_sd_name -pin_names {AXI2AXI_TO_HLS:AXI4_MASTER}

# DMA_INITIATOR <-- AXI2AXI_FROM_HLS
sd_connect_pins -sd_name $hls_sd_name -pin_names {AXI2AXI_FROM_HLS:AXI4_MASTER DMA_INITIATOR:AXI4mmaster1}
sd_mark_pins_unused -sd_name $hls_sd_name -pin_names {AXI2AXI_FROM_HLS:AXI4_SLAVE}

save_smartdesign -sd_name $hls_sd_name 

#
# Tool settings for SmartHLS 
#

# Synthesis option could be added here. For example:
configure_tool -name {SYNTHESIZE} \
    -params {RETIMING:true} \
    -params {ROM_TO_LOGIC:false}

# By default try up to 8 times to place and route if timing is not met.
# Set the HLS_PLACEROUTE_MAX_ITERATIONS TCL variable to override the default.
set pnrIterations 25
if { [info exists HLS_PLACEROUTE_MAX_ITERATIONS] } {
    set pnrIterations $HLS_PLACEROUTE_MAX_ITERATIONS
}
puts "Maximum place and route iterations:$pnrIterations"

configure_tool -name {PLACEROUTE} \
    -params {EFFORT_LEVEL:true} \
    -params {MULTI_PASS_CRITERIA:VIOLATIONS} \
    -params {MULTI_PASS_LAYOUT:true} \
    -params "NUM_MULTI_PASSES:$pnrIterations"  \
    -params {STOP_ON_FIRST_PASS:true}
    
# Options to verify timing can be added here:
# configure_tool -name {VERIFYTIMING} \
#     -params {CONSTRAINTS_COVERAGE:1}

puts "TCL_END: [info script]"
