# Creating SmartDesign PROC_SUBSYSTEM
set sd_name {PROC_SUBSYSTEM}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PREADYS9} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PSLVERRS9} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TCK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TDI} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TMS} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TRSTB} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {reset} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_CLK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_Reset} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM1_RST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM2_RST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_OUT} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_RST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PENABLES} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PSELS9} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PWRITES} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TDO} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TRNG_RST_N} -port_direction {OUT}

sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM1_SCL} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM1_SDA} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM2_SCL} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM2_SDA} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_SCL} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_SDA} -port_direction {INOUT} -port_is_pad {1}

# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {PRDATAS9} -port_direction {IN} -port_range {[31:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {GPIO_OUT_0} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PADDRS} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PWDATAS} -port_direction {OUT} -port_range {[31:0]}


# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {APBmslave9} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"PADDR:PADDRS" \
"PSELx:PSELS9" \
"PENABLE:PENABLES" \
"PWRITE:PWRITES" \
"PRDATA:PRDATAS9" \
"PWDATA:PWDATAS" \
"PREADY:PREADYS9" \
"PSLVERR:PSLVERRS9" } 

# Add BIBUF_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BIBUF_0:D} -value {GND}



# Add BIBUF_1 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_1}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BIBUF_1:D} -value {GND}



# Add BIBUF_2 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_2}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BIBUF_2:D} -value {GND}



# Add BIBUF_3 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_3}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BIBUF_3:D} -value {GND}



# Add BIBUF_4 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_4}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BIBUF_4:D} -value {GND}



# Add BIBUF_5 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_5}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BIBUF_5:D} -value {GND}



