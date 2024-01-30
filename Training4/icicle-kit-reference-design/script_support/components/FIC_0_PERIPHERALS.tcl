# Creating SmartDesign FIC_0_PERIPHERALS
set sd_name {FIC_0_PERIPHERALS}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {ACLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ARESETN} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_ARVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_AWVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_BREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_RREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_WLAST} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_WVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_BVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_RLAST} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_RVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_WREADY} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_ARREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_AWREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_BVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_RLAST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_RVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_WREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_BREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_RREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_WLAST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_WVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DMA_CONTROLLER_IRQ} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_ARADDR} -port_direction {IN} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_ARBURST} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_ARCACHE} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_ARID} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_ARLEN} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_ARLOCK} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_ARPROT} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_ARQOS} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_ARREGION} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_ARSIZE} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_ARUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_AWADDR} -port_direction {IN} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_AWBURST} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_AWCACHE} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_AWID} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_AWLEN} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_AWLOCK} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_AWPROT} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_AWQOS} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_AWREGION} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_AWSIZE} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_AWUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_WDATA} -port_direction {IN} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_WSTRB} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_WUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_BID} -port_direction {IN} -port_range {[8:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_BRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_BUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_RDATA} -port_direction {IN} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_RID} -port_direction {IN} -port_range {[8:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_RRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_RUSER} -port_direction {IN} -port_range {[0:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_BID} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_BRESP} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_BUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_RDATA} -port_direction {OUT} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_RID} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_RRESP} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_RUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARADDR} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARID} -port_direction {OUT} -port_range {[8:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARLOCK} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARPROT} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARQOS} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARREGION} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWADDR} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWID} -port_direction {OUT} -port_range {[8:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWLOCK} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWPROT} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWQOS} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWREGION} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_WDATA} -port_direction {OUT} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_WSTRB} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_WUSER} -port_direction {OUT} -port_range {[0:0]}


# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4mmaster0} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {mirroredMaster} -port_bif_mapping {\
"AWID:AXI4mmaster0_MASTER0_AWID" \
"AWADDR:AXI4mmaster0_MASTER0_AWADDR" \
"AWLEN:AXI4mmaster0_MASTER0_AWLEN" \
"AWSIZE:AXI4mmaster0_MASTER0_AWSIZE" \
"AWBURST:AXI4mmaster0_MASTER0_AWBURST" \
"AWLOCK:AXI4mmaster0_MASTER0_AWLOCK" \
"AWCACHE:AXI4mmaster0_MASTER0_AWCACHE" \
"AWPROT:AXI4mmaster0_MASTER0_AWPROT" \
"AWQOS:AXI4mmaster0_MASTER0_AWQOS" \
"AWREGION:AXI4mmaster0_MASTER0_AWREGION" \
"AWVALID:AXI4mmaster0_MASTER0_AWVALID" \
"AWREADY:AXI4mmaster0_MASTER0_AWREADY" \
"WDATA:AXI4mmaster0_MASTER0_WDATA" \
"WSTRB:AXI4mmaster0_MASTER0_WSTRB" \
"WLAST:AXI4mmaster0_MASTER0_WLAST" \
"WVALID:AXI4mmaster0_MASTER0_WVALID" \
"WREADY:AXI4mmaster0_MASTER0_WREADY" \
"BID:AXI4mmaster0_MASTER0_BID" \
"BRESP:AXI4mmaster0_MASTER0_BRESP" \
"BVALID:AXI4mmaster0_MASTER0_BVALID" \
"BREADY:AXI4mmaster0_MASTER0_BREADY" \
"ARID:AXI4mmaster0_MASTER0_ARID" \
"ARADDR:AXI4mmaster0_MASTER0_ARADDR" \
"ARLEN:AXI4mmaster0_MASTER0_ARLEN" \
"ARSIZE:AXI4mmaster0_MASTER0_ARSIZE" \
"ARBURST:AXI4mmaster0_MASTER0_ARBURST" \
"ARLOCK:AXI4mmaster0_MASTER0_ARLOCK" \
"ARCACHE:AXI4mmaster0_MASTER0_ARCACHE" \
"ARPROT:AXI4mmaster0_MASTER0_ARPROT" \
"ARQOS:AXI4mmaster0_MASTER0_ARQOS" \
"ARREGION:AXI4mmaster0_MASTER0_ARREGION" \
"ARVALID:AXI4mmaster0_MASTER0_ARVALID" \
"ARREADY:AXI4mmaster0_MASTER0_ARREADY" \
"RID:AXI4mmaster0_MASTER0_RID" \
"RDATA:AXI4mmaster0_MASTER0_RDATA" \
"RRESP:AXI4mmaster0_MASTER0_RRESP" \
"RLAST:AXI4mmaster0_MASTER0_RLAST" \
"RVALID:AXI4mmaster0_MASTER0_RVALID" \
"RREADY:AXI4mmaster0_MASTER0_RREADY" \
"AWUSER:AXI4mmaster0_MASTER0_AWUSER" \
"WUSER:AXI4mmaster0_MASTER0_WUSER" \
"BUSER:AXI4mmaster0_MASTER0_BUSER" \
"ARUSER:AXI4mmaster0_MASTER0_ARUSER" \
"RUSER:AXI4mmaster0_MASTER0_RUSER" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4mslave0} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"AWID:AXI4mslave0_SLAVE0_AWID" \
"AWADDR:AXI4mslave0_SLAVE0_AWADDR" \
"AWLEN:AXI4mslave0_SLAVE0_AWLEN" \
"AWSIZE:AXI4mslave0_SLAVE0_AWSIZE" \
"AWBURST:AXI4mslave0_SLAVE0_AWBURST" \
"AWLOCK:AXI4mslave0_SLAVE0_AWLOCK" \
"AWCACHE:AXI4mslave0_SLAVE0_AWCACHE" \
"AWPROT:AXI4mslave0_SLAVE0_AWPROT" \
"AWQOS:AXI4mslave0_SLAVE0_AWQOS" \
"AWREGION:AXI4mslave0_SLAVE0_AWREGION" \
"AWVALID:AXI4mslave0_SLAVE0_AWVALID" \
"AWREADY:AXI4mslave0_SLAVE0_AWREADY" \
"WDATA:AXI4mslave0_SLAVE0_WDATA" \
"WSTRB:AXI4mslave0_SLAVE0_WSTRB" \
"WLAST:AXI4mslave0_SLAVE0_WLAST" \
"WVALID:AXI4mslave0_SLAVE0_WVALID" \
"WREADY:AXI4mslave0_SLAVE0_WREADY" \
"BID:AXI4mslave0_SLAVE0_BID" \
"BRESP:AXI4mslave0_SLAVE0_BRESP" \
"BVALID:AXI4mslave0_SLAVE0_BVALID" \
"BREADY:AXI4mslave0_SLAVE0_BREADY" \
"ARID:AXI4mslave0_SLAVE0_ARID" \
"ARADDR:AXI4mslave0_SLAVE0_ARADDR" \
"ARLEN:AXI4mslave0_SLAVE0_ARLEN" \
"ARSIZE:AXI4mslave0_SLAVE0_ARSIZE" \
"ARBURST:AXI4mslave0_SLAVE0_ARBURST" \
"ARLOCK:AXI4mslave0_SLAVE0_ARLOCK" \
"ARCACHE:AXI4mslave0_SLAVE0_ARCACHE" \
"ARPROT:AXI4mslave0_SLAVE0_ARPROT" \
"ARQOS:AXI4mslave0_SLAVE0_ARQOS" \
"ARREGION:AXI4mslave0_SLAVE0_ARREGION" \
"ARVALID:AXI4mslave0_SLAVE0_ARVALID" \
"ARREADY:AXI4mslave0_SLAVE0_ARREADY" \
"RID:AXI4mslave0_SLAVE0_RID" \
"RDATA:AXI4mslave0_SLAVE0_RDATA" \
"RRESP:AXI4mslave0_SLAVE0_RRESP" \
"RLAST:AXI4mslave0_SLAVE0_RLAST" \
"RVALID:AXI4mslave0_SLAVE0_RVALID" \
"RREADY:AXI4mslave0_SLAVE0_RREADY" \
"AWUSER:AXI4mslave0_SLAVE0_AWUSER" \
"WUSER:AXI4mslave0_SLAVE0_WUSER" \
"BUSER:AXI4mslave0_SLAVE0_BUSER" \
"ARUSER:AXI4mslave0_SLAVE0_ARUSER" \
"RUSER:AXI4mslave0_SLAVE0_RUSER" } 

