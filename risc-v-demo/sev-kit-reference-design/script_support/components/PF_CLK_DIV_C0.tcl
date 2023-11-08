# Exporting Component Description of PF_CLK_DIV_C0 to TCL
# Family: PolarFireSoC
# Part Number: MPFS250T-1FCG1152
# Create and Configure the core component PF_CLK_DIV_C0
create_and_configure_core -core_vlnv Actel:SgCore:PF_CLK_DIV:$PF_CLK_DIV_version -component_name {PF_CLK_DIV_C0} -params {\
"DIVIDER:2"  \
"ENABLE_BIT_SLIP:false"  \
"ENABLE_SRESET:false"   }
# Exporting Component Description of PF_CLK_DIV_C0 to TCL done
