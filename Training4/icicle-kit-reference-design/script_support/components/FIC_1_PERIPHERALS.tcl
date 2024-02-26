# Creating SmartDesign FIC_1_PERIPHERALS
set sd_name {FIC_1_PERIPHERALS}
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
sd_create_scalar_port -sd_name ${sd_name} -port_name {CLKS_FROM_TXPLL_TO_PCIE_1_PCIE_1_TX_BIT_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CLKS_FROM_TXPLL_TO_PCIE_1_PCIE_1_TX_PLL_LOCK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CLKS_FROM_TXPLL_TO_PCIE_1_PCIE_1_TX_PLL_REF_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE0_DRI_SLAVE_PCIESS_LANE0_DRI_ARST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE0_DRI_SLAVE_PCIESS_LANE0_DRI_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE1_DRI_SLAVE_PCIESS_LANE1_DRI_ARST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE1_DRI_SLAVE_PCIESS_LANE1_DRI_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE2_DRI_SLAVE_PCIESS_LANE2_DRI_ARST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE2_DRI_SLAVE_PCIESS_LANE2_DRI_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE3_DRI_SLAVE_PCIESS_LANE3_DRI_ARST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE3_DRI_SLAVE_PCIESS_LANE3_DRI_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD0_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD0_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD1_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD1_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD2_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD2_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD3_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD3_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIE_APB_SLAVE_APB_S_PENABLE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIE_APB_SLAVE_APB_S_PSEL} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIE_APB_SLAVE_APB_S_PWRITE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIe_CLK_125MHz} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIe_INIT_DONE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIe_REFERENCE_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PRESETN} -port_direction {IN}

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
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE0_DRI_SLAVE_PCIESS_LANE0_DRI_INTERRUPT} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE1_DRI_SLAVE_PCIESS_LANE1_DRI_INTERRUPT} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE2_DRI_SLAVE_PCIESS_LANE2_DRI_INTERRUPT} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE3_DRI_SLAVE_PCIESS_LANE3_DRI_INTERRUPT} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD0_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD0_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD1_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD1_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD2_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD2_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD3_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD3_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIE_1_PERST_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIE_APB_SLAVE_APB_S_PREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIE_APB_SLAVE_APB_S_PSLVERR} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIe_IRQ} -port_direction {OUT}


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
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_BID} -port_direction {IN} -port_range {[4:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_BRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_BUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_RDATA} -port_direction {IN} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_RID} -port_direction {IN} -port_range {[4:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_RRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_RUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PCIESS_LANE0_DRI_SLAVE_PCIESS_LANE0_DRI_CTRL} -port_direction {IN} -port_range {[10:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PCIESS_LANE0_DRI_SLAVE_PCIESS_LANE0_DRI_WDATA} -port_direction {IN} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PCIESS_LANE1_DRI_SLAVE_PCIESS_LANE1_DRI_CTRL} -port_direction {IN} -port_range {[10:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PCIESS_LANE1_DRI_SLAVE_PCIESS_LANE1_DRI_WDATA} -port_direction {IN} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PCIESS_LANE2_DRI_SLAVE_PCIESS_LANE2_DRI_CTRL} -port_direction {IN} -port_range {[10:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PCIESS_LANE2_DRI_SLAVE_PCIESS_LANE2_DRI_WDATA} -port_direction {IN} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PCIESS_LANE3_DRI_SLAVE_PCIESS_LANE3_DRI_CTRL} -port_direction {IN} -port_range {[10:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PCIESS_LANE3_DRI_SLAVE_PCIESS_LANE3_DRI_WDATA} -port_direction {IN} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PCIE_APB_SLAVE_APB_S_PADDR} -port_direction {IN} -port_range {[25:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PCIE_APB_SLAVE_APB_S_PWDATA} -port_direction {IN} -port_range {[31:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_BID} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_BRESP} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_BUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_RDATA} -port_direction {OUT} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_RID} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_RRESP} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_RUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARADDR} -port_direction {OUT} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARID} -port_direction {OUT} -port_range {[4:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARLOCK} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARPROT} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARQOS} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARREGION} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWADDR} -port_direction {OUT} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWID} -port_direction {OUT} -port_range {[4:0]}
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
sd_create_bus_port -sd_name ${sd_name} -port_name {PCIESS_LANE0_DRI_SLAVE_PCIESS_LANE0_DRI_RDATA} -port_direction {OUT} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PCIESS_LANE1_DRI_SLAVE_PCIESS_LANE1_DRI_RDATA} -port_direction {OUT} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PCIESS_LANE2_DRI_SLAVE_PCIESS_LANE2_DRI_RDATA} -port_direction {OUT} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PCIESS_LANE3_DRI_SLAVE_PCIESS_LANE3_DRI_RDATA} -port_direction {OUT} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PCIE_APB_SLAVE_APB_S_PRDATA} -port_direction {OUT} -port_range {[31:0]}


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

