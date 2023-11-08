# Creating SmartDesign FIC_CONVERTER
set sd_name {FIC_CONVERTER}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC3_APB3_master_PENABLE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC3_APB3_master_PSEL} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC3_APB3_master_PWRITE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PREADYS1} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PSLVERRS1} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC3_APB3_master_PREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC3_APB3_master_PSLVERR} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PENABLES} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PSELS1} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PWRITES} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC3_APB3_master_PADDR} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC3_APB3_master_PWDATA} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PRDATAS1} -port_direction {IN} -port_range {[31:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {FIC3_APB3_master_PRDATA} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PADDRS} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PWDATAS} -port_direction {OUT} -port_range {[31:0]}


# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {APBmslave} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"PADDR:PADDRS" \
"PSELx:PSELS1" \
"PENABLE:PENABLES" \
"PWRITE:PWRITES" \
"PRDATA:PRDATAS1" \
"PWDATA:PWDATAS" \
"PREADY:PREADYS1" \
"PSLVERR:PSLVERRS1" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {FIC3_APB3_master} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {mirroredMaster} -port_bif_mapping {\
"PADDR:FIC3_APB3_master_PADDR" \
"PSELx:FIC3_APB3_master_PSEL" \
"PENABLE:FIC3_APB3_master_PENABLE" \
"PWRITE:FIC3_APB3_master_PWRITE" \
"PRDATA:FIC3_APB3_master_PRDATA" \
"PWDATA:FIC3_APB3_master_PWDATA" \
"PREADY:FIC3_APB3_master_PREADY" \
"PSLVERR:FIC3_APB3_master_PSLVERR" } 

# Add CoreAPB3_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreAPB3_C0} -instance_name {CoreAPB3_C0_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreAPB3_C0_0:APBmslave0}





# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"APBmslave" "CoreAPB3_C0_0:APBmslave1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_C0_0:APB3mmaster" "FIC3_APB3_master" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign FIC_CONVERTER
generate_component -component_name ${sd_name}
