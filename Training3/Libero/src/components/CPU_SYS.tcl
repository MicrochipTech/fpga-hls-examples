# Creating SmartDesign CPU_SYS
set sd_name {CPU_SYS}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI_MSTR_ARREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI_MSTR_AWREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI_MSTR_BID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI_MSTR_BVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI_MSTR_RID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI_MSTR_RLAST} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI_MSTR_RVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI_MSTR_WREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CLK_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {EXT_IRQ} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESETN_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TCK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TDI} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TMS} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TRSTB} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {UART_RX_i} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI_MSTR_ARID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI_MSTR_ARVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI_MSTR_AWID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI_MSTR_AWVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI_MSTR_BREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI_MSTR_RREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI_MSTR_WLAST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI_MSTR_WVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_RSTN_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TDO} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {UART_TX_o} -port_direction {OUT}

sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_SCL} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_SDA} -port_direction {INOUT} -port_is_pad {1}

# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI_MSTR_BRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI_MSTR_RDATA} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI_MSTR_RRESP} -port_direction {IN} -port_range {[1:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {AXI_MSTR_ARADDR} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI_MSTR_ARBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI_MSTR_ARCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI_MSTR_ARLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI_MSTR_ARLOCK} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI_MSTR_ARPROT} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI_MSTR_ARSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI_MSTR_AWADDR} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI_MSTR_AWBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI_MSTR_AWCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI_MSTR_AWLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI_MSTR_AWLOCK} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI_MSTR_AWPROT} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI_MSTR_AWSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI_MSTR_WDATA} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI_MSTR_WSTRB} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {GPIO_OUT} -port_direction {OUT} -port_range {[1:0]}


# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4_MSTR} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {master} -port_bif_mapping {\
"AWID:AXI_MSTR_AWID" \
"AWADDR:AXI_MSTR_AWADDR" \
"AWLEN:AXI_MSTR_AWLEN" \
"AWSIZE:AXI_MSTR_AWSIZE" \
"AWBURST:AXI_MSTR_AWBURST" \
"AWLOCK:AXI_MSTR_AWLOCK" \
"AWCACHE:AXI_MSTR_AWCACHE" \
"AWPROT:AXI_MSTR_AWPROT" \
"AWVALID:AXI_MSTR_AWVALID" \
"AWREADY:AXI_MSTR_AWREADY" \
"WDATA:AXI_MSTR_WDATA" \
"WSTRB:AXI_MSTR_WSTRB" \
"WLAST:AXI_MSTR_WLAST" \
"WVALID:AXI_MSTR_WVALID" \
"WREADY:AXI_MSTR_WREADY" \
"BID:AXI_MSTR_BID" \
"BRESP:AXI_MSTR_BRESP" \
"BVALID:AXI_MSTR_BVALID" \
"BREADY:AXI_MSTR_BREADY" \
"ARID:AXI_MSTR_ARID" \
"ARADDR:AXI_MSTR_ARADDR" \
"ARLEN:AXI_MSTR_ARLEN" \
"ARSIZE:AXI_MSTR_ARSIZE" \
"ARBURST:AXI_MSTR_ARBURST" \
"ARLOCK:AXI_MSTR_ARLOCK" \
"ARCACHE:AXI_MSTR_ARCACHE" \
"ARPROT:AXI_MSTR_ARPROT" \
"ARVALID:AXI_MSTR_ARVALID" \
"ARREADY:AXI_MSTR_ARREADY" \
"RID:AXI_MSTR_RID" \
"RDATA:AXI_MSTR_RDATA" \
"RRESP:AXI_MSTR_RRESP" \
"RLAST:AXI_MSTR_RLAST" \
"RVALID:AXI_MSTR_RVALID" \
"RREADY:AXI_MSTR_RREADY" } 

# Add BIBUF_1 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_1}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BIBUF_1:D} -value {GND}



# Add BIBUF_2 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_2}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BIBUF_2:D} -value {GND}



# Add CoreAPB3_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreAPB3_C0} -instance_name {CoreAPB3_C0_0}



