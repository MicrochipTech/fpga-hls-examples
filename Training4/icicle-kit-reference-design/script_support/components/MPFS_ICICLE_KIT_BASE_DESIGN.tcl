# Creating SmartDesign MPFS_ICICLE_KIT_BASE_DESIGN
set sd_name {MPFS_ICICLE_KIT_BASE_DESIGN}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAN_0_RXBUS_F2M} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAN_1_RXBUS} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {COREUART_RX} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_0_RXD_F2M} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_1_RXD_F2M} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_2_RXD_F2M} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_3_RXD_F2M} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD0_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD0_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD1_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD1_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD2_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD2_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD3_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD3_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REFCLK_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REFCLK} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_50MHz} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_CD_EMMC_STRB} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_WP_EMMC_RSTN} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_RX0_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_RX0_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_RX1_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_RX1_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SPI_1_DI} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SW1} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SW2} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SW3} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SW4} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_CLK} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DIR} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_NXT} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {mBUS_INT} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {mBUS_UART_RX} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {CAN_0_TXBUS_M2F} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAN_0_TX_EBL_M2F} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAN_1_TXBUS} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAN_1_TX_EBL_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CKE} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CK_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CK} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {COREUART_TX} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CS} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LED0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LED1} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LED2} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LED3} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MAC_1_MDC} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_0_TXD_M2F} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_1_TXD_M2F} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_2_TXD_M2F} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_3_TXD_M2F} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ODT} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD0_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD0_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD1_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD1_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD2_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD2_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD3_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD3_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIE_1_PERST_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESET_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SDIO_SW_EN_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SDIO_SW_SEL0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SDIO_SW_SEL1} -port_direction {OUT}
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
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_ULPI_RESET} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VSC_8662_CMODE3} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VSC_8662_CMODE4} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VSC_8662_CMODE5} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VSC_8662_CMODE6} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VSC_8662_CMODE7} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VSC_8662_OSCEN} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VSC_8662_PLLMODE} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VSC_8662_RESETN} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VSC_8662_SRESET} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {mBUS_PWM} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {mBUS_UART_TX} -port_direction {OUT}

