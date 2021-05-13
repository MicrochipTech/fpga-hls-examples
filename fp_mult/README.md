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
1. Launch LegUp HLS IDE.
2. Import the example HLS project.
   * From the menu select: File -> Import.
   * In the import window select General -> "Existing Projects into Workspace". Click Next.
   * Click the Browse button beside "Select root directory". Navigate to where you cloned this fpga-hls-examples git repository.
   * Under Projects you should see the fp_mult project checked. Click Finish.
3. Try "Run Software", "Compile to Hardware", and "SW/HW Co-simulation".

# Using LegUp HLS Command-line
1. Make sure environment variable "LEGUP_ROOT_DIR" is properly set. 
2. Run "legup sw" to run software
3. Run "legup hw" to compile to hardware
4. Run "legup cosim" to run SW/HW co-simulation
