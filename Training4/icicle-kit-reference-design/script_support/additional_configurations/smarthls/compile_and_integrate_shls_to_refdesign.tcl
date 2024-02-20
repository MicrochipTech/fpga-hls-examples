puts "TCL_BEGIN: [info script]"

# 
# Save the current working because we're moving to the HLS module directory.
#
set cwd [pwd]
set hlsModuleDir [file normalize $SMARTHLS]
cd $hlsModuleDir

set shls_path [getHlsPath]
set ::env(SHLS_ROOT_DIR) [file dirname $shls_path]/..
 
#
# Call SmartHLS.
#
# - The "soc_sw_compile_accel" target will generate and compile not just 
#   the software driver, but also the hardware (Verilog + TCL) as the hardware 
#   is an explicit dependency in SmartHLS makefile
# - The file open is just to pipe stdout as SmartHLS compilation advances


set command "$shls_path -a soc_sw_compile_accel"
set fid [open "| $command" "r"]
# Print the result while execution
while {[gets $fid line] != -1} {
    # Process each line of output
    puts $line
}
# Close the fid
close $fid

 
#
# Integrate SmartHLS hardware modules into SmartDesign
#
source $hlsModuleDir/hls_output/scripts/shls_integrate_accels.tcl
 
#
# Restore the working directory
#
cd $cwd
 
puts "TCL_END: [info script]"