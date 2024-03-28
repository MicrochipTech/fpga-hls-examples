#
# Find out where SmartHLS is installed in the system, considering the OS as well. 
# In decreasing order of priority, the options are:
#   1) Custom (user-defined) path. Users can specify the path to SmartHLS as an 
#       argument to the script. For example, on Windows:
#       script_args:shls_path:C:/fpga_tools/SmartHLS-2022.2.1/SmartHLS/bin/shls
#       This is typical for SmartHLS incremental releases.
#   2) Otherwise, see if the `shls` command is in the PATH environment variable.
#   3) If not, then check under the Libero installation path
#
proc getHlsPaths { } {
    set install_loc [defvar_get -name ACTEL_SW_DIR]
    set OS [lindex $::tcl_platform(os) 0]
    set liberoRelease [string trim [string range [get_libero_release] 0 end] "*v" ]

    # set base_path ""
    if {![info exists shls_path]} {catch {set shls_path [exec which shls]}}
    
    if {[info exists shls_path]} {
        set base_path [string trimright $shls_path bin/shls]
    } else {
        global shls_path
        if { $OS == "Linux" } {
            set base_path [string cat [string trimright $install_loc Libero]/SmartHLS-$liberoRelease {/}]
            set ::env(PATH) [string cat $::env(PATH) ":" $base_path {SmartHLS/bin}]
            set shls_path [string cat $base_path {SmartHLS/bin/shls}]
        } else {
            set base_path [string cat [string trimright $install_loc Designer]SmartHLS-$liberoRelease {/}]
            set base_path [file normalize $base_path]
            set drive [string range $install_loc 0 0]
            set shls_path "$base_path/SmartHLS/bin/shls.bat"
            set shls_path [file normalize $shls_path]
            set ::env(PATH) [string cat $::env(PATH) ";" $base_path {SmartHLS/bin}]
        }
    }
    puts "base_path: $base_path"
    puts "shls_path: $shls_path"

    if {![file exists "$shls_path"]} {
        puts stderr "Error: Cannot find SmartHLS (shls)."
        puts stderr "Please specify a full path to SmartHLS (shls file) using \"shls_path\" parameter in the \"script_args\"."
        puts stderr "For example: script_args:shls_path:C:/Microchip/SmartHLS-20XX.Y.Z/SmartHLS/bin/shls"
        exit 1
    }

    #return the list of paths
    set pathList [list $base_path $shls_path]
}

proc create_config {current_config updated_config} {
    set def_config [open $current_config]
    set def_config_data [read $def_config]
    set data [split $def_config_data "\n"]
    close $def_config
    
    set new_config [open $updated_config w]
    foreach line $data {
        puts $new_config "$line"
    }
    puts $new_config ""
    close $new_config
}

proc update_param {config param_to_update value_to_set} {
    set config_file [open $config]
    set config_file_data [read $config_file]
    set config_file_lines [split $config_file_data "\n"]
    close $config_file
    set config_file [open $config w]
    foreach line $config_file_lines {
        if { [regexp $param_to_update $line] } {
            puts $config_file "$param_to_update$value_to_set"
            puts $line
        } else {
            puts $config_file "$line"
        }
    }
    close $config_file
}

proc create_eNVM_config {config client} {
    set envm_config [open $config w]
    
    puts $envm_config "set_plain_text_client \\"
    puts $envm_config "-client_name {BOOT_MODE_1_ENVM_CLIENT} \\"
    puts $envm_config "-number_of_bytes 117248 \\"
    puts $envm_config "-content_type {MEMORY_FILE} \\"
    puts $envm_config "-content_file_format {Intel-Hex} \\"
    puts $envm_config "-content_file {$client} \\"
    puts $envm_config "-mem_file_base_address {0x20220000} \\"
    puts $envm_config "-start_page 0 \\"
    puts $envm_config "-use_for_simulation 0 \\"
    puts $envm_config "-reprogram 1 \\"
    puts $envm_config "-use_as_rom 0 \\"
    puts $envm_config "-fabric_access_read 1 \\"
    puts $envm_config "-fabric_access_write 0 \\"
    puts $envm_config "-mss_access_read 1 \\"
    puts $envm_config "-mss_access_write 0"

    close $envm_config
}

proc export_fpe_job {name directory components} {
    export_prog_job \
        -job_file_name $name \
        -export_dir $directory \
        -bitstream_file_type {TRUSTED_FACILITY} \
        -bitstream_file_components $components \
        -zeroization_likenew_action 0 \
        -zeroization_unrecoverable_action 0 \
        -program_design 1 \
        -program_spi_flash 0 \
        -include_plaintext_passkey 0 \
        -design_bitstream_format {PPD} \
        -prog_optional_procedures {} \
        -skip_recommended_procedures {} \
        -sanitize_snvm 0 \
        -sanitize_envm 0
}
