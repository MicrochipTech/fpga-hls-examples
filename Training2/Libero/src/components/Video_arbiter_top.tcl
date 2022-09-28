# Creating SmartDesign Video_arbiter_top
set sd_name {Video_arbiter_top}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {arready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {awready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {bvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ddr_ctrl_ready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {r0_req_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {r1_req_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {r2_req_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {r3_req_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {reset_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {rlast} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {rvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {sys_clk_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {w0_data_valid_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {w0_req_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {w1_data_valid_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {w1_req_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {w2_data_valid_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {w2_req_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {w3_data_valid_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {w3_req_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {wready} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {arvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {awvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {bready} -port_direction {OUT}
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
sd_create_scalar_port -sd_name ${sd_name} -port_name {rready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {w0_ack_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {w0_done_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {w1_ack_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {w1_done_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {w2_ack_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {w2_done_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {w3_ack_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {w3_done_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {wlast} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {wvalid} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {bid} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {bresp} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {r0_burst_size_i} -port_direction {IN} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {r0_rstart_addr_i} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {r1_burst_size_i} -port_direction {IN} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {r1_rstart_addr_i} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {r2_burst_size_i} -port_direction {IN} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {r2_rstart_addr_i} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {r3_burst_size_i} -port_direction {IN} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {r3_rstart_addr_i} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {rdata} -port_direction {IN} -port_range {[511:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {rid} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {rresp} -port_direction {IN} -port_range {[1:0]}
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

sd_create_bus_port -sd_name ${sd_name} -port_name {araddr} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {arburst} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {arcache} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {arid} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {arlen} -port_direction {OUT} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {arlock} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {arprot} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {arsize} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {awaddr} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {awburst} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {awcache} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {awid} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {awlen} -port_direction {OUT} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {awlock} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {awprot} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {awsize} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {rdata_o} -port_direction {OUT} -port_range {[511:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {wdata} -port_direction {OUT} -port_range {[511:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {wstrb} -port_direction {OUT} -port_range {[63:0]}


# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {M_AXI} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"AWID:awid" \
"AWADDR:awaddr" \
"AWLEN:awlen" \
"AWSIZE:awsize" \
"AWBURST:awburst" \
"AWLOCK:awlock" \
"AWCACHE:awcache" \
"AWPROT:awprot" \
"AWVALID:awvalid" \
"AWREADY:awready" \
"WDATA:wdata" \
"WSTRB:wstrb" \
"WLAST:wlast" \
"WVALID:wvalid" \
"WREADY:wready" \
"BID:bid" \
"BRESP:bresp" \
"BVALID:bvalid" \
"BREADY:bready" \
"ARID:arid" \
"ARADDR:araddr" \
"ARLEN:arlen" \
"ARSIZE:arsize" \
"ARBURST:arburst" \
"ARLOCK:arlock" \
"ARCACHE:arcache" \
"ARPROT:arprot" \
"ARVALID:arvalid" \
"ARREADY:arready" \
"RID:rid" \
"RDATA:rdata" \
"RRESP:rresp" \
"RLAST:rlast" \
"RVALID:rvalid" \
"RREADY:rready" } 

# Add ddr_rw_arbiter_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {ddr_rw_arbiter} -instance_name {ddr_rw_arbiter_0}
# Exporting Parameters of instance ddr_rw_arbiter_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {ddr_rw_arbiter_0} -params {\
"AXI_ADDR_WIDTH:32" \
"AXI_DATA_WIDTH:512" \
"AXI_ID_WIDTH:4" \
"AXI_LEN_WIDTH:16" \
"VIDEO_BUS_ASIZE:36" \
"VIDEO_BUS_DSIZE:512" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {ddr_rw_arbiter_0}
sd_update_instance -sd_name ${sd_name} -instance_name {ddr_rw_arbiter_0}



# Add read_top_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {read_top} -instance_name {read_top_0}



# Add write_top_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {write_top} -instance_name {write_top_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"ddr_ctrl_ready" "ddr_rw_arbiter_0:ddr_ctrl_ready_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ddr_rw_arbiter_0:ddr_clk_i" "read_top_0:sys_clk_i" "sys_clk_i" "write_top_0:sys_clk_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ddr_rw_arbiter_0:rack_o" "read_top_0:ack_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ddr_rw_arbiter_0:rdata_valid_o" "read_top_0:data_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ddr_rw_arbiter_0:rdone_o" "read_top_0:done_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ddr_rw_arbiter_0:resetn_i" "read_top_0:reset_i" "reset_i" "write_top_0:reset_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ddr_rw_arbiter_0:rreq_i" "read_top_0:req_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ddr_rw_arbiter_0:wack_o" "write_top_0:ack_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ddr_rw_arbiter_0:wdata_valid_i" "write_top_0:data_valid_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ddr_rw_arbiter_0:wdone_o" "write_top_0:done_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ddr_rw_arbiter_0:wreq_i" "write_top_0:req_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r0_ack_o" "read_top_0:r0_ack_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r0_data_valid_o" "read_top_0:r0_data_valid_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r0_done_o" "read_top_0:r0_done_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r0_req_i" "read_top_0:req0_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r1_ack_o" "read_top_0:r1_ack_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r1_data_valid_o" "read_top_0:r1_data_valid_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r1_done_o" "read_top_0:r1_done_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r1_req_i" "read_top_0:req1_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r2_ack_o" "read_top_0:r2_ack_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r2_data_valid_o" "read_top_0:r2_data_valid_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r2_done_o" "read_top_0:r2_done_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r2_req_i" "read_top_0:req2_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r3_ack_o" "read_top_0:r3_ack_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r3_data_valid_o" "read_top_0:r3_data_valid_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r3_done_o" "read_top_0:r3_done_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r3_req_i" "read_top_0:req3_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w0_ack_o" "write_top_0:w0_ack_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w0_data_valid_i" "write_top_0:w0_data_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w0_done_o" "write_top_0:w0_done_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w0_req_i" "write_top_0:w0_req_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w1_ack_o" "write_top_0:w1_ack_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w1_data_valid_i" "write_top_0:w1_data_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w1_done_o" "write_top_0:w1_done_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w1_req_i" "write_top_0:w1_req_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w2_ack_o" "write_top_0:w2_ack_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w2_data_valid_i" "write_top_0:w2_data_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w2_done_o" "write_top_0:w2_done_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w2_req_i" "write_top_0:w2_req_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w3_ack_o" "write_top_0:w3_ack_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w3_data_valid_i" "write_top_0:w3_data_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w3_done_o" "write_top_0:w3_done_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w3_req_i" "write_top_0:w3_req_i" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"ddr_rw_arbiter_0:beats_to_r_i" "read_top_0:burst_size_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ddr_rw_arbiter_0:beats_to_w_i" "write_top_0:burst_size_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ddr_rw_arbiter_0:rdata_o" "rdata_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ddr_rw_arbiter_0:rstart_addr_i" "read_top_0:rstart_addr_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ddr_rw_arbiter_0:wdata_i" "write_top_0:data_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ddr_rw_arbiter_0:wstart_addr_i" "write_top_0:wstart_addr_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r0_burst_size_i" "read_top_0:r0_burst_size_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r0_rstart_addr_i" "read_top_0:r0_rstart_addr_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r1_burst_size_i" "read_top_0:r1_burst_size_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r1_rstart_addr_i" "read_top_0:r1_rstart_addr_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r2_burst_size_i" "read_top_0:r2_burst_size_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r2_rstart_addr_i" "read_top_0:r2_rstart_addr_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r3_burst_size_i" "read_top_0:r3_burst_size_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"r3_rstart_addr_i" "read_top_0:r3_rstart_addr_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w0_burst_size_i" "write_top_0:w0_burst_size_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w0_data_i" "write_top_0:w0_data_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w0_wstart_addr_i" "write_top_0:w0_wstart_addr_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w1_burst_size_i" "write_top_0:w1_burst_size_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w1_data_i" "write_top_0:w1_data_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w1_wstart_addr_i" "write_top_0:w1_wstart_addr_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w2_burst_size_i" "write_top_0:w2_burst_size_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w2_data_i" "write_top_0:w2_data_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w2_wstart_addr_i" "write_top_0:w2_wstart_addr_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w3_burst_size_i" "write_top_0:w3_burst_size_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w3_data_i" "write_top_0:w3_data_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"w3_wstart_addr_i" "write_top_0:w3_wstart_addr_i" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"M_AXI" "ddr_rw_arbiter_0:M_AXI" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign Video_arbiter_top
generate_component -component_name ${sd_name}
