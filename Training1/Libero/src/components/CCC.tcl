# Creating SmartDesign CCC
set sd_name {CCC}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_0_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_0} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {OUT0_FABCLK_0_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {OUT0_FABCLK_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {OUT1_FABCLK_0_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PLL_LOCK_0_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PLL_LOCK_0} -port_direction {OUT}



# Add PF_CCC_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_CCC_C0} -instance_name {PF_CCC_C0_0}



# Add PF_CCC_C1_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_CCC_C1} -instance_name {PF_CCC_C1_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_CCC_C1_0:OUT1_FABCLK_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"OUT0_FABCLK_0" "PF_CCC_C0_0:OUT0_FABCLK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"OUT0_FABCLK_0_0" "PF_CCC_C1_0:OUT0_FABCLK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"OUT1_FABCLK_0_0" "PF_CCC_C0_0:OUT1_FABCLK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CCC_C0_0:PLL_LOCK_0" "PLL_LOCK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CCC_C0_0:REF_CLK_0" "REF_CLK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CCC_C1_0:PLL_LOCK_0" "PLL_LOCK_0_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CCC_C1_0:REF_CLK_0" "REF_CLK_0_0" }



# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign CCC
generate_component -component_name ${sd_name}
