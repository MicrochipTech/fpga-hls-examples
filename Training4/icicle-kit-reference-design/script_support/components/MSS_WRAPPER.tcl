# Creating SmartDesign MSS_WRAPPER
set sd_name {MSS_WRAPPER}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAN_0_RXBUS_F2M} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAN_1_RXBUS} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_0_ACLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_ARREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_AWREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_BVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_RLAST} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_RVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_WREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_TARGET_FIC_0_AXI4_S_ARLOCK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_TARGET_FIC_0_AXI4_S_ARVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_TARGET_FIC_0_AXI4_S_AWLOCK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_TARGET_FIC_0_AXI4_S_AWVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_TARGET_FIC_0_AXI4_S_BREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_TARGET_FIC_0_AXI4_S_RREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_TARGET_FIC_0_AXI4_S_WLAST} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_TARGET_FIC_0_AXI4_S_WVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_1_ACLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_ARREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_AWREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_BVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_RLAST} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_RVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_WREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_TARGET_FIC_1_AXI4_S_ARLOCK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_TARGET_FIC_1_AXI4_S_ARVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_TARGET_FIC_1_AXI4_S_AWLOCK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_TARGET_FIC_1_AXI4_S_AWVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_TARGET_FIC_1_AXI4_S_BREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_TARGET_FIC_1_AXI4_S_RREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_TARGET_FIC_1_AXI4_S_WLAST} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_TARGET_FIC_1_AXI4_S_WVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_2_ACLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_2_AXI4_TARGET_FIC_2_AXI4_S_ARLOCK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_2_AXI4_TARGET_FIC_2_AXI4_S_ARVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_2_AXI4_TARGET_FIC_2_AXI4_S_AWLOCK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_2_AXI4_TARGET_FIC_2_AXI4_S_AWVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_2_AXI4_TARGET_FIC_2_AXI4_S_BREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_2_AXI4_TARGET_FIC_2_AXI4_S_RREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_2_AXI4_TARGET_FIC_2_AXI4_S_WLAST} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_2_AXI4_TARGET_FIC_2_AXI4_S_WVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_3_APB_INITIATOR_FIC_3_APB_M_PREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_3_APB_INITIATOR_FIC_3_APB_M_PSLVERR} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_3_PCLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_2_F2M_30} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_2_F2M_31} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_0_RXD_F2M} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_1_RXD_F2M} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_2_RXD_F2M} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_3_RXD_F2M} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_4_RXD_F2M} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MSS_INT_F2M_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MSS_INT_F2M_1} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MSS_INT_F2M_2} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MSS_INT_F2M_3} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MSS_INT_F2M_4} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MSS_INT_F2M_5} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MSS_INT_F2M_59} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MSS_INT_F2M_60} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MSS_INT_F2M_61} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MSS_INT_F2M_62} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MSS_INT_F2M_63} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MSS_RESET_N_F2M} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REFCLK_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REFCLK} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_CD_EMMC_STRB} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_WP_EMMC_RSTN} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_RX0_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_RX0_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_RX1_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_RX1_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SPI_1_DI} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_CLK} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DIR} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_NXT} -port_direction {IN} -port_is_pad {1}

sd_create_scalar_port -sd_name ${sd_name} -port_name {CAN_0_TXBUS_M2F} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAN_0_TX_EBL_M2F} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAN_1_TXBUS} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAN_1_TX_EBL_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CKE} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CK_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CK} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CS} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_ARLOCK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_ARVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_AWLOCK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_AWVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_BREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_RREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_WLAST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_WVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_TARGET_FIC_0_AXI4_S_ARREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_TARGET_FIC_0_AXI4_S_AWREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_TARGET_FIC_0_AXI4_S_BVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_TARGET_FIC_0_AXI4_S_RLAST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_TARGET_FIC_0_AXI4_S_RVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_TARGET_FIC_0_AXI4_S_WREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_ARLOCK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_ARVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_AWLOCK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_AWVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_BREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_RREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_WLAST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_WVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_TARGET_FIC_1_AXI4_S_ARREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_TARGET_FIC_1_AXI4_S_AWREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_TARGET_FIC_1_AXI4_S_BVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_TARGET_FIC_1_AXI4_S_RLAST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_TARGET_FIC_1_AXI4_S_RVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_TARGET_FIC_1_AXI4_S_WREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_2_AXI4_TARGET_FIC_2_AXI4_S_ARREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_2_AXI4_TARGET_FIC_2_AXI4_S_AWREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_2_AXI4_TARGET_FIC_2_AXI4_S_BVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_2_AXI4_TARGET_FIC_2_AXI4_S_RLAST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_2_AXI4_TARGET_FIC_2_AXI4_S_RVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_2_AXI4_TARGET_FIC_2_AXI4_S_WREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_3_APB_INITIATOR_FIC_3_APB_M_PENABLE} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_3_APB_INITIATOR_FIC_3_APB_M_PSEL} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_3_APB_INITIATOR_FIC_3_APB_M_PWRITE} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_2_M2F_16} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_2_M2F_17} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_2_M2F_18} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_2_M2F_19} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_2_M2F_26} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_2_M2F_27} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_2_M2F_28} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MAC_1_MDC} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_0_TXD_M2F} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_1_TXD_M2F} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_2_TXD_M2F} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_3_TXD_M2F} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_4_TXD_M2F} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MSS_DLL_LOCKS} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MSS_RESET_N_M2F} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ODT} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESET_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_CLK_EMMC_CLK} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_POW_EMMC_DATA4} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_VOLT_CMD_DIR_EMMC_DATA7} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_VOLT_DIR_0_EMMC_UNUSED} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_VOLT_DIR_1_3_EMMC_UNUSED} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_VOLT_EN_EMMC_DATA6} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_VOLT_SEL_EMMC_DATA5} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_TX0_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_TX0_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_TX1_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_TX1_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SPI_1_DO} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_STP} -port_direction {OUT} -port_is_pad {1}

sd_create_scalar_port -sd_name ${sd_name} -port_name {I2C_1_SCL} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {I2C_1_SDA} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MAC_1_MDIO} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {QSPI_CLK} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {QSPI_DATA_0} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {QSPI_DATA_1} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {QSPI_DATA_2} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {QSPI_DATA_3} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {QSPI_SEL} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RPi_GPIO12} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RPi_GPIO13} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RPi_GPIO16} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RPi_GPIO17} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RPi_GPIO19} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RPi_GPIO20} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RPi_GPIO21} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RPi_GPIO22} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RPi_GPIO23} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RPi_GPIO24} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RPi_GPIO25} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RPi_GPIO26} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RPi_GPIO27} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_CMD_EMMC_CMD} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_DATA0_EMMC_DATA0} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_DATA1_EMMC_DATA1} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_DATA2_EMMC_DATA2} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_DATA3_EMMC_DATA3} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SPI_1_CLK} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SPI_1_SS0} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA0} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA1} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA2} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA3} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA4} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA5} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA6} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA7} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {mBUS_I2C_SCL} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {mBUS_I2C_SDA} -port_direction {INOUT} -port_is_pad {1}

# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_BID} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_BRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_RDATA} -port_direction {IN} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_RID} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_RRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_TARGET_FIC_0_AXI4_S_ARADDR} -port_direction {IN} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_TARGET_FIC_0_AXI4_S_ARBURST} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_TARGET_FIC_0_AXI4_S_ARCACHE} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_TARGET_FIC_0_AXI4_S_ARID} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_TARGET_FIC_0_AXI4_S_ARLEN} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_TARGET_FIC_0_AXI4_S_ARPROT} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_TARGET_FIC_0_AXI4_S_ARQOS} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_TARGET_FIC_0_AXI4_S_ARSIZE} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_TARGET_FIC_0_AXI4_S_AWADDR} -port_direction {IN} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_TARGET_FIC_0_AXI4_S_AWBURST} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_TARGET_FIC_0_AXI4_S_AWCACHE} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_TARGET_FIC_0_AXI4_S_AWID} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_TARGET_FIC_0_AXI4_S_AWLEN} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_TARGET_FIC_0_AXI4_S_AWPROT} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_TARGET_FIC_0_AXI4_S_AWQOS} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_TARGET_FIC_0_AXI4_S_AWSIZE} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_TARGET_FIC_0_AXI4_S_WDATA} -port_direction {IN} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_TARGET_FIC_0_AXI4_S_WSTRB} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_BID} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_BRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_RDATA} -port_direction {IN} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_RID} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_RRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_TARGET_FIC_1_AXI4_S_ARADDR} -port_direction {IN} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_TARGET_FIC_1_AXI4_S_ARBURST} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_TARGET_FIC_1_AXI4_S_ARCACHE} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_TARGET_FIC_1_AXI4_S_ARID} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_TARGET_FIC_1_AXI4_S_ARLEN} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_TARGET_FIC_1_AXI4_S_ARPROT} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_TARGET_FIC_1_AXI4_S_ARQOS} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_TARGET_FIC_1_AXI4_S_ARSIZE} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_TARGET_FIC_1_AXI4_S_AWADDR} -port_direction {IN} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_TARGET_FIC_1_AXI4_S_AWBURST} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_TARGET_FIC_1_AXI4_S_AWCACHE} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_TARGET_FIC_1_AXI4_S_AWID} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_TARGET_FIC_1_AXI4_S_AWLEN} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_TARGET_FIC_1_AXI4_S_AWPROT} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_TARGET_FIC_1_AXI4_S_AWQOS} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_TARGET_FIC_1_AXI4_S_AWSIZE} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_TARGET_FIC_1_AXI4_S_WDATA} -port_direction {IN} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_TARGET_FIC_1_AXI4_S_WSTRB} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_2_AXI4_TARGET_FIC_2_AXI4_S_ARADDR} -port_direction {IN} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_2_AXI4_TARGET_FIC_2_AXI4_S_ARBURST} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_2_AXI4_TARGET_FIC_2_AXI4_S_ARCACHE} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_2_AXI4_TARGET_FIC_2_AXI4_S_ARID} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_2_AXI4_TARGET_FIC_2_AXI4_S_ARLEN} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_2_AXI4_TARGET_FIC_2_AXI4_S_ARPROT} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_2_AXI4_TARGET_FIC_2_AXI4_S_ARQOS} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_2_AXI4_TARGET_FIC_2_AXI4_S_ARSIZE} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_2_AXI4_TARGET_FIC_2_AXI4_S_AWADDR} -port_direction {IN} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_2_AXI4_TARGET_FIC_2_AXI4_S_AWBURST} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_2_AXI4_TARGET_FIC_2_AXI4_S_AWCACHE} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_2_AXI4_TARGET_FIC_2_AXI4_S_AWID} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_2_AXI4_TARGET_FIC_2_AXI4_S_AWLEN} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_2_AXI4_TARGET_FIC_2_AXI4_S_AWPROT} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_2_AXI4_TARGET_FIC_2_AXI4_S_AWQOS} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_2_AXI4_TARGET_FIC_2_AXI4_S_AWSIZE} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_2_AXI4_TARGET_FIC_2_AXI4_S_WDATA} -port_direction {IN} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_2_AXI4_TARGET_FIC_2_AXI4_S_WSTRB} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_3_APB_INITIATOR_FIC_3_APB_M_PRDATA} -port_direction {IN} -port_range {[31:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {CA} -port_direction {OUT} -port_range {[5:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DM} -port_direction {OUT} -port_range {[3:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_ARADDR} -port_direction {OUT} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_ARBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_ARCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_ARID} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_ARLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_ARPROT} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_ARQOS} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_ARSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_AWADDR} -port_direction {OUT} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_AWBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_AWCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_AWID} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_AWLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_AWPROT} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_AWQOS} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_AWSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_WDATA} -port_direction {OUT} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_WSTRB} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_TARGET_FIC_0_AXI4_S_BID} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_TARGET_FIC_0_AXI4_S_BRESP} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_TARGET_FIC_0_AXI4_S_RDATA} -port_direction {OUT} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_TARGET_FIC_0_AXI4_S_RID} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_TARGET_FIC_0_AXI4_S_RRESP} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_ARADDR} -port_direction {OUT} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_ARBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_ARCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_ARID} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_ARLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_ARPROT} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_ARQOS} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_ARSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_AWADDR} -port_direction {OUT} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_AWBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_AWCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_AWID} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_AWLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_AWPROT} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_AWQOS} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_AWSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_WDATA} -port_direction {OUT} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_WSTRB} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_TARGET_FIC_1_AXI4_S_BID} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_TARGET_FIC_1_AXI4_S_BRESP} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_TARGET_FIC_1_AXI4_S_RDATA} -port_direction {OUT} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_TARGET_FIC_1_AXI4_S_RID} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_TARGET_FIC_1_AXI4_S_RRESP} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_2_AXI4_TARGET_FIC_2_AXI4_S_BID} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_2_AXI4_TARGET_FIC_2_AXI4_S_BRESP} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_2_AXI4_TARGET_FIC_2_AXI4_S_RDATA} -port_direction {OUT} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_2_AXI4_TARGET_FIC_2_AXI4_S_RID} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_2_AXI4_TARGET_FIC_2_AXI4_S_RRESP} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_3_APB_INITIATOR_FIC_3_APB_M_PADDR} -port_direction {OUT} -port_range {[28:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_3_APB_INITIATOR_FIC_3_APB_M_PWDATA} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_3_APB_M_PSTRB} -port_direction {OUT} -port_range {[3:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {DQS_N} -port_direction {INOUT} -port_range {[3:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQS} -port_direction {INOUT} -port_range {[3:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQ} -port_direction {INOUT} -port_range {[31:0]} -port_is_pad {1}

# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_INITIATOR} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {master} -port_bif_mapping {\
"AWID:FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_AWID" \
"AWADDR:FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_AWADDR" \
"AWLEN:FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_AWLEN" \
"AWSIZE:FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_AWSIZE" \
"AWBURST:FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_AWBURST" \
"AWLOCK:FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_AWLOCK" \
"AWCACHE:FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_AWCACHE" \
"AWPROT:FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_AWPROT" \
"AWQOS:FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_AWQOS" \
"AWVALID:FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_AWVALID" \
"AWREADY:FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_AWREADY" \
"WDATA:FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_WDATA" \
"WSTRB:FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_WSTRB" \
"WLAST:FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_WLAST" \
"WVALID:FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_WVALID" \
"WREADY:FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_WREADY" \
"BID:FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_BID" \
"BRESP:FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_BRESP" \
"BVALID:FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_BVALID" \
"BREADY:FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_BREADY" \
"ARID:FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_ARID" \
"ARADDR:FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_ARADDR" \
"ARLEN:FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_ARLEN" \
"ARSIZE:FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_ARSIZE" \
"ARBURST:FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_ARBURST" \
"ARLOCK:FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_ARLOCK" \
"ARCACHE:FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_ARCACHE" \
"ARPROT:FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_ARPROT" \
"ARQOS:FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_ARQOS" \
"ARVALID:FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_ARVALID" \
"ARREADY:FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_ARREADY" \
"RID:FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_RID" \
"RDATA:FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_RDATA" \
"RRESP:FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_RRESP" \
"RLAST:FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_RLAST" \
"RVALID:FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_RVALID" \
"RREADY:FIC_0_AXI4_INITIATOR_FIC_0_AXI4_M_RREADY" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_INITIATOR} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {master} -port_bif_mapping {\
"AWID:FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_AWID" \
"AWADDR:FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_AWADDR" \
"AWLEN:FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_AWLEN" \
"AWSIZE:FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_AWSIZE" \
"AWBURST:FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_AWBURST" \
"AWLOCK:FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_AWLOCK" \
"AWCACHE:FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_AWCACHE" \
"AWPROT:FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_AWPROT" \
"AWQOS:FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_AWQOS" \
"AWVALID:FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_AWVALID" \
"AWREADY:FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_AWREADY" \
"WDATA:FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_WDATA" \
"WSTRB:FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_WSTRB" \
"WLAST:FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_WLAST" \
"WVALID:FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_WVALID" \
"WREADY:FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_WREADY" \
"BID:FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_BID" \
"BRESP:FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_BRESP" \
"BVALID:FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_BVALID" \
"BREADY:FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_BREADY" \
"ARID:FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_ARID" \
"ARADDR:FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_ARADDR" \
"ARLEN:FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_ARLEN" \
"ARSIZE:FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_ARSIZE" \
"ARBURST:FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_ARBURST" \
"ARLOCK:FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_ARLOCK" \
"ARCACHE:FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_ARCACHE" \
"ARPROT:FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_ARPROT" \
"ARQOS:FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_ARQOS" \
"ARVALID:FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_ARVALID" \
"ARREADY:FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_ARREADY" \
"RID:FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_RID" \
"RDATA:FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_RDATA" \
"RRESP:FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_RRESP" \
"RLAST:FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_RLAST" \
"RVALID:FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_RVALID" \
"RREADY:FIC_1_AXI4_INITIATOR_FIC_1_AXI4_M_RREADY" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {FIC_3_APB_INITIATOR} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {master} -port_bif_mapping {\
"PADDR:FIC_3_APB_INITIATOR_FIC_3_APB_M_PADDR" \
"PSELx:FIC_3_APB_INITIATOR_FIC_3_APB_M_PSEL" \
"PENABLE:FIC_3_APB_INITIATOR_FIC_3_APB_M_PENABLE" \
"PWRITE:FIC_3_APB_INITIATOR_FIC_3_APB_M_PWRITE" \
"PRDATA:FIC_3_APB_INITIATOR_FIC_3_APB_M_PRDATA" \
"PWDATA:FIC_3_APB_INITIATOR_FIC_3_APB_M_PWDATA" \
"PREADY:FIC_3_APB_INITIATOR_FIC_3_APB_M_PREADY" \
"PSLVERR:FIC_3_APB_INITIATOR_FIC_3_APB_M_PSLVERR" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {FIC_0_AXI4_TARGET} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {slave} -port_bif_mapping {\
"AWID:FIC_0_AXI4_TARGET_FIC_0_AXI4_S_AWID" \
"AWADDR:FIC_0_AXI4_TARGET_FIC_0_AXI4_S_AWADDR" \
"AWLEN:FIC_0_AXI4_TARGET_FIC_0_AXI4_S_AWLEN" \
"AWSIZE:FIC_0_AXI4_TARGET_FIC_0_AXI4_S_AWSIZE" \
"AWBURST:FIC_0_AXI4_TARGET_FIC_0_AXI4_S_AWBURST" \
"AWLOCK:FIC_0_AXI4_TARGET_FIC_0_AXI4_S_AWLOCK" \
"AWCACHE:FIC_0_AXI4_TARGET_FIC_0_AXI4_S_AWCACHE" \
"AWPROT:FIC_0_AXI4_TARGET_FIC_0_AXI4_S_AWPROT" \
"AWQOS:FIC_0_AXI4_TARGET_FIC_0_AXI4_S_AWQOS" \
"AWVALID:FIC_0_AXI4_TARGET_FIC_0_AXI4_S_AWVALID" \
"AWREADY:FIC_0_AXI4_TARGET_FIC_0_AXI4_S_AWREADY" \
"WDATA:FIC_0_AXI4_TARGET_FIC_0_AXI4_S_WDATA" \
"WSTRB:FIC_0_AXI4_TARGET_FIC_0_AXI4_S_WSTRB" \
"WLAST:FIC_0_AXI4_TARGET_FIC_0_AXI4_S_WLAST" \
"WVALID:FIC_0_AXI4_TARGET_FIC_0_AXI4_S_WVALID" \
"WREADY:FIC_0_AXI4_TARGET_FIC_0_AXI4_S_WREADY" \
"BID:FIC_0_AXI4_TARGET_FIC_0_AXI4_S_BID" \
"BRESP:FIC_0_AXI4_TARGET_FIC_0_AXI4_S_BRESP" \
"BVALID:FIC_0_AXI4_TARGET_FIC_0_AXI4_S_BVALID" \
"BREADY:FIC_0_AXI4_TARGET_FIC_0_AXI4_S_BREADY" \
"ARID:FIC_0_AXI4_TARGET_FIC_0_AXI4_S_ARID" \
"ARADDR:FIC_0_AXI4_TARGET_FIC_0_AXI4_S_ARADDR" \
"ARLEN:FIC_0_AXI4_TARGET_FIC_0_AXI4_S_ARLEN" \
"ARSIZE:FIC_0_AXI4_TARGET_FIC_0_AXI4_S_ARSIZE" \
"ARBURST:FIC_0_AXI4_TARGET_FIC_0_AXI4_S_ARBURST" \
"ARLOCK:FIC_0_AXI4_TARGET_FIC_0_AXI4_S_ARLOCK" \
"ARCACHE:FIC_0_AXI4_TARGET_FIC_0_AXI4_S_ARCACHE" \
"ARPROT:FIC_0_AXI4_TARGET_FIC_0_AXI4_S_ARPROT" \
"ARQOS:FIC_0_AXI4_TARGET_FIC_0_AXI4_S_ARQOS" \
"ARVALID:FIC_0_AXI4_TARGET_FIC_0_AXI4_S_ARVALID" \
"ARREADY:FIC_0_AXI4_TARGET_FIC_0_AXI4_S_ARREADY" \
"RID:FIC_0_AXI4_TARGET_FIC_0_AXI4_S_RID" \
"RDATA:FIC_0_AXI4_TARGET_FIC_0_AXI4_S_RDATA" \
"RRESP:FIC_0_AXI4_TARGET_FIC_0_AXI4_S_RRESP" \
"RLAST:FIC_0_AXI4_TARGET_FIC_0_AXI4_S_RLAST" \
"RVALID:FIC_0_AXI4_TARGET_FIC_0_AXI4_S_RVALID" \
"RREADY:FIC_0_AXI4_TARGET_FIC_0_AXI4_S_RREADY" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {FIC_1_AXI4_TARGET} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {slave} -port_bif_mapping {\
"AWID:FIC_1_AXI4_TARGET_FIC_1_AXI4_S_AWID" \
"AWADDR:FIC_1_AXI4_TARGET_FIC_1_AXI4_S_AWADDR" \
"AWLEN:FIC_1_AXI4_TARGET_FIC_1_AXI4_S_AWLEN" \
"AWSIZE:FIC_1_AXI4_TARGET_FIC_1_AXI4_S_AWSIZE" \
"AWBURST:FIC_1_AXI4_TARGET_FIC_1_AXI4_S_AWBURST" \
"AWLOCK:FIC_1_AXI4_TARGET_FIC_1_AXI4_S_AWLOCK" \
"AWCACHE:FIC_1_AXI4_TARGET_FIC_1_AXI4_S_AWCACHE" \
"AWPROT:FIC_1_AXI4_TARGET_FIC_1_AXI4_S_AWPROT" \
"AWQOS:FIC_1_AXI4_TARGET_FIC_1_AXI4_S_AWQOS" \
"AWVALID:FIC_1_AXI4_TARGET_FIC_1_AXI4_S_AWVALID" \
"AWREADY:FIC_1_AXI4_TARGET_FIC_1_AXI4_S_AWREADY" \
"WDATA:FIC_1_AXI4_TARGET_FIC_1_AXI4_S_WDATA" \
"WSTRB:FIC_1_AXI4_TARGET_FIC_1_AXI4_S_WSTRB" \
"WLAST:FIC_1_AXI4_TARGET_FIC_1_AXI4_S_WLAST" \
"WVALID:FIC_1_AXI4_TARGET_FIC_1_AXI4_S_WVALID" \
"WREADY:FIC_1_AXI4_TARGET_FIC_1_AXI4_S_WREADY" \
"BID:FIC_1_AXI4_TARGET_FIC_1_AXI4_S_BID" \
"BRESP:FIC_1_AXI4_TARGET_FIC_1_AXI4_S_BRESP" \
"BVALID:FIC_1_AXI4_TARGET_FIC_1_AXI4_S_BVALID" \
"BREADY:FIC_1_AXI4_TARGET_FIC_1_AXI4_S_BREADY" \
"ARID:FIC_1_AXI4_TARGET_FIC_1_AXI4_S_ARID" \
"ARADDR:FIC_1_AXI4_TARGET_FIC_1_AXI4_S_ARADDR" \
"ARLEN:FIC_1_AXI4_TARGET_FIC_1_AXI4_S_ARLEN" \
"ARSIZE:FIC_1_AXI4_TARGET_FIC_1_AXI4_S_ARSIZE" \
"ARBURST:FIC_1_AXI4_TARGET_FIC_1_AXI4_S_ARBURST" \
"ARLOCK:FIC_1_AXI4_TARGET_FIC_1_AXI4_S_ARLOCK" \
"ARCACHE:FIC_1_AXI4_TARGET_FIC_1_AXI4_S_ARCACHE" \
"ARPROT:FIC_1_AXI4_TARGET_FIC_1_AXI4_S_ARPROT" \
"ARQOS:FIC_1_AXI4_TARGET_FIC_1_AXI4_S_ARQOS" \
"ARVALID:FIC_1_AXI4_TARGET_FIC_1_AXI4_S_ARVALID" \
"ARREADY:FIC_1_AXI4_TARGET_FIC_1_AXI4_S_ARREADY" \
"RID:FIC_1_AXI4_TARGET_FIC_1_AXI4_S_RID" \
"RDATA:FIC_1_AXI4_TARGET_FIC_1_AXI4_S_RDATA" \
"RRESP:FIC_1_AXI4_TARGET_FIC_1_AXI4_S_RRESP" \
"RLAST:FIC_1_AXI4_TARGET_FIC_1_AXI4_S_RLAST" \
"RVALID:FIC_1_AXI4_TARGET_FIC_1_AXI4_S_RVALID" \
"RREADY:FIC_1_AXI4_TARGET_FIC_1_AXI4_S_RREADY" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {FIC_2_AXI4_TARGET} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {slave} -port_bif_mapping {\
"AWID:FIC_2_AXI4_TARGET_FIC_2_AXI4_S_AWID" \
"AWADDR:FIC_2_AXI4_TARGET_FIC_2_AXI4_S_AWADDR" \
"AWLEN:FIC_2_AXI4_TARGET_FIC_2_AXI4_S_AWLEN" \
"AWSIZE:FIC_2_AXI4_TARGET_FIC_2_AXI4_S_AWSIZE" \
"AWBURST:FIC_2_AXI4_TARGET_FIC_2_AXI4_S_AWBURST" \
"AWLOCK:FIC_2_AXI4_TARGET_FIC_2_AXI4_S_AWLOCK" \
"AWCACHE:FIC_2_AXI4_TARGET_FIC_2_AXI4_S_AWCACHE" \
"AWPROT:FIC_2_AXI4_TARGET_FIC_2_AXI4_S_AWPROT" \
"AWQOS:FIC_2_AXI4_TARGET_FIC_2_AXI4_S_AWQOS" \
"AWVALID:FIC_2_AXI4_TARGET_FIC_2_AXI4_S_AWVALID" \
"AWREADY:FIC_2_AXI4_TARGET_FIC_2_AXI4_S_AWREADY" \
"WDATA:FIC_2_AXI4_TARGET_FIC_2_AXI4_S_WDATA" \
"WSTRB:FIC_2_AXI4_TARGET_FIC_2_AXI4_S_WSTRB" \
"WLAST:FIC_2_AXI4_TARGET_FIC_2_AXI4_S_WLAST" \
"WVALID:FIC_2_AXI4_TARGET_FIC_2_AXI4_S_WVALID" \
"WREADY:FIC_2_AXI4_TARGET_FIC_2_AXI4_S_WREADY" \
"BID:FIC_2_AXI4_TARGET_FIC_2_AXI4_S_BID" \
"BRESP:FIC_2_AXI4_TARGET_FIC_2_AXI4_S_BRESP" \
"BVALID:FIC_2_AXI4_TARGET_FIC_2_AXI4_S_BVALID" \
"BREADY:FIC_2_AXI4_TARGET_FIC_2_AXI4_S_BREADY" \
"ARID:FIC_2_AXI4_TARGET_FIC_2_AXI4_S_ARID" \
"ARADDR:FIC_2_AXI4_TARGET_FIC_2_AXI4_S_ARADDR" \
"ARLEN:FIC_2_AXI4_TARGET_FIC_2_AXI4_S_ARLEN" \
"ARSIZE:FIC_2_AXI4_TARGET_FIC_2_AXI4_S_ARSIZE" \
"ARBURST:FIC_2_AXI4_TARGET_FIC_2_AXI4_S_ARBURST" \
"ARLOCK:FIC_2_AXI4_TARGET_FIC_2_AXI4_S_ARLOCK" \
"ARCACHE:FIC_2_AXI4_TARGET_FIC_2_AXI4_S_ARCACHE" \
"ARPROT:FIC_2_AXI4_TARGET_FIC_2_AXI4_S_ARPROT" \
"ARQOS:FIC_2_AXI4_TARGET_FIC_2_AXI4_S_ARQOS" \
"ARVALID:FIC_2_AXI4_TARGET_FIC_2_AXI4_S_ARVALID" \
"ARREADY:FIC_2_AXI4_TARGET_FIC_2_AXI4_S_ARREADY" \
"RID:FIC_2_AXI4_TARGET_FIC_2_AXI4_S_RID" \
"RDATA:FIC_2_AXI4_TARGET_FIC_2_AXI4_S_RDATA" \
"RRESP:FIC_2_AXI4_TARGET_FIC_2_AXI4_S_RRESP" \
"RLAST:FIC_2_AXI4_TARGET_FIC_2_AXI4_S_RLAST" \
"RVALID:FIC_2_AXI4_TARGET_FIC_2_AXI4_S_RVALID" \
"RREADY:FIC_2_AXI4_TARGET_FIC_2_AXI4_S_RREADY" } 

# Add AND4_MSS_DLL_LOCKS instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND4} -instance_name {AND4_MSS_DLL_LOCKS}



# Add GPIO_2_2_IO instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {GPIO_2_2_IO}



# Add GPIO_2_3_IO instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {GPIO_2_3_IO}



# Add GPIO_2_4_IO instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {GPIO_2_4_IO}



# Add GPIO_2_5_IO instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {GPIO_2_5_IO}



# Add GPIO_2_7_IO instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {GPIO_2_7_IO}



# Add GPIO_2_8_IO instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {GPIO_2_8_IO}



# Add GPIO_2_9_IO instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {GPIO_2_9_IO}



# Add GPIO_2_10_IO instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {GPIO_2_10_IO}



# Add GPIO_2_11_IO instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {GPIO_2_11_IO}



# Add GPIO_2_12_IO instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {GPIO_2_12_IO}



# Add GPIO_2_13_IO instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {GPIO_2_13_IO}



# Add GPIO_2_14_IO instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {GPIO_2_14_IO}



# Add GPIO_2_15_IO instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {GPIO_2_15_IO}



# Add I2C0_SCL_BIBUF instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {I2C0_SCL_BIBUF}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {I2C0_SCL_BIBUF:D} -value {GND}



# Add I2C0_SDA_BIBUF instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {I2C0_SDA_BIBUF}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {I2C0_SDA_BIBUF:D} -value {GND}



# Add ICICLE_MSS instance
sd_instantiate_component -sd_name ${sd_name} -component_name {ICICLE_MSS} -instance_name {ICICLE_MSS}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {ICICLE_MSS:QSPI_DATA_F2M} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {ICICLE_MSS:QSPI_DATA_F2M} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {ICICLE_MSS:QSPI_DATA_F2M} -pin_slices {[2:2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {ICICLE_MSS:QSPI_DATA_F2M} -pin_slices {[3:3]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {ICICLE_MSS:MSS_INT_F2M} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {ICICLE_MSS:MSS_INT_F2M} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {ICICLE_MSS:MSS_INT_F2M} -pin_slices {[2:2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {ICICLE_MSS:MSS_INT_F2M} -pin_slices {[3:3]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {ICICLE_MSS:MSS_INT_F2M} -pin_slices {[4:4]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {ICICLE_MSS:MSS_INT_F2M} -pin_slices {[5:5]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {ICICLE_MSS:MSS_INT_F2M} -pin_slices {[58:6]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {ICICLE_MSS:MSS_INT_F2M[58:6]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {ICICLE_MSS:MSS_INT_F2M} -pin_slices {[59:59]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {ICICLE_MSS:MSS_INT_F2M} -pin_slices {[60:60]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {ICICLE_MSS:MSS_INT_F2M} -pin_slices {[61:61]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {ICICLE_MSS:MSS_INT_F2M} -pin_slices {[62:62]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {ICICLE_MSS:MSS_INT_F2M} -pin_slices {[63:63]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {ICICLE_MSS:QSPI_DATA_M2F} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {ICICLE_MSS:QSPI_DATA_M2F} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {ICICLE_MSS:QSPI_DATA_M2F} -pin_slices {[2:2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {ICICLE_MSS:QSPI_DATA_M2F} -pin_slices {[3:3]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {ICICLE_MSS:QSPI_DATA_OE_M2F} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {ICICLE_MSS:QSPI_DATA_OE_M2F} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {ICICLE_MSS:QSPI_DATA_OE_M2F} -pin_slices {[2:2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {ICICLE_MSS:QSPI_DATA_OE_M2F} -pin_slices {[3:3]}
#sd_create_pin_group -sd_name ${sd_name} -group_name {CAN_0} -instance_name {ICICLE_MSS} -pin_names {"CAN_0_TX_EBL_M2F" "CAN_0_TXBUS_M2F" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {CAN_0_IN} -instance_name {ICICLE_MSS} -pin_names {"CAN_0_RXBUS_F2M" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {CAN_1} -instance_name {ICICLE_MSS} -pin_names {"CAN_1_TXBUS" "CAN_1_TX_EBL_N" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {CAN_1_IN} -instance_name {ICICLE_MSS} -pin_names {"CAN_1_RXBUS" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {CLOCK} -instance_name {ICICLE_MSS} -pin_names {"PLL_CPU_LOCK_M2F" "PLL_DDR_LOCK_M2F" "PLL_SGMII_LOCK_M2F" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {CLOCK_IN} -instance_name {ICICLE_MSS} -pin_names {"REFCLK" "REFCLK_N" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {DDR} -instance_name {ICICLE_MSS} -pin_names {"DQ" "DQS" "DQS_N" "DM" "RESET_N" "ODT" "CKE" "CS" "CK" "CK_N" "CA" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {FIC_0} -instance_name {ICICLE_MSS} -pin_names {"FIC_0_DLL_LOCK_M2F" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {FIC_0_IN} -instance_name {ICICLE_MSS} -pin_names {"FIC_0_ACLK" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {FIC_1} -instance_name {ICICLE_MSS} -pin_names {"FIC_1_DLL_LOCK_M2F" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {FIC_1_IN} -instance_name {ICICLE_MSS} -pin_names {"FIC_1_ACLK" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {FIC_2} -instance_name {ICICLE_MSS} -pin_names {"FIC_2_DLL_LOCK_M2F" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {FIC_2_IN} -instance_name {ICICLE_MSS} -pin_names {"FIC_2_ACLK" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {FIC_3} -instance_name {ICICLE_MSS} -pin_names {"FIC_3_DLL_LOCK_M2F" "FIC_3_APB_M_PSTRB" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {FIC_3_IN} -instance_name {ICICLE_MSS} -pin_names {"FIC_3_PCLK" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {GPIO_2} -instance_name {ICICLE_MSS} -pin_names {"GPIO_2_M2F_28" "GPIO_2_M2F_27" "GPIO_2_M2F_26" "GPIO_2_M2F_19" "GPIO_2_M2F_18" "GPIO_2_M2F_17" "GPIO_2_M2F_16" "GPIO_2_M2F_15" "GPIO_2_M2F_14" "GPIO_2_M2F_13" "GPIO_2_M2F_12" "GPIO_2_M2F_11" "GPIO_2_M2F_10" "GPIO_2_M2F_9" "GPIO_2_M2F_8" "GPIO_2_M2F_7" "GPIO_2_M2F_6" "GPIO_2_M2F_5" "GPIO_2_M2F_4" "GPIO_2_M2F_3" "GPIO_2_M2F_2" "GPIO_2_M2F_1" "GPIO_2_M2F_0" "GPIO_2_OE_M2F_15" "GPIO_2_OE_M2F_14" "GPIO_2_OE_M2F_13" "GPIO_2_OE_M2F_12" "GPIO_2_OE_M2F_11" "GPIO_2_OE_M2F_10" "GPIO_2_OE_M2F_9" "GPIO_2_OE_M2F_8" "GPIO_2_OE_M2F_7" "GPIO_2_OE_M2F_6" "GPIO_2_OE_M2F_5" "GPIO_2_OE_M2F_4" "GPIO_2_OE_M2F_3" "GPIO_2_OE_M2F_2" "GPIO_2_OE_M2F_1" "GPIO_2_OE_M2F_0" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {GPIO_2_IN} -instance_name {ICICLE_MSS} -pin_names {"GPIO_2_F2M_31" "GPIO_2_F2M_30" "GPIO_2_F2M_15" "GPIO_2_F2M_14" "GPIO_2_F2M_13" "GPIO_2_F2M_12" "GPIO_2_F2M_11" "GPIO_2_F2M_10" "GPIO_2_F2M_9" "GPIO_2_F2M_8" "GPIO_2_F2M_7" "GPIO_2_F2M_6" "GPIO_2_F2M_5" "GPIO_2_F2M_4" "GPIO_2_F2M_3" "GPIO_2_F2M_2" "GPIO_2_F2M_1" "GPIO_2_F2M_0" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {I2C_0} -instance_name {ICICLE_MSS} -pin_names {"I2C_0_SCL_OE_M2F" "I2C_0_SDA_OE_M2F" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {I2C_0_IN} -instance_name {ICICLE_MSS} -pin_names {"I2C_0_SCL_F2M" "I2C_0_SDA_F2M" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {I2C_1} -instance_name {ICICLE_MSS} -pin_names {"I2C_1_SCL" "I2C_1_SDA" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {INTERRUPT} -instance_name {ICICLE_MSS} -pin_names {"MSS_INT_M2F" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {INTERRUPT_IN} -instance_name {ICICLE_MSS} -pin_names {"MSS_INT_F2M" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {MAC_0} -instance_name {ICICLE_MSS} -pin_names {"MAC_0_TSU_SOF_TX_M2F" "MAC_0_TSU_SYNC_FRAME_TX_M2F" "MAC_0_TSU_DELAY_REQ_TX_M2F" "MAC_0_TSU_PDELAY_REQ_TX_M2F" "MAC_0_TSU_PDELAY_RESP_TX_M2F" "MAC_0_TSU_SOF_RX_M2F" "MAC_0_TSU_SYNC_FRAME_RX_M2F" "MAC_0_TSU_DELAY_REQ_RX_M2F" "MAC_0_TSU_PDELAY_REQ_RX_M2F" "MAC_0_TSU_PDELAY_RESP_RX_M2F" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {MAC_1} -instance_name {ICICLE_MSS} -pin_names {"MAC_1_TSU_SOF_TX_M2F" "MAC_1_TSU_SYNC_FRAME_TX_M2F" "MAC_1_TSU_DELAY_REQ_TX_M2F" "MAC_1_TSU_PDELAY_REQ_TX_M2F" "MAC_1_TSU_PDELAY_RESP_TX_M2F" "MAC_1_TSU_SOF_RX_M2F" "MAC_1_TSU_SYNC_FRAME_RX_M2F" "MAC_1_TSU_DELAY_REQ_RX_M2F" "MAC_1_TSU_PDELAY_REQ_RX_M2F" "MAC_1_TSU_PDELAY_RESP_RX_M2F" "MAC_1_MDIO" "MAC_1_MDC" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {MMUART_0} -instance_name {ICICLE_MSS} -pin_names {"MMUART_0_TXD_M2F" "MMUART_0_TXD_OE_M2F" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {MMUART_0_IN} -instance_name {ICICLE_MSS} -pin_names {"MMUART_0_RXD_F2M" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {MMUART_1} -instance_name {ICICLE_MSS} -pin_names {"MMUART_1_TXD_M2F" "MMUART_1_TXD_OE_M2F" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {MMUART_1_IN} -instance_name {ICICLE_MSS} -pin_names {"MMUART_1_RXD_F2M" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {MMUART_2} -instance_name {ICICLE_MSS} -pin_names {"MMUART_2_TXD_M2F" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {MMUART_2_IN} -instance_name {ICICLE_MSS} -pin_names {"MMUART_2_RXD_F2M" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {MMUART_3} -instance_name {ICICLE_MSS} -pin_names {"MMUART_3_TXD_M2F" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {MMUART_3_IN} -instance_name {ICICLE_MSS} -pin_names {"MMUART_3_RXD_F2M" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {MMUART_4} -instance_name {ICICLE_MSS} -pin_names {"MMUART_4_TXD_M2F" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {MMUART_4_IN} -instance_name {ICICLE_MSS} -pin_names {"MMUART_4_RXD_F2M" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {QSPI} -instance_name {ICICLE_MSS} -pin_names {"QSPI_SEL_M2F" "QSPI_SEL_OE_M2F" "QSPI_CLK_M2F" "QSPI_CLK_OE_M2F" "QSPI_DATA_M2F" "QSPI_DATA_OE_M2F" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {QSPI_IN} -instance_name {ICICLE_MSS} -pin_names {"QSPI_DATA_F2M" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {RESET} -instance_name {ICICLE_MSS} -pin_names {"MSS_RESET_N_M2F" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {RESET_IN} -instance_name {ICICLE_MSS} -pin_names {"MSS_RESET_N_F2M" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {SD_EMMC} -instance_name {ICICLE_MSS} -pin_names {"SD_CLK_EMMC_CLK" "SD_CMD_EMMC_CMD" "SD_DATA0_EMMC_DATA0" "SD_DATA1_EMMC_DATA1" "SD_DATA2_EMMC_DATA2" "SD_DATA3_EMMC_DATA3" "SD_POW_EMMC_DATA4" "SD_VOLT_SEL_EMMC_DATA5" "SD_VOLT_EN_EMMC_DATA6" "SD_VOLT_CMD_DIR_EMMC_DATA7" "SD_VOLT_DIR_0_EMMC_UNUSED" "SD_VOLT_DIR_1_3_EMMC_UNUSED" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {SD_EMMC_IN} -instance_name {ICICLE_MSS} -pin_names {"SD_CD_EMMC_STRB" "SD_WP_EMMC_RSTN" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {SGMII} -instance_name {ICICLE_MSS} -pin_names {"SGMII_TX1_P" "SGMII_TX1_N" "SGMII_TX0_P" "SGMII_TX0_N" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {SGMII_IN} -instance_name {ICICLE_MSS} -pin_names {"SGMII_RX1_P" "SGMII_RX1_N" "SGMII_RX0_P" "SGMII_RX0_N" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {SPI_0} -instance_name {ICICLE_MSS} -pin_names {"SPI_0_SS1_M2F" "SPI_0_SS1_OE_M2F" "SPI_0_DO_M2F" "SPI_0_DO_OE_M2F" "SPI_0_CLK_M2F" "SPI_0_CLK_OE_M2F" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {SPI_0_IN} -instance_name {ICICLE_MSS} -pin_names {"SPI_0_SS_F2M" "SPI_0_DI_F2M" "SPI_0_CLK_F2M" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {SPI_1} -instance_name {ICICLE_MSS} -pin_names {"SPI_1_DO" "SPI_1_SS0" "SPI_1_CLK" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {SPI_1_IN} -instance_name {ICICLE_MSS} -pin_names {"SPI_1_DI" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {USB} -instance_name {ICICLE_MSS} -pin_names {"USB_STP" "USB_DATA0" "USB_DATA1" "USB_DATA2" "USB_DATA3" "USB_DATA4" "USB_DATA5" "USB_DATA6" "USB_DATA7" }
#sd_create_pin_group -sd_name ${sd_name} -group_name {USB_IN} -instance_name {ICICLE_MSS} -pin_names {"USB_CLK" "USB_DIR" "USB_NXT" }
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {ICICLE_MSS:SPI_0_SS_F2M} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {ICICLE_MSS:SPI_0_DI_F2M} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {ICICLE_MSS:SPI_0_CLK_F2M} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {ICICLE_MSS:GPIO_2_F2M_6} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {ICICLE_MSS:GPIO_2_F2M_1} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {ICICLE_MSS:GPIO_2_F2M_0} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ICICLE_MSS:MMUART_0_TXD_OE_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ICICLE_MSS:MMUART_1_TXD_OE_M2F}
sd_invert_pins -sd_name ${sd_name} -pin_names {ICICLE_MSS:CAN_0_TX_EBL_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ICICLE_MSS:SPI_0_SS1_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ICICLE_MSS:SPI_0_SS1_OE_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ICICLE_MSS:SPI_0_DO_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ICICLE_MSS:SPI_0_DO_OE_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ICICLE_MSS:SPI_0_CLK_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ICICLE_MSS:SPI_0_CLK_OE_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ICICLE_MSS:GPIO_2_M2F_6}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ICICLE_MSS:GPIO_2_M2F_1}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ICICLE_MSS:GPIO_2_M2F_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ICICLE_MSS:GPIO_2_OE_M2F_6}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ICICLE_MSS:GPIO_2_OE_M2F_1}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ICICLE_MSS:GPIO_2_OE_M2F_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ICICLE_MSS:MSS_INT_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ICICLE_MSS:PLL_CPU_LOCK_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ICICLE_MSS:PLL_DDR_LOCK_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ICICLE_MSS:PLL_SGMII_LOCK_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ICICLE_MSS:MAC_0_TSU_SOF_TX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ICICLE_MSS:MAC_0_TSU_SYNC_FRAME_TX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ICICLE_MSS:MAC_0_TSU_DELAY_REQ_TX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ICICLE_MSS:MAC_0_TSU_PDELAY_REQ_TX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ICICLE_MSS:MAC_0_TSU_PDELAY_RESP_TX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ICICLE_MSS:MAC_0_TSU_SOF_RX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ICICLE_MSS:MAC_0_TSU_SYNC_FRAME_RX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ICICLE_MSS:MAC_0_TSU_DELAY_REQ_RX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ICICLE_MSS:MAC_0_TSU_PDELAY_REQ_RX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ICICLE_MSS:MAC_0_TSU_PDELAY_RESP_RX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ICICLE_MSS:MAC_1_TSU_SOF_TX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ICICLE_MSS:MAC_1_TSU_SYNC_FRAME_TX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ICICLE_MSS:MAC_1_TSU_DELAY_REQ_TX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ICICLE_MSS:MAC_1_TSU_PDELAY_REQ_TX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ICICLE_MSS:MAC_1_TSU_PDELAY_RESP_TX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ICICLE_MSS:MAC_1_TSU_SOF_RX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ICICLE_MSS:MAC_1_TSU_SYNC_FRAME_RX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ICICLE_MSS:MAC_1_TSU_DELAY_REQ_RX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ICICLE_MSS:MAC_1_TSU_PDELAY_REQ_RX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ICICLE_MSS:MAC_1_TSU_PDELAY_RESP_RX_M2F}



# Add QSPI_CLK_BIBUF instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {QSPI_CLK_BIBUF}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {QSPI_CLK_BIBUF:Y}



# Add QSPI_DATA_0_BIBUF instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {QSPI_DATA_0_BIBUF}



# Add QSPI_DATA_1_BIBUF instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {QSPI_DATA_1_BIBUF}



# Add QSPI_DATA_2_BIBUF instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {QSPI_DATA_2_BIBUF}



# Add QSPI_DATA_3_BIBUF instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {QSPI_DATA_3_BIBUF}



# Add QSPI_SEL_BIBUF instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {QSPI_SEL_BIBUF}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {QSPI_SEL_BIBUF:Y}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_MSS_DLL_LOCKS:A" "ICICLE_MSS:FIC_0_DLL_LOCK_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_MSS_DLL_LOCKS:B" "ICICLE_MSS:FIC_3_DLL_LOCK_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_MSS_DLL_LOCKS:C" "ICICLE_MSS:FIC_2_DLL_LOCK_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_MSS_DLL_LOCKS:D" "ICICLE_MSS:FIC_1_DLL_LOCK_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_MSS_DLL_LOCKS:Y" "MSS_DLL_LOCKS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAN_0_RXBUS_F2M" "ICICLE_MSS:CAN_0_RXBUS_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAN_0_TXBUS_M2F" "ICICLE_MSS:CAN_0_TXBUS_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAN_0_TX_EBL_M2F" "ICICLE_MSS:CAN_0_TX_EBL_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAN_1_RXBUS" "ICICLE_MSS:CAN_1_RXBUS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAN_1_TXBUS" "ICICLE_MSS:CAN_1_TXBUS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAN_1_TX_EBL_N" "ICICLE_MSS:CAN_1_TX_EBL_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CK" "ICICLE_MSS:CK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CKE" "ICICLE_MSS:CKE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CK_N" "ICICLE_MSS:CK_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CS" "ICICLE_MSS:CS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_0_ACLK" "ICICLE_MSS:FIC_0_ACLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_ACLK" "ICICLE_MSS:FIC_1_ACLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_2_ACLK" "ICICLE_MSS:FIC_2_ACLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_3_PCLK" "ICICLE_MSS:FIC_3_PCLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_10_IO:D" "ICICLE_MSS:GPIO_2_M2F_10" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_10_IO:E" "ICICLE_MSS:GPIO_2_OE_M2F_10" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_10_IO:PAD" "RPi_GPIO22" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_10_IO:Y" "ICICLE_MSS:GPIO_2_F2M_10" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_11_IO:D" "ICICLE_MSS:GPIO_2_M2F_11" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_11_IO:E" "ICICLE_MSS:GPIO_2_OE_M2F_11" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_11_IO:PAD" "RPi_GPIO23" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_11_IO:Y" "ICICLE_MSS:GPIO_2_F2M_11" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_12_IO:D" "ICICLE_MSS:GPIO_2_M2F_12" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_12_IO:E" "ICICLE_MSS:GPIO_2_OE_M2F_12" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_12_IO:PAD" "RPi_GPIO24" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_12_IO:Y" "ICICLE_MSS:GPIO_2_F2M_12" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_13_IO:D" "ICICLE_MSS:GPIO_2_M2F_13" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_13_IO:E" "ICICLE_MSS:GPIO_2_OE_M2F_13" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_13_IO:PAD" "RPi_GPIO25" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_13_IO:Y" "ICICLE_MSS:GPIO_2_F2M_13" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_14_IO:D" "ICICLE_MSS:GPIO_2_M2F_14" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_14_IO:E" "ICICLE_MSS:GPIO_2_OE_M2F_14" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_14_IO:PAD" "RPi_GPIO26" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_14_IO:Y" "ICICLE_MSS:GPIO_2_F2M_14" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_15_IO:D" "ICICLE_MSS:GPIO_2_M2F_15" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_15_IO:E" "ICICLE_MSS:GPIO_2_OE_M2F_15" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_15_IO:PAD" "RPi_GPIO27" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_15_IO:Y" "ICICLE_MSS:GPIO_2_F2M_15" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_2_IO:D" "ICICLE_MSS:GPIO_2_M2F_2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_2_IO:E" "ICICLE_MSS:GPIO_2_OE_M2F_2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_2_IO:PAD" "RPi_GPIO12" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_2_IO:Y" "ICICLE_MSS:GPIO_2_F2M_2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_3_IO:D" "ICICLE_MSS:GPIO_2_M2F_3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_3_IO:E" "ICICLE_MSS:GPIO_2_OE_M2F_3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_3_IO:PAD" "RPi_GPIO13" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_3_IO:Y" "ICICLE_MSS:GPIO_2_F2M_3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_4_IO:D" "ICICLE_MSS:GPIO_2_M2F_4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_4_IO:E" "ICICLE_MSS:GPIO_2_OE_M2F_4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_4_IO:PAD" "RPi_GPIO16" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_4_IO:Y" "ICICLE_MSS:GPIO_2_F2M_4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_5_IO:D" "ICICLE_MSS:GPIO_2_M2F_5" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_5_IO:E" "ICICLE_MSS:GPIO_2_OE_M2F_5" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_5_IO:PAD" "RPi_GPIO17" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_5_IO:Y" "ICICLE_MSS:GPIO_2_F2M_5" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_7_IO:D" "ICICLE_MSS:GPIO_2_M2F_7" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_7_IO:E" "ICICLE_MSS:GPIO_2_OE_M2F_7" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_7_IO:PAD" "RPi_GPIO19" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_7_IO:Y" "ICICLE_MSS:GPIO_2_F2M_7" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_8_IO:D" "ICICLE_MSS:GPIO_2_M2F_8" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_8_IO:E" "ICICLE_MSS:GPIO_2_OE_M2F_8" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_8_IO:PAD" "RPi_GPIO20" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_8_IO:Y" "ICICLE_MSS:GPIO_2_F2M_8" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_9_IO:D" "ICICLE_MSS:GPIO_2_M2F_9" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_9_IO:E" "ICICLE_MSS:GPIO_2_OE_M2F_9" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_9_IO:PAD" "RPi_GPIO21" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_9_IO:Y" "ICICLE_MSS:GPIO_2_F2M_9" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_F2M_30" "ICICLE_MSS:GPIO_2_F2M_30" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_F2M_31" "ICICLE_MSS:GPIO_2_F2M_31" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_M2F_16" "ICICLE_MSS:GPIO_2_M2F_16" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_M2F_17" "ICICLE_MSS:GPIO_2_M2F_17" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_M2F_18" "ICICLE_MSS:GPIO_2_M2F_18" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_M2F_19" "ICICLE_MSS:GPIO_2_M2F_19" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_M2F_26" "ICICLE_MSS:GPIO_2_M2F_26" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_M2F_27" "ICICLE_MSS:GPIO_2_M2F_27" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_2_M2F_28" "ICICLE_MSS:GPIO_2_M2F_28" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"I2C0_SCL_BIBUF:E" "ICICLE_MSS:I2C_0_SCL_OE_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"I2C0_SCL_BIBUF:PAD" "mBUS_I2C_SCL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"I2C0_SCL_BIBUF:Y" "ICICLE_MSS:I2C_0_SCL_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"I2C0_SDA_BIBUF:E" "ICICLE_MSS:I2C_0_SDA_OE_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"I2C0_SDA_BIBUF:PAD" "mBUS_I2C_SDA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"I2C0_SDA_BIBUF:Y" "ICICLE_MSS:I2C_0_SDA_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"I2C_1_SCL" "ICICLE_MSS:I2C_1_SCL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"I2C_1_SDA" "ICICLE_MSS:I2C_1_SDA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:MAC_1_MDC" "MAC_1_MDC" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:MAC_1_MDIO" "MAC_1_MDIO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:MMUART_0_RXD_F2M" "MMUART_0_RXD_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:MMUART_0_TXD_M2F" "MMUART_0_TXD_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:MMUART_1_RXD_F2M" "MMUART_1_RXD_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:MMUART_1_TXD_M2F" "MMUART_1_TXD_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:MMUART_2_RXD_F2M" "MMUART_2_RXD_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:MMUART_2_TXD_M2F" "MMUART_2_TXD_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:MMUART_3_RXD_F2M" "MMUART_3_RXD_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:MMUART_3_TXD_M2F" "MMUART_3_TXD_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:MMUART_4_RXD_F2M" "MMUART_4_RXD_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:MMUART_4_TXD_M2F" "MMUART_4_TXD_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:MSS_INT_F2M[0:0]" "MSS_INT_F2M_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:MSS_INT_F2M[1:1]" "MSS_INT_F2M_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:MSS_INT_F2M[2:2]" "MSS_INT_F2M_2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:MSS_INT_F2M[3:3]" "MSS_INT_F2M_3" }

sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:MSS_INT_F2M[4:4]" "MSS_INT_F2M_4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:MSS_INT_F2M[5:5]" "MSS_INT_F2M_5" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:MSS_INT_F2M[59:59]" "MSS_INT_F2M_59" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:MSS_INT_F2M[60:60]" "MSS_INT_F2M_60" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:MSS_INT_F2M[61:61]" "MSS_INT_F2M_61" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:MSS_INT_F2M[62:62]" "MSS_INT_F2M_62" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:MSS_INT_F2M[63:63]" "MSS_INT_F2M_63" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:MSS_RESET_N_F2M" "MSS_RESET_N_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:MSS_RESET_N_M2F" "MSS_RESET_N_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:ODT" "ODT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:QSPI_CLK_M2F" "QSPI_CLK_BIBUF:D" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:QSPI_CLK_OE_M2F" "QSPI_CLK_BIBUF:E" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:QSPI_DATA_F2M[0:0]" "QSPI_DATA_0_BIBUF:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:QSPI_DATA_F2M[1:1]" "QSPI_DATA_1_BIBUF:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:QSPI_DATA_F2M[2:2]" "QSPI_DATA_2_BIBUF:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:QSPI_DATA_F2M[3:3]" "QSPI_DATA_3_BIBUF:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:QSPI_DATA_M2F[0:0]" "QSPI_DATA_0_BIBUF:D" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:QSPI_DATA_M2F[1:1]" "QSPI_DATA_1_BIBUF:D" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:QSPI_DATA_M2F[2:2]" "QSPI_DATA_2_BIBUF:D" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:QSPI_DATA_M2F[3:3]" "QSPI_DATA_3_BIBUF:D" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:QSPI_DATA_OE_M2F[0:0]" "QSPI_DATA_0_BIBUF:E" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:QSPI_DATA_OE_M2F[1:1]" "QSPI_DATA_1_BIBUF:E" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:QSPI_DATA_OE_M2F[2:2]" "QSPI_DATA_2_BIBUF:E" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:QSPI_DATA_OE_M2F[3:3]" "QSPI_DATA_3_BIBUF:E" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:QSPI_SEL_M2F" "QSPI_SEL_BIBUF:D" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:QSPI_SEL_OE_M2F" "QSPI_SEL_BIBUF:E" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:REFCLK" "REFCLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:REFCLK_N" "REFCLK_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:RESET_N" "RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:SD_CD_EMMC_STRB" "SD_CD_EMMC_STRB" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:SD_CLK_EMMC_CLK" "SD_CLK_EMMC_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:SD_CMD_EMMC_CMD" "SD_CMD_EMMC_CMD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:SD_DATA0_EMMC_DATA0" "SD_DATA0_EMMC_DATA0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:SD_DATA1_EMMC_DATA1" "SD_DATA1_EMMC_DATA1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:SD_DATA2_EMMC_DATA2" "SD_DATA2_EMMC_DATA2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:SD_DATA3_EMMC_DATA3" "SD_DATA3_EMMC_DATA3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:SD_POW_EMMC_DATA4" "SD_POW_EMMC_DATA4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:SD_VOLT_CMD_DIR_EMMC_DATA7" "SD_VOLT_CMD_DIR_EMMC_DATA7" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:SD_VOLT_DIR_0_EMMC_UNUSED" "SD_VOLT_DIR_0_EMMC_UNUSED" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:SD_VOLT_DIR_1_3_EMMC_UNUSED" "SD_VOLT_DIR_1_3_EMMC_UNUSED" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:SD_VOLT_EN_EMMC_DATA6" "SD_VOLT_EN_EMMC_DATA6" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:SD_VOLT_SEL_EMMC_DATA5" "SD_VOLT_SEL_EMMC_DATA5" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:SD_WP_EMMC_RSTN" "SD_WP_EMMC_RSTN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:SGMII_RX0_N" "SGMII_RX0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:SGMII_RX0_P" "SGMII_RX0_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:SGMII_RX1_N" "SGMII_RX1_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:SGMII_RX1_P" "SGMII_RX1_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:SGMII_TX0_N" "SGMII_TX0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:SGMII_TX0_P" "SGMII_TX0_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:SGMII_TX1_N" "SGMII_TX1_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:SGMII_TX1_P" "SGMII_TX1_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:SPI_1_CLK" "SPI_1_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:SPI_1_DI" "SPI_1_DI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:SPI_1_DO" "SPI_1_DO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:SPI_1_SS0" "SPI_1_SS0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:USB_CLK" "USB_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:USB_DATA0" "USB_DATA0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:USB_DATA1" "USB_DATA1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:USB_DATA2" "USB_DATA2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:USB_DATA3" "USB_DATA3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:USB_DATA4" "USB_DATA4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:USB_DATA5" "USB_DATA5" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:USB_DATA6" "USB_DATA6" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:USB_DATA7" "USB_DATA7" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:USB_DIR" "USB_DIR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:USB_NXT" "USB_NXT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ICICLE_MSS:USB_STP" "USB_STP" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"QSPI_CLK" "QSPI_CLK_BIBUF:PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"QSPI_DATA_0" "QSPI_DATA_0_BIBUF:PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"QSPI_DATA_1" "QSPI_DATA_1_BIBUF:PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"QSPI_DATA_2" "QSPI_DATA_2_BIBUF:PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"QSPI_DATA_3" "QSPI_DATA_3_BIBUF:PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"QSPI_SEL" "QSPI_SEL_BIBUF:PAD" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CA" "ICICLE_MSS:CA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DM" "ICICLE_MSS:DM" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DQ" "ICICLE_MSS:DQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DQS" "ICICLE_MSS:DQS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DQS_N" "ICICLE_MSS:DQS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_3_APB_M_PSTRB" "ICICLE_MSS:FIC_3_APB_M_PSTRB" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_0_AXI4_INITIATOR" "ICICLE_MSS:FIC_0_AXI4_INITIATOR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_0_AXI4_TARGET" "ICICLE_MSS:FIC_0_AXI4_TARGET" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_AXI4_INITIATOR" "ICICLE_MSS:FIC_1_AXI4_INITIATOR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_AXI4_TARGET" "ICICLE_MSS:FIC_1_AXI4_TARGET" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_2_AXI4_TARGET" "ICICLE_MSS:FIC_2_AXI4_TARGET" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_3_APB_INITIATOR" "ICICLE_MSS:FIC_3_APB_INITIATOR" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign MSS_WRAPPER
generate_component -component_name ${sd_name}
