# Exporting Component Description of PF_OSC_C0 to TCL
# Family: PolarFireSoC
# Part Number: MPFS250T-1FCG1152
# Create and Configure the core component PF_OSC_C0
create_and_configure_core -core_vlnv Actel:SgCore:PF_OSC:$PF_OSC_version -component_name {PF_OSC_C0} -params {\
"RCOSC_2MHZ_CLK_DIV_EN:true"  \
"RCOSC_2MHZ_GL_EN:false"  \
"RCOSC_2MHZ_NGMUX_EN:false"  \
"RCOSC_160MHZ_CLK_DIV_EN:false"  \
"RCOSC_160MHZ_GL_EN:false"  \
"RCOSC_160MHZ_NGMUX_EN:false"   }
# Exporting Component Description of PF_OSC_C0 to TCL done
