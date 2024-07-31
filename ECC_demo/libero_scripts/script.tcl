source ./common.tcl
set Prjname "Libero_Project"
set PrjLocation "../$Prjname"

#variable used in the design
set SimTime 100us
set Effort_Level true
set Repair_Min_Delay true
set Multi_Pass_Layout false

# Remove existing project if present
file delete -force ${PrjLocation}

# Create and configure new project
new_project \
    -name "$Prjname" \
    -location "$PrjLocation" \
    -family "RTG4" \
    -die $die_devkit \
    -package $devkit_package \
    -die_voltage "1.2" \
    -speed "-1" \
    -part_range $devkit_part_range \
    -hdl "VERILOG"

# Set VHDL language version for this project
#project_settings \
    -vhdl_mode VHDL_2008

select_profile -name $synprofile
select_profile -name $simuprofile

puts "Project created successfully"

# Create design
source ./src/1_create_design.tcl

# Constrain design
source ./src/2_constrain_design.tcl

# Implement design
source ./src/4_implement_design.tcl

# Program design
source ./src/5_program_design.tcl

# Save project
save_project
