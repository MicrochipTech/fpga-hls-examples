# Creating SmartDesign Video_Pipeline
set sd_name {Video_Pipeline}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM1_RX_CLK_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM1_RX_CLK_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CLK_125MHz_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CLK_50MHz_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {INIT_DONE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LPDDR4_RDY_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESETN_125MHz_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESETN_50MHz_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {arready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {awready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {bvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {penable_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {psel_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {pwrite_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {rlast} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {rvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {wready} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {arvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {awvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {bready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {frm_interrupt_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {pready_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {pslverr_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {rready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {wlast} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {wvalid} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {CAM1_RXD_N} -port_direction {IN} -port_range {[3:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {CAM1_RXD} -port_direction {IN} -port_range {[3:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {bid} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {bresp} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {paddr_i} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {pwdata_i} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {rdata} -port_direction {IN} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {rid} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {rresp} -port_direction {IN} -port_range {[1:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {araddr} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {arburst} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {arcache} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {arid} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {arlen} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {arlock} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {arprot} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {arsize} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {awaddr} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {awburst} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {awcache} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {awid} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {awlen} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {awlock} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {awprot} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {awsize} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {prdata_o} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {wdata} -port_direction {OUT} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {wstrb} -port_direction {OUT} -port_range {[63:0]}


# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {APBslave} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {slave} -port_bif_mapping {\
"PADDR:paddr_i" \
"PSELx:psel_i" \
"PENABLE:penable_i" \
"PWRITE:pwrite_i" \
"PRDATA:prdata_o" \
"PWDATA:pwdata_i" \
"PREADY:pready_o" \
"PSLVERR:pslverr_o" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {BIF_1} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"AWID:awid" \
"AWADDR:awaddr" \
"AWLEN:awlen" \
"AWSIZE:awsize" \
"AWBURST:awburst" \
"AWLOCK:awlock" \
"AWCACHE:awcache" \
"AWPROT:awprot" \
"AWVALID:awvalid" \
"AWREADY:awready" \
"WDATA:wdata" \
"WSTRB:wstrb" \
"WLAST:wlast" \
"WVALID:wvalid" \
"WREADY:wready" \
"BID:bid" \
"BRESP:bresp" \
"BVALID:bvalid" \
"BREADY:bready" \
"ARID:arid" \
"ARADDR:araddr" \
"ARLEN:arlen" \
"ARSIZE:arsize" \
"ARBURST:arburst" \
"ARLOCK:arlock" \
"ARCACHE:arcache" \
"ARPROT:arprot" \
"ARVALID:arvalid" \
"ARREADY:arready" \
"RID:rid" \
"RDATA:rdata" \
"RRESP:rresp" \
"RLAST:rlast" \
"RVALID:rvalid" \
"RREADY:rready" } 

# Add apb3_if_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {apb3_if} -instance_name {apb3_if_0}
# Exporting Parameters of instance apb3_if_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {apb3_if_0} -params {\
"g_APB3_IF_DATA_WIDTH:32" \
"g_CONST_WIDTH:12" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {apb3_if_0}
sd_update_instance -sd_name ${sd_name} -instance_name {apb3_if_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {apb3_if_0:quality_o} -pin_slices {[5:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {apb3_if_0:quality_o} -pin_slices {[7:6]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {apb3_if_0:quality_o[7:6]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {apb3_if_0:h264_ddrlsb_addr_o} -pin_slices {[21:0]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {apb3_if_0:h264_ddrlsb_addr_o[21:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {apb3_if_0:h264_ddrlsb_addr_o} -pin_slices {[31:22]}
sd_create_pin_group -sd_name ${sd_name} -group_name {Group} -instance_name {apb3_if_0} -pin_names {"brightness_i" "r_gain_i" "b_gain_i" "quality_i" "contrast_i" "g_gain_i" "mode_o" "alpha_o" "step_o" "frame_tcount_o" }
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {apb3_if_0:mode_o}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {apb3_if_0:r_gain_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {apb3_if_0:g_gain_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {apb3_if_0:b_gain_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {apb3_if_0:brightness_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {apb3_if_0:contrast_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {apb3_if_0:quality_i} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {apb3_if_0:alpha_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {apb3_if_0:step_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {apb3_if_0:frame_tcount_o}



# Add h264_top_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {h264_top} -instance_name {h264_top_0}



# Add IMX334_IF_TOP_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {IMX334_IF_TOP} -instance_name {IMX334_IF_TOP_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {IMX334_IF_TOP_0:CAMERA_CLK}



# Add RGBtoYCbCr_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {RGBtoYCbCr_C0} -instance_name {RGBtoYCbCr_C0_0}



# Add video_processing_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {video_processing} -instance_name {video_processing_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_RX_CLK_N" "IMX334_IF_TOP_0:CAM1_RX_CLK_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_RX_CLK_P" "IMX334_IF_TOP_0:CAM1_RX_CLK_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLK_125MHz_i" "h264_top_0:fic_clk" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLK_50MHz_i" "apb3_if_0:pclk_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX334_IF_TOP_0:ARST_N" "IMX334_IF_TOP_0:INIT_DONE" "INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX334_IF_TOP_0:CAMCLK_RESET_N" "RGBtoYCbCr_C0_0:RESET_N_I" "h264_top_0:resetn_i" "video_processing_0:RESETN_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX334_IF_TOP_0:PARALLEL_CLOCK" "RGBtoYCbCr_C0_0:CLOCK_I" "h264_top_0:sys_clk_i" "video_processing_0:SYS_CLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX334_IF_TOP_0:TRNG_RST_N" "LPDDR4_RDY_i" "h264_top_0:ddr_ctrl_ready_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX334_IF_TOP_0:c1_frame_start_o" "video_processing_0:frame_start_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX334_IF_TOP_0:c1_frame_valid_o" "apb3_if_0:frame_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX334_IF_TOP_0:c1_line_valid_o" "video_processing_0:DATA_VALID_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RESETN_125MHz_i" "h264_top_0:read_reset_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RESETN_50MHz_i" "apb3_if_0:preset_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RGBtoYCbCr_C0_0:DATA_VALID_I" "video_processing_0:DATA_VALID_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RGBtoYCbCr_C0_0:DATA_VALID_O" "h264_top_0:data_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"apb3_if_0:h264_clr_intr_o" "h264_top_0:clr_intr_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"apb3_if_0:h264_en_o" "video_processing_0:encoder_en_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"frm_interrupt_o" "h264_top_0:frm_interrupt_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"h264_top_0:eof_i" "video_processing_0:eof_encoder_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"h264_top_0:frame_valid_i" "video_processing_0:frame_start_encoder_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"h264_top_0:h264_encoder_en" "video_processing_0:encoder_en_o" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_RXD" "IMX334_IF_TOP_0:CAM1_RXD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_RXD_N" "IMX334_IF_TOP_0:CAM1_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX334_IF_TOP_0:c1_data_out_o" "video_processing_0:DATA_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RGBtoYCbCr_C0_0:BLUE_I" "video_processing_0:DATA_B_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RGBtoYCbCr_C0_0:C_OUT" "h264_top_0:data_c_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RGBtoYCbCr_C0_0:GREEN_I" "video_processing_0:DATA_G_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RGBtoYCbCr_C0_0:RED_I" "video_processing_0:DATA_R_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RGBtoYCbCr_C0_0:Y_OUT" "h264_top_0:data_y_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"apb3_if_0:RGB_SUM_i" "video_processing_0:y_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"apb3_if_0:bconst_o" "video_processing_0:B_CONST_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"apb3_if_0:frame_bytes_i" "h264_top_0:frame_bytes_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"apb3_if_0:frame_index_i" "h264_top_0:frame_index_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"apb3_if_0:gconst_o" "video_processing_0:G_CONST_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"apb3_if_0:h264_ddrlsb_addr_o[31:22]" "h264_top_0:frame_ddr_addr_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"apb3_if_0:horiz_resl_o" "h264_top_0:hres_i" "video_processing_0:hres_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"apb3_if_0:quality_o[5:0]" "h264_top_0:qp_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"apb3_if_0:rconst_o" "video_processing_0:R_CONST_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"apb3_if_0:second_const_o" "video_processing_0:COMMON_CONST_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"apb3_if_0:vert_resl_o" "h264_top_0:vres_i" "video_processing_0:vres_i" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"APBslave" "apb3_if_0:APB_slave" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIF_1" "h264_top_0:BIF_1" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign Video_Pipeline
generate_component -component_name ${sd_name}
