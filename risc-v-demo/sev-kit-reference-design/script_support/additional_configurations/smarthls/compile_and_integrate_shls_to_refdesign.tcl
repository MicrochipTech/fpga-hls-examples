puts "TCL_BEGIN: [info script]"

set OS [lindex $tcl_platform(os) 0]
set liberoRelease [string trim [string range [get_libero_release] 0 end] "*v" ]

# 
# Save the current working because we're moving to the HLS module directory.
#
set cwd [pwd]
set hlsModuleDir [file normalize $SMARTHLS]
cd $hlsModuleDir

# 
# Detect where SmartHLS and bash interpreter are located
#
set pathList [getHlsPaths]
set shls_path [lindex $pathList 1]
puts "shls_path: $shls_path"

set ::env(SHLS_ROOT_DIR) [file dirname $shls_path]/..

#
# Call SmartHLS.
#
# - The file open is just to pipe stdout as SmartHLS compilation advances
set command "$shls_path -a hw"
set fid [open "| $command" "r"]
# Print the result while execution
while {[gets $fid line] != -1} {
    # Process each line of output
    puts $line
}
# Close the fid
close $fid

#
# Connect additional signals
#
proc hls_user_connections {} {
    puts "Adding extra connections..."
    sd_connect_pins -sd_name {Video_Pipeline} -pin_names {"Video_AXIS_Converter_0:axis_initiator"   "get_frame_top_0:in_fifo_axi4stream"}
    sd_connect_pins -sd_name {Video_Pipeline} -pin_names {"get_frame_top_0:out_fifo_axi4stream"     "hls_pipeline_top_0:in_fifo_axi4stream"}
    sd_connect_pins -sd_name {Video_Pipeline} -pin_names {"hls_pipeline_top_0:out_fifo_axi4stream"  "watermark_top_0:in_fifo_axi4stream"}
    sd_connect_pins -sd_name {Video_Pipeline} -pin_names {"watermark_top_0:out_fifo_axi4stream"     "rotozoom_top_0:in_fifo_axi4stream"}
    sd_connect_pins -sd_name {Video_Pipeline} -pin_names {"rotozoom_top_0:out_fifo_axi4stream"      "put_frame_top_0:in_fifo_axi4stream"}
    sd_connect_pins -sd_name {Video_Pipeline} -pin_names {"put_frame_top_0:out_fifo_axi4stream"     "AXIS_Video_Converter_0:axis_target"}
}

#
# Integrate SmartHLS hardware modules into SmartDesign
#
source $hlsModuleDir/hls_output/scripts/shls_integrate_accels.tcl

#
# Restore the working directory
#
cd $cwd

puts "TCL_END: [info script]"
