# This script should be run first to run shls on the required examples.
# After this script completed, follow the remaining instructions in the 
# readme to run libero on the generated designs.

echo ""
echo "Running shls hw on Canny_FIFO_Switch"
echo ""
cd ../Canny_FIFO_Switch
shls hw

echo ""
echo "Running shls hw on Gaussian_FIFO_Pipelined"
echo ""
cd ../Gaussian_FIFO_Pipelined
shls hw

echo ""
echo "Running shls hw on RGB2YCbCr"
echo ""
cd ../RGB2YCbCr
shls hw

echo ""
echo "Running shls hw on YCbCr2RGB"
echo ""
cd ../YCbCr2RGB
shls hw

echo ""
echo "Running shls hw on alpha_blend"
echo ""
cd ../alpha_blend
shls hw

cd ../Libero/

echo ""
echo "Now run Libero by following the remaining steps in readme.txt."
echo ""
