#Importing and Linking all the HDL source files used in the design
import_files -library work -hdl_source ./src/hdl/DDR_read_controller_HDMI_RX.vhd
import_files -library work -hdl_source ./src/hdl/data_unpacker_HDMI_RX.vhd
import_files -library work -hdl_source ./src/hdl/ram2port.vhd
import_files -library work -hdl_source ./src/hdl/video_fifo.vhd
import_files -library work -hdl_source ./src/hdl/synchronizer_circuit.vhd
import_files -library work -hdl_source ./src/hdl/DDR_read_controller_HDMI_RX_4k.vhd
import_files -library work -hdl_source ./src/hdl/data_unpacker_HDMI_RX_4k.vhd
import_files -library work -hdl_source ./src/hdl/DDR_read_controller_scale.vhd
import_files -library work -hdl_source ./src/hdl/data_unpacker_scale.vhd
import_files -library work -hdl_source ./src/hdl/DDR_read_controller.vhd
import_files -library work -hdl_source ./src/hdl/data_unpacker.vhd
import_files -library work -hdl_source ./src/hdl/DDR_write_controller_HDMI_RX.vhd
import_files -library work -hdl_source ./src/hdl/data_packer_HDMI_RX.vhd
import_files -library work -hdl_source ./src/hdl/DDR_write_controller.vhd
import_files -library work -hdl_source ./src/hdl/data_packer.vhd
import_files -library work -hdl_source ./src/hdl/addr_decoder.vhd
import_files -library work -hdl_source ./src/hdl/plot_mux.vhd
import_files -library work -hdl_source ./src/hdl/receive_data.vhd
import_files -library work -hdl_source ./src/hdl/send_data.vhd
import_files -library work -hdl_source ./src/hdl/timer.vhd
import_files -library work -hdl_source ./src/hdl/axi_lbus_corefifo_NstagesSync.v
import_files -library work -hdl_source ./src/hdl/axi_lbus_corefifo_grayToBinConv.v
import_files -library work -hdl_source ./src/hdl/axi_lbus_corefifo_async.v
import_files -library work -hdl_source ./src/hdl/axi_lbus_corefifo_resetSync.v
import_files -library work -hdl_source ./src/hdl/axi_lbus_corefifo_sync.v
import_files -library work -hdl_source ./src/hdl/axi_lbus_corefifo_fwft.v
import_files -library work -hdl_source ./src/hdl/axi_lbus_corefifo_sync_scntr.v
import_files -library work -hdl_source ./src/hdl/axi_lbus_LSRAM_top.v
import_files -library work -hdl_source ./src/hdl/axi_lbus_ram_wrapper.v
import_files -library work -hdl_source ./src/hdl/video_axi_fifo.v
import_files -library work -hdl_source ./src/hdl/ddr_rw_arbiter.v
import_files -library work -hdl_source ./src/hdl/read_demux.vhd
import_files -library work -hdl_source ./src/hdl/read_mux.vhd
import_files -library work -hdl_source ./src/hdl/request_scheduler.vhd
import_files -library work -hdl_source ./src/hdl/write_demux.vhd
import_files -library work -hdl_source ./src/hdl/write_mux.vhd
import_files -library work -hdl_source ./src/hdl/binary_to_onehot.v
import_files -library work -hdl_source ./src/hdl/ram_dual_port_fifo.v
import_files -library work -hdl_source ./src/hdl/fwft_fifo.v
import_files -library work -hdl_source ./src/hdl/ram_dual_port.v
import_files -library work -hdl_source ./src/hdl/delay.v 
import_files -library work -hdl_source ./src/hdl/Mux_3_to_1_8bit.v
import_files -library work -hdl_source ./src/hdl/Switch_State_Controller.v
import_files -library work -hdl_source ./src/hdl/MUX_2_to_1.vhd
import_files -library work -hdl_source ./src/hdl/legup_mult_core.v
import_files -library work -hdl_source ./src/hdl/legup_mult_pipelined.v
import_files -library work -hdl_source ./src/hdl/legup_mult.v
import_files -library work -hdl_source ./src/hdl/alpha_enable.vhd
import_files -library work -hdl_source ./src/hdl/apb_wrapper.vhd
import_files -library work -hdl_source ./src/hdl/buffer.vhd
import_files -library work -hdl_source ./src/hdl/delay_circuit.vhd
import_files -library work -hdl_source ./src/hdl/intensity_average.vhd
import_files -library work -hdl_source ./src/hdl/PIP_mode.vhd
import_files -library work -hdl_source ./src/hdl/selector.vhd
