This is an example source code to show how to write an IP block to implement UDP TX path using SmartHLS. 

Please follow the user guide to install SmartHLS and learn more about the features of this HLS tool:
 - Homepage: https://www.microchip.com/en-us/products/fpgas-and-plds/fpga-and-soc-design-tools/smarthls-compiler
 - User guide: https://onlinedocs.microchip.com/v2/keyword-lookup?keyword=fpgahls&redirect=true&version=latest 

After the installation is done, you can try out this example through either GUI or command-line. 

# Using SmartHLS IDE
1. Launch SmartHLS IDE.
2. Import the example HLS project.
   * From the menu select: File -> Import.
   * In the import window select General -> "Existing Projects into Workspace". Click Next.
   * Click the Browse button beside "Select root directory". Navigate to where you cloned this fpga-hls-examples git repository.
   * Under Projects you should see the "udp_tx" project checked. Click Finish.
3. Try "Run Software", "Compile to Hardware", and "SW/HW Co-simulation".

# Using SmartHLS Commandline
1. Make sure "$(SMARTHLS_INSTALLATION_DIR)/SmartHLS/bin is on the $(PATH)" environment variable to get access to the "shls" script.
2. run "shls sw" to run software.
3. run "shls hw" to compile to hardware.
4. run "shls cosim" to run sw/hw co-simulation.
