source $env(SHLS_ROOT_DIR)/examples/legup.tcl
set_project PolarFire MPF300 hw_only

# Set other parameters and constraints here
# Refer to the user guide for more information: https://onlinedocs.microchip.com/v2/keyword-lookup?keyword=hls_constraints&redirect=true&version=latest
set_parameter CLOCK_PERIOD 10