# Add CoreAHBLite_0 instance
sd_instantiate_core -sd_name ${sd_name} -core_vlnv {Actel:DirectCore:CoreAHBLite:5.4.102} -instance_name {CoreAHBLite_0}
# Exporting Parameters of instance CoreAHBLite_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {CoreAHBLite_0} -params {\
"FAMILY:26" \
"HADDR_SHG_CFG:1" \
"M0_AHBSLOT0ENABLE:false" \
"M0_AHBSLOT1ENABLE:false" \
"M0_AHBSLOT2ENABLE:false" \
"M0_AHBSLOT3ENABLE:false" \
"M0_AHBSLOT4ENABLE:false" \
"M0_AHBSLOT5ENABLE:false" \
"M0_AHBSLOT6ENABLE:false" \
"M0_AHBSLOT7ENABLE:true" \
"M0_AHBSLOT8ENABLE:false" \
"M0_AHBSLOT9ENABLE:false" \
"M0_AHBSLOT10ENABLE:false" \
"M0_AHBSLOT11ENABLE:false" \
"M0_AHBSLOT12ENABLE:false" \
"M0_AHBSLOT13ENABLE:false" \
"M0_AHBSLOT14ENABLE:false" \
"M0_AHBSLOT15ENABLE:false" \
"M0_AHBSLOT16ENABLE:false" \
"M1_AHBSLOT0ENABLE:false" \
"M1_AHBSLOT1ENABLE:false" \
"M1_AHBSLOT2ENABLE:false" \
"M1_AHBSLOT3ENABLE:false" \
"M1_AHBSLOT4ENABLE:false" \
"M1_AHBSLOT5ENABLE:false" \
"M1_AHBSLOT6ENABLE:false" \
"M1_AHBSLOT7ENABLE:false" \
"M1_AHBSLOT8ENABLE:false" \
"M1_AHBSLOT9ENABLE:false" \
"M1_AHBSLOT10ENABLE:false" \
"M1_AHBSLOT11ENABLE:false" \
"M1_AHBSLOT12ENABLE:false" \
"M1_AHBSLOT13ENABLE:false" \
"M1_AHBSLOT14ENABLE:false" \
"M1_AHBSLOT15ENABLE:false" \
"M1_AHBSLOT16ENABLE:false" \
"M2_AHBSLOT0ENABLE:false" \
"M2_AHBSLOT1ENABLE:false" \
"M2_AHBSLOT2ENABLE:false" \
"M2_AHBSLOT3ENABLE:false" \
"M2_AHBSLOT4ENABLE:false" \
"M2_AHBSLOT5ENABLE:false" \
"M2_AHBSLOT6ENABLE:false" \
"M2_AHBSLOT7ENABLE:false" \
"M2_AHBSLOT8ENABLE:false" \
"M2_AHBSLOT9ENABLE:false" \
"M2_AHBSLOT10ENABLE:false" \
"M2_AHBSLOT11ENABLE:false" \
"M2_AHBSLOT12ENABLE:false" \
"M2_AHBSLOT13ENABLE:false" \
"M2_AHBSLOT14ENABLE:false" \
"M2_AHBSLOT15ENABLE:false" \
"M2_AHBSLOT16ENABLE:false" \
"M3_AHBSLOT0ENABLE:false" \
"M3_AHBSLOT1ENABLE:false" \
"M3_AHBSLOT2ENABLE:false" \
"M3_AHBSLOT3ENABLE:false" \
"M3_AHBSLOT4ENABLE:false" \
"M3_AHBSLOT5ENABLE:false" \
"M3_AHBSLOT6ENABLE:false" \
"M3_AHBSLOT7ENABLE:false" \
"M3_AHBSLOT8ENABLE:false" \
"M3_AHBSLOT9ENABLE:false" \
"M3_AHBSLOT10ENABLE:false" \
"M3_AHBSLOT11ENABLE:false" \
"M3_AHBSLOT12ENABLE:false" \
"M3_AHBSLOT13ENABLE:false" \
"M3_AHBSLOT14ENABLE:false" \
"M3_AHBSLOT15ENABLE:false" \
"M3_AHBSLOT16ENABLE:false" \
"MASTER0_INTERFACE:1" \
"MASTER1_INTERFACE:1" \
"MASTER2_INTERFACE:1" \
"MASTER3_INTERFACE:1" \
"MEMSPACE:1" \
"SC_0:false" \
"SC_1:false" \
"SC_2:false" \
"SC_3:false" \
"SC_4:false" \
"SC_5:false" \
"SC_6:false" \
"SC_7:false" \
"SC_8:false" \
"SC_9:false" \
"SC_10:false" \
"SC_11:false" \
"SC_12:false" \
"SC_13:false" \
"SC_14:false" \
"SC_15:false" \
"SLAVE0_INTERFACE:1" \
"SLAVE1_INTERFACE:1" \
"SLAVE2_INTERFACE:1" \
"SLAVE3_INTERFACE:1" \
"SLAVE4_INTERFACE:1" \
"SLAVE5_INTERFACE:1" \
"SLAVE6_INTERFACE:1" \
"SLAVE7_INTERFACE:1" \
"SLAVE8_INTERFACE:1" \
"SLAVE9_INTERFACE:1" \
"SLAVE10_INTERFACE:1" \
"SLAVE11_INTERFACE:1" \
"SLAVE12_INTERFACE:1" \
"SLAVE13_INTERFACE:1" \
"SLAVE14_INTERFACE:1" \
"SLAVE15_INTERFACE:1" \
"SLAVE16_INTERFACE:1" \
"testbench:User" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {CoreAHBLite_0}



# Add CoreAHBLite_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreAHBLite_C0} -instance_name {CoreAHBLite_C0_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CoreAHBLite_C0_0:REMAP_M0} -value {GND}



# Add COREAHBTOAPB3_0 instance
sd_instantiate_core -sd_name ${sd_name} -core_vlnv Actel:DirectCore:COREAHBTOAPB3:$COREAHBTOAPB3_version -instance_name {COREAHBTOAPB3_0}
# Exporting Parameters of instance COREAHBTOAPB3_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {COREAHBTOAPB3_0} -params {\
"FAMILY:15" \
"HDL_license:O" \
"testbench:User" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {COREAHBTOAPB3_0}



