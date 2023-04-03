
# This Tcl file will import SmartHLS generated Verilog and create an HDL+ core for each top-level module in Libero.
# You can easily instantiate the HDL+ core(s) in a SmartDesign.
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


source $hlsPrjAbsPath/hls_output/scripts/create_hdl_plus_row_cumulative_sum_top.tcl

# Save the project after everything is done."
save_project
