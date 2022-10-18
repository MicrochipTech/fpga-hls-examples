# Creating SmartDesign HDMI_2p0
set sd_name {HDMI_2p0}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {DATA_VALID_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {EDID_CLK_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HPD_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {H_SYNC_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RXD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RXD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_RXD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_RXD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_RXD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_RXD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_RXD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_RXD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESET_N_I_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESET_N_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SCL_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {V_SYNC_I} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {DATA_VALID_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HPD_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_TXD_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_TXD_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_TX_CLK_R} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_TX_CLK_STABLE} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_TXD_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_TXD_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_TXD_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_TXD_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_RX_CLK_R} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_TXD_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_TXD_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {V_SYNC_O} -port_direction {OUT}

sd_create_scalar_port -sd_name ${sd_name} -port_name {SDA} -port_direction {INOUT} -port_is_pad {1}

# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {DATA_B_I} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DATA_G_I} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DATA_R_I} -port_direction {IN} -port_range {[31:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {B_O} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {G_O} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {R_O} -port_direction {OUT} -port_range {[7:0]}


# Add BIBUF_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BIBUF_0:D} -value {GND}



# Add HDMI_RX_C0_1 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {HDMI_RX_C0} -instance_name {HDMI_RX_C0_1}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {HDMI_RX_C0_1:H_SYNC_O}



# Add HDMI_TX_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {HDMI_TX_C0} -instance_name {HDMI_TX_C0_0}



# Add PF_TX_PLL_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_TX_PLL_C0} -instance_name {PF_TX_PLL_C0_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_TX_PLL_C0_0:PLL_LOCK}



# Add PF_XCVR_ERM_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_XCVR_ERM_C0} -instance_name {PF_XCVR_ERM_C0_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C0_0:LANE0_RX_CLK_R}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C0_0:LANE0_RX_SLIP} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C0_0:LANE0_RX_IDLE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C0_0:LANE0_RX_READY}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C0_0:LANE0_RX_VAL}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C0_0:LANE0_RX_BYPASS_DATA}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C0_0:LANE1_TX_CLK_R}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C0_0:LANE1_RX_IDLE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C0_0:LANE1_RX_READY}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C0_0:LANE1_TX_CLK_STABLE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C0_0:LANE1_RX_BYPASS_DATA}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C0_0:LANE2_TX_CLK_R}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C0_0:LANE2_RX_IDLE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C0_0:LANE2_RX_READY}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C0_0:LANE2_TX_CLK_STABLE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C0_0:LANE2_RX_BYPASS_DATA}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C0_0:LANE3_TX_CLK_R}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C0_0:LANE3_RX_IDLE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C0_0:LANE3_RX_READY}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C0_0:LANE3_TX_CLK_STABLE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C0_0:LANE3_RX_BYPASS_DATA}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C0_0:LANE0_TX_DATA} -value {0000011111000001111100000111110000011111}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C0_0:LANE0_RX_DATA}



# Add PF_XCVR_REF_CLK_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_XCVR_REF_CLK_C0} -instance_name {PF_XCVR_REF_CLK_C0_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_0:E" "HDMI_RX_C0_1:SDA_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_0:PAD" "SDA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_0:Y" "HDMI_RX_C0_1:SDA_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DATA_VALID_I" "HDMI_TX_C0_0:DATA_VALID_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DATA_VALID_O" "HDMI_RX_C0_1:DATA_VALID_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"EDID_CLK_I" "HDMI_RX_C0_1:EDID_CLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_RX_C0_1:BIT_SLIP_B_O" "PF_XCVR_ERM_C0_0:LANE1_RX_SLIP" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_RX_C0_1:BIT_SLIP_G_O" "PF_XCVR_ERM_C0_0:LANE2_RX_SLIP" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_RX_C0_1:BIT_SLIP_R_O" "PF_XCVR_ERM_C0_0:LANE3_RX_SLIP" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_RX_C0_1:B_RX_CLK_I" "PF_XCVR_ERM_C0_0:LANE1_RX_CLK_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_RX_C0_1:B_RX_VALID_I" "PF_XCVR_ERM_C0_0:LANE1_RX_VAL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_RX_C0_1:G_RX_CLK_I" "PF_XCVR_ERM_C0_0:LANE2_RX_CLK_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_RX_C0_1:G_RX_VALID_I" "PF_XCVR_ERM_C0_0:LANE2_RX_VAL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_RX_C0_1:HPD_I" "HPD_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_RX_C0_1:HPD_O" "HPD_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_RX_C0_1:RESET_N_I" "RESET_N_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_RX_C0_1:R_RX_CLK_I" "LANE3_RX_CLK_R" "PF_XCVR_ERM_C0_0:LANE3_RX_CLK_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_RX_C0_1:R_RX_VALID_I" "PF_XCVR_ERM_C0_0:LANE3_RX_VAL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_RX_C0_1:SCL_I" "SCL_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_RX_C0_1:V_SYNC_O" "V_SYNC_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_TX_C0_0:H_SYNC_I" "H_SYNC_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_TX_C0_0:RESET_N_I" "PF_XCVR_ERM_C0_0:LANE0_PCS_ARST_N" "PF_XCVR_ERM_C0_0:LANE0_PMA_ARST_N" "PF_XCVR_ERM_C0_0:LANE1_PCS_ARST_N" "PF_XCVR_ERM_C0_0:LANE1_PMA_ARST_N" "PF_XCVR_ERM_C0_0:LANE2_PCS_ARST_N" "PF_XCVR_ERM_C0_0:LANE2_PMA_ARST_N" "PF_XCVR_ERM_C0_0:LANE3_PCS_ARST_N" "PF_XCVR_ERM_C0_0:LANE3_PMA_ARST_N" "RESET_N_I_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_TX_C0_0:SYS_CLK_I" "LANE0_TX_CLK_R" "PF_XCVR_ERM_C0_0:LANE0_TX_CLK_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_TX_C0_0:V_SYNC_I" "V_SYNC_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_RXD_N" "PF_XCVR_ERM_C0_0:LANE0_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_RXD_P" "PF_XCVR_ERM_C0_0:LANE0_RXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_TXD_N" "PF_XCVR_ERM_C0_0:LANE0_TXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_TXD_P" "PF_XCVR_ERM_C0_0:LANE0_TXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_TX_CLK_STABLE" "PF_XCVR_ERM_C0_0:LANE0_TX_CLK_STABLE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_RXD_N" "PF_XCVR_ERM_C0_0:LANE1_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_RXD_P" "PF_XCVR_ERM_C0_0:LANE1_RXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_TXD_N" "PF_XCVR_ERM_C0_0:LANE1_TXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_TXD_P" "PF_XCVR_ERM_C0_0:LANE1_TXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE2_RXD_N" "PF_XCVR_ERM_C0_0:LANE2_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE2_RXD_P" "PF_XCVR_ERM_C0_0:LANE2_RXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE2_TXD_N" "PF_XCVR_ERM_C0_0:LANE2_TXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE2_TXD_P" "PF_XCVR_ERM_C0_0:LANE2_TXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE3_RXD_N" "PF_XCVR_ERM_C0_0:LANE3_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE3_RXD_P" "PF_XCVR_ERM_C0_0:LANE3_RXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE3_TXD_N" "PF_XCVR_ERM_C0_0:LANE3_TXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE3_TXD_P" "PF_XCVR_ERM_C0_0:LANE3_TXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_TX_PLL_C0_0:REF_CLK" "PF_XCVR_ERM_C0_0:LANE0_CDR_REF_CLK_0" "PF_XCVR_ERM_C0_0:LANE1_CDR_REF_CLK_0" "PF_XCVR_ERM_C0_0:LANE2_CDR_REF_CLK_0" "PF_XCVR_ERM_C0_0:LANE3_CDR_REF_CLK_0" "PF_XCVR_REF_CLK_C0_0:REF_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_XCVR_REF_CLK_C0_0:REF_CLK_PAD_N" "REF_CLK_PAD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_XCVR_REF_CLK_C0_0:REF_CLK_PAD_P" "REF_CLK_PAD_P" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"B_O" "HDMI_RX_C0_1:B_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DATA_B_I" "HDMI_TX_C0_0:DATA_B_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DATA_G_I" "HDMI_TX_C0_0:DATA_G_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DATA_R_I" "HDMI_TX_C0_0:DATA_R_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"G_O" "HDMI_RX_C0_1:G_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_RX_C0_1:DATA_B_I" "PF_XCVR_ERM_C0_0:LANE1_RX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_RX_C0_1:DATA_G_I" "PF_XCVR_ERM_C0_0:LANE2_RX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_RX_C0_1:DATA_R_I" "PF_XCVR_ERM_C0_0:LANE3_RX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_RX_C0_1:R_O" "R_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_TX_C0_0:TMDS_B_O" "PF_XCVR_ERM_C0_0:LANE1_TX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_TX_C0_0:TMDS_G_O" "PF_XCVR_ERM_C0_0:LANE2_TX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_TX_C0_0:TMDS_R_O" "PF_XCVR_ERM_C0_0:LANE3_TX_DATA" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_TX_PLL_C0_0:CLKS_TO_XCVR" "PF_XCVR_ERM_C0_0:CLKS_FROM_TXPLL_0" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign HDMI_2p0
generate_component -component_name ${sd_name}
