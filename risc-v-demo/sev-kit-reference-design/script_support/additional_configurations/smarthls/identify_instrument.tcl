puts "TCL_BEGIN: [info script]"

# set scriptPath [file normalize [file dirname [info script]]]

set prjFile ./SEVPFSOC_TOP_syn.prj
set top SEVPFSOC_TOP

project open $prjFile

impl -active synthesis

device jtagport builtin

# --[ IICE for HLS AXIS clk domain ]--------------------------------------------
iice new {IICE} -type regular -mode {none}
iice sampler -iice {IICE} -depth 2048 -qualified_sampling 1 -always_armed 1 -compression 0 {behavioral}
iice clock -iice {IICE}  -edge positive {/Video_Pipeline_0/Video_AXIS_Converter_0/i_axis_clk}
iice controller -iice {IICE}  none
# iice -iice {IICE} controller -counterwidth 2 -triggerstates 4 -triggerconditions 2 -importtrigger 0 -exporttrigger 0 -crosstrigger 0 statemachine

# --[ IICE for CAM clock domain ]-----------------------------------------------
iice new {IICE_CAM} -type regular -mode {none}
iice sampler -iice {IICE_CAM} -depth 2048 -qualified_sampling 0 -always_armed 0 -compression 0 {behavioral}
iice clock -iice {IICE_CAM} -edge positive {/Video_Pipeline_0/IMX334_IF_TOP_0/PARALLEL_CLOCK}
iice controller -iice {IICE_CAM} -importtrigger 0 -exporttrigger 0 -crosstrigger 0 none

#--[Top]------------------------------------------------------------------------
# signals add -iice {IICE_CAM} -sample -trigger {/RESET_N}
# signals add -iice {IICE_CAM} -sample -trigger {/CAM_CLK_EN}
# signals add -iice {IICE_CAM} -sample -trigger {/CAM1_RST}

#--[MSS]------------------------------------------------------------------------
signals add -iice {IICE} -sample -trigger {/MSS/FIC_0_DLL_LOCK_M2F}
# HLS reset
signals add -iice {IICE} -sample -trigger {/MSS/GPIO_2_M2F_1}
# LPDDR_rdy
signals add -iice {IICE} -sample -trigger {/MSS/GPIO_2_M2F_4}
# CAM1_RST
signals add -iice {IICE} -sample -trigger {/MSS/GPIO_2_M2F_8}
# CAM_CLK_EN
signals add -iice {IICE} -sample -trigger {/MSS/GPIO_2_M2F_9}

#--[Video Pipeline]-------------------------------------------------------------
signals add -iice {IICE_CAM} -sample -trigger {/Video_Pipeline_0/IMX334_IF_TOP_0/PF_CCC_C2_0_PLL_LOCK_0}
signals add -iice {IICE_CAM} -sample -trigger {/Video_Pipeline_0/IMX334_IF_TOP_0/CAMCLK_RESET_N}

#--[Video Processing]-----------------------------------------------------------
signals add -iice {IICE_CAM} -sample -trigger {/Video_Pipeline_0/video_processing_0/frame_start_i}
# signals add -iice {IICE_CAM} -sample -trigger {/Video_Pipeline_0/video_processing_0/vres_i}
# signals add -iice {IICE_CAM} -sample -trigger {/Video_Pipeline_0/video_processing_0/hres_i}
# signals add -iice {IICE_CAM} -sample -trigger {/Video_Pipeline_0/video_processing_0/DATA_B_O}
# signals add -iice {IICE_CAM} -sample -trigger {/Video_Pipeline_0/video_processing_0/DATA_G_O}
# signals add -iice {IICE_CAM} -sample -trigger {/Video_Pipeline_0/video_processing_0/DATA_R_O}
# signals add -iice {IICE_CAM} -sample -trigger {/Video_Pipeline_0/video_processing_0/DATA_VALID_O}
signals add -iice {IICE_CAM} -sample -trigger {/Video_Pipeline_0/video_processing_0/encoder_en_o}
signals add -iice {IICE_CAM} -sample -trigger {/Video_Pipeline_0/video_processing_0/eof_encoder_o}
signals add -iice {IICE_CAM} -sample -trigger {/Video_Pipeline_0/video_processing_0/frame_start_encoder_o}
# signals add -iice {IICE_CAM} -sample -trigger {/Video_Pipeline_0/video_processing_0/y_o}

