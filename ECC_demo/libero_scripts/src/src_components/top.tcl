# Creating SmartDesign top
set sd_name {top}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {DEVRST_N} -port_direction {IN} -port_is_pad {1}

# Add RCOSC_50MHZ_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {RCOSC_50MHZ} -instance_name {RCOSC_50MHZ_0}

# Add RTG4FCCC_0 instance
sd_instantiate_core -sd_name ${sd_name} -core_vlnv Actel:SgCore:RTG4FCCC:$RTG4FCCCver -instance_name {RTG4FCCC_0}
# Exporting Parameters of instance RTG4FCCC_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {RTG4FCCC_0} -params {\
"ADVANCED_TAB_CHANGED:true" \
"CLK0_IS_USED:false" \
"CLK0_PAD_IS_USED:false" \
"CLK1_IS_USED:false" \
"CLK1_PAD_IS_USED:false" \
"CLK2_IS_USED:false" \
"CLK2_PAD_IS_USED:false" \
"CLK3_IS_USED:false" \
"CLK3_PAD_IS_USED:false" \
"DYN_CONF_IS_USED:false" \
"ENABLE_AUTO_RESET_LOGIC:false" \
"EXPOSE_CGL_ENABLE_ARST_SIGNALS:false" \
"FAMILY:25" \
"GL0_BP_IN_0_FREQ:50.000" \
"GL0_BP_IN_0_SRC:OSC_50MHZ" \
"GL0_BP_IN_1_FREQ:100" \
"GL0_BP_IN_1_SRC:IO_HARDWIRED_0" \
"GL0_FREQUENCY_LOCKED:false" \
"GL0_IN_0_SRC:BYPASS" \
"GL0_IN_1_SRC:UNUSED" \
"GL0_IS_INVERTED:false" \
"GL0_IS_USED:true" \
"GL0_OUT_0_FREQ:50" \
"GL0_OUT_1_FREQ:50" \
"GL0_OUT_IS_GATED:false" \
"GL0_PLL_IN_0_PHASE:0" \
"GL0_PLL_IN_1_PHASE:0" \
"GL1_BP_IN_0_FREQ:100" \
"GL1_BP_IN_0_SRC:IO_HARDWIRED_0" \
"GL1_BP_IN_1_FREQ:100" \
"GL1_BP_IN_1_SRC:IO_HARDWIRED_0" \
"GL1_FREQUENCY_LOCKED:false" \
"GL1_IN_0_SRC:PLL" \
"GL1_IN_1_SRC:UNUSED" \
"GL1_IS_INVERTED:false" \
"GL1_IS_USED:false" \
"GL1_OUT_0_FREQ:100" \
"GL1_OUT_1_FREQ:50" \
"GL1_OUT_IS_GATED:false" \
"GL1_PLL_IN_0_PHASE:0" \
"GL1_PLL_IN_1_PHASE:0" \
"GL2_BP_IN_0_FREQ:100" \
"GL2_BP_IN_0_SRC:IO_HARDWIRED_0" \
"GL2_BP_IN_1_FREQ:100" \
"GL2_BP_IN_1_SRC:IO_HARDWIRED_0" \
"GL2_FREQUENCY_LOCKED:false" \
"GL2_IN_0_SRC:PLL" \
"GL2_IN_1_SRC:UNUSED" \
"GL2_IS_INVERTED:false" \
"GL2_IS_USED:false" \
"GL2_OUT_0_FREQ:100" \
"GL2_OUT_1_FREQ:50" \
"GL2_OUT_IS_GATED:false" \
"GL2_PLL_IN_0_PHASE:0" \
"GL2_PLL_IN_1_PHASE:0" \
"GL3_BP_IN_0_FREQ:100" \
"GL3_BP_IN_0_SRC:IO_HARDWIRED_0" \
"GL3_BP_IN_1_FREQ:100" \
"GL3_BP_IN_1_SRC:IO_HARDWIRED_0" \
"GL3_FREQUENCY_LOCKED:false" \
"GL3_IN_0_SRC:PLL" \
"GL3_IN_1_SRC:UNUSED" \
"GL3_IS_INVERTED:false" \
"GL3_IS_USED:false" \
"GL3_OUT_0_FREQ:100" \
"GL3_OUT_1_FREQ:50" \
"GL3_OUT_IS_GATED:false" \
"GL3_PLL_IN_0_PHASE:0" \
"GL3_PLL_IN_1_PHASE:0" \
"GPD0_IS_USED:false" \
"GPD0_NOPIPE_RSTSYNC:true" \
"GPD0_SYNC_STYLE:G3STYLE_AND_NO_LOCK_RSTSYNC" \
"GPD1_IS_USED:false" \
"GPD1_NOPIPE_RSTSYNC:true" \
"GPD1_SYNC_STYLE:G3STYLE_AND_NO_LOCK_RSTSYNC" \
"GPD2_IS_USED:false" \
"GPD2_NOPIPE_RSTSYNC:true" \
"GPD2_SYNC_STYLE:G3STYLE_AND_NO_LOCK_RSTSYNC" \
"GPD3_IS_USED:false" \
"GPD3_NOPIPE_RSTSYNC:true" \
"GPD3_SYNC_STYLE:G3STYLE_AND_NO_LOCK_RSTSYNC" \
"GPD_EXPOSE_RESETS:false" \
"GPD_SYNC_STYLE:G3STYLE_AND_NO_LOCK_RSTSYNC" \
"INCLUDE_RECONFIGURATION_LOGIC:true" \
"INIT:088101248000000B80404040664C993186186C730430" \
"IO_HARDWIRED_0_IS_DIFF:false" \
"IO_HARDWIRED_1_IS_DIFF:false" \
"IO_HARDWIRED_2_IS_DIFF:false" \
"IO_HARDWIRED_3_IS_DIFF:false" \
"MODE_10V:false" \
"NGMUX0_HOLD_IS_USED:false" \
"NGMUX1_HOLD_IS_USED:false" \
"NGMUX2_HOLD_IS_USED:false" \
"NGMUX3_HOLD_IS_USED:false" \
"NGMUX_EXPOSE_HOLD:false" \
"PLL_DELAY:0" \
"PLL_EXPOSE_BYPASS:false" \
"PLL_EXPOSE_READY_VDDPLL:false" \
"PLL_EXPOSE_RESETS:false" \
"PLL_EXT_FB_GL:EXT_FB_GL0" \
"PLL_FB_SRC:CCC_INTERNAL" \
"PLL_IN_FREQ:50.000" \
"PLL_IN_SRC:OSC_50MHZ" \
"PLL_IS_USED:false" \
"PLL_LOCK_IND:1024" \
"PLL_LOCK_WND:6000" \
"PLL_SSM_DEPTH:0.5" \
"PLL_SSM_ENABLE:false" \
"PLL_SSM_FREQ:40" \
"PLL_SUPPLY_VOLTAGE:25_V" \
"PLL_VCO_TARGET:700" \
"RCOSC_25_50MHZ_IS_USED:true" \
"RX0_RECOVERY_BLOCK_DATA:Unused-Unused" \
"RX0_RECOVERY_BLOCK_IS_USED:false" \
"RX0_RECOVERY_BLOCK_STROBE:Unused" \
"RX0_SPACE_WIRE_MODE_IS_USED:true" \
"RX1_RECOVERY_BLOCK_DATA:Unused-Unused" \
"RX1_RECOVERY_BLOCK_IS_USED:false" \
"RX1_RECOVERY_BLOCK_STROBE:Unused" \
"RX1_SPACE_WIRE_MODE_IS_USED:true" \
"SD_EXPORT_HIDDEN_PORTS:false" \
"VCOFREQUENCY:640.000" \
"Y0_IS_USED:false" \
"Y1_IS_USED:false" \
"Y2_IS_USED:false" \
"Y3_IS_USED:false" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {RTG4FCCC_0}

# Add RTG4FCCCECALIB_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {RTG4FCCCECALIB_C0} -instance_name {RTG4FCCCECALIB_C0_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {RTG4FCCCECALIB_C0_0:READY_VDDPLL} -value {VCC}

# Add SYSRESET_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {SYSRESET} -instance_name {SYSRESET_0}

# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"DEVRST_N" "SYSRESET_0:DEVRST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RCOSC_50MHZ_0:CLKOUT" "RTG4FCCCECALIB_C0_0:CCC_0_RCOSC_50MHZ" "RTG4FCCC_0:RCOSC_50MHZ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RTG4FCCCECALIB_C0_0:CCC_0_PLL_POWERDOWN_N" "RTG4FCCCECALIB_C0_0:PLL_RST_N" "SYSRESET_0:POWER_ON_RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RTG4FCCCECALIB_C0_0:CLK_50MHZ" "RTG4FCCC_0:GL0" }

# Temporarily mark pin unused
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {RTG4FCCCECALIB_C0_0:CCC_0_LOCK}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {RTG4FCCCECALIB_C0_0:CCC_0_GL0}

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign top
generate_component -component_name ${sd_name}

# Set top level module
build_design_hierarchy 
set_root -module {top::work} 
