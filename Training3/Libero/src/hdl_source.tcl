#Importing and Linking all the HDL source files used in the design
import_files -library work -hdl_source ./src/hdl/data_unpacker.vhd
import_files -library work -hdl_source ./src/hdl/delay_chain.v
import_files -library work -hdl_source ./src/hdl/pattern_vg.v
import_files -library work -hdl_source ./src/hdl/sync_vg.v
import_files -library work -hdl_source ./src/hdl/top_sync_vg_pattern.v
import_files -library work -hdl_source ./src/hdl/counter.v
import_files -library work -hdl_source ./src/hdl/signal_synchronizer.v
