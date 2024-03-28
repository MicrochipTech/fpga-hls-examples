puts "TCL_BEGIN: [info script]"

#
# NOTES:
#   - Ideally this should go into their own create_hdl_plus_*.tcl files
#
set pathList [getHlsPaths]
set base_path [lindex $pathList 0]
puts "base_path: $base_path"

open_smartdesign -sd_name {Video_Pipeline} 

#
# Common
#

# This file is needed by the converters

create_links -hdl_source $base_path/ip/libs/generic/fwft_fifo/fwft_fifo.v
create_links -hdl_source $base_path/ip/libs/generic/fwft_fifo/ram_dual_port_fifo.v
# create_links -hdl_source $base_path/ip/libs/generic/cdc/rst_sync.v
# create_links -hdl_source $base_path/ip/sev/riscv-demo/async_fifo/axis_register.v
# create_links -hdl_source $base_path/ip/sev/riscv-demo/async_fifo/axis_async_fifo.v
create_links -hdl_source ./script_support/additional_configurations/smarthls/hdl/async_fifo/axis_async_fifo.v

#
# Video --> AXIS
#
create_links -hdl_source ./script_support/additional_configurations/smarthls/hdl/video-axis/video_axis.v

build_design_hierarchy
create_hdl_core \
    -file ./script_support/additional_configurations/smarthls/hdl/video-axis/video_axis.v \
    -module {Video_AXIS_Converter} \
    -library {work} \
    -package {}

hdl_core_add_bif -hdl_core_name {Video_AXIS_Converter} -bif_definition {AXI4Stream:AMBA:AMBA4:master} -bif_name {axis_initiator} -signal_map {}
hdl_core_assign_bif_signal -hdl_core_name {Video_AXIS_Converter} -bif_name {axis_initiator} -bif_signal_name {TLAST} -core_signal_name {o_tlast} 
hdl_core_assign_bif_signal -hdl_core_name {Video_AXIS_Converter} -bif_name {axis_initiator} -bif_signal_name {TUSER} -core_signal_name {o_tuser} 
hdl_core_assign_bif_signal -hdl_core_name {Video_AXIS_Converter} -bif_name {axis_initiator} -bif_signal_name {TDATA} -core_signal_name {o_tdata} 
hdl_core_assign_bif_signal -hdl_core_name {Video_AXIS_Converter} -bif_name {axis_initiator} -bif_signal_name {TVALID} -core_signal_name {o_tvalid} 
hdl_core_assign_bif_signal -hdl_core_name {Video_AXIS_Converter} -bif_name {axis_initiator} -bif_signal_name {TREADY} -core_signal_name {i_tready} 

#
# AXIS --> Video
#
create_links -hdl_source ./script_support/additional_configurations/smarthls/hdl/axis-video/axis_video.v

build_design_hierarchy
create_hdl_core \
    -file ./script_support/additional_configurations/smarthls/hdl/axis-video/axis_video.v \
    -module {AXIS_Video_Converter} \
    -library {work}


hdl_core_add_bif -hdl_core_name {AXIS_Video_Converter} -bif_definition {AXI4Stream:AMBA:AMBA4:slave} -bif_name {axis_target} -signal_map {}
hdl_core_assign_bif_signal -hdl_core_name {AXIS_Video_Converter} -bif_name {axis_target} -bif_signal_name {TLAST} -core_signal_name {i_tlast}
hdl_core_assign_bif_signal -hdl_core_name {AXIS_Video_Converter} -bif_name {axis_target} -bif_signal_name {TUSER} -core_signal_name {i_tuser}
hdl_core_assign_bif_signal -hdl_core_name {AXIS_Video_Converter} -bif_name {axis_target} -bif_signal_name {TDATA} -core_signal_name {i_tdata}
hdl_core_assign_bif_signal -hdl_core_name {AXIS_Video_Converter} -bif_name {axis_target} -bif_signal_name {TVALID} -core_signal_name {i_tvalid}
hdl_core_assign_bif_signal -hdl_core_name {AXIS_Video_Converter} -bif_name {axis_target} -bif_signal_name {TREADY} -core_signal_name {o_tready}

#
# Create a pass through between the converters 
#
sd_instantiate_hdl_core -sd_name {Video_Pipeline} -hdl_core_name {Video_AXIS_Converter} -instance_name {Video_AXIS_Converter_0} 
sd_instantiate_hdl_core -sd_name {Video_Pipeline} -hdl_core_name {AXIS_Video_Converter} -instance_name {AXIS_Video_Converter_0} 
sd_connect_pins -sd_name {Video_Pipeline} -pin_names {"Video_AXIS_Converter_0:axis_initiator" "AXIS_Video_Converter_0:axis_target"} 

# 
# Reroute the Video signals through the HLS subsystem
# 
sd_delete_nets -sd_name {Video_Pipeline} -net_names {video_processing_0_frame_start_encoder_o}
sd_delete_nets -sd_name {Video_Pipeline} -net_names {video_processing_0_DATA_VALID_O}
sd_delete_nets -sd_name {Video_Pipeline} -net_names {video_processing_0_DATA_R_O}
sd_delete_nets -sd_name {Video_Pipeline} -net_names {video_processing_0_DATA_G_O}
sd_delete_nets -sd_name {Video_Pipeline} -net_names {video_processing_0_DATA_B_O}

