# Creating SmartDesign CLOCKS_AND_RESETS
set sd_name {CLOCKS_AND_RESETS}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {EXT_RST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MSS_PLL_LOCKS} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_50MHz} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_P} -port_direction {IN} -port_is_pad {1}

sd_create_scalar_port -sd_name ${sd_name} -port_name {BIT_CLK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_0_CLK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_1_CLK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_2_CLK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_3_CLK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LOCK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIE_INIT_DONE} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIe_CLK_125MHz} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIe_REFERENCE_CLK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_TO_LANE} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESETN_FIC2_CLK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESETN_FIC_0_CLK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESETN_FIC_1_CLK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESETN_FIC_3_CLK} -port_direction {OUT}



# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {CLKS_TO_XCVR} -port_bif_vlnv {Actel:busdef.clock:PF_TXPLL_XCVR_CLK:1.0} -port_bif_role {master} -port_bif_mapping {\
"LOCK:LOCK" \
"BIT_CLK:BIT_CLK" \
"REF_CLK_TO_LANE:REF_CLK_TO_LANE" } 

# Add AND4_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND4} -instance_name {AND4_0}



# Add CCC_FIC_x_CLK instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_CCC_C0} -instance_name {CCC_FIC_x_CLK}



# Add CLK_160MHz_to_CLK_80MHz instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CLK_DIV} -instance_name {CLK_160MHz_to_CLK_80MHz}



# Add CLKINT_REF_CLK_50MHz instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {CLKINT} -instance_name {CLKINT_REF_CLK_50MHz}



# Add EXTERNAL_RESETN instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND3} -instance_name {EXTERNAL_RESETN}



# Add GLITCHLESS_MUX instance
sd_instantiate_component -sd_name ${sd_name} -component_name {GLITCHLESS_MUX} -instance_name {GLITCHLESS_MUX}



# Add INIT_MONITOR_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {INIT_MONITOR} -instance_name {INIT_MONITOR_0}
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



# Add OSCILLATOR_160MHz instance
sd_instantiate_component -sd_name ${sd_name} -component_name {OSCILLATOR_160MHz} -instance_name {OSCILLATOR_160MHz}



# Add PCIe_CLK_LOCK instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {PCIe_CLK_LOCK}



# Add PCIE_REF_CLK_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PCIE_REF_CLK} -instance_name {PCIE_REF_CLK_0}



# Add RESET_FIC_0_CLK instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CORERESET} -instance_name {RESET_FIC_0_CLK}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {RESET_FIC_0_CLK:BANK_x_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {RESET_FIC_0_CLK:BANK_y_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {RESET_FIC_0_CLK:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {RESET_FIC_0_CLK:FF_US_RESTORE} -value {GND}



# Add RESET_FIC_1_CLK instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CORERESET} -instance_name {RESET_FIC_1_CLK}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {RESET_FIC_1_CLK:BANK_x_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {RESET_FIC_1_CLK:BANK_y_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {RESET_FIC_1_CLK:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {RESET_FIC_1_CLK:FF_US_RESTORE} -value {GND}



# Add RESET_FIC_2_CLK instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CORERESET} -instance_name {RESET_FIC_2_CLK}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {RESET_FIC_2_CLK:BANK_x_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {RESET_FIC_2_CLK:BANK_y_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {RESET_FIC_2_CLK:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {RESET_FIC_2_CLK:FF_US_RESTORE} -value {GND}



# Add RESET_FIC_3_CLK instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CORERESET} -instance_name {RESET_FIC_3_CLK}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {RESET_FIC_3_CLK:BANK_x_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {RESET_FIC_3_CLK:BANK_y_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {RESET_FIC_3_CLK:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {RESET_FIC_3_CLK:FF_US_RESTORE} -value {GND}



