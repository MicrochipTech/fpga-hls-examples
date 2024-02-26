# Creating SmartDesign FIC_3_ADDRESS_GENERATION
set sd_name {FIC_3_ADDRESS_GENERATION}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_MASTER_high_out_high_pready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_MASTER_high_out_high_pslverr} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_MMASTER_in_penable} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_MMASTER_in_psel} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_MMASTER_in_pwrite} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave0_PREADYS0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave0_PSLVERRS0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave15_PREADYS15} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave15_PSLVERRS15} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave16_PREADYS16} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave16_PSLVERRS16} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave1_PREADYS1} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave1_PSLVERRS1} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave2_PREADYS2} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave2_PSLVERRS2} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave3_PREADYS3} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave3_PSLVERRS3} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_3_0x4000_04xx_PREADYS4} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_3_0x4000_04xx_PSLVERRS4} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_MASTER_high_out_high_penable} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_MASTER_high_out_high_psel} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_MASTER_high_out_high_pwrite} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_MMASTER_in_pready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_MMASTER_in_pslverr} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave0_PENABLES} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave0_PSELS0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave0_PWRITES} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave15_PENABLES} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave15_PSELS15} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave15_PWRITES} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave16_PENABLES} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave16_PSELS16} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave16_PWRITES} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave1_PSELS1} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave2_PSELS2} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave3_PSELS3} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_3_0x4000_04xx_PSELS4} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {APB_MASTER_high_out_high_prdata} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APB_MMASTER_in_paddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APB_MMASTER_in_pwdata} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APBmslave0_PRDATAS0} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APBmslave15_PRDATAS15} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APBmslave16_PRDATAS16} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APBmslave1_PRDATAS1} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APBmslave2_PRDATAS2} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APBmslave3_PRDATAS3} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC_3_0x4000_04xx_PRDATAS4} -port_direction {IN} -port_range {[31:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {APB_MASTER_high_out_high_paddr} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APB_MASTER_high_out_high_pwdata} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APB_MMASTER_in_prdata} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APBmslave0_PADDRS} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APBmslave0_PWDATAS} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APBmslave15_PADDRS} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APBmslave15_PWDATAS} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APBmslave16_PADDRS} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APBmslave16_PWDATAS} -port_direction {OUT} -port_range {[31:0]}


# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {APB_MMASTER} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {mirroredMaster} -port_bif_mapping {\
"PADDR:APB_MMASTER_in_paddr" \
"PSELx:APB_MMASTER_in_psel" \
"PENABLE:APB_MMASTER_in_penable" \
"PWRITE:APB_MMASTER_in_pwrite" \
"PRDATA:APB_MMASTER_in_prdata" \
"PWDATA:APB_MMASTER_in_pwdata" \
"PREADY:APB_MMASTER_in_pready" \
"PSLVERR:APB_MMASTER_in_pslverr" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {FIC_3_0x5xxx_xxxx} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {master} -port_bif_mapping {\
"PADDR:APB_MASTER_high_out_high_paddr" \
"PSELx:APB_MASTER_high_out_high_psel" \
"PENABLE:APB_MASTER_high_out_high_penable" \
"PWRITE:APB_MASTER_high_out_high_pwrite" \
"PRDATA:APB_MASTER_high_out_high_prdata" \
"PWDATA:APB_MASTER_high_out_high_pwdata" \
"PREADY:APB_MASTER_high_out_high_pready" \
"PSLVERR:APB_MASTER_high_out_high_pslverr" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {FIC_3_0x4FFF_FFxx} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"PADDR:APBmslave15_PADDRS" \
"PSELx:APBmslave15_PSELS15" \
"PENABLE:APBmslave15_PENABLES" \
"PWRITE:APBmslave15_PWRITES" \
"PRDATA:APBmslave15_PRDATAS15" \
"PWDATA:APBmslave15_PWDATAS" \
"PREADY:APBmslave15_PREADYS15" \
"PSLVERR:APBmslave15_PSLVERRS15" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {FIC_3_0x43xx_xxxx_0x48xx_xxxx} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"PADDR:APBmslave16_PADDRS" \
"PSELx:APBmslave16_PSELS16" \
"PENABLE:APBmslave16_PENABLES" \
"PWRITE:APBmslave16_PWRITES" \
"PRDATA:APBmslave16_PRDATAS16" \
"PWDATA:APBmslave16_PWDATAS" \
"PREADY:APBmslave16_PREADYS16" \
"PSLVERR:APBmslave16_PSLVERRS16" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {FIC_3_0x4000_00xx} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"PADDR:APBmslave0_PADDRS" \
"PSELx:APBmslave0_PSELS0" \
"PENABLE:APBmslave0_PENABLES" \
"PWRITE:APBmslave0_PWRITES" \
"PRDATA:APBmslave0_PRDATAS0" \
"PWDATA:APBmslave0_PWDATAS" \
"PREADY:APBmslave0_PREADYS0" \
"PSLVERR:APBmslave0_PSLVERRS0" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {FIC_3_0x4000_01xx} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"PADDR:APBmslave0_PADDRS" \
"PSELx:APBmslave1_PSELS1" \
"PENABLE:APBmslave0_PENABLES" \
"PWRITE:APBmslave0_PWRITES" \
"PRDATA:APBmslave1_PRDATAS1" \
"PWDATA:APBmslave0_PWDATAS" \
"PREADY:APBmslave1_PREADYS1" \
"PSLVERR:APBmslave1_PSLVERRS1" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {FIC_3_0x4000_02xx} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"PADDR:APBmslave0_PADDRS" \
"PSELx:APBmslave2_PSELS2" \
"PENABLE:APBmslave0_PENABLES" \
"PWRITE:APBmslave0_PWRITES" \
"PRDATA:APBmslave2_PRDATAS2" \
"PWDATA:APBmslave0_PWDATAS" \
"PREADY:APBmslave2_PREADYS2" \
"PSLVERR:APBmslave2_PSLVERRS2" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {FIC_3_0x4000_03xx} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"PADDR:APBmslave0_PADDRS" \
"PSELx:APBmslave3_PSELS3" \
"PENABLE:APBmslave0_PENABLES" \
"PWRITE:APBmslave0_PWRITES" \
"PRDATA:APBmslave3_PRDATAS3" \
"PWDATA:APBmslave0_PWDATAS" \
"PREADY:APBmslave3_PREADYS3" \
"PSLVERR:APBmslave3_PSLVERRS3" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {FIC_3_0x4000_04xx} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"PADDR:APBmslave0_PADDRS" \
"PSELx:FIC_3_0x4000_04xx_PSELS4" \
"PENABLE:APBmslave0_PENABLES" \
"PWRITE:APBmslave0_PWRITES" \
"PRDATA:FIC_3_0x4000_04xx_PRDATAS4" \
"PWDATA:APBmslave0_PWDATAS" \
"PREADY:FIC_3_0x4000_04xx_PREADYS4" \
"PSLVERR:FIC_3_0x4000_04xx_PSLVERRS4" } 

