# to run:
# libero SCRIPT:libero_update_hls_core.tcl SCRIPT_ARGS:"<libero_prjx_file> <top_component> <hdl_core_name> <verilog_file> <create_hdl_plus> <current_sd_name> <instance_update>"
#
# store arguments in parameters
set project         [lindex $argv 0]
set top_component   [lindex $argv 1]
set hdl_core_name   [lindex $argv 2]
set verilog_file    [lindex $argv 3]
set create_hdl_plus [lindex $argv 4]
set current_sd_name [lindex $argv 5]
set instance_update [lindex $argv 6]
# added the below argument to take into account the name change of hls module from legup to smarthls
set new_hdl_core_name [string map {legup smarthls} $hdl_core_name]

open_project -file $project
remove_hdl_core -hdl_core_name $hdl_core_name
delete_files -file $verilog_file -from_disk

# re-create the SmartHLS core
source $create_hdl_plus
open_smartdesign -sd_name $current_sd_name
sd_replace_component -sd_name $current_sd_name  -instance_name $instance_update -new_component_name $new_hdl_core_name -replace_all_instances 1
save_smartdesign -sd_name $current_sd_name
generate_component -component_name $current_sd_name -recursive 1
generate_component -component_name $top_component -recursive 1
build_design_hierarchy

save_project
close_project 
