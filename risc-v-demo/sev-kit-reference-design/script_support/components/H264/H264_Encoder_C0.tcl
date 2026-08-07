# Exporting Component Description of H264_Encoder_C0 to TCL
# Family: PolarFireSoC
# Part Number: MPFS250TS-1FCG1152I
# Create and Configure the core component H264_Encoder_C0
create_and_configure_core -core_vlnv Microchip:SolutionCore:H264_Encoder:$H264_Encoder_version -component_name {H264_Encoder_C0} -params {\
"G_4K_EN:0"  \
"G_16x16_INTRA_PRED:1"  \
"G_AXI4L:0"  \
"G_DDR_AXI_DW:512"  \
"G_FRM_GAP:1"  \
"G_HRES:1920"  \
"G_LINE_GAP:8192"  \
"G_P_CNT:16"  \
"G_P_FRM:0"  \
"G_QFACTOR:30"  \
"G_SKIP_TH:512"  \
"G_SLICES:1"  \
"G_VRES:1072"   }
# Exporting Component Description of H264_Encoder_C0 to TCL done
