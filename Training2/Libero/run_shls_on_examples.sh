# This script should be run first to run shls on the required examples.
# After this script completed, follow the remaining instructions in the 
# readme to run libero on the generated designs.

echo ""
echo "Running shls hw on digit_recognition"
echo ""
cd ../digit_recognition
shls hw

echo ""
echo "Running shls hw on RGB2YCbCr"
echo ""
cd ../../Training1/RGB2YCbCr
shls hw

echo ""
echo "Running shls hw on alpha_blend"
echo ""
cd ../alpha_blend
shls hw

cd ../../Training2/Libero/

echo ""
echo "Now run Libero by following the remaining steps in readme.txt."
echo ""
