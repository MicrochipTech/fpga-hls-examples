########## This file is automatically generated. Any changes to this file will be lost. ##########
########### If you have your own constraints tcl file, please add it to the project ##########
########### by using the "Set custom config file" constraint in the HLS Constraints dialog. ##########
source $env(SHLS_ROOT_DIR)/examples/legup.tcl
set_project PolarFireSoC MPFS250T Icicle_SoC

# Include a free-running counter in the HLS susbsystem for profiling purposes 
set_parameter SOC_PROFILER_COUNTER 1
