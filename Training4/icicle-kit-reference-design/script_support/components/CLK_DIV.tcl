# Exporting Component Description of CLK_DIV to TCL
# Family: PolarFireSoC
# Part Number: MPFS250T_ES-FCVG484E
# Create and Configure the core component CLK_DIV
create_and_configure_core -core_vlnv {Actel:SgCore:PF_CLK_DIV:*} -component_name {CLK_DIV} -params {\
"DIVIDER:2"  \
"ENABLE_BIT_SLIP:false"  \
"ENABLE_SRESET:false"   }
# Exporting Component Description of CLK_DIV to TCL done