sd_create_scalar_port -sd_name ${sd_name} -port_name {COREI2C_C0_SCL} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {COREI2C_C0_SDA} -port_direction {INOUT} -port_is_pad {1}
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
sd_create_scalar_port -sd_name ${sd_name} -port_name {RPi_ID_SC} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RPi_ID_SD} -port_direction {INOUT} -port_is_pad {1}
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
sd_create_bus_port -sd_name ${sd_name} -port_name {CA} -port_direction {OUT} -port_range {[5:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DM} -port_direction {OUT} -port_range {[3:0]} -port_is_pad {1}

sd_create_bus_port -sd_name ${sd_name} -port_name {DQS_N} -port_direction {INOUT} -port_range {[3:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQS} -port_direction {INOUT} -port_range {[3:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQ} -port_direction {INOUT} -port_range {[31:0]} -port_is_pad {1}

sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {SDIO_SW_EN_N} -value {GND}
sd_invert_pins -sd_name ${sd_name} -pin_names {USB_ULPI_RESET}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {VSC_8662_CMODE3} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {VSC_8662_CMODE4} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {VSC_8662_CMODE5} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {VSC_8662_CMODE6} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {VSC_8662_CMODE7} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {VSC_8662_OSCEN} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {VSC_8662_PLLMODE} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {VSC_8662_SRESET} -value {VCC}
# Add CLOCKS_AND_RESETS instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CLOCKS_AND_RESETS} -instance_name {CLOCKS_AND_RESETS}



# Add FIC_0_PERIPHERALS_1 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {FIC_0_PERIPHERALS} -instance_name {FIC_0_PERIPHERALS_1}



# Add FIC_1_PERIPHERALS_1 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {FIC_1_PERIPHERALS} -instance_name {FIC_1_PERIPHERALS_1}



# Add FIC_3_PERIPHERALS_1 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {FIC_3_PERIPHERALS} -instance_name {FIC_3_PERIPHERALS_1}



# Add MSS_GPIO_2_16_OR_COREGPIO_C0_GPIO_OUT_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {OR2} -instance_name {MSS_GPIO_2_16_OR_COREGPIO_C0_GPIO_OUT_0}



# Add MSS_GPIO_2_17_OR_COREGPIO_C0_GPIO_OUT_1 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {OR2} -instance_name {MSS_GPIO_2_17_OR_COREGPIO_C0_GPIO_OUT_1}



# Add MSS_GPIO_2_18_OR_COREGPIO_C0_GPIO_OUT_2 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {OR2} -instance_name {MSS_GPIO_2_18_OR_COREGPIO_C0_GPIO_OUT_2}



# Add MSS_GPIO_2_19_OR_COREGPIO_C0_GPIO_OUT_3 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {OR2} -instance_name {MSS_GPIO_2_19_OR_COREGPIO_C0_GPIO_OUT_3}



# Add MSS_WRAPPER_1 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {MSS_WRAPPER} -instance_name {MSS_WRAPPER_1}



# Add SW1_OR_GPIO_2_28 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {OR2} -instance_name {SW1_OR_GPIO_2_28}
sd_invert_pins -sd_name ${sd_name} -pin_names {SW1_OR_GPIO_2_28:A}



# Add SW2_OR_GPIO_2_26 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {OR2} -instance_name {SW2_OR_GPIO_2_26}
sd_invert_pins -sd_name ${sd_name} -pin_names {SW2_OR_GPIO_2_26:A}



# Add SW3_OR_GPIO_2_27 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {OR2} -instance_name {SW3_OR_GPIO_2_27}
sd_invert_pins -sd_name ${sd_name} -pin_names {SW3_OR_GPIO_2_27:A}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAN_0_RXBUS_F2M" "MSS_WRAPPER_1:CAN_0_RXBUS_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAN_0_TXBUS_M2F" "MSS_WRAPPER_1:CAN_0_TXBUS_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAN_0_TX_EBL_M2F" "MSS_WRAPPER_1:CAN_0_TX_EBL_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAN_1_RXBUS" "MSS_WRAPPER_1:CAN_1_RXBUS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAN_1_TXBUS" "MSS_WRAPPER_1:CAN_1_TXBUS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAN_1_TX_EBL_N" "MSS_WRAPPER_1:CAN_1_TX_EBL_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CK" "MSS_WRAPPER_1:CK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CKE" "MSS_WRAPPER_1:CKE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CK_N" "MSS_WRAPPER_1:CK_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:EXT_RST_N" "MSS_WRAPPER_1:MSS_RESET_N_M2F" "USB_ULPI_RESET" "VSC_8662_RESETN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:FIC_0_CLK" "FIC_0_PERIPHERALS_1:ACLK" "MSS_WRAPPER_1:FIC_0_ACLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:FIC_1_CLK" "FIC_1_PERIPHERALS_1:ACLK" "MSS_WRAPPER_1:FIC_1_ACLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:FIC_2_CLK" "MSS_WRAPPER_1:FIC_2_ACLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:FIC_3_CLK" "FIC_1_PERIPHERALS_1:PCLK" "FIC_3_PERIPHERALS_1:PCLK" "MSS_WRAPPER_1:FIC_3_PCLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:MSS_PLL_LOCKS" "MSS_WRAPPER_1:MSS_DLL_LOCKS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:PCIE_INIT_DONE" "FIC_1_PERIPHERALS_1:PCIe_INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:PCIe_CLK_125MHz" "FIC_1_PERIPHERALS_1:PCIe_CLK_125MHz" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:PCIe_REFERENCE_CLK" "FIC_1_PERIPHERALS_1:PCIe_REFERENCE_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:REF_CLK_50MHz" "REF_CLK_50MHz" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:REF_CLK_PAD_N" "REF_CLK_PAD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:REF_CLK_PAD_P" "REF_CLK_PAD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:RESETN_FIC_0_CLK" "FIC_0_PERIPHERALS_1:ARESETN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:RESETN_FIC_1_CLK" "FIC_1_PERIPHERALS_1:ARESETN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:RESETN_FIC_3_CLK" "FIC_1_PERIPHERALS_1:PRESETN" "FIC_3_PERIPHERALS_1:PRESETN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREI2C_C0_SCL" "FIC_3_PERIPHERALS_1:COREI2C_C0_SCL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREI2C_C0_SDA" "FIC_3_PERIPHERALS_1:COREI2C_C0_SDA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREUART_RX" "FIC_3_PERIPHERALS_1:CoreUARTapb_RX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREUART_TX" "FIC_3_PERIPHERALS_1:CoreUARTapb_TX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CS" "MSS_WRAPPER_1:CS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_0_PERIPHERALS_1:DMA_CONTROLLER_IRQ" "MSS_WRAPPER_1:MSS_INT_F2M_2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:PCIESS_LANE_RXD0_N" "PCIESS_LANE_RXD0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:PCIESS_LANE_RXD0_P" "PCIESS_LANE_RXD0_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:PCIESS_LANE_RXD1_N" "PCIESS_LANE_RXD1_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:PCIESS_LANE_RXD1_P" "PCIESS_LANE_RXD1_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:PCIESS_LANE_RXD2_N" "PCIESS_LANE_RXD2_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:PCIESS_LANE_RXD2_P" "PCIESS_LANE_RXD2_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:PCIESS_LANE_RXD3_N" "PCIESS_LANE_RXD3_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:PCIESS_LANE_RXD3_P" "PCIESS_LANE_RXD3_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:PCIESS_LANE_TXD0_N" "PCIESS_LANE_TXD0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:PCIESS_LANE_TXD0_P" "PCIESS_LANE_TXD0_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:PCIESS_LANE_TXD1_N" "PCIESS_LANE_TXD1_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:PCIESS_LANE_TXD1_P" "PCIESS_LANE_TXD1_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:PCIESS_LANE_TXD2_N" "PCIESS_LANE_TXD2_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:PCIESS_LANE_TXD2_P" "PCIESS_LANE_TXD2_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:PCIESS_LANE_TXD3_N" "PCIESS_LANE_TXD3_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:PCIESS_LANE_TXD3_P" "PCIESS_LANE_TXD3_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:PCIE_1_PERST_N" "PCIE_1_PERST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:PCIe_IRQ" "MSS_WRAPPER_1:MSS_INT_F2M_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_3_PERIPHERALS_1:CORE_I2C_C0_INT" "MSS_WRAPPER_1:MSS_INT_F2M_4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_3_PERIPHERALS_1:RPI_ID_I2C_IRQ" "MSS_WRAPPER_1:MSS_INT_F2M_5" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_3_PERIPHERALS_1:GPIO_OUT_0" "MSS_GPIO_2_16_OR_COREGPIO_C0_GPIO_OUT_0:B" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_3_PERIPHERALS_1:GPIO_OUT_1" "MSS_GPIO_2_17_OR_COREGPIO_C0_GPIO_OUT_1:B" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_3_PERIPHERALS_1:GPIO_OUT_2" "MSS_GPIO_2_18_OR_COREGPIO_C0_GPIO_OUT_2:B" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_3_PERIPHERALS_1:GPIO_OUT_3" "MSS_GPIO_2_19_OR_COREGPIO_C0_GPIO_OUT_3:B" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_3_PERIPHERALS_1:IHC_SUBSYSTEM_E51_IRQ" "MSS_WRAPPER_1:MSS_INT_F2M_63" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_3_PERIPHERALS_1:IHC_SUBSYSTEM_U54_1_IRQ" "MSS_WRAPPER_1:MSS_INT_F2M_62" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_3_PERIPHERALS_1:IHC_SUBSYSTEM_U54_2_IRQ" "MSS_WRAPPER_1:MSS_INT_F2M_61" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_3_PERIPHERALS_1:IHC_SUBSYSTEM_U54_3_IRQ" "MSS_WRAPPER_1:MSS_INT_F2M_60" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_3_PERIPHERALS_1:IHC_SUBSYSTEM_U54_4_IRQ" "MSS_WRAPPER_1:MSS_INT_F2M_59" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_3_PERIPHERALS_1:PWM_0" "mBUS_PWM" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_3_PERIPHERALS_1:RPi_ID_SC" "RPi_ID_SC" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_3_PERIPHERALS_1:RPi_ID_SD" "RPi_ID_SD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_3_PERIPHERALS_1:fabric_sd_emmc_demux_select_out" "SDIO_SW_SEL0" "SDIO_SW_SEL1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"I2C_1_SCL" "MSS_WRAPPER_1:I2C_1_SCL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"I2C_1_SDA" "MSS_WRAPPER_1:I2C_1_SDA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LED0" "MSS_GPIO_2_16_OR_COREGPIO_C0_GPIO_OUT_0:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LED1" "MSS_GPIO_2_17_OR_COREGPIO_C0_GPIO_OUT_1:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LED2" "MSS_GPIO_2_18_OR_COREGPIO_C0_GPIO_OUT_2:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LED3" "MSS_GPIO_2_19_OR_COREGPIO_C0_GPIO_OUT_3:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MAC_1_MDC" "MSS_WRAPPER_1:MAC_1_MDC" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MAC_1_MDIO" "MSS_WRAPPER_1:MAC_1_MDIO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MMUART_0_RXD_F2M" "MSS_WRAPPER_1:MMUART_0_RXD_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MMUART_0_TXD_M2F" "MSS_WRAPPER_1:MMUART_0_TXD_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MMUART_1_RXD_F2M" "MSS_WRAPPER_1:MMUART_1_RXD_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MMUART_1_TXD_M2F" "MSS_WRAPPER_1:MMUART_1_TXD_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MMUART_2_RXD_F2M" "MSS_WRAPPER_1:MMUART_2_RXD_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MMUART_2_TXD_M2F" "MSS_WRAPPER_1:MMUART_2_TXD_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MMUART_3_RXD_F2M" "MSS_WRAPPER_1:MMUART_3_RXD_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MMUART_3_TXD_M2F" "MSS_WRAPPER_1:MMUART_3_TXD_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_GPIO_2_16_OR_COREGPIO_C0_GPIO_OUT_0:A" "MSS_WRAPPER_1:GPIO_2_M2F_16" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_GPIO_2_17_OR_COREGPIO_C0_GPIO_OUT_1:A" "MSS_WRAPPER_1:GPIO_2_M2F_17" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_GPIO_2_18_OR_COREGPIO_C0_GPIO_OUT_2:A" "MSS_WRAPPER_1:GPIO_2_M2F_18" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_GPIO_2_19_OR_COREGPIO_C0_GPIO_OUT_3:A" "MSS_WRAPPER_1:GPIO_2_M2F_19" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:GPIO_2_F2M_30" "SW2_OR_GPIO_2_26:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:GPIO_2_F2M_31" "SW3_OR_GPIO_2_27:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:GPIO_2_M2F_26" "SW2_OR_GPIO_2_26:B" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:GPIO_2_M2F_27" "SW3_OR_GPIO_2_27:B" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:GPIO_2_M2F_28" "SW1_OR_GPIO_2_28:B" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:MMUART_4_RXD_F2M" "mBUS_UART_RX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:MMUART_4_TXD_M2F" "mBUS_UART_TX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:MSS_INT_F2M_0" "SW1_OR_GPIO_2_28:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:MSS_INT_F2M_3" "mBUS_INT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:MSS_RESET_N_F2M" "SW4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:ODT" "ODT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:QSPI_CLK" "QSPI_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:QSPI_DATA_0" "QSPI_DATA_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:QSPI_DATA_1" "QSPI_DATA_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:QSPI_DATA_2" "QSPI_DATA_2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:QSPI_DATA_3" "QSPI_DATA_3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:QSPI_SEL" "QSPI_SEL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:REFCLK" "REFCLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:REFCLK_N" "REFCLK_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:RESET_N" "RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:RPi_GPIO12" "RPi_GPIO12" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:RPi_GPIO13" "RPi_GPIO13" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:RPi_GPIO16" "RPi_GPIO16" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:RPi_GPIO17" "RPi_GPIO17" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:RPi_GPIO19" "RPi_GPIO19" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:RPi_GPIO20" "RPi_GPIO20" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:RPi_GPIO21" "RPi_GPIO21" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:RPi_GPIO22" "RPi_GPIO22" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:RPi_GPIO23" "RPi_GPIO23" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:RPi_GPIO24" "RPi_GPIO24" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:RPi_GPIO25" "RPi_GPIO25" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:RPi_GPIO26" "RPi_GPIO26" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:RPi_GPIO27" "RPi_GPIO27" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:SD_CD_EMMC_STRB" "SD_CD_EMMC_STRB" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:SD_CLK_EMMC_CLK" "SD_CLK_EMMC_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:SD_CMD_EMMC_CMD" "SD_CMD_EMMC_CMD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:SD_DATA0_EMMC_DATA0" "SD_DATA0_EMMC_DATA0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:SD_DATA1_EMMC_DATA1" "SD_DATA1_EMMC_DATA1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:SD_DATA2_EMMC_DATA2" "SD_DATA2_EMMC_DATA2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:SD_DATA3_EMMC_DATA3" "SD_DATA3_EMMC_DATA3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:SD_POW_EMMC_DATA4" "SD_POW_EMMC_DATA4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:SD_VOLT_CMD_DIR_EMMC_DATA7" "SD_VOLT_CMD_DIR_EMMC_DATA7" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:SD_VOLT_DIR_0_EMMC_UNUSED" "SD_VOLT_DIR_0_EMMC_UNUSED" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:SD_VOLT_DIR_1_3_EMMC_UNUSED" "SD_VOLT_DIR_1_3_EMMC_UNUSED" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:SD_VOLT_EN_EMMC_DATA6" "SD_VOLT_EN_EMMC_DATA6" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:SD_VOLT_SEL_EMMC_DATA5" "SD_VOLT_SEL_EMMC_DATA5" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:SD_WP_EMMC_RSTN" "SD_WP_EMMC_RSTN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:SGMII_RX0_N" "SGMII_RX0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:SGMII_RX0_P" "SGMII_RX0_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:SGMII_RX1_N" "SGMII_RX1_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:SGMII_RX1_P" "SGMII_RX1_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:SGMII_TX0_N" "SGMII_TX0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:SGMII_TX0_P" "SGMII_TX0_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:SGMII_TX1_N" "SGMII_TX1_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:SGMII_TX1_P" "SGMII_TX1_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:SPI_1_CLK" "SPI_1_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:SPI_1_DI" "SPI_1_DI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:SPI_1_DO" "SPI_1_DO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:SPI_1_SS0" "SPI_1_SS0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:USB_CLK" "USB_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:USB_DATA0" "USB_DATA0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:USB_DATA1" "USB_DATA1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:USB_DATA2" "USB_DATA2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:USB_DATA3" "USB_DATA3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:USB_DATA4" "USB_DATA4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:USB_DATA5" "USB_DATA5" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:USB_DATA6" "USB_DATA6" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:USB_DATA7" "USB_DATA7" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:USB_DIR" "USB_DIR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:USB_NXT" "USB_NXT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:USB_STP" "USB_STP" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:mBUS_I2C_SCL" "mBUS_I2C_SCL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS_WRAPPER_1:mBUS_I2C_SDA" "mBUS_I2C_SDA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SW1" "SW1_OR_GPIO_2_28:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SW2" "SW2_OR_GPIO_2_26:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SW3" "SW3_OR_GPIO_2_27:A" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CA" "MSS_WRAPPER_1:CA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DM" "MSS_WRAPPER_1:DM" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DQ" "MSS_WRAPPER_1:DQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DQS" "MSS_WRAPPER_1:DQS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DQS_N" "MSS_WRAPPER_1:DQS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_3_PERIPHERALS_1:PSTRB" "MSS_WRAPPER_1:FIC_3_APB_M_PSTRB" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:CLKS_TO_XCVR" "FIC_1_PERIPHERALS_1:TX_PLL_CLKS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_0_PERIPHERALS_1:AXI4mmaster0" "MSS_WRAPPER_1:FIC_0_AXI4_INITIATOR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_0_PERIPHERALS_1:AXI4mslave0" "MSS_WRAPPER_1:FIC_0_AXI4_TARGET" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:AXI4mmaster0" "MSS_WRAPPER_1:FIC_1_AXI4_INITIATOR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:AXI4mslave0" "MSS_WRAPPER_1:FIC_1_AXI4_TARGET" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:Q0_LANE0_DRI_SLAVE" "FIC_3_PERIPHERALS_1:Q0_LANE0_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:Q0_LANE1_DRI_SLAVE" "FIC_3_PERIPHERALS_1:Q0_LANE1_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:Q0_LANE2_DRI_SLAVE" "FIC_3_PERIPHERALS_1:Q0_LANE2_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:Q0_LANE3_DRI_SLAVE" "FIC_3_PERIPHERALS_1:Q0_LANE3_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_3_PERIPHERALS_1:APB_MMASTER" "MSS_WRAPPER_1:FIC_3_APB_INITIATOR" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign MPFS_ICICLE_KIT_BASE_DESIGN
generate_component -component_name ${sd_name}