#
# Video-AXIS-Video combo uses only 12b compared to 16b from the register interface
#
sd_create_pin_slices -sd_name {Video_Pipeline} -pin_name {apb3_if_0:horiz_resl_o} -pin_slices {"[11:0]"} 
sd_create_pin_slices -sd_name {Video_Pipeline} -pin_name {apb3_if_0:vert_resl_o} -pin_slices {"[11:0]"} 

# 
# Video to AXIS connections
#
sd_connect_pins -sd_name {Video_Pipeline} -pin_names {"video_processing_0:frame_start_encoder_o"    "Video_AXIS_Converter_0:i_frame_start"}
sd_connect_pins -sd_name {Video_Pipeline} -pin_names {"video_processing_0:DATA_VALID_O"             "Video_AXIS_Converter_0:i_data_valid"}
sd_connect_pins -sd_name {Video_Pipeline} -pin_names {"apb3_if_0:vert_resl_o[11:0]"                 "Video_AXIS_Converter_0:i_vres"}
sd_connect_pins -sd_name {Video_Pipeline} -pin_names {"apb3_if_0:horiz_resl_o[11:0]"                "Video_AXIS_Converter_0:i_hres"}
sd_connect_pins -sd_name {Video_Pipeline} -pin_names {"video_processing_0:DATA_R_O"                 "Video_AXIS_Converter_0:i_R"}
sd_connect_pins -sd_name {Video_Pipeline} -pin_names {"video_processing_0:DATA_G_O"                 "Video_AXIS_Converter_0:i_G"}
sd_connect_pins -sd_name {Video_Pipeline} -pin_names {"video_processing_0:DATA_B_O"                 "Video_AXIS_Converter_0:i_B"}
sd_connect_pins -sd_name {Video_Pipeline} -pin_names {"IMX334_IF_TOP_0:PARALLEL_CLOCK"              "Video_AXIS_Converter_0:i_video_clk"}
sd_connect_pins -sd_name {Video_Pipeline} -pin_names {"IMX334_IF_TOP_0:CAMCLK_RESET_N"              "Video_AXIS_Converter_0:i_video_reset"}
sd_connect_pins -sd_name {Video_Pipeline} -pin_names {"CLK_170MHz_i"                                "Video_AXIS_Converter_0:i_axis_clk"}

sd_mark_pins_unused -sd_name {Video_Pipeline} -pin_names "Video_AXIS_Converter_0:o_frames_skipped"
sd_mark_pins_unused -sd_name {Video_Pipeline} -pin_names "Video_AXIS_Converter_0:o_pushback_detected"
 
# 
# AXIS to Video connections
#
sd_connect_pins -sd_name {Video_Pipeline} -pin_names {"apb3_if_0:horiz_resl_o[11:0]"                "AXIS_Video_Converter_0:i_hres"} 
sd_connect_pins -sd_name {Video_Pipeline} -pin_names {"apb3_if_0:vert_resl_o[11:0]"                 "AXIS_Video_Converter_0:i_vres"}
sd_connect_pins -sd_name {Video_Pipeline} -pin_names {"IMX334_IF_TOP_0:PARALLEL_CLOCK"              "AXIS_Video_Converter_0:i_video_clk"}
sd_connect_pins -sd_name {Video_Pipeline} -pin_names {"IMX334_IF_TOP_0:CAMCLK_RESET_N"              "AXIS_Video_Converter_0:i_video_reset"}
sd_connect_pins -sd_name {Video_Pipeline} -pin_names {"CLK_170MHz_i"                                "AXIS_Video_Converter_0:i_axis_clk"}
sd_connect_pins -sd_name {Video_Pipeline} -pin_names {"AXIS_Video_Converter_0:o_R"                  "RGBtoYCbCr_C0_0:RED_I"}
sd_connect_pins -sd_name {Video_Pipeline} -pin_names {"AXIS_Video_Converter_0:o_G"                  "RGBtoYCbCr_C0_0:GREEN_I"}
sd_connect_pins -sd_name {Video_Pipeline} -pin_names {"AXIS_Video_Converter_0:o_B"                  "RGBtoYCbCr_C0_0:BLUE_I"}
sd_connect_pins -sd_name {Video_Pipeline} -pin_names {"AXIS_Video_Converter_0:o_data_valid"         "RGBtoYCbCr_C0_0:DATA_VALID_I"}
sd_connect_pins -sd_name {Video_Pipeline} -pin_names {"AXIS_Video_Converter_0:o_frame_start"        "h264_top_0:frame_valid_i"}
sd_connect_pins -sd_name {Video_Pipeline} -pin_names {"AXIS_Video_Converter_0:o_EOF"                "h264_top_0:eof_i"}

# 
# Reset polarity inversions
#
sd_connect_pins -sd_name {Video_Pipeline} -pin_names {  "HLS_PIPELINE_RESETN:Y" \
                                                        "Video_AXIS_Converter_0:i_axis_reset"\
                                                        "AXIS_Video_Converter_0:i_axis_reset"}
sd_invert_pins -sd_name {Video_Pipeline} -pin_names {"Video_AXIS_Converter_0:i_video_reset"}
sd_invert_pins -sd_name {Video_Pipeline} -pin_names {"Video_AXIS_Converter_0:i_axis_reset"}
sd_invert_pins -sd_name {Video_Pipeline} -pin_names {"AXIS_Video_Converter_0:i_video_reset"}
sd_invert_pins -sd_name {Video_Pipeline} -pin_names {"AXIS_Video_Converter_0:i_axis_reset"}

save_smartdesign -sd_name {Video_Pipeline} 

puts "TCL_END: [info script]"
