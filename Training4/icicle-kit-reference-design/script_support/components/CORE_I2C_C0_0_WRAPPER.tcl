# Creating SmartDesign CORE_I2C_C0_0_WRAPPER
set sd_name {CORE_I2C_C0_0_WRAPPER}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBslave_PENABLE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBslave_PSEL} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBslave_PWRITE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PRESETN} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {INT} -port_direction {OUT}

sd_create_scalar_port -sd_name ${sd_name} -port_name {COREI2C_C0_SCL} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {COREI2C_C0_SDA} -port_direction {INOUT} -port_is_pad {1}

# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {APBslave_PADDR} -port_direction {IN} -port_range {[8:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APBslave_PWDATA} -port_direction {IN} -port_range {[7:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {APBslave_PRDATA} -port_direction {OUT} -port_range {[7:0]}


# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {APBslave} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {slave} -port_bif_mapping {\
"PADDR:APBslave_PADDR" \
"PSELx:APBslave_PSEL" \
"PENABLE:APBslave_PENABLE" \
"PWRITE:APBslave_PWRITE" \
"PRDATA:APBslave_PRDATA" \
"PWDATA:APBslave_PWDATA" } 

# Add COREI2C_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREI2C_C0} -instance_name {COREI2C_C0_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {COREI2C_C0_0:INT} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {COREI2C_C0_0:SCLI} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {COREI2C_C0_0:SCLO} -pin_slices {[0:0]}
sd_invert_pins -sd_name ${sd_name} -pin_names {COREI2C_C0_0:SCLO[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {COREI2C_C0_0:SDAI} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {COREI2C_C0_0:SDAO} -pin_slices {[0:0]}
sd_invert_pins -sd_name ${sd_name} -pin_names {COREI2C_C0_0:SDAO[0:0]}



# Add COREI2C_C0_0_SCL_BIBUF instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {COREI2C_C0_0_SCL_BIBUF}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {COREI2C_C0_0_SCL_BIBUF:D} -value {GND}



# Add COREI2C_C0_0_SDA_BIBUF instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {COREI2C_C0_0_SDA_BIBUF}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {COREI2C_C0_0_SDA_BIBUF:D} -value {GND}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREI2C_C0_0:INT[0:0]" "INT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREI2C_C0_0:PCLK" "PCLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREI2C_C0_0:PRESETN" "PRESETN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREI2C_C0_0:SCLI[0:0]" "COREI2C_C0_0_SCL_BIBUF:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREI2C_C0_0:SCLO[0:0]" "COREI2C_C0_0_SCL_BIBUF:E" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREI2C_C0_0:SDAI[0:0]" "COREI2C_C0_0_SDA_BIBUF:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREI2C_C0_0:SDAO[0:0]" "COREI2C_C0_0_SDA_BIBUF:E" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREI2C_C0_0_SCL_BIBUF:PAD" "COREI2C_C0_SCL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREI2C_C0_0_SDA_BIBUF:PAD" "COREI2C_C0_SDA" }


# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"APBslave" "COREI2C_C0_0:APBslave" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign CORE_I2C_C0_0_WRAPPER
generate_component -component_name ${sd_name}
