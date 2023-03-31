
# This Tcl file will import SmartHLS generated Verilog and create an HDL+ core for the top-level module top_function_top in Libero.
# You can easily instantiate the HDL+ core in a SmartDesign.
# It will create a bus interface for AXI4 Initiator/Target if the top-level module uses them.
# It will also group pins into AXI4 Master/Slave/Stream interfaces if they match the AXI specification.
# See the SmartHLS User Guide for more information about the AXI4 interfaces.
#
# How to use this Tcl file:
#   1. Open a project in Libero.
#   2. Click "Project" tab on the top left corner and click "Execute Script"
#       OR  press "Ctrl+U".
#   3. Click "..." to browse into the folder containing the SmartHLS project and select this Tcl file
#       OR  enter the full path of this Tcl file.
#       Note: The path is printed in the terminal as SmartHLS runs.
#             e.g. Info: Generating HDL+ Tcl script to be imported in SmartDesign: <full path>.
#   4. Click "Run".
#   5. Go to "Design Flow" tab on the middle left and click "Create Design" -> "Create SmartDesign"
#      (skip this step if there's an existing SmartDesign).
#   6. Go to "Design Hierarchy" tab next to "Design Flow" tab, find the HDL+ core named as "<top module name>_top",
#      and drag it into the SmartDesign or right click and select "instantiate in <SmartDesign name>".

# Find the absolute path to the HLS generated RTL folder.
# hlsPrjAbsPath contains the absolute path to the SmartHLS project directory.
set hlsPrjAbsPath [file normalize [file dirname [info script]]/../..]
set srcFiles [concat \
    $hlsPrjAbsPath/hls_output/rtl/multiple_computable_functions_top_function.v \
    [glob -nocomplain $hlsPrjAbsPath/hls_output/rtl/ram_primitives/*.v] \
]

create_links -hdl_source $srcFiles

# Hierarchy rebuild is required after linking the HLS generated RTL source files.
build_design_hierarchy

# Tell synthesis where to find the .mem files.
set cmd "configure_tool -name {SYNTHESIZE} \
   -params {SYNPLIFY_OPTIONS:set_option -hdl_define -set MEM_INIT_DIR=\"$hlsPrjAbsPath/hls_output/rtl/mem_init/\"}"
puts "$cmd"
eval $cmd


create_hdl_core \
    -file "$hlsPrjAbsPath/hls_output/rtl/multiple_computable_functions_top_function.v" \
    -module {top_function_top} \
    -library {work}


# Save the project after everything is done."
save_project
