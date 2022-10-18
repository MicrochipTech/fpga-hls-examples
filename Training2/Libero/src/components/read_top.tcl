# Creating SmartDesign read_top
set sd_name {read_top}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {ack_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {data_valid_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {done_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {req0_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {req1_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {req2_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {req3_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {reset_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {sys_clk_i} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {r0_ack_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {r0_data_valid_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {r0_done_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {r1_ack_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {r1_data_valid_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {r1_done_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {r2_ack_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {r2_data_valid_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {r2_done_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {r3_ack_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {r3_data_valid_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {r3_done_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {req_o} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {r0_burst_size_i} -port_direction {IN} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {r0_rstart_addr_i} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {r1_burst_size_i} -port_direction {IN} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {r1_rstart_addr_i} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {r2_burst_size_i} -port_direction {IN} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {r2_rstart_addr_i} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {r3_burst_size_i} -port_direction {IN} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {r3_rstart_addr_i} -port_direction {IN} -port_range {[31:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {burst_size_o} -port_direction {OUT} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {rstart_addr_o} -port_direction {OUT} -port_range {[31:0]}


# Add read_demux_1 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {read_demux} -hdl_file {hdl\read_demux.vhd} -instance_name {read_demux_1}



# Add read_mux_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {read_mux} -hdl_file {hdl\read_mux.vhd} -instance_name {read_mux_0}



# Add request_scheduler_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {request_scheduler} -hdl_file {hdl\request_scheduler.vhd} -instance_name {request_scheduler_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"ack_i" "read_demux_1:ack_i" "request_scheduler_0:ack_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_valid_i" "read_demux_1:data_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"done_i" "read_demux_1:done_i" "request_scheduler_0:done_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r0_ack_o" "read_demux_1:r0_ack_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r0_data_valid_o" "read_demux_1:r0_data_valid_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r0_done_o" "read_demux_1:r0_done_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r1_ack_o" "read_demux_1:r1_ack_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r1_data_valid_o" "read_demux_1:r1_data_valid_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r1_done_o" "read_demux_1:r1_done_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r2_ack_o" "read_demux_1:r2_ack_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r2_data_valid_o" "read_demux_1:r2_data_valid_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r2_done_o" "read_demux_1:r2_done_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r3_ack_o" "read_demux_1:r3_ack_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r3_data_valid_o" "read_demux_1:r3_data_valid_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r3_done_o" "read_demux_1:r3_done_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"read_demux_1:reset_i" "request_scheduler_0:reset_i" "reset_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"req0_i" "request_scheduler_0:req0_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"req1_i" "request_scheduler_0:req1_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"req2_i" "request_scheduler_0:req2_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"req3_i" "request_scheduler_0:req3_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"req_o" "request_scheduler_0:req_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"request_scheduler_0:sys_clk_i" "sys_clk_i" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"burst_size_o" "read_mux_0:burst_size_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r0_burst_size_i" "read_mux_0:r0_burst_size_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r0_rstart_addr_i" "read_mux_0:r0_rstart_addr_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r1_burst_size_i" "read_mux_0:r1_burst_size_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r1_rstart_addr_i" "read_mux_0:r1_rstart_addr_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r2_burst_size_i" "read_mux_0:r2_burst_size_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r2_rstart_addr_i" "read_mux_0:r2_rstart_addr_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r3_burst_size_i" "read_mux_0:r3_burst_size_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r3_rstart_addr_i" "read_mux_0:r3_rstart_addr_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"read_demux_1:mux_sel_i" "read_mux_0:mux_sel_i" "request_scheduler_0:mux_sel_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"read_mux_0:rstart_addr_o" "rstart_addr_o" }


# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign read_top
generate_component -component_name ${sd_name}
