# to run:
# libero SCRIPT:libero_generate_job.tcl SCRIPT_ARGS:"<libero_prjx_file> <job_file_name>"
#
# store arguments in parameters
set project [lindex $argv 0]
set job_file [lindex $argv 1]

open_project -file $project

# Workaround to fix Linux Synthesis issue with Libero project. TODO: update original Libero project
# Synthesis is failing with missing mux_3_to_1_8bit module. To avaoid this, added the below code to re-import the corresponding hdl file and to regenerate the top component

import_files \
         -convert_EDN_to_HDL 0 \
         -library {work} \
         -hdl_source {./LegUp_Training1_Libero/hdl/mux_3_to_1_8bit.v} 
save_project 
generate_component -component_name {LegUp_Image_Filters} -recursive 1 
generate_component -component_name {VIDEO_KIT_TOP} -recursive 1
build_design_hierarchy 

# we purposely don't change any synthesis or P&R settings to reproduce what the user will do
# when they download the Libero project

run_tool -name {SYNTHESIZE}
run_tool -name {PLACEROUTE}
run_tool -name {VERIFYTIMING}

# regenerate the .job file
export_prog_job \
         -job_file_name $job_file \
         -export_dir {.} \
         -bitstream_file_type {TRUSTED_FACILITY} \
         -bitstream_file_components {FABRIC_SNVM} \
         -zeroization_likenew_action 0 \
         -zeroization_unrecoverable_action 0 \
         -program_design 1 \
         -program_spi_flash 0 \
         -include_plaintext_passkey 0 \
         -design_bitstream_format {PPD} \
         -prog_optional_procedures {} \
         -skip_recommended_procedures {} \
         -sanitize_snvm 0
