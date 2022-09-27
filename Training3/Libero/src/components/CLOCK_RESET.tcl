# Creating SmartDesign CLOCK_RESET
set sd_name {CLOCK_RESET}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {CLK27_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR4_CTRLR_READY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR4_PLL_LOCK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {EXT_RST_N} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {CLK100_RESETN_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CLK100_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CLK50_RESETN_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CLK50_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_CLK_RESETN_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_CLK_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {INIT_DONE} -port_direction {OUT}



# Add AND2_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {AND2_0}



# Add AND2_1 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {AND2_1}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {AND2_1:A} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {AND2_1:B} -value {VCC}



# Add AND2_2 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {AND2_2}



# Add AND4_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND4} -instance_name {AND4_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {AND4_0:D} -value {VCC}



# Add CORERESET_PF_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CORERESET_PF_C0} -instance_name {CORERESET_PF_C0_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_0:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_0:INIT_DONE} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_0:FF_US_RESTORE} -value {GND}



# Add CORERESET_PF_C0_1 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CORERESET_PF_C0} -instance_name {CORERESET_PF_C0_1}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_1:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_1:INIT_DONE} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_1:FF_US_RESTORE} -value {GND}



# Add CORERESET_PF_C0_2 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CORERESET_PF_C0} -instance_name {CORERESET_PF_C0_2}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_2:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_2:INIT_DONE} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_2:FF_US_RESTORE} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_2:PLL_POWERDOWN_B}



# Add PF_CCC_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_CCC_C0} -instance_name {PF_CCC_C0_0}



# Add PF_CCC_C1_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_CCC_C1} -instance_name {PF_CCC_C1_0}



# Add PF_INIT_MONITOR_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_INIT_MONITOR_C0} -instance_name {PF_INIT_MONITOR_C0_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_C0_0:PCIE_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_C0_0:USRAM_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_C0_0:SRAM_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_C0_0:XCVR_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_C0_0:USRAM_INIT_FROM_SNVM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_C0_0:USRAM_INIT_FROM_UPROM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_C0_0:USRAM_INIT_FROM_SPI_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_C0_0:SRAM_INIT_FROM_SNVM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_C0_0:SRAM_INIT_FROM_UPROM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_C0_0:SRAM_INIT_FROM_SPI_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_C0_0:AUTOCALIB_DONE}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:A" "AND2_2:Y" "INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:B" "AND4_0:A" "PF_CCC_C0_0:PLL_LOCK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:Y" "CORERESET_PF_C0_0:PLL_LOCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_1:Y" "CORERESET_PF_C0_0:BANK_x_VDDI_STATUS" "CORERESET_PF_C0_0:BANK_y_VDDI_STATUS" "CORERESET_PF_C0_1:BANK_x_VDDI_STATUS" "CORERESET_PF_C0_1:BANK_y_VDDI_STATUS" "CORERESET_PF_C0_2:BANK_x_VDDI_STATUS" "CORERESET_PF_C0_2:BANK_y_VDDI_STATUS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_2:A" "PF_INIT_MONITOR_C0_0:DEVICE_INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_2:B" "PF_INIT_MONITOR_C0_0:BANK_2_CALIB_STATUS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_0:B" "DDR4_PLL_LOCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_0:C" "DDR4_CTRLR_READY" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_0:Y" "CORERESET_PF_C0_2:PLL_LOCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLK100_RESETN_o" "CORERESET_PF_C0_2:FABRIC_RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLK100_o" "CORERESET_PF_C0_2:CLK" "PF_CCC_C0_0:OUT1_FABCLK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLK27_i" "PF_CCC_C0_0:REF_CLK_0" "PF_CCC_C1_0:REF_CLK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLK50_RESETN_o" "CORERESET_PF_C0_0:FABRIC_RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLK50_o" "CORERESET_PF_C0_0:CLK" "PF_CCC_C0_0:OUT0_FABCLK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_0:EXT_RST_N" "CORERESET_PF_C0_1:EXT_RST_N" "CORERESET_PF_C0_2:EXT_RST_N" "EXT_RST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_0:FPGA_POR_N" "CORERESET_PF_C0_1:FPGA_POR_N" "CORERESET_PF_C0_2:FPGA_POR_N" "PF_INIT_MONITOR_C0_0:FABRIC_POR_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_0:PLL_POWERDOWN_B" "PF_CCC_C0_0:PLL_POWERDOWN_N_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_1:CLK" "HDMI_CLK_o" "PF_CCC_C1_0:OUT0_FABCLK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_1:FABRIC_RESET_N" "HDMI_CLK_RESETN_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_1:PLL_LOCK" "PF_CCC_C1_0:PLL_LOCK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_1:PLL_POWERDOWN_B" "PF_CCC_C1_0:PLL_POWERDOWN_N_0" }



# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign CLOCK_RESET
generate_component -component_name ${sd_name}
