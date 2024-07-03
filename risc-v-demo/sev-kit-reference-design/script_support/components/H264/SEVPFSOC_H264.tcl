# Creating SmartDesign SEVPFSOC_TOP
set sd_name {SEVPFSOC_TOP}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM1_RX_CLK_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM1_RX_CLK_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_0_RXD_F2M} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_1_RXD_F2M} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REFCLK_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REFCLK} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_CD_EMMC_STRB} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_WP_EMMC_RSTN} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_RX0_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_RX0_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_RX1_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_RX1_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_CLK} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DIR} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_NXT} -port_direction {IN} -port_is_pad {1}

sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM1_RST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM_CLK_EN} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CKE} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CK_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CK} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CS} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LED2} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LED3} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MAC_0_MDC} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_0_TXD_M2F} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_1_TXD_M2F} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ODT} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESET_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SDIO_SW_EN_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SDIO_SW_SEL0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SDIO_SW_SEL1} -port_direction {OUT} -port_is_pad {1}
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
sd_create_scalar_port -sd_name ${sd_name} -port_name {TEN} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_STP} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_ULPI_RESET_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VSC_8662_CMODE3} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VSC_8662_CMODE4} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VSC_8662_CMODE5} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VSC_8662_CMODE6} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VSC_8662_CMODE7} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VSC_8662_RESETN} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VSC_8662_SRESET} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {cam1inck} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {cam1xmaster} -port_direction {OUT}

sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM1_SCL} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM1_SDA} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MAC_0_MDIO} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_CMD_EMMC_CMD} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_DATA0_EMMC_DATA0} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_DATA1_EMMC_DATA1} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_DATA2_EMMC_DATA2} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_DATA3_EMMC_DATA3} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA0} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA1} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA2} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA3} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA4} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA5} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA6} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA7} -port_direction {INOUT} -port_is_pad {1}

# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {CAM1_RXD_N} -port_direction {IN} -port_range {[3:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {CAM1_RXD} -port_direction {IN} -port_range {[3:0]} -port_is_pad {1}

sd_create_bus_port -sd_name ${sd_name} -port_name {CA} -port_direction {OUT} -port_range {[5:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DM} -port_direction {OUT} -port_range {[3:0]} -port_is_pad {1}

sd_create_bus_port -sd_name ${sd_name} -port_name {DQS_N} -port_direction {INOUT} -port_range {[3:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQS} -port_direction {INOUT} -port_range {[3:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQ} -port_direction {INOUT} -port_range {[31:0]} -port_is_pad {1}

sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {TEN} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {VSC_8662_CMODE3} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {VSC_8662_CMODE4} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {VSC_8662_CMODE5} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {VSC_8662_CMODE6} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {VSC_8662_CMODE7} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {VSC_8662_SRESET} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {cam1inck} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {cam1xmaster} -value {GND}
# Add BIBUF_1 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_1}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BIBUF_1:D} -value {GND}



# Add BIBUF_2 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_2}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BIBUF_2:D} -value {GND}



# Add CLOCKS_AND_RESETS instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CLOCKS_AND_RESETS} -instance_name {CLOCKS_AND_RESETS}



# Add FIC_CONVERTER_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {FIC_CONVERTER} -instance_name {FIC_CONVERTER_0}



# Add MSS instance
sd_instantiate_component -sd_name ${sd_name} -component_name {MSS_SEV} -instance_name {MSS}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MSS:MSS_INT_F2M} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MSS:MSS_INT_F2M} -pin_slices {[63:1]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MSS:MSS_INT_F2M[63:1]} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MSS:GPIO_2_F2M_25} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MSS:FIC_3_DLL_LOCK_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MSS:FIC_3_APB_M_PSTRB}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MSS:MMUART_0_TXD_OE_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MSS:MMUART_1_TXD_OE_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MSS:GPIO_2_M2F_3}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MSS:GPIO_2_M2F_2}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MSS:GPIO_2_M2F_1}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MSS:MSS_INT_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MSS:PLL_CPU_LOCK_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MSS:PLL_DDR_LOCK_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MSS:PLL_SGMII_LOCK_M2F}



