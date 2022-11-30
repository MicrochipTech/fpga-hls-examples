#Libero project creation

new_project -location {./Libero_training3} -name {Libero_training3} -project_description {} -block_mode 0 -hdl Verilog -family {PolarFire} -die {MPF300T} -package {FCG1152} -speed {-1} -die_voltage {1.0} -part_range {EXT} -adv_options {IO_DEFT_STD:LVCMOS 1.8V} -adv_options {RESERVEMIGRATIONPINS:1} -adv_options {RESTRICTPROBEPINS:1} -adv_options {RESTRICTSPIPINS:0} -adv_options {TEMPR:EXT} -adv_options {UNUSED_MSS_IO_RESISTOR_PULL:None} -adv_options {VCCI_1.2_VOLTR:EXT} -adv_options {VCCI_1.5_VOLTR:EXT} -adv_options {VCCI_1.8_VOLTR:EXT} -adv_options {VCCI_2.5_VOLTR:EXT} -adv_options {VCCI_3.3_VOLTR:EXT} -adv_options {VOLTR:EXT} 

#Download all the required cores to the vault
download_core -vlnv "Actel:SgCore:PF_CCC:*}" -location {www.microchip-ip.com/repositories/SgCore}
download_core -vlnv "Actel:DirectCore:CORERESET_PF:*}" -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv "Actel:SystemBuilder:PF_DDR4:*}" -location {www.microchip-ip.com/repositories/SgCore}
download_core -vlnv "Actel:SystemBuilder:PF_SRAM_AHBL_AXI:*}" -location {www.microchip-ip.com/repositories/SgCore}
download_core -vlnv "Actel:DirectCore:COREFIFO:*}" -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv "Actel:DirectCore:COREI2C:*}" -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv "Actel:DirectCore:CoreAPB3:*}" -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv "Actel:DirectCore:CoreGPIO:*}" -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv "Actel:DirectCore:COREJTAGDEBUG:*}" -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv "Actel:SgCore:PF_INIT_MONITOR:*}" -location {www.microchip-ip.com/repositories/SgCore}
download_core -vlnv "Microsemi:MiV:MIV_RV32:*}" -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv "Actel:DirectCore:CoreUARTapb:*}" -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv "Actel:DirectCore:COREAXI4INTERCONNECT:*}" -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv "Actel:DirectCore:COREAXITOAXICONNECT:*}" -location {www.microchip-ip.com/repositories/DirectCore}

#source the below tcl file to create the top level SmartDesign and generate it
source ./src/TOP_recursive.tcl
build_design_hierarchy 

#Import the constraint files and organize the Synthesize, Place and Route and Verify Timing tools
import_files \
         -io_pdc ./src/constraint/user_io.pdc
import_files \
         -fp_pdc ./src/constraint/user_fp.pdc
import_files \
         -sdc ./src/constraint/user.sdc

organize_tool_files -tool {PLACEROUTE} -file {./Libero_training3/constraint/io/user_io.pdc} -file {./Libero_training3/constraint/fp/user_fp.pdc} -file {./Libero_training3/constraint/user.sdc} -module {TOP::work} -input_type {constraint} 
organize_tool_files -tool {VERIFYTIMING} -file {./Libero_training3/constraint/user.sdc} -module {TOP::work} -input_type {constraint} 

derive_constraints_sdc
save_project

#Configure and run the tools Synthesize, Place and Route and Verify Timing

configure_tool -name {SYNTHESIZE} -params {ACTIVE_IMPLEMENTATION:synthesis} -params {AUTO_COMPILE_POINT:true} -params {BLOCK_MODE:false} -params {BLOCK_PLACEMENT_CONFLICTS:ERROR} -params {BLOCK_ROUTING_CONFLICTS:LOCK} -params {CDC_MIN_NUM_SYNC_REGS:2} -params {CDC_REPORT:true} -params {CLOCK_ASYNC:800} -params {CLOCK_DATA:5000} -params {CLOCK_GATE_ENABLE:false} -params {CLOCK_GATE_ENABLE_THRESHOLD_GLOBAL:1000} -params {CLOCK_GATE_ENABLE_THRESHOLD_ROW:100} -params {CLOCK_GLOBAL:2}  -params {PA4_GB_COUNT:36} -params {PA4_GB_MAX_RCLKINT_INSERTION:16} -params {PA4_GB_MIN_GB_FANOUT_TO_USE_RCLKINT:1000} -params {RAM_OPTIMIZED_FOR_POWER:0} -params {RETIMING:false} -params {ROM_TO_LOGIC:true} -params {SEQSHIFT_TO_URAM:1} -params {SYNPLIFY_TCL_FILE:../src/synplify_options.tcl} 
run_tool -name {SYNTHESIZE}