# Add CoreAPB3_0 instance
sd_instantiate_core -sd_name ${sd_name} -core_vlnv Actel:DirectCore:CoreAPB3:$CoreAPB3_version -instance_name {CoreAPB3_0}
# Exporting Parameters of instance CoreAPB3_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {CoreAPB3_0} -params {\
"APB_DWIDTH:32" \
"APBSLOT0ENABLE:false" \
"APBSLOT1ENABLE:true" \
"APBSLOT2ENABLE:true" \
"APBSLOT3ENABLE:true" \
"APBSLOT4ENABLE:true" \
"APBSLOT5ENABLE:true" \
"APBSLOT6ENABLE:true" \
"APBSLOT7ENABLE:true" \
"APBSLOT8ENABLE:true" \
"APBSLOT9ENABLE:true" \
"APBSLOT10ENABLE:false" \
"APBSLOT11ENABLE:false" \
"APBSLOT12ENABLE:false" \
"APBSLOT13ENABLE:false" \
"APBSLOT14ENABLE:false" \
"APBSLOT15ENABLE:false" \
"FAMILY:15" \
"HDL_license:U" \
"IADDR_OPTION:0" \
"MADDR_BITS:16" \
"SC_0:false" \
"SC_1:false" \
"SC_2:false" \
"SC_3:false" \
"SC_4:false" \
"SC_5:false" \
"SC_6:false" \
"SC_7:false" \
"SC_8:false" \
"SC_9:false" \
"SC_10:false" \
"SC_11:false" \
"SC_12:false" \
"SC_13:false" \
"SC_14:false" \
"SC_15:false" \
"testbench:User" \
"UPR_NIBBLE_POSN:6" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {CoreAPB3_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreAPB3_0:APBmslave1}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreAPB3_0:APBmslave2}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreAPB3_0:APBmslave3}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreAPB3_0:APBmslave6}



