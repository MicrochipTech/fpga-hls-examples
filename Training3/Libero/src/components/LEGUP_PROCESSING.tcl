# Creating SmartDesign LEGUP_PROCESSING
set sd_name {LEGUP_PROCESSING}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {CLK_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CPU_AXI4m_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MASTER0_ARVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MASTER0_AWVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MASTER0_BREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MASTER0_RREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MASTER0_WLAST} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MASTER0_WVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {Process_Start_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESETN_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SLAVE0_ARREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SLAVE0_AWREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SLAVE0_BVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SLAVE0_RLAST} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SLAVE0_RVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SLAVE0_WREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {fifo_ready_i} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {MASTER0_ARREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MASTER0_AWREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MASTER0_BVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MASTER0_RLAST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MASTER0_RVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MASTER0_WREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SLAVE0_ARVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SLAVE0_AWVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SLAVE0_BREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SLAVE0_RREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SLAVE0_WLAST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SLAVE0_WVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {output_fifo_valid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {processing_phase_running} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_ARADDR} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_ARBURST} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_ARCACHE} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_ARID} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_ARLEN} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_ARLOCK} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_ARPROT} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_ARQOS} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_ARREGION} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_ARSIZE} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_ARUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_AWADDR} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_AWBURST} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_AWCACHE} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_AWID} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_AWLEN} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_AWLOCK} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_AWPROT} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_AWQOS} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_AWREGION} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_AWSIZE} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_AWUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_WDATA} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_WSTRB} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_WUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {SLAVE0_BID} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {SLAVE0_BRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {SLAVE0_BUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {SLAVE0_RDATA} -port_direction {IN} -port_range {[511:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {SLAVE0_RID} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {SLAVE0_RRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {SLAVE0_RUSER} -port_direction {IN} -port_range {[0:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_BID} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_BRESP} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_BUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_RDATA} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_RID} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_RRESP} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_RUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {SLAVE0_ARADDR} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {SLAVE0_ARBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {SLAVE0_ARCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {SLAVE0_ARID} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {SLAVE0_ARLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {SLAVE0_ARLOCK} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {SLAVE0_ARPROT} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {SLAVE0_ARQOS} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {SLAVE0_ARREGION} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {SLAVE0_ARSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {SLAVE0_ARUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {SLAVE0_AWADDR} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {SLAVE0_AWBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {SLAVE0_AWCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {SLAVE0_AWID} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {SLAVE0_AWLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {SLAVE0_AWLOCK} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {SLAVE0_AWPROT} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {SLAVE0_AWQOS} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {SLAVE0_AWREGION} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {SLAVE0_AWSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {SLAVE0_AWUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {SLAVE0_WDATA} -port_direction {OUT} -port_range {[511:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {SLAVE0_WSTRB} -port_direction {OUT} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {SLAVE0_WUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {output_fifo} -port_direction {OUT} -port_range {[63:0]}


# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {CPU_AXI4m} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {mirroredMaster} -port_bif_mapping {\
"AWID:MASTER0_AWID" \
"AWADDR:MASTER0_AWADDR" \
"AWLEN:MASTER0_AWLEN" \
"AWSIZE:MASTER0_AWSIZE" \
"AWBURST:MASTER0_AWBURST" \
"AWLOCK:MASTER0_AWLOCK" \
"AWCACHE:MASTER0_AWCACHE" \
"AWPROT:MASTER0_AWPROT" \
"AWQOS:MASTER0_AWQOS" \
"AWREGION:MASTER0_AWREGION" \
"AWVALID:MASTER0_AWVALID" \
"AWREADY:MASTER0_AWREADY" \
"WDATA:MASTER0_WDATA" \
"WSTRB:MASTER0_WSTRB" \
"WLAST:MASTER0_WLAST" \
"WVALID:MASTER0_WVALID" \
"WREADY:MASTER0_WREADY" \
"BID:MASTER0_BID" \
"BRESP:MASTER0_BRESP" \
"BVALID:MASTER0_BVALID" \
"BREADY:MASTER0_BREADY" \
"ARID:MASTER0_ARID" \
"ARADDR:MASTER0_ARADDR" \
"ARLEN:MASTER0_ARLEN" \
"ARSIZE:MASTER0_ARSIZE" \
"ARBURST:MASTER0_ARBURST" \
"ARLOCK:MASTER0_ARLOCK" \
"ARCACHE:MASTER0_ARCACHE" \
"ARPROT:MASTER0_ARPROT" \
"ARQOS:MASTER0_ARQOS" \
"ARREGION:MASTER0_ARREGION" \
"ARVALID:MASTER0_ARVALID" \
"ARREADY:MASTER0_ARREADY" \
"RID:MASTER0_RID" \
"RDATA:MASTER0_RDATA" \
"RRESP:MASTER0_RRESP" \
"RLAST:MASTER0_RLAST" \
"RVALID:MASTER0_RVALID" \
"RREADY:MASTER0_RREADY" \
"AWUSER:MASTER0_AWUSER" \
"WUSER:MASTER0_WUSER" \
"BUSER:MASTER0_BUSER" \
"ARUSER:MASTER0_ARUSER" \
"RUSER:MASTER0_RUSER" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4mslave0} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"AWID:SLAVE0_AWID" \
"AWADDR:SLAVE0_AWADDR" \
"AWLEN:SLAVE0_AWLEN" \
"AWSIZE:SLAVE0_AWSIZE" \
"AWBURST:SLAVE0_AWBURST" \
"AWLOCK:SLAVE0_AWLOCK" \
"AWCACHE:SLAVE0_AWCACHE" \
"AWPROT:SLAVE0_AWPROT" \
"AWQOS:SLAVE0_AWQOS" \
"AWREGION:SLAVE0_AWREGION" \
"AWVALID:SLAVE0_AWVALID" \
"AWREADY:SLAVE0_AWREADY" \
"WDATA:SLAVE0_WDATA" \
"WSTRB:SLAVE0_WSTRB" \
"WLAST:SLAVE0_WLAST" \
"WVALID:SLAVE0_WVALID" \
"WREADY:SLAVE0_WREADY" \
"BID:SLAVE0_BID" \
"BRESP:SLAVE0_BRESP" \
"BVALID:SLAVE0_BVALID" \
"BREADY:SLAVE0_BREADY" \
"ARID:SLAVE0_ARID" \
"ARADDR:SLAVE0_ARADDR" \
"ARLEN:SLAVE0_ARLEN" \
"ARSIZE:SLAVE0_ARSIZE" \
"ARBURST:SLAVE0_ARBURST" \
"ARLOCK:SLAVE0_ARLOCK" \
"ARCACHE:SLAVE0_ARCACHE" \
"ARPROT:SLAVE0_ARPROT" \
"ARQOS:SLAVE0_ARQOS" \
"ARREGION:SLAVE0_ARREGION" \
"ARVALID:SLAVE0_ARVALID" \
"ARREADY:SLAVE0_ARREADY" \
"RID:SLAVE0_RID" \
"RDATA:SLAVE0_RDATA" \
"RRESP:SLAVE0_RRESP" \
"RLAST:SLAVE0_RLAST" \
"RVALID:SLAVE0_RVALID" \
"RREADY:SLAVE0_RREADY" \
"AWUSER:SLAVE0_AWUSER" \
"WUSER:SLAVE0_WUSER" \
"BUSER:SLAVE0_BUSER" \
"ARUSER:SLAVE0_ARUSER" \
"RUSER:SLAVE0_RUSER" } 

# Add AND2_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {AND2_0}



# Add COREAXI4INTERCONNECT_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREAXI4INTERCONNECT_C0} -instance_name {COREAXI4INTERCONNECT_C0_0}



# Add COREAXI4INTERCONNECT_C1_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREAXI4INTERCONNECT_C1} -instance_name {COREAXI4INTERCONNECT_C1_0}



# Add COREAXITOAXICONNECT_C1_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREAXITOAXICONNECT_C1} -instance_name {COREAXITOAXICONNECT_C1_0}



# Add DFN1E1C0_1 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {DFN1E1C0} -instance_name {DFN1E1C0_1}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {DFN1E1C0_1:D} -value {VCC}



# Add INV_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {INV} -instance_name {INV_0}



# Add INV_1 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {INV} -instance_name {INV_1}



# Add texture_mapper_top_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {texture_mapper_top} -instance_name {texture_mapper_top_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {texture_mapper_top_0:run_loop} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {texture_mapper_top_0:run_loop} -pin_slices {[7:1]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {texture_mapper_top_0:run_loop[7:1]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {texture_mapper_top_0:run_done_write_data} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {texture_mapper_top_0:run_done_write_data} -pin_slices {[7:1]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {texture_mapper_top_0:run_done_write_data[7:1]}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {texture_mapper_top_0:output_fifo_axi4stream} -pin_names {texture_mapper_top_0:output_fifo}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {texture_mapper_top_0:output_fifo_axi4stream} -pin_names {texture_mapper_top_0:output_fifo_ready}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {texture_mapper_top_0:output_fifo_axi4stream} -pin_names {texture_mapper_top_0:output_fifo_valid}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {texture_mapper_top_0:ready}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {texture_mapper_top_0:finish}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {texture_mapper_top_0:run_done_write_en}



# Add wide_mult_axi_top_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {wide_mult_axi_top} -instance_name {wide_mult_axi_top_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {wide_mult_axi_top_0:ready}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {wide_mult_axi_top_0:finish}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:A" "INV_1:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:B" "COREAXI4INTERCONNECT_C0_0:ARESETN" "COREAXI4INTERCONNECT_C1_0:ARESETN" "INV_0:A" "RESETN_i" "texture_mapper_top_0:start" "wide_mult_axi_top_0:start" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:Y" "DFN1E1C0_1:CLR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLK_i" "COREAXI4INTERCONNECT_C0_0:ACLK" "COREAXI4INTERCONNECT_C1_0:ACLK" "DFN1E1C0_1:CLK" "texture_mapper_top_0:clk" "wide_mult_axi_top_0:clk" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4INTERCONNECT_C0_0:M_CLK0" "CPU_AXI4m_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4INTERCONNECT_C1_0:S_CLK0" "DDR_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DFN1E1C0_1:E" "Process_Start_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DFN1E1C0_1:Q" "processing_phase_running" "texture_mapper_top_0:run_loop[0:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"INV_0:Y" "texture_mapper_top_0:reset" "wide_mult_axi_top_0:reset" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"INV_1:A" "texture_mapper_top_0:run_done_write_data[0:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"fifo_ready_i" "texture_mapper_top_0:output_fifo_ready" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"output_fifo_valid" "texture_mapper_top_0:output_fifo_valid" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"output_fifo" "texture_mapper_top_0:output_fifo" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4mslave0" "COREAXI4INTERCONNECT_C1_0:AXI4mslave0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4INTERCONNECT_C0_0:AXI4mmaster0" "CPU_AXI4m" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4INTERCONNECT_C0_0:AXI4mslave0" "texture_mapper_top_0:axi_s" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4INTERCONNECT_C0_0:AXI4mslave1" "wide_mult_axi_top_0:axi_s" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4INTERCONNECT_C0_0:AXI4mslave2" "COREAXITOAXICONNECT_C1_0:AXI4_SLAVE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4INTERCONNECT_C1_0:AXI4mmaster0" "COREAXITOAXICONNECT_C1_0:AXI4_MASTER" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4INTERCONNECT_C1_0:AXI4mmaster1" "wide_mult_axi_top_0:initiator" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign LEGUP_PROCESSING
generate_component -component_name ${sd_name}