sd_create_bif_port -sd_name ${sd_name} -port_name {Q0_LANE0_DRI_SLAVE} -port_bif_vlnv {Actel:busdef.dri:PF_DRI:1.0} -port_bif_role {slave} -port_bif_mapping {\
"DRI_CLK:PCIESS_LANE0_DRI_SLAVE_PCIESS_LANE0_DRI_CLK" \
"DRI_ARST_N:PCIESS_LANE0_DRI_SLAVE_PCIESS_LANE0_DRI_ARST_N" \
"DRI_CTRL:PCIESS_LANE0_DRI_SLAVE_PCIESS_LANE0_DRI_CTRL" \
"DRI_RDATA:PCIESS_LANE0_DRI_SLAVE_PCIESS_LANE0_DRI_RDATA" \
"DRI_WDATA:PCIESS_LANE0_DRI_SLAVE_PCIESS_LANE0_DRI_WDATA" \
"DRI_INTERRUPT:PCIESS_LANE0_DRI_SLAVE_PCIESS_LANE0_DRI_INTERRUPT" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {Q0_LANE1_DRI_SLAVE} -port_bif_vlnv {Actel:busdef.dri:PF_DRI:1.0} -port_bif_role {slave} -port_bif_mapping {\
"DRI_CLK:PCIESS_LANE1_DRI_SLAVE_PCIESS_LANE1_DRI_CLK" \
"DRI_ARST_N:PCIESS_LANE1_DRI_SLAVE_PCIESS_LANE1_DRI_ARST_N" \
"DRI_CTRL:PCIESS_LANE1_DRI_SLAVE_PCIESS_LANE1_DRI_CTRL" \
"DRI_RDATA:PCIESS_LANE1_DRI_SLAVE_PCIESS_LANE1_DRI_RDATA" \
"DRI_WDATA:PCIESS_LANE1_DRI_SLAVE_PCIESS_LANE1_DRI_WDATA" \
"DRI_INTERRUPT:PCIESS_LANE1_DRI_SLAVE_PCIESS_LANE1_DRI_INTERRUPT" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {Q0_LANE2_DRI_SLAVE} -port_bif_vlnv {Actel:busdef.dri:PF_DRI:1.0} -port_bif_role {slave} -port_bif_mapping {\
"DRI_CLK:PCIESS_LANE2_DRI_SLAVE_PCIESS_LANE2_DRI_CLK" \
"DRI_ARST_N:PCIESS_LANE2_DRI_SLAVE_PCIESS_LANE2_DRI_ARST_N" \
"DRI_CTRL:PCIESS_LANE2_DRI_SLAVE_PCIESS_LANE2_DRI_CTRL" \
"DRI_RDATA:PCIESS_LANE2_DRI_SLAVE_PCIESS_LANE2_DRI_RDATA" \
"DRI_WDATA:PCIESS_LANE2_DRI_SLAVE_PCIESS_LANE2_DRI_WDATA" \
"DRI_INTERRUPT:PCIESS_LANE2_DRI_SLAVE_PCIESS_LANE2_DRI_INTERRUPT" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {Q0_LANE3_DRI_SLAVE} -port_bif_vlnv {Actel:busdef.dri:PF_DRI:1.0} -port_bif_role {slave} -port_bif_mapping {\
"DRI_CLK:PCIESS_LANE3_DRI_SLAVE_PCIESS_LANE3_DRI_CLK" \
"DRI_ARST_N:PCIESS_LANE3_DRI_SLAVE_PCIESS_LANE3_DRI_ARST_N" \
"DRI_CTRL:PCIESS_LANE3_DRI_SLAVE_PCIESS_LANE3_DRI_CTRL" \
"DRI_RDATA:PCIESS_LANE3_DRI_SLAVE_PCIESS_LANE3_DRI_RDATA" \
"DRI_WDATA:PCIESS_LANE3_DRI_SLAVE_PCIESS_LANE3_DRI_WDATA" \
"DRI_INTERRUPT:PCIESS_LANE3_DRI_SLAVE_PCIESS_LANE3_DRI_INTERRUPT" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {APB_SLAVE} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {slave} -port_bif_mapping {\
"PADDR:PCIE_APB_SLAVE_APB_S_PADDR" \
"PSELx:PCIE_APB_SLAVE_APB_S_PSEL" \
"PENABLE:PCIE_APB_SLAVE_APB_S_PENABLE" \
"PWRITE:PCIE_APB_SLAVE_APB_S_PWRITE" \
"PRDATA:PCIE_APB_SLAVE_APB_S_PRDATA" \
"PWDATA:PCIE_APB_SLAVE_APB_S_PWDATA" \
"PREADY:PCIE_APB_SLAVE_APB_S_PREADY" \
"PSLVERR:PCIE_APB_SLAVE_APB_S_PSLVERR" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {TX_PLL_CLKS} -port_bif_vlnv {Actel:busdef.clock:PF_TXPLL_XCVR_CLK:1.0} -port_bif_role {slave} -port_bif_mapping {\
"LOCK:CLKS_FROM_TXPLL_TO_PCIE_1_PCIE_1_TX_PLL_LOCK" \
"BIT_CLK:CLKS_FROM_TXPLL_TO_PCIE_1_PCIE_1_TX_BIT_CLK" \
"REF_CLK_TO_LANE:CLKS_FROM_TXPLL_TO_PCIE_1_PCIE_1_TX_PLL_REF_CLK" } 

# Add AXI_ADDRESS_SHIM_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {AXI_ADDRESS_SHIM} -instance_name {AXI_ADDRESS_SHIM_0}



# Add FIC_1_INITIATOR_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {FIC_1_INITIATOR} -instance_name {FIC_1_INITIATOR_0}



# Add PCIE instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_PCIE_C0} -instance_name {PCIE}
#sd_create_pin_group -sd_name ${sd_name} -group_name {PADs_IN} -instance_name {PCIE} -pin_names {"PCIESS_LANE_RXD0_P" "PCIESS_LANE_RXD0_N" "PCIESS_LANE_RXD1_P" "PCIESS_LANE_RXD1_N" "PCIESS_LANE_RXD2_P" "PCIESS_LANE_RXD2_N" "PCIESS_LANE_RXD3_P" "PCIESS_LANE_RXD3_N" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {PADs_OUT} -instance_name {PCIE} -pin_names {"PCIESS_LANE_TXD0_P" "PCIESS_LANE_TXD0_N" "PCIESS_LANE_TXD1_P" "PCIESS_LANE_TXD1_N" "PCIESS_LANE_TXD2_P" "PCIESS_LANE_TXD2_N" "PCIESS_LANE_TXD3_P" "PCIESS_LANE_TXD3_N" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {CLK_IN} -instance_name {PCIE} -pin_names {"PCIESS_LANE0_CDR_REF_CLK_0" "AXI_CLK" "AXI_CLK_STABLE" "PCIESS_LANE1_CDR_REF_CLK_0" "PCIESS_LANE2_CDR_REF_CLK_0" "PCIESS_LANE3_CDR_REF_CLK_0" "PCIE_1_TL_CLK_125MHz" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {PCIE_IN} -instance_name {PCIE} -pin_names {"PCIE_1_INTERRUPT" "PCIE_1_M_RDERR" "PCIE_1_S_WDERR" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {PCIE_OUT} -instance_name {PCIE} -pin_names {"PCIE_1_LTSSM" "PCIE_1_INTERRUPT_OUT" "PCIE_1_PERST_OUT_N" "PCIE_1_M_WDERR" "PCIE_1_S_RDERR" "PCIE_1_HOT_RST_EXIT" "PCIE_1_DLUP_EXIT" }
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PCIE:PCIE_1_INTERRUPT} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PCIE:PCIE_1_M_RDERR} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PCIE:PCIE_1_S_WDERR} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PCIE:PCIE_1_LTSSM}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PCIE:PCIE_1_M_WDERR}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PCIE:PCIE_1_S_RDERR}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PCIE:PCIE_1_HOT_RST_EXIT}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PCIE:PCIE_1_DLUP_EXIT}



