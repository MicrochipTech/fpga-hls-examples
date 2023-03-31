source $env(LEGUP_ROOT_DIR)/examples/legup.tcl
set_project PolarFire MPF300 hw_only

# Set other parameters and constraints here
# Refer to the user guide for more information: https://microchiptech.github.io/fpga-hls-docs/constraintsmanual.html
set_parameter CLOCK_PERIOD 10