# Add CoreGPIO_OUT instance
sd_instantiate_core -sd_name ${sd_name} -core_vlnv Actel:DirectCore:CoreGPIO:$CoreGPIO_version -instance_name {CoreGPIO_OUT}
# Exporting Parameters of instance CoreGPIO_OUT
sd_configure_core_instance -sd_name ${sd_name} -instance_name {CoreGPIO_OUT} -params {\
"APB_WIDTH:32" \
"FIXED_CONFIG_0:true" \
"FIXED_CONFIG_1:true" \
"FIXED_CONFIG_2:true" \
"FIXED_CONFIG_3:true" \
"FIXED_CONFIG_4:true" \
"FIXED_CONFIG_5:true" \
"FIXED_CONFIG_6:true" \
"FIXED_CONFIG_7:true" \
"FIXED_CONFIG_8:true" \
"FIXED_CONFIG_9:true" \
"FIXED_CONFIG_10:true" \
"FIXED_CONFIG_11:true" \
"FIXED_CONFIG_12:true" \
"FIXED_CONFIG_13:true" \
"FIXED_CONFIG_14:true" \
"FIXED_CONFIG_15:true" \
"FIXED_CONFIG_16:true" \
"FIXED_CONFIG_17:true" \
"FIXED_CONFIG_18:true" \
"FIXED_CONFIG_19:true" \
"FIXED_CONFIG_20:true" \
"FIXED_CONFIG_21:true" \
"FIXED_CONFIG_22:true" \
"FIXED_CONFIG_23:true" \
"FIXED_CONFIG_24:true" \
"FIXED_CONFIG_25:true" \
"FIXED_CONFIG_26:true" \
"FIXED_CONFIG_27:true" \
"FIXED_CONFIG_28:true" \
"FIXED_CONFIG_29:true" \
"FIXED_CONFIG_30:true" \
"FIXED_CONFIG_31:true" \
"INT_BUS:0" \
"IO_INT_TYPE_0:7" \
"IO_INT_TYPE_1:7" \
"IO_INT_TYPE_2:7" \
"IO_INT_TYPE_3:7" \
"IO_INT_TYPE_4:7" \
"IO_INT_TYPE_5:7" \
"IO_INT_TYPE_6:7" \
"IO_INT_TYPE_7:7" \
"IO_INT_TYPE_8:7" \
"IO_INT_TYPE_9:7" \
"IO_INT_TYPE_10:7" \
"IO_INT_TYPE_11:7" \
"IO_INT_TYPE_12:7" \
"IO_INT_TYPE_13:7" \
"IO_INT_TYPE_14:7" \
"IO_INT_TYPE_15:7" \
"IO_INT_TYPE_16:7" \
"IO_INT_TYPE_17:7" \
"IO_INT_TYPE_18:7" \
"IO_INT_TYPE_19:7" \
"IO_INT_TYPE_20:7" \
"IO_INT_TYPE_21:7" \
"IO_INT_TYPE_22:7" \
"IO_INT_TYPE_23:7" \
"IO_INT_TYPE_24:7" \
"IO_INT_TYPE_25:7" \
"IO_INT_TYPE_26:7" \
"IO_INT_TYPE_27:7" \
"IO_INT_TYPE_28:7" \
"IO_INT_TYPE_29:7" \
"IO_INT_TYPE_30:7" \
"IO_INT_TYPE_31:7" \
"IO_NUM:32" \
"IO_TYPE_0:1" \
"IO_TYPE_1:1" \
"IO_TYPE_2:1" \
"IO_TYPE_3:1" \
"IO_TYPE_4:1" \
"IO_TYPE_5:1" \
"IO_TYPE_6:1" \
"IO_TYPE_7:1" \
"IO_TYPE_8:1" \
"IO_TYPE_9:1" \
"IO_TYPE_10:1" \
"IO_TYPE_11:1" \
"IO_TYPE_12:1" \
"IO_TYPE_13:1" \
"IO_TYPE_14:1" \
"IO_TYPE_15:1" \
"IO_TYPE_16:1" \
"IO_TYPE_17:1" \
"IO_TYPE_18:1" \
"IO_TYPE_19:1" \
"IO_TYPE_20:1" \
"IO_TYPE_21:1" \
"IO_TYPE_22:1" \
"IO_TYPE_23:1" \
"IO_TYPE_24:1" \
"IO_TYPE_25:1" \
"IO_TYPE_26:1" \
"IO_TYPE_27:1" \
"IO_TYPE_28:1" \
"IO_TYPE_29:1" \
"IO_TYPE_30:1" \
"IO_TYPE_31:1" \
"IO_VAL_0:0" \
"IO_VAL_1:0" \
"IO_VAL_2:0" \
"IO_VAL_3:0" \
"IO_VAL_4:0" \
"IO_VAL_5:0" \
"IO_VAL_6:0" \
"IO_VAL_7:0" \
"IO_VAL_8:0" \
"IO_VAL_9:0" \
"IO_VAL_10:0" \
"IO_VAL_11:0" \
"IO_VAL_12:0" \
"IO_VAL_13:0" \
"IO_VAL_14:0" \
"IO_VAL_15:0" \
"IO_VAL_16:0" \
"IO_VAL_17:0" \
"IO_VAL_18:0" \
"IO_VAL_19:0" \
"IO_VAL_20:0" \
"IO_VAL_21:0" \
"IO_VAL_22:0" \
"IO_VAL_23:0" \
"IO_VAL_24:0" \
"IO_VAL_25:0" \
"IO_VAL_26:0" \
"IO_VAL_27:0" \
"IO_VAL_28:0" \
"IO_VAL_29:0" \
"IO_VAL_30:0" \
"IO_VAL_31:0" \
"OE_TYPE:1" \
"testbench:User" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {CoreGPIO_OUT}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_OUT:GPIO_OUT} -pin_slices {[31:10]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreGPIO_OUT:GPIO_OUT[31:10]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_OUT:GPIO_OUT} -pin_slices {[3:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_OUT:GPIO_OUT} -pin_slices {[4:4]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_OUT:GPIO_OUT} -pin_slices {[6:5]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreGPIO_OUT:GPIO_OUT[6:5]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_OUT:GPIO_OUT} -pin_slices {[7:7]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_OUT:GPIO_OUT} -pin_slices {[8:8]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_OUT:GPIO_OUT} -pin_slices {[9:9]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreGPIO_OUT:INT}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CoreGPIO_OUT:GPIO_IN} -value {GND}



# Add COREI2C_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREI2C_C0} -instance_name {COREI2C_C0_0}



# Add COREI2C_C0_1 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREI2C_C0} -instance_name {COREI2C_C0_1}



# Add COREI2C_C0_2 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREI2C_C0} -instance_name {COREI2C_C0_2}



