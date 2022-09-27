# Exporting Component Description of MIV_RV32IMA_L1_AHB_C0 to TCL
# Family: PolarFire
# Part Number: MPF300TS-1FCG1152I
# Create and Configure the core component MIV_RV32IMA_L1_AHB_C0
create_and_configure_core -core_vlnv Microsemi:MiV:MIV_RV32IMA_L1_AHB:$MIV_RV32IMA_L1_AHB_version -component_name {MIV_RV32IMA_L1_AHB_C0} -params {\
"ECC_EN:false"  \
"EXT_HALT:false"  \
"RESET_VECTOR_ADDR_0:0x0"  \
"RESET_VECTOR_ADDR_1:0x8000"   }
# Exporting Component Description of MIV_RV32IMA_L1_AHB_C0 to TCL done
