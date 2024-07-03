puts "TCL_BEGIN: [info script]"

#
# // Icicle Kit eMMC Libero design
#

#
# // Check path length to verify project can be created
#

if { [lindex $tcl_platform(os) 0]  == "Windows" } {
    if {[string length [pwd]] < 90} {
        puts "Project path length ok."
    } else {
        error "Path to project is too long, please reduce the path and try again."
    }
}

#
# // Process arguments
#

if { $::argc > 0 } {
    set i 1
    foreach arg $::argv {
        if {[string match "*:*" $arg]} {
            set var [string range $arg 0 [string first ":" $arg]-1]
            set val [string range $arg [string first ":" $arg]+1 end]
            puts "Setting parameter $var to $val"
            set $var "$val"
        } else {
            set $arg 1
            puts "set $arg to 1"
        }
        incr i
    }
} else {
    puts "no command line argument passed"
}

#
# // Set required variables and add functions
#

set libero_release [split [get_libero_version] .]
set install_loc [defvar_get -name ACTEL_SW_DIR]
set mss_config_loc "$install_loc/bin64/pfsoc_mss"
set local_dir [pwd]
set constraint_path ./script_support/constraints


set project_name "Icicle_SoC"
set project_dir "$local_dir/soc"


set MSS_LINUX 1


source ./script_support/additional_configurations/functions.tcl