#--[Data packer]-----------------------------------------------------------
signals add -iice {IICE_CAM} -sample -trigger {/Video_Pipeline_0/h264_top_0/H264_DDR_WRITE_64/data_packer_h264_0/reset_i}
signals add -iice {IICE_CAM} -sample -trigger {/Video_Pipeline_0/h264_top_0/H264_DDR_WRITE_64/data_packer_h264_0/frame_end_i}
signals add -iice {IICE_CAM} -sample -trigger {/Video_Pipeline_0/h264_top_0/H264_DDR_WRITE_64/data_packer_h264_0/data_i}
signals add -iice {IICE_CAM} -sample -trigger {/Video_Pipeline_0/h264_top_0/H264_DDR_WRITE_64/data_packer_h264_0/data_valid_i}
signals add -iice {IICE_CAM} -sample -trigger {/Video_Pipeline_0/h264_top_0/H264_DDR_WRITE_64/data_packer_h264_0/data_o}
signals add -iice {IICE_CAM} -sample -trigger {/Video_Pipeline_0/h264_top_0/H264_DDR_WRITE_64/data_packer_h264_0/data_valid_o}

#--[Video FIFO]-----------------------------------------------------------
signals add -iice {IICE_CAM} -sample -trigger {/Video_Pipeline_0/h264_top_0/H264_DDR_WRITE_64/video_fifo_0/wresetn_i}
signals add -iice {IICE_CAM} -sample -trigger {/Video_Pipeline_0/h264_top_0/H264_DDR_WRITE_64/video_fifo_0/wen_i}
signals add -iice {IICE_CAM} -sample -trigger {/Video_Pipeline_0/h264_top_0/H264_DDR_WRITE_64/video_fifo_0/wdata_i}
signals add -iice {IICE_CAM} -sample -trigger {/Video_Pipeline_0/h264_top_0/H264_DDR_WRITE_64/video_fifo_0/wfull}
signals add -iice {IICE_CAM} -sample -trigger {/Video_Pipeline_0/h264_top_0/H264_DDR_WRITE_64/video_fifo_0/wafull}

#--[ Video-AXIS-Video adapters ]------------------------------------------------
# Video_AXIS

signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/Video_AXIS_Converter_0/i_video_reset}
signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/Video_AXIS_Converter_0/i_tready}
signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/Video_AXIS_Converter_0/o_frames_skipped}
signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/Video_AXIS_Converter_0/o_pushback_detected}
signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/Video_AXIS_Converter_0/skip_frame}
signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/Video_AXIS_Converter_0/FIFO_A/s_rst}
signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/Video_AXIS_Converter_0/FIFO_A/s_axis_tlast}
signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/Video_AXIS_Converter_0/FIFO_A/s_axis_tuser}
signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/Video_AXIS_Converter_0/FIFO_A/s_axis_tdata}
signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/Video_AXIS_Converter_0/FIFO_A/s_axis_tvalid}
signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/Video_AXIS_Converter_0/FIFO_A/s_axis_tready}

signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/Video_AXIS_Converter_0/FIFO_A/m_rst}
signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/Video_AXIS_Converter_0/FIFO_A/m_axis_tlast}
signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/Video_AXIS_Converter_0/FIFO_A/m_axis_tuser}
signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/Video_AXIS_Converter_0/FIFO_A/m_axis_tdata}
signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/Video_AXIS_Converter_0/FIFO_A/m_axis_tvalid}
signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/Video_AXIS_Converter_0/FIFO_A/m_axis_tready}

# signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/Video_AXIS_Converter_0/FIFO_A/s_status_overflow}
# signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/Video_AXIS_Converter_0/FIFO_A/m_status_overflow}

# AXIS_Video
signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/AXIS_Video_Converter_0/i_hres}
signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/AXIS_Video_Converter_0/i_vres}
signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/AXIS_Video_Converter_0/i_video_reset}

signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/AXIS_Video_Converter_0/FIFO_A/s_rst}
signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/AXIS_Video_Converter_0/FIFO_A/s_axis_tlast}
signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/AXIS_Video_Converter_0/FIFO_A/s_axis_tuser}
signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/AXIS_Video_Converter_0/FIFO_A/s_axis_tdata}
signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/AXIS_Video_Converter_0/FIFO_A/s_axis_tvalid}
signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/AXIS_Video_Converter_0/FIFO_A/s_axis_tready}

signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/AXIS_Video_Converter_0/FIFO_A/m_rst}
signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/AXIS_Video_Converter_0/FIFO_A/m_axis_tlast}
signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/AXIS_Video_Converter_0/FIFO_A/m_axis_tuser}
signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/AXIS_Video_Converter_0/FIFO_A/m_axis_tdata}
signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/AXIS_Video_Converter_0/FIFO_A/m_axis_tvalid}
signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/AXIS_Video_Converter_0/FIFO_A/m_axis_tready}

# signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/AXIS_Video_Converter_0/FIFO_A/s_status_overflow}
# signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/AXIS_Video_Converter_0/FIFO_A/s_status_bad_frame}
# signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/AXIS_Video_Converter_0/FIFO_A/s_status_good_frame}
# signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/AXIS_Video_Converter_0/FIFO_A/m_status_overflow}
# signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/AXIS_Video_Converter_0/FIFO_A/m_status_bad_frame}
# signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/AXIS_Video_Converter_0/FIFO_A/m_status_good_frame}


# signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/AXIS_Video_Converter_0/o_frame_start}
# signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/AXIS_Video_Converter_0/o_EOF}
# signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/AXIS_Video_Converter_0/o_data_valid }
# signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/AXIS_Video_Converter_0/o_B}
# signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/AXIS_Video_Converter_0/o_R}
# signals add -iice {IICE} -sample -trigger {/Video_Pipeline_0/AXIS_Video_Converter_0/o_G}


#--[ SmartHLS ]-----------------------------------------------------------------

# set hlsModule invert_and_threshold
# set hlsModule sobel
set hlsModule hls_pipeline
# set hlsModule get_frame
signals add -iice {IICE} -sample -trigger /Video_Pipeline_0/${hlsModule}_top_0/reset
signals add -iice {IICE} -sample -trigger /Video_Pipeline_0/${hlsModule}_top_0/start
signals add -iice {IICE} -sample -trigger /Video_Pipeline_0/${hlsModule}_top_0/finish
signals add -iice {IICE} -sample -trigger /Video_Pipeline_0/${hlsModule}_top_0/accel_active
signals add -iice {IICE} -sample -trigger /Video_Pipeline_0/${hlsModule}_top_0/${hlsModule}_inst/${hlsModule}_inst/fsm_stall

# set hlsModule watermark
# set hlsModule get_frame
# signals add -iice {IICE} -sample -trigger /Video_Pipeline_0/${hlsModule}_top_0/reset
# signals add -iice {IICE} -sample -trigger /Video_Pipeline_0/${hlsModule}_top_0/start
# signals add -iice {IICE} -sample -trigger /Video_Pipeline_0/${hlsModule}_top_0/finish
# signals add -iice {IICE} -sample -trigger /Video_Pipeline_0/${hlsModule}_top_0/accel_active
# signals add -iice {IICE} -sample -trigger /Video_Pipeline_0/${hlsModule}_top_0/${hlsModule}_inst/${hlsModule}_inst/fsm_stall

