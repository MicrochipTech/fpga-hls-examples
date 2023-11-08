# Creating SmartDesign CLOCKS_AND_RESETS
set sd_name {CLOCKS_AND_RESETS}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {EXT_RST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MSS_PLL_LOCKS} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_P} -port_direction {IN} -port_is_pad {1}

sd_create_scalar_port -sd_name ${sd_name} -port_name {CLK_125MHz} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CLK_50MHz} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DEVICE_INIT_DONE} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FABRIC_POR_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {I2C_BCLK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESETN_125MHz} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESETN_50MHz} -port_direction {OUT}



# Add AND2_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {AND2_0}



# Add CORERESET_CLK_50MHz instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CORERESET_PF_C5} -instance_name {CORERESET_CLK_50MHz}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_CLK_50MHz:BANK_x_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_CLK_50MHz:BANK_y_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_CLK_50MHz:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_CLK_50MHz:FF_US_RESTORE} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORERESET_CLK_50MHz:PLL_POWERDOWN_B}



# Add CORERESET_CLK_125MHz instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CORERESET} -instance_name {CORERESET_CLK_125MHz}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_CLK_125MHz:BANK_x_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_CLK_125MHz:BANK_y_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_CLK_125MHz:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_CLK_125MHz:FF_US_RESTORE} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORERESET_CLK_125MHz:PLL_POWERDOWN_B}



# Add INIT_MONITOR_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {INIT_MONITOR} -instance_name {INIT_MONITOR_0}
sd_create_pin_group -sd_name ${sd_name} -group_name {Group} -instance_name {INIT_MONITOR_0} -pin_names {"USRAM_INIT_FROM_SNVM_DONE" "USRAM_INIT_DONE" "SRAM_INIT_FROM_UPROM_DONE" "USRAM_INIT_FROM_UPROM_DONE" "SRAM_INIT_FROM_SPI_DONE" "SRAM_INIT_DONE" "USRAM_INIT_FROM_SPI_DONE" "SRAM_INIT_FROM_SNVM_DONE" "AUTOCALIB_DONE" "PCIE_INIT_DONE" "XCVR_INIT_DONE" }
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {INIT_MONITOR_0:PCIE_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {INIT_MONITOR_0:USRAM_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {INIT_MONITOR_0:SRAM_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {INIT_MONITOR_0:XCVR_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {INIT_MONITOR_0:USRAM_INIT_FROM_SNVM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {INIT_MONITOR_0:USRAM_INIT_FROM_UPROM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {INIT_MONITOR_0:USRAM_INIT_FROM_SPI_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {INIT_MONITOR_0:SRAM_INIT_FROM_SNVM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {INIT_MONITOR_0:SRAM_INIT_FROM_UPROM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {INIT_MONITOR_0:SRAM_INIT_FROM_SPI_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {INIT_MONITOR_0:AUTOCALIB_DONE}



# Add PF_CCC_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_CCC_C0} -instance_name {PF_CCC_C0_0}



# Add PF_CLK_DIV_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_CLK_DIV_C0} -instance_name {PF_CLK_DIV_C0_0}



# Add PF_OSC_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_OSC_C0} -instance_name {PF_OSC_C0_0}



# Add PF_XCVR_REF_CLK_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_XCVR_REF_CLK_C0} -instance_name {PF_XCVR_REF_CLK_C0_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_REF_CLK_C0_0:REF_CLK}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:A" "PF_CCC_C0_0:PLL_LOCK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:B" "MSS_PLL_LOCKS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:Y" "CORERESET_CLK_125MHz:PLL_LOCK" "CORERESET_CLK_50MHz:PLL_LOCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLK_125MHz" "CORERESET_CLK_125MHz:CLK" "PF_CCC_C0_0:OUT0_FABCLK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLK_50MHz" "CORERESET_CLK_50MHz:CLK" "PF_CCC_C0_0:OUT1_FABCLK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_CLK_125MHz:EXT_RST_N" "CORERESET_CLK_50MHz:EXT_RST_N" "EXT_RST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_CLK_125MHz:FABRIC_RESET_N" "RESETN_125MHz" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_CLK_125MHz:FPGA_POR_N" "CORERESET_CLK_50MHz:FPGA_POR_N" "FABRIC_POR_N" "INIT_MONITOR_0:FABRIC_POR_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_CLK_125MHz:INIT_DONE" "CORERESET_CLK_50MHz:INIT_DONE" "DEVICE_INIT_DONE" "INIT_MONITOR_0:DEVICE_INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_CLK_50MHz:FABRIC_RESET_N" "RESETN_50MHz" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"I2C_BCLK" "PF_CLK_DIV_C0_0:CLK_OUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CCC_C0_0:REF_CLK_0" "PF_XCVR_REF_CLK_C0_0:FAB_REF_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CLK_DIV_C0_0:CLK_IN" "PF_OSC_C0_0:RCOSC_2MHZ_CLK_DIV" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_XCVR_REF_CLK_C0_0:REF_CLK_PAD_N" "REF_CLK_PAD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_XCVR_REF_CLK_C0_0:REF_CLK_PAD_P" "REF_CLK_PAD_P" }



# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign CLOCKS_AND_RESETS
generate_component -component_name ${sd_name}