# Add Video_Pipeline_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Video_Pipeline} -instance_name {Video_Pipeline_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_1:E" "MSS:I2C_0_SCL_OE_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_1:PAD" "CAM1_SCL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_1:Y" "MSS:I2C_0_SCL_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_2:E" "MSS:I2C_0_SDA_OE_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_2:PAD" "CAM1_SDA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_2:Y" "MSS:I2C_0_SDA_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_RST" "MSS:GPIO_2_M2F_8" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_RX_CLK_N" "Video_Pipeline_0:CAM1_RX_CLK_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_RX_CLK_P" "Video_Pipeline_0:CAM1_RX_CLK_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM_CLK_EN" "MSS:GPIO_2_M2F_9" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CK" "MSS:CK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CKE" "MSS:CKE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CK_N" "MSS:CK_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:CLK_125MHz" "MSS:FIC_1_ACLK" "Video_Pipeline_0:CLK_125MHz_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:CLK_50MHz" "MSS:FIC_3_PCLK" "Video_Pipeline_0:CLK_50MHz_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:DEVICE_INIT_DONE" "Video_Pipeline_0:INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:EXT_RST_N" "MSS:MSS_RESET_N_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:FABRIC_POR_N" "MSS:MSS_RESET_N_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:I2C_BCLK" "MSS:I2C_0_BCLK_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:MSS_PLL_LOCKS" "MSS:FIC_1_DLL_LOCK_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:REF_CLK_PAD_N" "REF_CLK_PAD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:REF_CLK_PAD_P" "REF_CLK_PAD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:RESETN_125MHz" "VSC_8662_RESETN" "Video_Pipeline_0:RESETN_125MHz_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:RESETN_50MHz" "Video_Pipeline_0:RESETN_50MHz_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CS" "MSS:CS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LED2" "MSS:GPIO_2_M2F_18" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LED3" "MSS:GPIO_2_M2F_19" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MAC_0_MDC" "MSS:MAC_0_MDC" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MAC_0_MDIO" "MSS:MAC_0_MDIO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MMUART_0_RXD_F2M" "MSS:MMUART_0_RXD_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MMUART_0_TXD_M2F" "MSS:MMUART_0_TXD_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MMUART_1_RXD_F2M" "MSS:MMUART_1_RXD_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MMUART_1_TXD_M2F" "MSS:MMUART_1_TXD_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:GPIO_1_12_OUT" "USB_ULPI_RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:GPIO_1_16_OUT" "SDIO_SW_SEL0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:GPIO_1_20_OUT" "SDIO_SW_SEL1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:GPIO_1_23_OUT" "SDIO_SW_EN_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:GPIO_2_M2F_4" "Video_Pipeline_0:LPDDR4_RDY_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:MSS_INT_F2M[0:0]" "Video_Pipeline_0:frm_interrupt_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:ODT" "ODT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:REFCLK" "REFCLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:REFCLK_N" "REFCLK_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:RESET_N" "RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SD_CD_EMMC_STRB" "SD_CD_EMMC_STRB" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SD_CLK_EMMC_CLK" "SD_CLK_EMMC_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SD_CMD_EMMC_CMD" "SD_CMD_EMMC_CMD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SD_DATA0_EMMC_DATA0" "SD_DATA0_EMMC_DATA0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SD_DATA1_EMMC_DATA1" "SD_DATA1_EMMC_DATA1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SD_DATA2_EMMC_DATA2" "SD_DATA2_EMMC_DATA2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SD_DATA3_EMMC_DATA3" "SD_DATA3_EMMC_DATA3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SD_POW_EMMC_DATA4" "SD_POW_EMMC_DATA4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SD_VOLT_CMD_DIR_EMMC_DATA7" "SD_VOLT_CMD_DIR_EMMC_DATA7" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SD_VOLT_DIR_0_EMMC_UNUSED" "SD_VOLT_DIR_0_EMMC_UNUSED" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SD_VOLT_DIR_1_3_EMMC_UNUSED" "SD_VOLT_DIR_1_3_EMMC_UNUSED" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SD_VOLT_EN_EMMC_DATA6" "SD_VOLT_EN_EMMC_DATA6" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SD_VOLT_SEL_EMMC_DATA5" "SD_VOLT_SEL_EMMC_DATA5" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SD_WP_EMMC_RSTN" "SD_WP_EMMC_RSTN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SGMII_RX0_N" "SGMII_RX0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SGMII_RX0_P" "SGMII_RX0_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SGMII_RX1_N" "SGMII_RX1_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SGMII_RX1_P" "SGMII_RX1_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SGMII_TX0_N" "SGMII_TX0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SGMII_TX0_P" "SGMII_TX0_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SGMII_TX1_N" "SGMII_TX1_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SGMII_TX1_P" "SGMII_TX1_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:USB_CLK" "USB_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:USB_DATA0" "USB_DATA0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:USB_DATA1" "USB_DATA1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:USB_DATA2" "USB_DATA2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:USB_DATA3" "USB_DATA3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:USB_DATA4" "USB_DATA4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:USB_DATA5" "USB_DATA5" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:USB_DATA6" "USB_DATA6" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:USB_DATA7" "USB_DATA7" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:USB_DIR" "USB_DIR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:USB_NXT" "USB_NXT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:USB_STP" "USB_STP" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CA" "MSS:CA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_RXD" "Video_Pipeline_0:CAM1_RXD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_RXD_N" "Video_Pipeline_0:CAM1_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DM" "MSS:DM" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DQ" "MSS:DQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DQS" "MSS:DQS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DQS_N" "MSS:DQS_N" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_CONVERTER_0:APBmslave" "Video_Pipeline_0:APBslave" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_CONVERTER_0:FIC3_APB3_master" "MSS:FIC_3_APB_INITIATOR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:FIC_1_AXI4_TARGET" "Video_Pipeline_0:BIF_1" }

# FIC 0 interface and clock
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:CLK_125MHz" "MSS:FIC_0_ACLK"}

# sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:FIC_1_DLL_LOCK_M2F" "CLOCKS_AND_RESETS:MSS_PLL_LOCKS"}

sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MSS:FIC_0_DLL_LOCK_M2F}
# sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Video_Pipeline_0:CAMCLK_RESET_N}

# sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {AND2_MSS_DLL_LOCKS}
# sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:FIC_0_DLL_LOCK_M2F" "AND2_MSS_DLL_LOCKS:A"}
# sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:FIC_1_DLL_LOCK_M2F" "AND2_MSS_DLL_LOCKS:B"}
# sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_MSS_DLL_LOCKS:Y" "CLOCKS_AND_RESETS:MSS_PLL_LOCKS"}

sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MSS:FIC_0_AXI4_TARGET}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MSS:FIC_0_AXI4_INITIATOR}


# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign SEVPFSOC_TOP
generate_component -component_name ${sd_name}
