# Creating SmartDesign Memory_Read
set sd_name {Memory_Read}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {ddr_data_valid_i_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ddr_data_valid_i_1} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ddr_data_valid_i_2} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ddr_data_valid_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {disp_clk_i_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {disp_clk_i_1} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {disp_clk_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {disp_clk} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {frame_end_i_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {frame_end_i_1} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {frame_end_i_2} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {frame_end_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {read_ackn_i_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {read_ackn_i_1} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {read_ackn_i_2} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {read_ackn_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {read_done_i_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {read_done_i_1} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {read_done_i_2} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {read_done_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {read_en_i_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {read_en_i_1} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {read_en_i_2} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {read_en_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {reset_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {sys_clk_i} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {bayer_dvalid_o_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {bayer_dvalid_o_1} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {bayer_dvalid_o_2} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {bayer_dvalid_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {frame_active_d_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {read_req_o_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {read_req_o_1} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {read_req_o_2} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {read_req_o} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {frame_start_addr_i_0} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {frame_start_addr_i_1} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {frame_start_addr_i_2} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {frame_start_addr_i} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {h_pan_i_0} -port_direction {IN} -port_range {[11:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {h_pan_i_1} -port_direction {IN} -port_range {[11:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {h_pan_i_2} -port_direction {IN} -port_range {[11:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {h_pan_i} -port_direction {IN} -port_range {[11:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {h_shift_i} -port_direction {IN} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {horz_resl_i_0} -port_direction {IN} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {horz_resl_i_1} -port_direction {IN} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {horz_resl_i_2} -port_direction {IN} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {horz_resl_i} -port_direction {IN} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {v_pan_i_0} -port_direction {IN} -port_range {[11:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {v_pan_i_1} -port_direction {IN} -port_range {[11:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {v_pan_i_2} -port_direction {IN} -port_range {[11:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {v_pan_i} -port_direction {IN} -port_range {[11:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {v_shift_i} -port_direction {IN} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {wdata_i_0} -port_direction {IN} -port_range {[511:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {wdata_i_1} -port_direction {IN} -port_range {[511:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {wdata_i_2} -port_direction {IN} -port_range {[511:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {wdata_i} -port_direction {IN} -port_range {[511:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {bayer_data_o_0} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {bayer_data_o} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {beats_to_read_o_0} -port_direction {OUT} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {beats_to_read_o_1} -port_direction {OUT} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {beats_to_read_o_2} -port_direction {OUT} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {beats_to_read_o} -port_direction {OUT} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {blue_o} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {data_o_0} -port_direction {OUT} -port_range {[15:8]}
sd_create_bus_port -sd_name ${sd_name} -port_name {data_o_1} -port_direction {OUT} -port_range {[31:24]}
sd_create_bus_port -sd_name ${sd_name} -port_name {data_o_2} -port_direction {OUT} -port_range {[23:16]}
sd_create_bus_port -sd_name ${sd_name} -port_name {data_o} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {green_o} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {read_start_addr_o_0} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {read_start_addr_o_1} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {read_start_addr_o_2} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {read_start_addr_o} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {red_o} -port_direction {OUT} -port_range {[7:0]}


# Add DDR_Read_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {DDR_Read} -instance_name {DDR_Read_0}



# Add DDR_Read_HDMI_RX_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {DDR_Read_HDMI_RX} -instance_name {DDR_Read_HDMI_RX_0}



# Add DDR_Read_HDMI_Rx_4k_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {DDR_Read_HDMI_Rx_4k} -instance_name {DDR_Read_HDMI_Rx_4k_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DDR_Read_HDMI_Rx_4k_0:data_o} -pin_slices {[15:8]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DDR_Read_HDMI_Rx_4k_0:data_o} -pin_slices {[23:16]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DDR_Read_HDMI_Rx_4k_0:data_o} -pin_slices {[31:24]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DDR_Read_HDMI_Rx_4k_0:data_o} -pin_slices {[7:0]}



# Add DDR_Read_scale_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {DDR_Read_scale} -instance_name {DDR_Read_scale_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_0:bayer_dvalid_o" "bayer_dvalid_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_0:ddr_data_valid_i" "ddr_data_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_0:disp_clk_i" "disp_clk_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_0:frame_end_i" "frame_end_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_0:read_ackn_i" "read_ackn_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_0:read_done_i" "read_done_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_0:read_en_i" "read_en_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_0:read_req_o" "read_req_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_0:reset_i" "DDR_Read_HDMI_RX_0:reset_i" "DDR_Read_HDMI_Rx_4k_0:reset_i" "DDR_Read_scale_0:reset_i" "reset_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_0:sys_clk_i" "DDR_Read_HDMI_RX_0:sys_clk_i" "DDR_Read_HDMI_Rx_4k_0:sys_clk_i" "DDR_Read_scale_0:sys_clk_i" "sys_clk_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_HDMI_RX_0:bayer_dvalid_o" "bayer_dvalid_o_2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_HDMI_RX_0:ddr_data_valid_i" "ddr_data_valid_i_2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_HDMI_RX_0:disp_clk_i" "disp_clk_i_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_HDMI_RX_0:frame_end_i" "frame_end_i_2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_HDMI_RX_0:read_ackn_i" "read_ackn_i_2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_HDMI_RX_0:read_done_i" "read_done_i_2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_HDMI_RX_0:read_en_i" "read_en_i_2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_HDMI_RX_0:read_req_o" "read_req_o_2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_HDMI_Rx_4k_0:bayer_dvalid_o" "bayer_dvalid_o_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_HDMI_Rx_4k_0:ddr_data_valid_i" "ddr_data_valid_i_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_HDMI_Rx_4k_0:disp_clk_i" "disp_clk_i_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_HDMI_Rx_4k_0:frame_end_i" "frame_end_i_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_HDMI_Rx_4k_0:read_ackn_i" "read_ackn_i_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_HDMI_Rx_4k_0:read_done_i" "read_done_i_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_HDMI_Rx_4k_0:read_en_i" "read_en_i_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_HDMI_Rx_4k_0:read_req_o" "read_req_o_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_scale_0:bayer_dvalid_o" "bayer_dvalid_o_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_scale_0:ddr_data_valid_i" "ddr_data_valid_i_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_scale_0:disp_clk" "disp_clk" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_scale_0:frame_active_d_o" "frame_active_d_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_scale_0:frame_end_i" "frame_end_i_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_scale_0:read_ackn_i" "read_ackn_i_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_scale_0:read_done_i" "read_done_i_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_scale_0:read_en_i" "read_en_i_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_scale_0:read_req_o" "read_req_o_0" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_0:bayer_data_o" "bayer_data_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_0:beats_to_read_o" "beats_to_read_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_0:frame_start_addr_i" "frame_start_addr_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_0:h_pan_i" "h_pan_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_0:horz_resl_i" "horz_resl_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_0:read_start_addr_o" "read_start_addr_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_0:v_pan_i" "v_pan_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_0:wdata_i" "wdata_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_HDMI_RX_0:beats_to_read_o" "beats_to_read_o_2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_HDMI_RX_0:blue_o" "blue_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_HDMI_RX_0:frame_start_addr_i" "frame_start_addr_i_2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_HDMI_RX_0:green_o" "green_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_HDMI_RX_0:h_pan_i" "h_pan_i_2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_HDMI_RX_0:horz_resl_i" "horz_resl_i_2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_HDMI_RX_0:read_start_addr_o" "read_start_addr_o_2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_HDMI_RX_0:red_o" "red_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_HDMI_RX_0:v_pan_i" "v_pan_i_2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_HDMI_RX_0:wdata_i" "wdata_i_2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_HDMI_Rx_4k_0:beats_to_read_o" "beats_to_read_o_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_HDMI_Rx_4k_0:data_o[15:8]" "data_o_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_HDMI_Rx_4k_0:data_o[23:16]" "data_o_2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_HDMI_Rx_4k_0:data_o[31:24]" "data_o_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_HDMI_Rx_4k_0:data_o[7:0]" "data_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_HDMI_Rx_4k_0:frame_start_addr_i" "frame_start_addr_i_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_HDMI_Rx_4k_0:h_pan_i" "h_pan_i_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_HDMI_Rx_4k_0:horz_resl_i" "horz_resl_i_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_HDMI_Rx_4k_0:read_start_addr_o" "read_start_addr_o_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_HDMI_Rx_4k_0:v_pan_i" "v_pan_i_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_HDMI_Rx_4k_0:wdata_i" "wdata_i_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_scale_0:bayer_data_o" "bayer_data_o_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_scale_0:beats_to_read_o" "beats_to_read_o_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_scale_0:frame_start_addr_i" "frame_start_addr_i_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_scale_0:h_pan_i" "h_pan_i_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_scale_0:h_shift_i" "h_shift_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_scale_0:horz_resl_i" "horz_resl_i_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_scale_0:read_start_addr_o" "read_start_addr_o_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_scale_0:v_pan_i" "v_pan_i_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_scale_0:v_shift_i" "v_shift_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_scale_0:wdata_i" "wdata_i_0" }


# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign Memory_Read
generate_component -component_name ${sd_name}
