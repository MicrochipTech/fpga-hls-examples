# Exporting Component Description of RGBtoYCbCr_C0 to TCL
# Family: PolarFireSoC
# Part Number: MPFS250T-1FCG1152
# Create and Configure the core component RGBtoYCbCr_C0
create_and_configure_core -core_vlnv Microsemi:SolutionCore:RGBtoYCbCr:$RGBtoYCbCr_version -component_name {RGBtoYCbCr_C0} -params {\
"G_FORMAT:0"  \
"G_RGB_DATA_BIT_WIDTH:8"  \
"G_YCbCr_DATA_BIT_WIDTH:8"  \
"G_YCbCr_FORMAT:2"   }
# Exporting Component Description of RGBtoYCbCr_C0 to TCL done
