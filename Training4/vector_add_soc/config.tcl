source $env(SHLS_ROOT_DIR)/examples/legup.tcl
set_project PolarFireSoC MPFS250T Icicle_SoC

# Set other parameters and constraints here
# Refer to the user guide for more information: https://onlinedocs.microchip.com/v2/keyword-lookup?keyword=hls_constraints&redirect=true&version=latest
set_parameter CLOCK_PERIOD 10
