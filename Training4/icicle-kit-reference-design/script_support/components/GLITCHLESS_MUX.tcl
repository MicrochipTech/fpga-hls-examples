# Exporting Component Description of GLITCHLESS_MUX to TCL
# Family: PolarFireSoC
# Part Number: MPFS250T_ES-FCVG484E
# Create and Configure the core component GLITCHLESS_MUX
create_and_configure_core -core_vlnv {Actel:SgCore:PF_NGMUX:*} -component_name {GLITCHLESS_MUX} -params {\
"ENABLE_NON_TOGGLING_CLK_SWITCH_SUPPORT:false"   }
# Exporting Component Description of GLITCHLESS_MUX to TCL done