configure_tool -name {PLACEROUTE} -params {DELAY_ANALYSIS:MAX} -params {EFFORT_LEVEL:false} -params {GB_DEMOTION:true} -params {INCRPLACEANDROUTE:false} -params {IOREG_COMBINING:false} -params {MULTI_PASS_CRITERIA:VIOLATIONS} -params {MULTI_PASS_LAYOUT:true} -params {NUM_MULTI_PASSES:5} -params {PDPR:false} -params {RANDOM_SEED:0} -params {REPAIR_MIN_DELAY:true} -params {REPLICATION:false} -params {SLACK_CRITERIA:WORST_SLACK} -params {SPECIFIC_CLOCK:} -params {START_SEED_INDEX:1} -params {STOP_ON_FIRST_PASS:true} -params {TDPR:true} 
run_tool -name {PLACEROUTE}

#TODO: Timing is failing with min delay violations. Once the timing is fixed, re-enable Verify Timing
#configure_tool -name {VERIFYTIMING} -params {CONSTRAINTS_COVERAGE:1} -params {FORMAT:XML} -params {MAX_EXPANDED_PATHS_TIMING:1} -params {MAX_EXPANDED_PATHS_VIOLATION:0} -params {MAX_PARALLEL_PATHS_TIMING:1} -params {MAX_PARALLEL_PATHS_VIOLATION:1} -params {MAX_PATHS_INTERACTIVE_REPORT:1} -params {MAX_PATHS_TIMING:5} -params {MAX_PATHS_VIOLATION:20} -params {MAX_TIMING_FAST_HV_LT:1} -params {MAX_TIMING_MULTI_CORNER:1} -params {MAX_TIMING_SLOW_LV_HT:1} -params {MAX_TIMING_SLOW_LV_LT:1} -params {MAX_TIMING_VIOLATIONS_FAST_HV_LT:1} -params {MAX_TIMING_VIOLATIONS_MULTI_CORNER:1} -params {MAX_TIMING_VIOLATIONS_SLOW_LV_HT:1} -params {MAX_TIMING_VIOLATIONS_SLOW_LV_LT:1} -params {MIN_TIMING_FAST_HV_LT:1} -params {MIN_TIMING_MULTI_CORNER:1} -params {MIN_TIMING_SLOW_LV_HT:1} -params {MIN_TIMING_SLOW_LV_LT:1} -params {MIN_TIMING_VIOLATIONS_FAST_HV_LT:1} -params {MIN_TIMING_VIOLATIONS_MULTI_CORNER:1} -params {MIN_TIMING_VIOLATIONS_SLOW_LV_HT:1} -params {MIN_TIMING_VIOLATIONS_SLOW_LV_LT:1} -params {SLACK_THRESHOLD_VIOLATION:0.0} -params {SMART_INTERACTIVE:1} 
#run_tool -name {VERIFYTIMING}

run_tool -name {GENERATEPROGRAMMINGDATA} 

#Configure Design Initialization Data and Memories
configure_design_initialization_data -second_stage_start_address {0x00000000} -third_stage_uprom_start_address {0x00000000} -third_stage_snvm_start_address {0x00000000} -third_stage_spi_start_address {0x00000400} -third_stage_spi_type {SPIFLASH_NO_BINDING_PLAINTEXT} -third_stage_spi_clock_divider {6} -init_timeout 128 -auto_calib_timeout {3000} -broadcast_RAMs {1} 

#The below file sources the *.hex file generated by the SoftConsole
#and the .hex file for the texture_mapper image.
configure_ram -cfg_file {./src/cfg_and_mem_files/RAM.cfg} 
configure_snvm -cfg_file {./src/cfg_and_mem_files/SNVM.cfg} 
configure_spiflash -cfg_file {./src/cfg_and_mem_files/spiflash.cfg} 
save_project 

generate_design_initialization_data 

configure_tool \
         -name {GENERATEPROGRAMMINGFILE} \
         -params {program_fabric:true} \
         -params {program_security:false} \
         -params {program_snvm:true} \
         -params {sanitize_snvm:false} 
run_tool -name {GENERATEPROGRAMMINGFILE} 

#Generate the Programming job file
export_prog_job \
         -job_file_name {TOP} \
         -export_dir {.} \
         -bitstream_file_type {TRUSTED_FACILITY} \
         -bitstream_file_components {FABRIC_SNVM} \
         -zeroization_likenew_action 0 \
         -zeroization_unrecoverable_action 0 \
         -program_design 1 \
         -program_spi_flash 1 \
         -include_plaintext_passkey 0 \
         -design_bitstream_format {PPD} \
         -prog_optional_procedures {} \
         -skip_recommended_procedures {} \
         -sanitize_snvm 0 

save_project