# Add TRANSMIT_PLL_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {TRANSMIT_PLL} -instance_name {TRANSMIT_PLL_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_0:A" "RESET_FIC_0_CLK:PLL_POWERDOWN_B" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_0:B" "RESET_FIC_1_CLK:PLL_POWERDOWN_B" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_0:C" "RESET_FIC_2_CLK:PLL_POWERDOWN_B" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_0:D" "RESET_FIC_3_CLK:PLL_POWERDOWN_B" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_0:Y" "CCC_FIC_x_CLK:PLL_POWERDOWN_N_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CCC_FIC_x_CLK:OUT0_FABCLK_0" "FIC_0_CLK" "RESET_FIC_0_CLK:CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CCC_FIC_x_CLK:OUT1_FABCLK_0" "FIC_1_CLK" "RESET_FIC_1_CLK:CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CCC_FIC_x_CLK:OUT2_FABCLK_0" "FIC_2_CLK" "RESET_FIC_2_CLK:CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CCC_FIC_x_CLK:OUT3_FABCLK_0" "FIC_3_CLK" "RESET_FIC_3_CLK:CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CCC_FIC_x_CLK:PLL_LOCK_0" "RESET_FIC_0_CLK:PLL_LOCK" "RESET_FIC_1_CLK:PLL_LOCK" "RESET_FIC_2_CLK:PLL_LOCK" "RESET_FIC_3_CLK:PLL_LOCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CCC_FIC_x_CLK:REF_CLK_0" "CLKINT_REF_CLK_50MHz:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLKINT_REF_CLK_50MHz:A" "REF_CLK_50MHz" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLK_160MHz_to_CLK_80MHz:CLK_IN" "OSCILLATOR_160MHz:RCOSC_160MHZ_CLK_DIV" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLK_160MHz_to_CLK_80MHz:CLK_OUT" "GLITCHLESS_MUX:CLK0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"EXTERNAL_RESETN:A" "EXT_RST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"EXTERNAL_RESETN:B" "MSS_PLL_LOCKS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"EXTERNAL_RESETN:C" "PCIe_CLK_LOCK:A" "TRANSMIT_PLL_0:PLL_LOCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"EXTERNAL_RESETN:Y" "RESET_FIC_0_CLK:EXT_RST_N" "RESET_FIC_1_CLK:EXT_RST_N" "RESET_FIC_2_CLK:EXT_RST_N" "RESET_FIC_3_CLK:EXT_RST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GLITCHLESS_MUX:CLK1" "TRANSMIT_PLL_0:CLK_125" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GLITCHLESS_MUX:CLK_OUT" "PCIe_CLK_125MHz" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GLITCHLESS_MUX:SEL" "PCIe_CLK_LOCK:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"INIT_MONITOR_0:DEVICE_INIT_DONE" "RESET_FIC_0_CLK:INIT_DONE" "RESET_FIC_1_CLK:INIT_DONE" "RESET_FIC_2_CLK:INIT_DONE" "RESET_FIC_3_CLK:INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"INIT_MONITOR_0:FABRIC_POR_N" "RESET_FIC_0_CLK:FPGA_POR_N" "RESET_FIC_1_CLK:FPGA_POR_N" "RESET_FIC_2_CLK:FPGA_POR_N" "RESET_FIC_3_CLK:FPGA_POR_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"INIT_MONITOR_0:PCIE_INIT_DONE" "PCIE_INIT_DONE" "PCIe_CLK_LOCK:B" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE_REF_CLK_0:REF_CLK" "PCIe_REFERENCE_CLK" "TRANSMIT_PLL_0:REF_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE_REF_CLK_0:REF_CLK_PAD_N" "REF_CLK_PAD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE_REF_CLK_0:REF_CLK_PAD_P" "REF_CLK_PAD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RESETN_FIC2_CLK" "RESET_FIC_2_CLK:FABRIC_RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RESETN_FIC_0_CLK" "RESET_FIC_0_CLK:FABRIC_RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RESETN_FIC_1_CLK" "RESET_FIC_1_CLK:FABRIC_RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RESETN_FIC_3_CLK" "RESET_FIC_3_CLK:FABRIC_RESET_N" }


# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLKS_TO_XCVR" "TRANSMIT_PLL_0:CLKS_TO_XCVR" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign CLOCKS_AND_RESETS
generate_component -component_name ${sd_name}
