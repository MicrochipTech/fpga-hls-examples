# Creating SmartDesign Disp_controller
set sd_name {Disp_controller}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {EXT_SYNC_SIGNAL_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESETN_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SYS_CLK_I} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {DATA_ENABLE_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DATA_TRIGGER_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FRAME_END_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {H_SYNC_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {V_SYNC_O} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {H_RES_O} -port_direction {OUT} -port_range {[15:0]}


# Add Display_Controller_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Display_Controller_C0} -instance_name {Display_Controller_C0_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Display_Controller_C0_0:ENABLE_I} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Display_Controller_C0_0:ENABLE_EXT_SYNC_I} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Display_Controller_C0_0:H_ACTIVE_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Display_Controller_C0_0:V_ACTIVE_O}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"DATA_ENABLE_O" "Display_Controller_C0_0:DATA_ENABLE_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DATA_TRIGGER_O" "Display_Controller_C0_0:DATA_TRIGGER_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Display_Controller_C0_0:EXT_SYNC_SIGNAL_I" "EXT_SYNC_SIGNAL_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Display_Controller_C0_0:FRAME_END_O" "FRAME_END_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Display_Controller_C0_0:H_SYNC_O" "H_SYNC_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Display_Controller_C0_0:RESETN_I" "RESETN_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Display_Controller_C0_0:SYS_CLK_I" "SYS_CLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Display_Controller_C0_0:V_SYNC_O" "V_SYNC_O" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"Display_Controller_C0_0:H_RES_O" "H_RES_O" }


# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign Disp_controller
generate_component -component_name ${sd_name}