#
# AXI-MM Write
#
# set hlsModule get_frame
# signals add -iice {IICE} -sample -trigger /Video_Pipeline_0/${hlsModule}_top_0/axi4initiator_aw_burst
# signals add -iice {IICE} -sample -trigger /Video_Pipeline_0/${hlsModule}_top_0/axi4initiator_aw_size
# signals add -iice {IICE} -sample -trigger /Video_Pipeline_0/${hlsModule}_top_0/axi4initiator_aw_len
# # signals add -iice {IICE} -sample -trigger /Video_Pipeline_0/${hlsModule}_top_0/axi4initiator_aw_addr
# signals add -iice {IICE} -sample -trigger /Video_Pipeline_0/${hlsModule}_top_0/axi4initiator_aw_valid
# signals add -iice {IICE} -sample -trigger /Video_Pipeline_0/${hlsModule}_top_0/axi4initiator_aw_ready
# signals add -iice {IICE} -sample -trigger /Video_Pipeline_0/${hlsModule}_top_0/axi4initiator_w_last
# signals add -iice {IICE} -sample -trigger /Video_Pipeline_0/${hlsModule}_top_0/axi4initiator_w_strb
# # signals add -iice {IICE} -sample -trigger /Video_Pipeline_0/${hlsModule}_top_0/axi4initiator_w_data
# signals add -iice {IICE} -sample -trigger /Video_Pipeline_0/${hlsModule}_top_0/axi4initiator_w_valid
# signals add -iice {IICE} -sample -trigger /Video_Pipeline_0/${hlsModule}_top_0/axi4initiator_w_ready
# signals add -iice {IICE} -sample -trigger /Video_Pipeline_0/${hlsModule}_top_0/axi4initiator_b_resp
# signals add -iice {IICE} -sample -trigger /Video_Pipeline_0/${hlsModule}_top_0/axi4initiator_b_resp_valid
# signals add -iice {IICE} -sample -trigger /Video_Pipeline_0/${hlsModule}_top_0/axi4initiator_b_resp_ready

#
# AXI-MM Read
#
# set hlsModule put_frame
# # signals add -iice {IICE} -sample -trigger /Video_Pipeline_0/${hlsModule}_top_0/axi4initiator_ar_addr
# signals add -iice {IICE} -sample -trigger /Video_Pipeline_0/${hlsModule}_top_0/axi4initiator_ar_burst
# signals add -iice {IICE} -sample -trigger /Video_Pipeline_0/${hlsModule}_top_0/axi4initiator_ar_len
# signals add -iice {IICE} -sample -trigger /Video_Pipeline_0/${hlsModule}_top_0/axi4initiator_ar_size
# # signals add -iice {IICE} -sample -trigger /Video_Pipeline_0/${hlsModule}_top_0/axi4initiator_r_data
# signals add -iice {IICE} -sample -trigger /Video_Pipeline_0/${hlsModule}_top_0/axi4initiator_ar_valid
# signals add -iice {IICE} -sample -trigger /Video_Pipeline_0/${hlsModule}_top_0/axi4initiator_ar_ready
# signals add -iice {IICE} -sample -trigger /Video_Pipeline_0/${hlsModule}_top_0/axi4initiator_r_last
# signals add -iice {IICE} -sample -trigger /Video_Pipeline_0/${hlsModule}_top_0/axi4initiator_r_resp
# signals add -iice {IICE} -sample -trigger /Video_Pipeline_0/${hlsModule}_top_0/axi4initiator_r_valid
# signals add -iice {IICE} -sample -trigger /Video_Pipeline_0/${hlsModule}_top_0/axi4initiator_r_ready

write instrumentation -idc_loc ./identify.idc

# Command to estimate the resources required for instrumentation
# device  estimate -resources -iice IICE
project -save $prjFile

puts "TCL_END: [info script]"