#
# // Open or create a Libero project
#
if { [file exists $project_dir/$project_name.prjx] } {
    puts "Open existing project"
    open_project -file $project_dir/$project_name.prjx
    open_smartdesign -sd_name {MPFS_ICICLE_KIT_BASE_DESIGN}
    set isNewProject 0
} else {
    puts "Creating a new project"
    set isNewProject 1
    new_project \
        -location $project_dir \
        -name $project_name \
        -project_description {} \
        -block_mode 0 \
        -standalone_peripheral_initialization 0 \
        -instantiate_in_smartdesign 1 \
        -ondemand_build_dh 1 \
        -use_relative_path 0 \
        -linked_files_root_dir_env {} \
        -hdl {VERILOG} \
        -family {PolarFireSoC} \
        -die {MPFS250T_ES} \
        -package {FCVG484} \
        -speed {STD} \
        -die_voltage {1.05} \
        -part_range {EXT} \
        -adv_options {IO_DEFT_STD:LVCMOS 1.8V} \
        -adv_options {RESTRICTPROBEPINS:1} \
        -adv_options {RESTRICTSPIPINS:0} \
        -adv_options {SYSTEM_CONTROLLER_SUSPEND_MODE:0} \
        -adv_options {TEMPR:EXT} \
        -adv_options {VCCI_1.2_VOLTR:EXT} \
        -adv_options {VCCI_1.5_VOLTR:EXT} \
        -adv_options {VCCI_1.8_VOLTR:EXT} \
        -adv_options {VCCI_2.5_VOLTR:EXT} \
        -adv_options {VCCI_3.3_VOLTR:EXT} \
        -adv_options {VOLTR:EXT}

    smartdesign \
        -memory_map_drc_change_error_to_warning 1 \
        -bus_interface_data_width_drc_change_error_to_warning 1 \
        -bus_interface_id_width_drc_change_error_to_warning 1 
    #
    # // Download required cores
    #
	try {
		download_core -vlnv {Actel:SgCore:PF_OSC:*} -location {www.microchip-ip.com/repositories/SgCore}
		download_core -vlnv {Actel:SgCore:PF_CCC:*} -location {www.microchip-ip.com/repositories/SgCore}
		download_core -vlnv {Actel:DirectCore:CORERESET_PF:*} -location {www.microchip-ip.com/repositories/DirectCore}
		download_core -vlnv {Microsemi:SgCore:PFSOC_INIT_MONITOR:*} -location {www.microchip-ip.com/repositories/SgCore}
		download_core -vlnv {Actel:DirectCore:COREAXI4INTERCONNECT:2.8.103} -location {www.microchip-ip.com/repositories/DirectCore}
		download_core -vlnv {Actel:SgCore:PF_CLK_DIV:*} -location {www.microchip-ip.com/repositories/SgCore}
		download_core -vlnv {Actel:SgCore:PF_DRI:*} -location {www.microchip-ip.com/repositories/SgCore}
		download_core -vlnv {Actel:SgCore:PF_NGMUX:*} -location {www.microchip-ip.com/repositories/SgCore}
		download_core -vlnv {Actel:SgCore:PF_PCIE:*} -location {www.microchip-ip.com/repositories/SgCore}
		download_core -vlnv {Actel:SgCore:PF_TX_PLL:*} -location {www.microchip-ip.com/repositories/SgCore}
		download_core -vlnv {Actel:SgCore:PF_XCVR_REF_CLK:*} -location {www.microchip-ip.com/repositories/SgCore}
		download_core -vlnv {Actel:DirectCore:CoreAPB3:4.2.100} -location {www.microchip-ip.com/repositories/DirectCore}
		download_core -vlnv {Actel:DirectCore:COREAXI4DMACONTROLLER:2.0.100} -location {www.microchip-ip.com/repositories/DirectCore}
		download_core -vlnv {Actel:DirectCore:CoreGPIO:3.2.102} -location {www.microchip-ip.com/repositories/DirectCore}
		download_core -vlnv {Actel:SystemBuilder:PF_SRAM_AHBL_AXI:*} -location {www.microchip-ip.com/repositories/SgCore}
		download_core -vlnv {Actel:Simulation:CLK_GEN:*} -location {www.microchip-ip.com/repositories/SgCore}
		download_core -vlnv {Actel:Simulation:RESET_GEN:*} -location {www.microchip-ip.com/repositories/SgCore}
		download_core -vlnv {Actel:DirectCore:corepwm:4.5.100} -location {www.microchip-ip.com/repositories/DirectCore} 
		download_core -vlnv {Actel:DirectCore:COREI2C:7.2.101} -location {www.microchip-ip.com/repositories/DirectCore} 
		download_core -vlnv {Actel:DirectCore:CoreUARTapb:5.7.100} -location {www.microchip-ip.com/repositories/DirectCore} 
	} on error err {
		puts "Downloading cores failed, the script will continute but will fail if all of the required cores aren't present in the vault."
	}

    #
    #  // Generate and import MSS component
    #

    if {[file isdirectory $local_dir/script_support/components/MSS]} {
        file delete -force $local_dir/script_support/components/MSS
    }
    file mkdir $local_dir/script_support/components/MSS


    exec $mss_config_loc -GENERATE -CONFIGURATION_FILE:$local_dir/script_support/MPFS_ICICLE_MSS_linux.cfg -OUTPUT_DIR:$local_dir/script_support/components/MSS

    import_mss_component -file "$local_dir/script_support/components/MSS/ICICLE_MSS.cxz"

    #
    # // Generate base design
    #

    cd ./script_support/
    source MPFS_ICICLE_KIT_BASE_DESIGN_recursive.tcl
    cd ../
    set_root -module {MPFS_ICICLE_KIT_BASE_DESIGN::work} 

    #
    # // Import I/O constraints
    #

    import_files \
        -convert_EDN_to_HDL 0 \
        -io_pdc "${constraint_path}/ICICLE.pdc" \
        -io_pdc "${constraint_path}/ICICLE_CAN0.pdc" \
        -io_pdc "${constraint_path}/ICICLE_MAC.pdc" \
        -io_pdc "${constraint_path}/ICICLE_MIKROBUS.pdc" \
        -io_pdc "${constraint_path}/ICICLE_MMUART0.pdc" \
        -io_pdc "${constraint_path}/ICICLE_MMUART1.pdc" \
        -io_pdc "${constraint_path}/ICICLE_MMUART2.pdc" \
        -io_pdc "${constraint_path}/ICICLE_MMUART3.pdc" \
        -io_pdc "${constraint_path}/ICICLE_PCIE.pdc" \
        -io_pdc "${constraint_path}/ICICLE_USB.pdc" \
        -io_pdc "${constraint_path}/ICICLE_SDIO.pdc" \
        -io_pdc "${constraint_path}/ICICLE_RPi.pdc" \
        -io_pdc "${constraint_path}/ICICLE_I2C_LOOPBACK.pdc" \
        -io_pdc "${constraint_path}/ICICLE_SPI_LOOPBACK.pdc" \
        -io_pdc "${constraint_path}/ICICLE_RPi_MICRON_QSPI.pdc" \
	    -fp_pdc "${constraint_path}/NW_PLL.pdc" \
	    -sdc "${constraint_path}/fic_clocks.sdc"

    #
    # // Associate imported constraints with the design flow
    #

    organize_tool_files \
        -tool {SYNTHESIZE} \
        -file "${project_dir}/constraint/fic_clocks.sdc" \
        -module {MPFS_ICICLE_KIT_BASE_DESIGN::work} \
        -input_type {constraint} 

	organize_tool_files \
        -tool {PLACEROUTE} \
        -file "${project_dir}/constraint/io/ICICLE_CAN0.pdc" \
        -file "${project_dir}/constraint/io/ICICLE_MIKROBUS.pdc" \
        -file "${project_dir}/constraint/io/ICICLE_SDIO.pdc" \
        -file "${project_dir}/constraint/io/ICICLE_USB.pdc" \
        -file "${project_dir}/constraint/io/ICICLE.pdc" \
        -file "${project_dir}/constraint/io/ICICLE_MAC.pdc" \
        -file "${project_dir}/constraint/io/ICICLE_PCIE.pdc" \
        -file "${project_dir}/constraint/io/ICICLE_MMUART0.pdc" \
        -file "${project_dir}/constraint/io/ICICLE_MMUART1.pdc" \
        -file "${project_dir}/constraint/io/ICICLE_MMUART3.pdc" \
        -file "${project_dir}/constraint/io/ICICLE_MMUART2.pdc" \
        -file "${project_dir}/constraint/io/ICICLE_RPi.pdc" \
        -file "${project_dir}/constraint/fp/NW_PLL.pdc" \
        -file "${project_dir}/constraint/fic_clocks.sdc" \
        -module {MPFS_ICICLE_KIT_BASE_DESIGN::work} \
        -input_type {constraint}
	
    organize_tool_files \
        -tool {VERIFYTIMING} \
        -file "${project_dir}/constraint/fic_clocks.sdc" \
        -module {MPFS_ICICLE_KIT_BASE_DESIGN::work} \
        -input_type {constraint} 
        
        
    #
    # // Build hierarchy before progressing
    #

    build_design_hierarchy


    #
    # // Derive timing constraints
    #
    build_design_hierarchy
    derive_constraints_sdc 

    #
    # // Auto layout SmartDesigns
    #
    save_project 
    sd_reset_layout -sd_name {CLOCKS_AND_RESETS}
    save_smartdesign -sd_name {CLOCKS_AND_RESETS}
    sd_reset_layout -sd_name {FIC_0_PERIPHERALS}
    save_smartdesign -sd_name {FIC_0_PERIPHERALS}
    sd_reset_layout -sd_name {FIC_1_PERIPHERALS}
    save_smartdesign -sd_name {FIC_1_PERIPHERALS}
    sd_reset_layout -sd_name {CORE_I2C_C0_0_WRAPPER}
    save_smartdesign -sd_name {CORE_I2C_C0_0_WRAPPER}
    sd_reset_layout -sd_name {FIC_3_ADDRESS_GENERATION}
    save_smartdesign -sd_name {FIC_3_ADDRESS_GENERATION}
    sd_reset_layout -sd_name {IHC_SUBSYSTEM}
    save_smartdesign -sd_name {IHC_SUBSYSTEM}
    sd_reset_layout -sd_name {FIC_3_PERIPHERALS}
    save_smartdesign -sd_name {FIC_3_PERIPHERALS}
    sd_reset_layout -sd_name {MSS_WRAPPER}
    save_smartdesign -sd_name {MSS_WRAPPER}
    sd_reset_layout -sd_name {MPFS_ICICLE_KIT_BASE_DESIGN}
    save_smartdesign -sd_name {MPFS_ICICLE_KIT_BASE_DESIGN}
} ; # // Create new project


