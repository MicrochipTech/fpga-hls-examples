# Create, configure and generate core components
source ./src/src_components/RTG4FCCCECALIB_C0.tcl

# Generate SmartDesign Components

build_design_hierarchy 
source ./src/src_components/top.tcl
source ./src/hls_updates.tcl

# Set top level module
build_design_hierarchy 
set_root -module {top::work} 

save_project
puts "Design generated successfully\n"
