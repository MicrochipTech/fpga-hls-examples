# Exporting Component Description of COREI2C_C0 to TCL
# Family: PolarFireSoC
# Part Number: MPFS250T_ES-FCVG484E
# Create and Configure the core component COREI2C_C0
create_and_configure_core -core_vlnv {Actel:DirectCore:COREI2C:7.2.101} -component_name {COREI2C_C0} -params {\
"ADD_SLAVE1_ADDRESS_EN:false"  \
"BAUD_RATE_FIXED:false"  \
"BAUD_RATE_VALUE:0"  \
"BCLK_ENABLED:false"  \
"FIXED_SLAVE0_ADDR_EN:false"  \
"FIXED_SLAVE0_ADDR_VALUE:0x0"  \
"FIXED_SLAVE1_ADDR_EN:false"  \
"FIXED_SLAVE1_ADDR_VALUE:0x0"  \
"FREQUENCY:30"  \
"GLITCHREG_NUM:3"  \
"I2C_NUM:1"  \
"IPMI_EN:false"  \
"OPERATING_MODE:0"  \
"SMB_EN:false"   }
# Exporting Component Description of COREI2C_C0 to TCL done