# Add PCIE_INITIATOR instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PCIE_INITIATOR} -instance_name {PCIE_INITIATOR}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"ACLK" "FIC_1_INITIATOR_0:ACLK" "PCIE:AXI_CLK" "PCIE_INITIATOR:ACLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ARESETN" "AXI_ADDRESS_SHIM_0:RESETN" "FIC_1_INITIATOR_0:ARESETN" "PCIE:AXI_CLK_STABLE" "PCIE_INITIATOR:ARESETN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE:APB_S_PCLK" "PCLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE:APB_S_PRESET_N" "PRESETN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE:INIT_DONE" "PCIe_INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE:PCIESS_LANE0_CDR_REF_CLK_0" "PCIE:PCIESS_LANE1_CDR_REF_CLK_0" "PCIE:PCIESS_LANE2_CDR_REF_CLK_0" "PCIE:PCIESS_LANE3_CDR_REF_CLK_0" "PCIe_REFERENCE_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE:PCIESS_LANE_RXD0_N" "PCIESS_LANE_RXD0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE:PCIESS_LANE_RXD0_P" "PCIESS_LANE_RXD0_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE:PCIESS_LANE_RXD1_N" "PCIESS_LANE_RXD1_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE:PCIESS_LANE_RXD1_P" "PCIESS_LANE_RXD1_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE:PCIESS_LANE_RXD2_N" "PCIESS_LANE_RXD2_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE:PCIESS_LANE_RXD2_P" "PCIESS_LANE_RXD2_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE:PCIESS_LANE_RXD3_N" "PCIESS_LANE_RXD3_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE:PCIESS_LANE_RXD3_P" "PCIESS_LANE_RXD3_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE:PCIESS_LANE_TXD0_N" "PCIESS_LANE_TXD0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE:PCIESS_LANE_TXD0_P" "PCIESS_LANE_TXD0_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE:PCIESS_LANE_TXD1_N" "PCIESS_LANE_TXD1_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE:PCIESS_LANE_TXD1_P" "PCIESS_LANE_TXD1_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE:PCIESS_LANE_TXD2_N" "PCIESS_LANE_TXD2_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE:PCIESS_LANE_TXD2_P" "PCIESS_LANE_TXD2_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE:PCIESS_LANE_TXD3_N" "PCIESS_LANE_TXD3_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE:PCIESS_LANE_TXD3_P" "PCIESS_LANE_TXD3_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE:PCIE_1_INTERRUPT_OUT" "PCIe_IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE:PCIE_1_PERST_OUT_N" "PCIE_1_PERST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE:PCIE_1_TL_CLK_125MHz" "PCIe_CLK_125MHz" }


# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_SLAVE" "PCIE:PCIE_APB_SLAVE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4mmaster0" "FIC_1_INITIATOR_0:AXI4mmaster0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4mslave0" "PCIE_INITIATOR:AXI4mslave0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI_ADDRESS_SHIM_0:AXI4_INITIATOR" "PCIE_INITIATOR:AXI4mmaster0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI_ADDRESS_SHIM_0:AXI4_TARGET" "PCIE:AXI_1_MASTER" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_INITIATOR_0:AXI4mslave0" "PCIE:AXI_1_SLAVE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE:CLKS_FROM_TXPLL_TO_PCIE_1" "TX_PLL_CLKS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE:PCIESS_LANE0_DRI_SLAVE" "Q0_LANE0_DRI_SLAVE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE:PCIESS_LANE1_DRI_SLAVE" "Q0_LANE1_DRI_SLAVE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE:PCIESS_LANE2_DRI_SLAVE" "Q0_LANE2_DRI_SLAVE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE:PCIESS_LANE3_DRI_SLAVE" "Q0_LANE3_DRI_SLAVE" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign FIC_1_PERIPHERALS
generate_component -component_name ${sd_name}