# Add CoreGPIO_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreGPIO_C0} -instance_name {CoreGPIO_C0_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreGPIO_C0_0:INT}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CoreGPIO_C0_0:GPIO_IN} -value {GND}



# Add COREI2C_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREI2C_C0} -instance_name {COREI2C_C0_0}



# Add COREJTAGDEBUG_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREJTAGDEBUG_C0} -instance_name {COREJTAGDEBUG_C0_0}



# Add CoreUARTapb_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreUARTapb_C0} -instance_name {CoreUARTapb_C0_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreUARTapb_C0_0:TXRDY}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreUARTapb_C0_0:RXRDY}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreUARTapb_C0_0:PARITY_ERR}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreUARTapb_C0_0:OVERFLOW}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreUARTapb_C0_0:FRAMING_ERR}



# Add INV_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {INV} -instance_name {INV_0}



# Add INV_1 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {INV} -instance_name {INV_1}



# Add MIV_RAM_64K_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {MIV_RAM_64K} -instance_name {MIV_RAM_64K_0}



# Add MIV_RV32_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {MIV_RV32_C0} -instance_name {MIV_RV32_C0_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32_C0_0:MSYS_EI} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32_C0_0:MSYS_EI} -pin_slices {[1:1]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MIV_RV32_C0_0:MSYS_EI[1:1]} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MIV_RV32_C0_0:JTAG_TDO_DR}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MIV_RV32_C0_0:EXT_RESETN}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MIV_RV32_C0_0:TIME_COUNT_OUT}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_1:E" "INV_0:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_1:PAD" "HDMI_SCL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_1:Y" "COREI2C_C0_0:SCLI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_2:E" "INV_1:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_2:PAD" "HDMI_SDA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_2:Y" "COREI2C_C0_0:SDAI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLK_i" "COREI2C_C0_0:BCLK" "COREI2C_C0_0:PCLK" "CoreGPIO_C0_0:PCLK" "CoreUARTapb_C0_0:PCLK" "MIV_RAM_64K_0:HCLK" "MIV_RV32_C0_0:CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREI2C_C0_0:INT" "MIV_RV32_C0_0:MSYS_EI[0:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREI2C_C0_0:PRESETN" "CoreGPIO_C0_0:PRESETN" "CoreUARTapb_C0_0:PRESETN" "HDMI_RSTN_o" "MIV_RAM_64K_0:HRESETN" "MIV_RV32_C0_0:RESETN" "RESETN_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREI2C_C0_0:SCLO" "INV_0:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREI2C_C0_0:SDAO" "INV_1:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_C0_0:TCK" "TCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_C0_0:TDI" "TDI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_C0_0:TDO" "TDO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_C0_0:TGT_TCK_0" "MIV_RV32_C0_0:JTAG_TCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_C0_0:TGT_TDI_0" "MIV_RV32_C0_0:JTAG_TDI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_C0_0:TGT_TDO_0" "MIV_RV32_C0_0:JTAG_TDO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_C0_0:TGT_TMS_0" "MIV_RV32_C0_0:JTAG_TMS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_C0_0:TGT_TRSTB_0" "MIV_RV32_C0_0:JTAG_TRSTN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_C0_0:TMS" "TMS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_C0_0:TRSTB" "TRSTB" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreUARTapb_C0_0:RX" "UART_RX_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreUARTapb_C0_0:TX" "UART_TX_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"EXT_IRQ" "MIV_RV32_C0_0:EXT_IRQ" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_C0_0:GPIO_OUT" "GPIO_OUT" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4_MSTR" "MIV_RV32_C0_0:AXI4_MSTR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREI2C_C0_0:APBslave" "CoreAPB3_C0_0:APBmslave1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_C0_0:APB3mmaster" "MIV_RV32_C0_0:APB_MSTR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_C0_0:APBmslave0" "CoreUARTapb_C0_0:APB_bif" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_C0_0:APBmslave3" "CoreGPIO_C0_0:APB_bif" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_RAM_64K_0:AHBSlaveInterface" "MIV_RV32_C0_0:AHBL_M_SLV" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign CPU_SYS
generate_component -component_name ${sd_name}