# Add COREJTAGDEBUG_0 instance
sd_instantiate_core -sd_name ${sd_name} -core_vlnv Actel:DirectCore:COREJTAGDEBUG:$COREJTAGDEBUG_version -instance_name {COREJTAGDEBUG_0}
# Exporting Parameters of instance COREJTAGDEBUG_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {COREJTAGDEBUG_0} -params {\
"FAMILY:26" \
"IR_CODE_TGT_0:0x55" \
"IR_CODE_TGT_1:0x56" \
"IR_CODE_TGT_2:0x57" \
"IR_CODE_TGT_3:0x58" \
"IR_CODE_TGT_4:0x59" \
"IR_CODE_TGT_5:0x5a" \
"IR_CODE_TGT_6:0x5b" \
"IR_CODE_TGT_7:0x5c" \
"IR_CODE_TGT_8:0x5d" \
"IR_CODE_TGT_9:0x5e" \
"IR_CODE_TGT_10:0x5f" \
"IR_CODE_TGT_11:0x60" \
"IR_CODE_TGT_12:0x61" \
"IR_CODE_TGT_13:0x62" \
"IR_CODE_TGT_14:0x63" \
"IR_CODE_TGT_15:0x64" \
"NUM_DEBUG_TGTS:1" \
"Testbench:User" \
"TGT_ACTIVE_HIGH_RESET_0:true" \
"TGT_ACTIVE_HIGH_RESET_1:true" \
"TGT_ACTIVE_HIGH_RESET_2:true" \
"TGT_ACTIVE_HIGH_RESET_3:true" \
"TGT_ACTIVE_HIGH_RESET_4:true" \
"TGT_ACTIVE_HIGH_RESET_5:true" \
"TGT_ACTIVE_HIGH_RESET_6:true" \
"TGT_ACTIVE_HIGH_RESET_7:true" \
"TGT_ACTIVE_HIGH_RESET_8:true" \
"TGT_ACTIVE_HIGH_RESET_9:true" \
"TGT_ACTIVE_HIGH_RESET_10:true" \
"TGT_ACTIVE_HIGH_RESET_11:true" \
"TGT_ACTIVE_HIGH_RESET_12:true" \
"TGT_ACTIVE_HIGH_RESET_13:true" \
"TGT_ACTIVE_HIGH_RESET_14:true" \
"TGT_ACTIVE_HIGH_RESET_15:true" \
"UJTAG_BYPASS:false" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {COREJTAGDEBUG_0}



# Add INV_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {INV} -instance_name {INV_0}



# Add INV_1 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {INV} -instance_name {INV_1}



# Add INV_2 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {INV} -instance_name {INV_2}



# Add INV_3 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {INV} -instance_name {INV_3}



# Add INV_4 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {INV} -instance_name {INV_4}



# Add INV_5 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {INV} -instance_name {INV_5}



# Add MIV_RV32IMA_L1_AHB_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {MIV_RV32IMA_L1_AHB_C0} -instance_name {MIV_RV32IMA_L1_AHB_C0_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32IMA_L1_AHB_C0_0:IRQ} -pin_slices {[26:0]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MIV_RV32IMA_L1_AHB_C0_0:IRQ[26:0]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32IMA_L1_AHB_C0_0:IRQ} -pin_slices {[27:27]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32IMA_L1_AHB_C0_0:IRQ} -pin_slices {[28:28]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32IMA_L1_AHB_C0_0:IRQ} -pin_slices {[29:29]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32IMA_L1_AHB_C0_0:IRQ} -pin_slices {[30:30]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MIV_RV32IMA_L1_AHB_C0_0:IRQ[30:30]} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MIV_RV32IMA_L1_AHB_C0_0:AHB_MST_MEM_HSEL}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MIV_RV32IMA_L1_AHB_C0_0:AHB_MST_MMIO_HSEL}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MIV_RV32IMA_L1_AHB_C0_0:EXT_RESETN}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MIV_RV32IMA_L1_AHB_C0_0:DRV_TDO}



