source $env(SHLS_ROOT_DIR)/examples/legup.tcl
set_project PolarFireSoC MPFS250T Icicle_SoC

# Set other parameters and constraints here
# Refer to the user guide for more information: https://microchiptech.github.io/fpga-hls-docs/constraintsmanual.html
set_parameter CLOCK_PERIOD 10