# Add DMA_CONTROLLER instance
sd_instantiate_component -sd_name ${sd_name} -component_name {DMA_CONTROLLER} -instance_name {DMA_CONTROLLER}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DMA_CONTROLLER:INTERRUPT} -pin_slices {[0:0]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {DMA_CONTROLLER:STRTDMAOP} -value {GND}



# Add DMA_INITIATOR instance
sd_instantiate_component -sd_name ${sd_name} -component_name {DMA_INITIATOR} -instance_name {DMA_INITIATOR}



# Add FIC0_INITIATOR instance
sd_instantiate_component -sd_name ${sd_name} -component_name {FIC0_INITIATOR} -instance_name {FIC0_INITIATOR}



# Add MSS_LSRAM instance
sd_instantiate_component -sd_name ${sd_name} -component_name {MSS_LSRAM} -instance_name {MSS_LSRAM}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"ACLK" "DMA_CONTROLLER:CLOCK" "DMA_INITIATOR:ACLK" "FIC0_INITIATOR:ACLK" "MSS_LSRAM:ACLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ARESETN" "DMA_CONTROLLER:RESETN" "DMA_INITIATOR:ARESETN" "FIC0_INITIATOR:ARESETN" "MSS_LSRAM:ARESETN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DMA_CONTROLLER:INTERRUPT[0:0]" "DMA_CONTROLLER_IRQ" }


# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4mmaster0" "FIC0_INITIATOR:AXI4mmaster0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4mslave0" "DMA_INITIATOR:AXI4mslave0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DMA_CONTROLLER:AXI4MasterDMA_IF" "DMA_INITIATOR:AXI4mmaster0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DMA_CONTROLLER:AXI4SlaveCtrl_IF" "FIC0_INITIATOR:AXI4mslave0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC0_INITIATOR:AXI4mslave1" "MSS_LSRAM:AXI4_Slave" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign FIC_0_PERIPHERALS
generate_component -component_name ${sd_name}
