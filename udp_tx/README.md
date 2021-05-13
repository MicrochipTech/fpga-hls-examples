This is an example source code to show how to write an IP block to implement UDP TX path using LegUp. 

Please follow the documentation in https://www.legupcomputing.com/ to install LegUp and learn more about the features of this HLS tool.

After the installation is done, you can try out this example through either GUI or commandline. 

# Using LegUp HLS IDE
1. Launch LegUp IDE.
2. Create a new LegUp project.
   * Set a project name, e.g., "udp_tx".
   * Add the following source files:
     * `axi_word.hpp`, `checksum_calc.h` and `utils.h` from the above `network_stack` directory.
     * `udp_tx.cpp`, `in.dat`, `expected_out.dat` from this directory (select "All Files" in "Files of Types" to see `.dat` files).
   * Skip "Top-Level Function" since a top-level pragma is already specified for the `udpTx` function in `udp_tx.cpp`.
   * Skip "Test Bench Module" as we will use SW/HW Co-simulation.
   * Select "PolarFire" and "MPF300TS-1FCG1152I on MPF300 board" for the target FPGA device.
   * Then "Finish".
3. Try "Run Software", "Compile to Hardware", and "SW/HW Co-simulation".

# Using LegUp HLS Commandline
1. Make sure environment variable "LEGUP_ROOT_DIR" is properly set. 
2. run "legup sw" to run software
3. run "legup hw" to compile to hardware
4. run "legup cosim" to run sw/hw co-simulation
