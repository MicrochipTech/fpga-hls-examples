# Creating SmartDesign LegUp_Image_Filters
set sd_name {LegUp_Image_Filters}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {clk} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {input_valid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {reset_n} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {toggle} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {vsync} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {output_valid} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {greyscale_input} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {switches} -port_direction {IN} -port_range {[3:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {onehot_state} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {processing_output} -port_direction {OUT} -port_range {[7:0]}


sd_create_pin_slices -sd_name ${sd_name} -pin_name {switches} -pin_slices {[0:0]}
sd_invert_pins -sd_name ${sd_name} -pin_names {switches[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {switches} -pin_slices {[1:1]}
sd_invert_pins -sd_name ${sd_name} -pin_names {switches[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {switches} -pin_slices {[2:2]}
sd_invert_pins -sd_name ${sd_name} -pin_names {switches[2:2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {switches} -pin_slices {[3:3]}
sd_invert_pins -sd_name ${sd_name} -pin_names {switches[3:3]}
sd_invert_pins -sd_name ${sd_name} -pin_names {toggle}
# Add AND2_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {AND2_0}
sd_invert_pins -sd_name ${sd_name} -pin_names {AND2_0:B}



# Add binary_to_onehot_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {binary_to_onehot} -hdl_file {hdl\binary_to_onehot.v} -instance_name {binary_to_onehot_0}



# Add canny_top_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {canny_top} -instance_name {canny_top_0}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {canny_top_0:input_fifo_axi4stream} -pin_names {canny_top_0:input_fifo}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {canny_top_0:input_fifo_axi4stream} -pin_names {canny_top_0:input_fifo_valid}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {canny_top_0:output_fifo_axi4stream} -pin_names {canny_top_0:output_fifo}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {canny_top_0:output_fifo_axi4stream} -pin_names {canny_top_0:output_fifo_ready}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {canny_top_0:output_fifo_axi4stream} -pin_names {canny_top_0:output_fifo_valid}
sd_invert_pins -sd_name ${sd_name} -pin_names {canny_top_0:reset}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {canny_top_0:start} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {canny_top_0:ready}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {canny_top_0:finish}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {canny_top_0:output_fifo_ready} -value {VCC}



# Add delay_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {delay} -hdl_file {hdl\delay.v} -instance_name {delay_0}
sd_invert_pins -sd_name ${sd_name} -pin_names {delay_0:reset}



# Add gaussian_filter_pipelined_top_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {gaussian_filter_pipelined_top} -instance_name {gaussian_filter_pipelined_top_0}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {gaussian_filter_pipelined_top_0:input_fifo_axi4stream} -pin_names {gaussian_filter_pipelined_top_0:input_fifo}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {gaussian_filter_pipelined_top_0:input_fifo_axi4stream} -pin_names {gaussian_filter_pipelined_top_0:input_fifo_valid}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {gaussian_filter_pipelined_top_0:output_fifo_axi4stream} -pin_names {gaussian_filter_pipelined_top_0:output_fifo}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {gaussian_filter_pipelined_top_0:output_fifo_axi4stream} -pin_names {gaussian_filter_pipelined_top_0:output_fifo_ready}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {gaussian_filter_pipelined_top_0:output_fifo_axi4stream} -pin_names {gaussian_filter_pipelined_top_0:output_fifo_valid}
sd_invert_pins -sd_name ${sd_name} -pin_names {gaussian_filter_pipelined_top_0:reset}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {gaussian_filter_pipelined_top_0:start} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {gaussian_filter_pipelined_top_0:ready}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {gaussian_filter_pipelined_top_0:finish}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {gaussian_filter_pipelined_top_0:output_fifo_ready} -value {VCC}



# Add mux_3_to_1_8bit_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {mux_3_to_1_8bit} -instance_name {mux_3_to_1_8bit_0}
# Exporting Parameters of instance mux_3_to_1_8bit_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {mux_3_to_1_8bit_0} -params {\
"DATA_WIDTH:8" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {mux_3_to_1_8bit_0}
sd_update_instance -sd_name ${sd_name} -instance_name {mux_3_to_1_8bit_0}



# Add switch_3_state_controller_top_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {switch_3_state_controller_top} -instance_name {switch_3_state_controller_top_0}
sd_invert_pins -sd_name ${sd_name} -pin_names {switch_3_state_controller_top_0:reset}



# Add video_fifo_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {video_fifo} -instance_name {video_fifo_0}
# Exporting Parameters of instance video_fifo_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {video_fifo_0} -params {\
"g_HALF_EMPTY_THRESHOLD:1280" \
"g_INPUT_VIDEO_DATA_BIT_WIDTH:8" \
"g_VIDEO_FIFO_AWIDTH:12" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {video_fifo_0}
sd_update_instance -sd_name ${sd_name} -instance_name {video_fifo_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_0:wfull_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_0:wafull_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_0:rdata_rdy_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_0:rempty_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_0:raempty_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_0:rhempty_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_0:wdata_count_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_0:rdata_count_o}



# Add video_fifo_1 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {video_fifo} -instance_name {video_fifo_1}
# Exporting Parameters of instance video_fifo_1
sd_configure_core_instance -sd_name ${sd_name} -instance_name {video_fifo_1} -params {\
"g_HALF_EMPTY_THRESHOLD:1280" \
"g_INPUT_VIDEO_DATA_BIT_WIDTH:8" \
"g_VIDEO_FIFO_AWIDTH:12" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {video_fifo_1}
sd_update_instance -sd_name ${sd_name} -instance_name {video_fifo_1}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_1:wfull_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_1:wafull_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_1:rdata_rdy_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_1:rempty_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_1:raempty_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_1:rhempty_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_1:wdata_count_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_1:rdata_count_o}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:A" "canny_top_0:reset" "delay_0:reset" "gaussian_filter_pipelined_top_0:reset" "reset_n" "switch_3_state_controller_top_0:reset" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:B" "vsync" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:Y" "video_fifo_0:rresetn_i" "video_fifo_0:wresetn_i" "video_fifo_1:rresetn_i" "video_fifo_1:wresetn_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"canny_top_0:clk" "clk" "delay_0:clk" "gaussian_filter_pipelined_top_0:clk" "switch_3_state_controller_top_0:clk" "video_fifo_0:rclock_i" "video_fifo_0:wclock_i" "video_fifo_1:rclock_i" "video_fifo_1:wclock_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"canny_top_0:input_fifo_valid" "gaussian_filter_pipelined_top_0:input_fifo_valid" "input_valid" "video_fifo_0:wen_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"canny_top_0:output_fifo_valid" "delay_0:valid_i" "video_fifo_0:ren_i" "video_fifo_1:ren_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"canny_top_0:switch_0" "gaussian_filter_pipelined_top_0:on_switch" "switches[0:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"canny_top_0:switch_1" "switches[1:1]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"canny_top_0:switch_2" "switches[2:2]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"canny_top_0:switch_3" "switches[3:3]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"delay_0:valid_o" "output_valid" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"gaussian_filter_pipelined_top_0:output_fifo_valid" "video_fifo_1:wen_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"switch_3_state_controller_top_0:toggle" "toggle" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"binary_to_onehot_0:binary" "mux_3_to_1_8bit_0:sel" "switch_3_state_controller_top_0:sel" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"binary_to_onehot_0:onehot" "onehot_state" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"canny_top_0:input_fifo" "gaussian_filter_pipelined_top_0:input_fifo" "greyscale_input" "video_fifo_0:wdata_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"canny_top_0:output_fifo" "delay_0:data_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"delay_0:data_o" "mux_3_to_1_8bit_0:c" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"gaussian_filter_pipelined_top_0:output_fifo" "video_fifo_1:wdata_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"mux_3_to_1_8bit_0:a" "video_fifo_0:rdata_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"mux_3_to_1_8bit_0:b" "video_fifo_1:rdata_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"mux_3_to_1_8bit_0:o" "processing_output" }


# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign LegUp_Image_Filters
generate_component -component_name ${sd_name}