# 
# Compile and integrate the SmartHLS code
#
if {$isNewProject} {
    # Prepare the SmartDesign for HLS integration 
    source ./script_support/additional_configurations/smarthls/pre_hls_integration.tcl
}

# If the SmartHLS variable points to a valid SmartHLS project directory, then compile it.
# Otherwise, HLS modules can be added later.
if {[file isdirectory $SMARTHLS]} {
    source ./script_support/additional_configurations/smarthls/compile_and_integrate_shls_to_refdesign.tcl
    derive_constraints_sdc
}

build_design_hierarchy

#
# // Run the design flow and add eNVM clients if required
#

if {[info exists SYNTHESIZE]} {
    run_tool -name {SYNTHESIZE}
} elseif {[info exists PLACEROUTE]} {
    run_tool -name {PLACEROUTE}
} elseif {[info exists VERIFY_TIMING]} {
    run_tool -name {VERIFYTIMING}
}

if {[info exists HSS_UPDATE]} {
    if !{[file exists "./script_support/hss-envm-wrapper.mpfs-icicle-kit-es.hex"]} {
        if {[catch    {exec wget https://github.com/polarfire-soc/hart-software-services/releases/latest/download/hss-envm-wrapper.mpfs-icicle-kit-es.hex -P ./script_support/} issue]} {
        }
    }
    create_eNVM_config "$local_dir/script_support/components/MSS/ENVM.cfg" "$local_dir/script_support/hss-envm-wrapper.mpfs-icicle-kit-es.hex"
    run_tool -name {GENERATEPROGRAMMINGDATA}
    configure_envm -cfg_file {script_support/components/MSS/ENVM.cfg}
}

if {[info exists GENERATE_PROGRAMMING_DATA]} {
    run_tool -name {GENERATEPROGRAMMINGDATA}
}  elseif {[info exists PROGRAM]} {
    run_tool -name {PROGRAMDEVICE}
} elseif {[info exists EXPORT_FPE]} {   
    set gUseSPI [update_snvm_to_spi_ram_cfg $project_dir/designer/MPFS_ICICLE_KIT_BASE_DESIGN/MPFS_ICICLE_KIT_BASE_DESIGN_RAM.cfg ]
    generate_design_initialization_data
    
    
    set jobPath $local_dir
    if {[file isdirectory $EXPORT_FPE]} {set jobPath $EXPORT_FPE}

    set components "FABRIC_SNVM"
    if {[info exists HSS_UPDATE]} { set components "$components ENVM" }

    puts "export_fpe_job $project_name $jobPath $components $gUseSPI"
    export_fpe_job $project_name $jobPath $components $gUseSPI
}

save_project 

puts "TCL_END: [info script]"
