# This script should be run first to run shls on the required examples.
# After this script completed, follow the remaining instructions in the 
# readme to run libero on the generated designs.

echo ""
echo "Running shls hw on wide_mult_axi"
echo ""
cd ../wide_mult_axi
shls hw

echo ""
echo "Running shls hw on texture_mapper"
echo ""
cd ../texture_mapper
shls hw

cd ../Libero/

echo ""
echo "Now run Libero by following the remaining steps in readme.txt."
echo ""
