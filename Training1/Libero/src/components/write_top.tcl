# Creating SmartDesign write_top
set sd_name {write_top}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {ack_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {done_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {reset_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {sys_clk_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {w0_data_valid_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {w0_req_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {w1_data_valid_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {w1_req_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {w2_data_valid_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {w2_req_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {w3_data_valid_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {w3_req_i} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {data_valid_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {req_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {w0_ack_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {w0_done_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {w1_ack_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {w1_done_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {w2_ack_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {w2_done_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {w3_ack_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {w3_done_o} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {w0_burst_size_i} -port_direction {IN} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {w0_data_i} -port_direction {IN} -port_range {[511:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {w0_wstart_addr_i} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {w1_burst_size_i} -port_direction {IN} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {w1_data_i} -port_direction {IN} -port_range {[511:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {w1_wstart_addr_i} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {w2_burst_size_i} -port_direction {IN} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {w2_data_i} -port_direction {IN} -port_range {[511:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {w2_wstart_addr_i} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {w3_burst_size_i} -port_direction {IN} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {w3_data_i} -port_direction {IN} -port_range {[511:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {w3_wstart_addr_i} -port_direction {IN} -port_range {[31:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {burst_size_o} -port_direction {OUT} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {data_o} -port_direction {OUT} -port_range {[511:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {wstart_addr_o} -port_direction {OUT} -port_range {[31:0]}


# Add request_scheduler_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {request_scheduler} -hdl_file {hdl\request_scheduler.vhd} -instance_name {request_scheduler_0}



# Add write_demux_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {write_demux} -hdl_file {hdl\write_demux.vhd} -instance_name {write_demux_0}



# Add write_mux_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {write_mux} -hdl_file {hdl\write_mux.vhd} -instance_name {write_mux_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"ack_i" "request_scheduler_0:ack_i" "write_demux_0:ack_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_valid_o" "write_mux_0:data_valid_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"done_i" "request_scheduler_0:done_i" "write_demux_0:done_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"req_o" "request_scheduler_0:req_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"request_scheduler_0:req0_i" "w0_req_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"request_scheduler_0:req1_i" "w1_req_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"request_scheduler_0:req2_i" "w2_req_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"request_scheduler_0:req3_i" "w3_req_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"request_scheduler_0:reset_i" "reset_i" "write_demux_0:reset_i" "write_mux_0:reset_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"request_scheduler_0:sys_clk_i" "sys_clk_i" "write_mux_0:sys_clk_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w0_ack_o" "write_demux_0:w0_ack_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w0_data_valid_i" "write_mux_0:w0_data_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w0_done_o" "write_demux_0:w0_done_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w1_ack_o" "write_demux_0:w1_ack_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w1_data_valid_i" "write_mux_0:w1_data_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w1_done_o" "write_demux_0:w1_done_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w2_ack_o" "write_demux_0:w2_ack_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w2_data_valid_i" "write_mux_0:w2_data_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w2_done_o" "write_demux_0:w2_done_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w3_ack_o" "write_demux_0:w3_ack_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w3_data_valid_i" "write_mux_0:w3_data_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w3_done_o" "write_demux_0:w3_done_o" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"burst_size_o" "write_mux_0:burst_size_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_o" "write_mux_0:data_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"request_scheduler_0:mux_sel_o" "write_demux_0:mux_sel_i" "write_mux_0:mux_sel_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w0_burst_size_i" "write_mux_0:w0_burst_size_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w0_data_i" "write_mux_0:w0_data_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w0_wstart_addr_i" "write_mux_0:w0_wstart_addr_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w1_burst_size_i" "write_mux_0:w1_burst_size_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w1_data_i" "write_mux_0:w1_data_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w1_wstart_addr_i" "write_mux_0:w1_wstart_addr_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w2_burst_size_i" "write_mux_0:w2_burst_size_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w2_data_i" "write_mux_0:w2_data_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w2_wstart_addr_i" "write_mux_0:w2_wstart_addr_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w3_burst_size_i" "write_mux_0:w3_burst_size_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w3_data_i" "write_mux_0:w3_data_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w3_wstart_addr_i" "write_mux_0:w3_wstart_addr_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"write_mux_0:wstart_addr_o" "wstart_addr_o" }


# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign write_top
generate_component -component_name ${sd_name}
