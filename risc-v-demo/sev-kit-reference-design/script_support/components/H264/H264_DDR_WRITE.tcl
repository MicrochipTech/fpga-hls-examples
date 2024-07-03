# Creating SmartDesign H264_DDR_WRITE
set sd_name {H264_DDR_WRITE}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {clr_intr_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {data_valid_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ddr_clk_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {frame_end_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {h264_clk_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {h264_encoder_en_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {reset_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {write_ackn_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {write_done_i} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {frm_interrupt_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {rdata_rdy_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {write_req_o} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {data_i} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {frame_ddr_addr_i} -port_direction {IN} -port_range {[9:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {frame_bytes_o} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {frame_index_o} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {rdata_o} -port_direction {OUT} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {write_length_o} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {write_start_addr_o} -port_direction {OUT} -port_range {[31:0]}


# Add AND2_1 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {AND2_1}



# Add data_packer_h264_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {data_packer_h264} -instance_name {data_packer_h264_0}
# Exporting Parameters of instance data_packer_h264_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {data_packer_h264_0} -params {\
"g_IP_DW:8" \
"g_OP_DW:64" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {data_packer_h264_0}
sd_update_instance -sd_name ${sd_name} -instance_name {data_packer_h264_0}

# Add ddr_write_controller_enc_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {ddr_write_controller_enc} -hdl_file {hdl\ddr_write_controller_enc.v} -instance_name {ddr_write_controller_enc_0}

# Add video_fifo_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {video_fifo} -instance_name {video_fifo_0}
# Exporting Parameters of instance video_fifo_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {video_fifo_0} -params {\
"g_HALF_EMPTY_THRESHOLD:1280" \
"g_INPUT_VIDEO_DATA_BIT_WIDTH:64" \
"g_VIDEO_FIFO_AWIDTH:12" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {video_fifo_0}
sd_update_instance -sd_name ${sd_name} -instance_name {video_fifo_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_0:wfull_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_0:wafull_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_0:rempty_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_0:raempty_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_0:rhempty_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_0:wdata_count_o}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_1:A" "ddr_write_controller_enc_0:reset_i" "ddr_write_controller_enc_0:wrclk_reset_i" "reset_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_1:B" "ddr_write_controller_enc_0:fifo_reset_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_1:Y" "video_fifo_0:rresetn_i" "video_fifo_0:wresetn_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"clr_intr_i" "ddr_write_controller_enc_0:clr_intr_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_packer_h264_0:data_valid_i" "data_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_packer_h264_0:data_valid_o" "video_fifo_0:wen_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_packer_h264_0:frame_end_i" "ddr_write_controller_enc_0:eof_i" "frame_end_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_packer_h264_0:reset_i" "ddr_write_controller_enc_0:encoder_en_i" "h264_encoder_en_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_packer_h264_0:sys_clk_i" "ddr_write_controller_enc_0:wrclk_i" "h264_clk_i" "video_fifo_0:wclock_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ddr_clk_i" "ddr_write_controller_enc_0:sys_clk_i" "video_fifo_0:rclock_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ddr_write_controller_enc_0:frm_interrupt_o" "frm_interrupt_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ddr_write_controller_enc_0:read_fifo_o" "video_fifo_0:ren_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ddr_write_controller_enc_0:write_ackn_i" "write_ackn_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ddr_write_controller_enc_0:write_done_i" "write_done_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ddr_write_controller_enc_0:write_req_o" "write_req_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"rdata_rdy_o" "video_fifo_0:rdata_rdy_o" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_i" "data_packer_h264_0:data_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_packer_h264_0:data_o" "video_fifo_0:wdata_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ddr_write_controller_enc_0:fifo_count_i" "video_fifo_0:rdata_count_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ddr_write_controller_enc_0:frame_ddr_addr_i" "frame_ddr_addr_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ddr_write_controller_enc_0:frame_idx_o" "frame_index_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ddr_write_controller_enc_0:frame_size_o" "frame_bytes_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ddr_write_controller_enc_0:write_length_o" "write_length_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ddr_write_controller_enc_0:write_start_addr_o" "write_start_addr_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"rdata_o" "video_fifo_0:rdata_o" }


# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign H264_DDR_WRITE
generate_component -component_name ${sd_name}