# Add APB_ARBITER_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {APB_ARBITER} -instance_name {APB_ARBITER_0}
# Exporting Parameters of instance APB_ARBITER_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {APB_ARBITER_0} -params {\
"select_bit:28" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {APB_ARBITER_0}
sd_update_instance -sd_name ${sd_name} -instance_name {APB_ARBITER_0}



# Add APB_PASS_THROUGH_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {APB_PASS_THROUGH} -instance_name {APB_PASS_THROUGH_0}



# Add APB_PASS_THROUGH_1 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {APB_PASS_THROUGH} -instance_name {APB_PASS_THROUGH_1}



# Add FIC_3_0x4FFF_Fxxx_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {FIC_3_0x4FFF_Fxxx} -instance_name {FIC_3_0x4FFF_Fxxx_0}



# Add FIC_3_0x4xxx_xxxx_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {FIC_3_0x4xxx_xxxx} -instance_name {FIC_3_0x4xxx_xxxx_0}



# Add FIC_3_0x4000_0xxx_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {FIC_3_0x4000_0xxx} -instance_name {FIC_3_0x4000_0xxx_0}





# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_ARBITER_0:APB_MASTER_high" "FIC_3_0x5xxx_xxxx" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_ARBITER_0:APB_MASTER_low" "FIC_3_0x4xxx_xxxx_0:APB3mmaster" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_ARBITER_0:APB_MMASTER" "APB_MMASTER" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_PASS_THROUGH_0:APB_INITIATOR" "FIC_3_0x4000_0xxx_0:APB3mmaster" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_PASS_THROUGH_0:APB_TARGET" "FIC_3_0x4xxx_xxxx_0:APBmslave0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_PASS_THROUGH_1:APB_INITIATOR" "FIC_3_0x4FFF_Fxxx_0:APB3mmaster" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_PASS_THROUGH_1:APB_TARGET" "FIC_3_0x4xxx_xxxx_0:APBmslave15" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_3_0x4000_00xx" "FIC_3_0x4000_0xxx_0:APBmslave0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_3_0x4000_01xx" "FIC_3_0x4000_0xxx_0:APBmslave1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_3_0x4000_02xx" "FIC_3_0x4000_0xxx_0:APBmslave2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_3_0x4000_03xx" "FIC_3_0x4000_0xxx_0:APBmslave3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_3_0x4000_04xx" "FIC_3_0x4000_0xxx_0:APBmslave4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_3_0x43xx_xxxx_0x48xx_xxxx" "FIC_3_0x4xxx_xxxx_0:APBmslave16" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_3_0x4FFF_FFxx" "FIC_3_0x4FFF_Fxxx_0:APBmslave15" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign FIC_3_ADDRESS_GENERATION
generate_component -component_name ${sd_name}
