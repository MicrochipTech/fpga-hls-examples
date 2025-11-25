source $env(SHLS_ROOT_DIR)/examples/shls.tcl
set_project PolarFireSoC MPFS250T Icicle_SoC
set_parameter POINTSTO_ANALYZE_HW_ONLY 1

#
# Parameters used for SoC integration
#
set_parameter SOC_DMA_ENGINE              HARD_DMA
set_parameter SOC_BD_NAME                 Video_Pipeline
set_parameter SOC_AXI_INITIATOR           hls_axi_initiator
set_parameter SOC_AXI_TARGET              hls_axi_target
set_parameter SOC_CLOCK                   CLK_170MHz_i
set_parameter SOC_RESET                   HLS_PIPELINE_RESETN:Y
set_parameter SOC_FABRIC_BASE_ADDRESS     0x70000000
set_parameter SOC_FABRIC_SIZE             0x400000
set_parameter SOC_CPU_MEM_BASE_ADDRESS    0x80000000
set_parameter SOC_CPU_MEM_SIZE            0x60000000
set_parameter SOC_POLL_DELAY              1
set_parameter REGISTER_EXTERNAL_INPUT_FIFO SKID
