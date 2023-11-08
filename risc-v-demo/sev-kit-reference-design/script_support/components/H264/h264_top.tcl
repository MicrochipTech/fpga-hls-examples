# Creating SmartDesign h264_top
set sd_name {h264_top}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {arready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {awready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {bvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {clr_intr_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {data_valid_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ddr_ctrl_ready_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {eof_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {fic_clk} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {frame_valid_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {h264_encoder_en} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {read_reset_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {resetn_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {rlast} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {rvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {sys_clk_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {wready} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {arvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {awvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {bready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {frm_interrupt_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {rready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {wlast} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {wvalid} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {bid} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {bresp} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {data_c_i} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {data_y_i} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {frame_ddr_addr_i} -port_direction {IN} -port_range {[9:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {hres_i} -port_direction {IN} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {qp_i} -port_direction {IN} -port_range {[5:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {rdata} -port_direction {IN} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {rid} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {rresp} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {vres_i} -port_direction {IN} -port_range {[15:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {araddr} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {arburst} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {arcache} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {arid} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {arlen} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {arlock} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {arprot} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {arsize} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {awaddr} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {awburst} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {awcache} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {awid} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {awlen} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {awlock} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {awprot} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {awsize} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {frame_bytes_o} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {frame_index_o} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {wdata} -port_direction {OUT} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {wstrb} -port_direction {OUT} -port_range {[63:0]}


# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {BIF_1} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
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

# Add AND2_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {AND2_0}



# Add DDR_AXI4_ARBITER_PF_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {DDR_AXI4_ARBITER_PF_C0} -instance_name {DDR_AXI4_ARBITER_PF_C0_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {DDR_AXI4_ARBITER_PF_C0_0:r0_req_i} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {DDR_AXI4_ARBITER_PF_C0_0:r0_ack_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {DDR_AXI4_ARBITER_PF_C0_0:r0_data_valid_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {DDR_AXI4_ARBITER_PF_C0_0:r0_done_o}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {DDR_AXI4_ARBITER_PF_C0_0:r0_burst_size_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {DDR_AXI4_ARBITER_PF_C0_0:r0_rstart_addr_i} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {DDR_AXI4_ARBITER_PF_C0_0:rdata_o}



# Add H264_DDR_WRITE_64 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {H264_DDR_WRITE} -instance_name {H264_DDR_WRITE_64}



# Add H264_Iframe_Encoder_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {H264_Iframe_Encoder_C0} -instance_name {H264_Iframe_Encoder_C0_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:A" "resetn_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:B" "H264_DDR_WRITE_64:h264_encoder_en_i" "h264_encoder_en" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:Y" "H264_Iframe_Encoder_C0_0:RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_AXI4_ARBITER_PF_C0_0:ddr_ctrl_ready_i" "ddr_ctrl_ready_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_AXI4_ARBITER_PF_C0_0:reset_i" "H264_DDR_WRITE_64:reset_i" "read_reset_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_AXI4_ARBITER_PF_C0_0:sys_clk_i" "H264_DDR_WRITE_64:ddr_clk_i" "fic_clk" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_AXI4_ARBITER_PF_C0_0:w0_ack_o" "H264_DDR_WRITE_64:write_ackn_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_AXI4_ARBITER_PF_C0_0:w0_data_valid_i" "H264_DDR_WRITE_64:rdata_rdy_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_AXI4_ARBITER_PF_C0_0:w0_done_o" "H264_DDR_WRITE_64:write_done_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_AXI4_ARBITER_PF_C0_0:w0_req_i" "H264_DDR_WRITE_64:write_req_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"H264_DDR_WRITE_64:clr_intr_i" "clr_intr_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"H264_DDR_WRITE_64:data_valid_i" "H264_Iframe_Encoder_C0_0:DATA_VALID_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"H264_DDR_WRITE_64:frame_end_i" "H264_Iframe_Encoder_C0_0:FRAME_END_I" "eof_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"H264_DDR_WRITE_64:frm_interrupt_o" "frm_interrupt_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"H264_DDR_WRITE_64:h264_clk_i" "H264_Iframe_Encoder_C0_0:PIX_CLK" "sys_clk_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"H264_Iframe_Encoder_C0_0:DATA_VALID_I" "data_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"H264_Iframe_Encoder_C0_0:FRAME_START_I" "frame_valid_i" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_AXI4_ARBITER_PF_C0_0:w0_burst_size_i" "H264_DDR_WRITE_64:write_length_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_AXI4_ARBITER_PF_C0_0:w0_data_i" "H264_DDR_WRITE_64:rdata_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_AXI4_ARBITER_PF_C0_0:w0_wstart_addr_i" "H264_DDR_WRITE_64:write_start_addr_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"H264_DDR_WRITE_64:data_i" "H264_Iframe_Encoder_C0_0:DATA_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"H264_DDR_WRITE_64:frame_bytes_o" "frame_bytes_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"H264_DDR_WRITE_64:frame_ddr_addr_i" "frame_ddr_addr_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"H264_DDR_WRITE_64:frame_index_o" "frame_index_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"H264_Iframe_Encoder_C0_0:DATA_C_I" "data_c_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"H264_Iframe_Encoder_C0_0:DATA_Y_I" "data_y_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"H264_Iframe_Encoder_C0_0:HRES_I" "hres_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"H264_Iframe_Encoder_C0_0:QP_I" "qp_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"H264_Iframe_Encoder_C0_0:VRES_I" "vres_i" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIF_1" "DDR_AXI4_ARBITER_PF_C0_0:MIRRORED_SLAVE_AXI4" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign h264_top
generate_component -component_name ${sd_name}