# Add PF_SRAM_AHBL_AXI_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_SRAM_AHBL_AXI_C0} -instance_name {PF_SRAM_AHBL_AXI_C0_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_CLK" "COREAHBTOAPB3_0:HCLK" "COREI2C_C0_0:BCLK" "COREI2C_C0_0:PCLK" "COREI2C_C0_1:BCLK" "COREI2C_C0_1:PCLK" "COREI2C_C0_2:BCLK" "COREI2C_C0_2:PCLK" "CoreAHBLite_0:HCLK" "CoreAHBLite_C0_0:HCLK" "CoreGPIO_OUT:PCLK" "MIV_RV32IMA_L1_AHB_C0_0:CLK" "PCLK" "PF_SRAM_AHBL_AXI_C0_0:HCLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_Reset" "COREAHBTOAPB3_0:HRESETN" "COREI2C_C0_0:PRESETN" "COREI2C_C0_1:PRESETN" "COREI2C_C0_2:PRESETN" "CoreAHBLite_0:HRESETN" "CoreAHBLite_C0_0:HRESETN" "CoreGPIO_OUT:PRESETN" "HDMI_RST" "MIV_RV32IMA_L1_AHB_C0_0:RESETN" "PF_SRAM_AHBL_AXI_C0_0:HRESETN" "reset" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_0:E" "INV_0:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_0:PAD" "CAM1_SCL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_0:Y" "COREI2C_C0_2:SCLI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_1:E" "INV_1:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_1:PAD" "CAM1_SDA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_1:Y" "COREI2C_C0_2:SDAI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_2:E" "INV_2:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_2:PAD" "HDMI_SCL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_2:Y" "COREI2C_C0_1:SCLI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_3:E" "INV_3:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_3:PAD" "HDMI_SDA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_3:Y" "COREI2C_C0_1:SDAI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_4:E" "INV_4:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_4:PAD" "CAM2_SCL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_4:Y" "COREI2C_C0_0:SCLI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_5:E" "INV_5:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_5:PAD" "CAM2_SDA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_5:Y" "COREI2C_C0_0:SDAI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_RST" "CoreGPIO_OUT:GPIO_OUT[8:8]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM2_RST" "CoreGPIO_OUT:GPIO_OUT[7:7]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREI2C_C0_0:INT" "MIV_RV32IMA_L1_AHB_C0_0:IRQ[29:29]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREI2C_C0_0:SCLO" "INV_4:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREI2C_C0_0:SDAO" "INV_5:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREI2C_C0_1:INT" "MIV_RV32IMA_L1_AHB_C0_0:IRQ[27:27]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREI2C_C0_1:SCLO" "INV_2:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREI2C_C0_1:SDAO" "INV_3:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREI2C_C0_2:INT" "MIV_RV32IMA_L1_AHB_C0_0:IRQ[28:28]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREI2C_C0_2:SCLO" "INV_0:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREI2C_C0_2:SDAO" "INV_1:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_0:TCK" "TCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_0:TDI" "TDI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_0:TDO" "TDO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_0:TGT_TCK_0" "MIV_RV32IMA_L1_AHB_C0_0:TCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_0:TGT_TDI_0" "MIV_RV32IMA_L1_AHB_C0_0:TDI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_0:TGT_TDO_0" "MIV_RV32IMA_L1_AHB_C0_0:TDO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_0:TGT_TMS_0" "MIV_RV32IMA_L1_AHB_C0_0:TMS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_0:TGT_TRSTB_0" "MIV_RV32IMA_L1_AHB_C0_0:TRST" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_0:TMS" "TMS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_0:TRSTB" "TRSTB" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_OUT:GPIO_OUT[4:4]" "TRNG_RST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_OUT:GPIO_OUT[9:9]" "GPIO_OUT" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_OUT:GPIO_OUT[3:0]" "GPIO_OUT_0" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"APBmslave9" "CoreAPB3_0:APBmslave9" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAHBTOAPB3_0:AHBslave" "CoreAHBLite_0:AHBmslave7" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAHBTOAPB3_0:APBmaster" "CoreAPB3_0:APB3mmaster" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREI2C_C0_0:APBslave" "CoreAPB3_0:APBmslave4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREI2C_C0_1:APBslave" "CoreAPB3_0:APBmslave8" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREI2C_C0_2:APBslave" "CoreAPB3_0:APBmslave7" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAHBLite_0:AHBmmaster0" "MIV_RV32IMA_L1_AHB_C0_0:AHB_MST_MMIO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAHBLite_C0_0:AHBmmaster0" "MIV_RV32IMA_L1_AHB_C0_0:AHB_MST_MEM" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAHBLite_C0_0:AHBmslave16" "PF_SRAM_AHBL_AXI_C0_0:AHBSlaveInterface" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_0:APBmslave5" "CoreGPIO_OUT:APB_bif" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign PROC_SUBSYSTEM
generate_component -component_name ${sd_name}
