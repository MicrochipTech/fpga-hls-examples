#Importing and Linking all the HDL source files used in the design
import_files -library work -hdl_source script_support/hdl/H264/apb_wrapper.vhd
import_files -library work -hdl_source script_support/hdl/H264/data_packer_h264.vhd
import_files -library work -hdl_source script_support/hdl/ddr_write_controller_enc.v
import_files -library work -hdl_source script_support/hdl/frame_controls_gen.v
import_files -library work -hdl_source script_support/hdl/intensity_average.vhd
import_files -library work -hdl_source script_support/hdl/ram2port.vhd
import_files -library work -hdl_source script_support/hdl/video_fifo.vhd

