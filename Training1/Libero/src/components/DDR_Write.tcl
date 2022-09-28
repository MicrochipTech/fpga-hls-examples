# Creating SmartDesign DDR_Write
set sd_name {DDR_Write}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {data_valid_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ddr_clk_rst} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ddr_clock_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {frame_valid_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {parallel_clk_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {reset_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {write_ackn_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {write_done_i} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {rdata_rdy_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {write_req_o} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {data_i} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {frame_ddr_addr_i} -port_direction {IN} -port_range {[7:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {beats_to_write_o} -port_direction {OUT} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {display_frame_addr_o} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {rdata_o} -port_direction {OUT} -port_range {[511:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {write_start_addr_o} -port_direction {OUT} -port_range {[31:0]}


# Add AND2_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {AND2_0}



# Add data_packer_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {data_packer} -hdl_file {hdl\data_packer.vhd} -instance_name {data_packer_0}



# Add DDR_write_controller_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {DDR_write_controller} -hdl_file {hdl\DDR_write_controller.vhd} -instance_name {DDR_write_controller_0}



# Add synchronizer_circuit_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {synchronizer_circuit} -hdl_file {hdl/synchronizer_circuit.vhd} -instance_name {synchronizer_circuit_0}



# Add synchronizer_circuit_1 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {synchronizer_circuit} -hdl_file {hdl/synchronizer_circuit.vhd} -instance_name {synchronizer_circuit_1}



# Add video_fifo_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {video_fifo} -instance_name {video_fifo_0}
# Exporting Parameters of instance video_fifo_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {video_fifo_0} -params {\
"g_HALF_EMPTY_THRESHOLD:1280" \
"g_INPUT_VIDEO_DATA_BIT_WIDTH:512" \
"g_VIDEO_FIFO_AWIDTH:6" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {video_fifo_0}
sd_update_instance -sd_name ${sd_name} -instance_name {video_fifo_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_0:wfull_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_0:wafull_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_0:rempty_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_0:raempty_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_0:rhempty_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_0:wdata_count_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_0:rdata_count_o}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:A" "data_packer_0:reset_i" "reset_i" "synchronizer_circuit_0:reset_n" "synchronizer_circuit_1:reset_n" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:B" "data_packer_0:fifo_reset_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:Y" "synchronizer_circuit_0:data_in" "synchronizer_circuit_1:data_in" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_write_controller_0:frame_valid_i" "data_packer_0:frame_valid_i" "frame_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_write_controller_0:read_fifo_o" "video_fifo_0:ren_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_write_controller_0:reset_i" "ddr_clk_rst" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_write_controller_0:start_i" "data_packer_0:start_ddr_w_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_write_controller_0:sys_clk_i" "ddr_clock_i" "synchronizer_circuit_1:sys_clk" "video_fifo_0:rclock_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_write_controller_0:write_ackn_i" "write_ackn_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_write_controller_0:write_done_i" "write_done_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_write_controller_0:write_req_o" "write_req_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_packer_0:data_valid_i" "data_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_packer_0:data_valid_o" "video_fifo_0:wen_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_packer_0:sys_clk_i" "parallel_clk_i" "synchronizer_circuit_0:sys_clk" "video_fifo_0:wclock_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"rdata_rdy_o" "video_fifo_0:rdata_rdy_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"synchronizer_circuit_0:sync_out" "video_fifo_0:wresetn_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"synchronizer_circuit_1:sync_out" "video_fifo_0:rresetn_i" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_write_controller_0:display_frame_addr_o" "display_frame_addr_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_write_controller_0:frame_ddr_addr_i" "frame_ddr_addr_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_write_controller_0:horiz_resolution_i" "data_packer_0:h_count_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_write_controller_0:write_length_o" "beats_to_write_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_write_controller_0:write_start_addr_o" "write_start_addr_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_i" "data_packer_0:data_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_packer_0:data_o" "video_fifo_0:wdata_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"rdata_o" "video_fifo_0:rdata_o" }


# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign DDR_Write
generate_component -component_name ${sd_name}
