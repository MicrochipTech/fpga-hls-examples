# Exporting Component Description of PF_TX_PLL_C0 to TCL
# Family: PolarFire
# Part Number: MPF300TS-1FCG1152I
# Create and Configure the core component PF_TX_PLL_C0
create_and_configure_core -core_vlnv Actel:SgCore:PF_TX_PLL:* -component_name {PF_TX_PLL_C0} -params {\
"CORE:PF_TX_PLL"  \
"INIT:0x0"  \
"TxPLL_AUX_LOW_SEL:true"  \
"TxPLL_AUX_OUT:125"  \
"TxPLL_BANDWIDTH:Low"  \
"TxPLL_CLK_125_EN:false"  \
"TxPLL_DYNAMIC_RECONFIG_INTERFACE_EN:false"  \
"TxPLL_EXT_WAVE_SEL:0"  \
"TxPLL_FAB_LOCK_EN:false"  \
"TxPLL_FAB_REF:200"  \
"TxPLL_INTEGER_MODE:false"  \
"TxPLL_JITTER_MODE_AT_POWERUP:true"  \
"TxPLL_JITTER_MODE_REFCLK_FREQ:125"  \
"TxPLL_JITTER_MODE_REFCLK_SEL:DEDICATED"  \
"TxPLL_JITTER_MODE_SEL:10G SyncE 32Bit"  \
"TxPLL_MODE:NORMAL"  \
"TxPLL_OUT:2970.000"  \
"TxPLL_REF:148.5"  \
"TxPLL_RN_FILTER:false"  \
"TxPLL_SOURCE:DEDICATED"  \
"TxPLL_SSM_DEPTH:0"  \
"TxPLL_SSM_DIVVAL:1"  \
"TxPLL_SSM_DOWN_SPREAD:false"  \
"TxPLL_SSM_FREQ:64"  \
"TxPLL_SSM_RAND_PATTERN:0"  \
"VCOFREQUENCY:1600"   }
# Exporting Component Description of PF_TX_PLL_C0 to TCL done
