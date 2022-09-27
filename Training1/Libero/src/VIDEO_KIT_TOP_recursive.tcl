#This Tcl file sources other Tcl files to build the design(on which recursive export is run) in a bottom-up fashion

#Sourcing the Tcl file in which all the HDL source files used in the design are imported or linked
source ./src/hdl_source.tcl
build_design_hierarchy

set sd_name {VIDEO_KIT_TOP}
create_smartdesign -sd_name ${sd_name}
set_root -module VIDEO_KIT_TOP::work

#Sourcing the Tcl files in which HDL+ core definitions are created for HDL modules
source ./src/components/video_fifo.tcl 
source ./src/components/ddr_rw_arbiter.tcl 
source ../Canny_FIFO_Switch/hls_output/scripts/create_hdl_plus.tcl

source ../Gaussian_FIFO_Pipelined/hls_output/scripts/create_hdl_plus.tcl
source ./src/components/mux_3_to_1_8bit.tcl 
source ./src/components/switch_3_state_controller_top.tcl 
source ../RGB2YCbCr/hls_output/scripts/create_hdl_plus.tcl
source ../YCbCr2RGB/hls_output/scripts/create_hdl_plus.tcl
source ../alpha_blend/hls_output/scripts/create_hdl_plus.tcl
source ./src/components/apb3_if.tcl 
build_design_hierarchy

#Sourcing the Tcl files for creating individual components under the top level
source ./src/components/PF_CCC_C0.tcl 
source ./src/components/PF_CCC_C1.tcl 
source ./src/components/CCC.tcl 
source ./src/components/Display_Controller_C0.tcl 
source ./src/components/Display_Controller_C1.tcl 
source ./src/components/Disp_controller.tcl 
source ./src/components/HDMI_RX_C0.tcl 
source ./src/components/HDMI_TX_C0.tcl 
source ./src/components/PF_TX_PLL_C0.tcl 
source ./src/components/PF_XCVR_ERM_C0.tcl 
source ./src/components/PF_XCVR_REF_CLK_C0.tcl 
source ./src/components/HDMI_2p0.tcl 
source ./src/components/CORERESET_PF_C1.tcl 
source ./src/components/CORERXIODBITALIGN_C0.tcl 
source ./src/components/CORERXIODBITALIGN_C1.tcl 
source ./src/components/CORERXIODBITALIGN_C2.tcl 
source ./src/components/CORERXIODBITALIGN_C3.tcl 
source ./src/components/PF_IOD_GENERIC_RX_C0.tcl 
source ./src/components/CAM_IOD_TIP_TOP.tcl 
source ./src/components/CORERESET_PF_C2.tcl 
source ./src/components/CORERESET_PF_C3.tcl 
source ./src/components/PF_CCC_C2.tcl 
source ./src/components/mipicsi2rxdecoderPF_C0.tcl 
source ./src/components/IMX334_IF_TOP.tcl 
source ./src/components/DDR_Read_HDMI_RX.tcl 
source ./src/components/DDR_Read_HDMI_Rx_4k.tcl 
source ./src/components/DDR_Read_scale.tcl 
source ./src/components/DDR_Read.tcl 
source ./src/components/Memory_Read.tcl 
source ./src/components/DDR_Write_HDMI_RX.tcl 
source ./src/components/DDR_Write.tcl 
source ./src/components/Memory_Write.tcl 
source ./src/components/PF_DDR4_C0.tcl 
source ./src/components/COREI2C_C0.tcl 
source ./src/components/CoreAHBLite_C0.tcl 
source ./src/components/MIV_RV32IMA_L1_AHB_C0.tcl 
source ./src/components/PF_SRAM_AHBL_AXI_C0.tcl 
source ./src/components/PROC_SUBSYSTEM.tcl 
source ./src/components/CORERESET_PF_C0.tcl 
source ./src/components/PF_INIT_MONITOR_C0.tcl 
source ./src/components/Reset.tcl 
source ./src/components/COREUART_C0.tcl 
source ./src/components/UART_interface.tcl 
source ./src/components/read_top.tcl 
source ./src/components/write_top.tcl 
source ./src/components/Video_arbiter_top.tcl 
source ./src/components/Bayer_Interpolation_C0.tcl 
source ./src/components/Bayer_Interpolation_C1.tcl 
source ./src/components/Bayer_Interpolation_C2.tcl 
source ./src/components/Image_Enhancement_C0.tcl 
source ./src/components/Image_Enhancement_C1.tcl 
source ./src/components/LegUp_Image_Filters.tcl 
source ./src/components/video_pipelining.tcl 
source ./src/components/VIDEO_KIT_TOP.tcl 
build_design_hierarchy
