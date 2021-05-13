This is an example showing how to implement an arbitrary precision floating point
multiplication core using LegUp HLS. The source file fmult.hpp contains the
function fmult() that implements floating point multiplication. The function
works on any floating point format, with arbitrary mantissa and exponent width.
The inputs to the function are of the class ap_fp (arbitrary precision floating
point), a template class where the template parameters define the mantissa and
exponent width.

This function also displays the use of the ap_uint class (arbitrary precision
unsigned integer), which is a LegUp provided template class that represents
unsigned integers of any bit width (defined by the template parameter).

The fmult_test.cpp file contains tests of the multiplication function. This is
done using float and double types, as well as a half precision floating point
format, implemented by the third party library in half.hpp.

Please follow the user guide to install LegUp HLS and learn more about the features of this HLS tool:
 - https://www.microsemi.com/product-directory/fpga-design-tools/5590-hls#getting-started

After the installation is done, you can try out this example through either GUI
or command-line. 

# Using LegUp HLS IDE
1. Launch LegUp IDE.
2. Create a new LegUp project.
   * Set a project name, e.g., "fp_mult".
   * Add all `.hpp`, `.cpp` source files from this directory.
   * Skip "Top-Level Function" since a top-level pragma is already specified for the `custom_top` function in `fmul_test.cpp`.
   * Skip "Test Bench Module" as we will use SW/HW Co-simulation.
   * Select "PolarFire" and "MPF300TS-1FCG1152I on MPF300 board" for the target FPGA device.
   * Then "Finish".
3. Click "HLS Constraints" button, then select "Set target clock period" constraint type, set constraint value 20 (in nanoseconds), click "Add" and "OK".
4. Try "Run Software", "Compile to Hardware", and "SW/HW Co-simulation".

# Using LegUp HLS Command-line
1. Make sure environment variable "LEGUP_ROOT_DIR" is properly set. 
2. Run "legup sw" to run software
3. Run "legup hw" to compile to hardware
4. Run "legup cosim" to run SW/HW co-simulation
