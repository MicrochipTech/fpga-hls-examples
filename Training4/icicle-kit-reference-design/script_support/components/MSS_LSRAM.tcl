# Exporting Component Description of MSS_LSRAM to TCL
# Family: PolarFireSoC
# Part Number: MPFS250T_ES-FCVG484E
# Create and Configure the core component MSS_LSRAM
create_and_configure_core -core_vlnv {Actel:SystemBuilder:PF_SRAM_AHBL_AXI:*} -component_name {MSS_LSRAM} -params {\
"AXI4_AWIDTH:32" \
"AXI4_DWIDTH:64" \
"AXI4_IDWIDTH:8" \
"AXI4_IFTYPE_RD:T" \
"AXI4_IFTYPE_WR:T" \
"AXI4_WRAP_SUPPORT:F" \
"BYTEENABLES:1" \
"BYTE_ENABLE_WIDTH:8" \
"B_REN_POLARITY:2" \
"CASCADE:1" \
"ECC_OPTIONS:0" \
"FABRIC_INTERFACE_TYPE:1" \
"IMPORT_FILE:" \
"INIT_RAM:F" \
"LPM_HINT:0" \
"PIPELINE_OPTIONS:1" \
"RDEPTH:2048" \
"RWIDTH:80" \
"USE_NATIVE_INTERFACE:F" \
"WDEPTH:2048" \
"WWIDTH:80" }
# Exporting Component Description of MSS_LSRAM to TCL done
