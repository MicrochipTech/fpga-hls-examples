# Creating SmartDesign Memory_Write
set sd_name {Memory_Write}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {data_valid_i_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {data_valid_i_1} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ddr_clock_i_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ddr_clock_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {frame_valid_i_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {frame_valid_i_1} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {parallel_clk_i_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {parallel_clk_i_1} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {reset_i_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {reset_i_1} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {reset_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {write_ackn_i_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {write_ackn_i_1} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {write_done_i_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {write_done_i_1} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {rdata_rdy_o_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {rdata_rdy_o_1} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {write_req_o_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {write_req_o_1} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {data_i_0} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {data_i_1} -port_direction {IN} -port_range {[31:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {beats_to_write_o_0} -port_direction {OUT} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {beats_to_write_o_1} -port_direction {OUT} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {display_frame_addr_o_0} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {display_frame_addr_o_1} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {rdata_o_0} -port_direction {OUT} -port_range {[511:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {rdata_o_1} -port_direction {OUT} -port_range {[511:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {write_start_addr_o_0} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {write_start_addr_o_1} -port_direction {OUT} -port_range {[31:0]}


# Add DDR_Write_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {DDR_Write} -instance_name {DDR_Write_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {DDR_Write_0:frame_ddr_addr_i} -value {00000000}



# Add DDR_Write_1 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {DDR_Write} -instance_name {DDR_Write_1}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {DDR_Write_1:frame_ddr_addr_i} -value {00000100}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_0:data_valid_i" "data_valid_i_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_0:ddr_clk_rst" "DDR_Write_1:ddr_clk_rst" "reset_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_0:ddr_clock_i" "ddr_clock_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_0:frame_valid_i" "frame_valid_i_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_0:parallel_clk_i" "parallel_clk_i_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_0:rdata_rdy_o" "rdata_rdy_o_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_0:reset_i" "reset_i_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_0:write_ackn_i" "write_ackn_i_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_0:write_done_i" "write_done_i_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_0:write_req_o" "write_req_o_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_1:data_valid_i" "data_valid_i_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_1:ddr_clock_i" "ddr_clock_i_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_1:frame_valid_i" "frame_valid_i_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_1:parallel_clk_i" "parallel_clk_i_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_1:rdata_rdy_o" "rdata_rdy_o_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_1:reset_i" "reset_i_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_1:write_ackn_i" "write_ackn_i_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_1:write_done_i" "write_done_i_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_1:write_req_o" "write_req_o_1" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_0:beats_to_write_o" "beats_to_write_o_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_0:data_i" "data_i_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_0:display_frame_addr_o" "display_frame_addr_o_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_0:rdata_o" "rdata_o_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_0:write_start_addr_o" "write_start_addr_o_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_1:beats_to_write_o" "beats_to_write_o_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_1:data_i" "data_i_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_1:display_frame_addr_o" "display_frame_addr_o_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_1:rdata_o" "rdata_o_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_1:write_start_addr_o" "write_start_addr_o_1" }


# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign Memory_Write
generate_component -component_name ${sd_name}
