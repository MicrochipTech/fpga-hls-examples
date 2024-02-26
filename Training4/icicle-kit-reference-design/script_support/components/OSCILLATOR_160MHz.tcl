# Exporting Component Description of OSCILLATOR_160MHz to TCL
# Family: PolarFireSoC
# Part Number: MPFS250T_ES-FCVG484E
# Create and Configure the core component OSCILLATOR_160MHz
create_and_configure_core -core_vlnv {Actel:SgCore:PF_OSC:*} -component_name {OSCILLATOR_160MHz} -params {\
"RCOSC_2MHZ_CLK_DIV_EN:false"  \
"RCOSC_2MHZ_GL_EN:false"  \
"RCOSC_2MHZ_NGMUX_EN:false"  \
"RCOSC_160MHZ_CLK_DIV_EN:true"  \
"RCOSC_160MHZ_GL_EN:true"  \
"RCOSC_160MHZ_NGMUX_EN:false"   }
# Exporting Component Description of OSCILLATOR_160MHz to TCL done
