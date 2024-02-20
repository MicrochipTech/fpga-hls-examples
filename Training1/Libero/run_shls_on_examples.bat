CALL echo "Running shls hw on Canny_FIFO_Switch"
cd ../Canny_FIFO_Switch
CALL shls.bat hw

echo "Running shls hw on Gaussian_FIFO_Pipelined"
cd ../Gaussian_FIFO_Pipelined
CALL shls.bat hw

CALL echo "Running shls hw on RGB2YCbCr"
cd ../RGB2YCbCr
CALL shls.bat hw

CALL echo "Running shls hw on YCbCr2RGB"
cd ../YCbCr2RGB
CALL shls.bat hw

CALL echo "Running shls hw on alpha_blend"
cd ../alpha_blend
CALL shls.bat hw

cd ../Libero/

CALL echo "Now run Libero by following the remaining steps in readme.txt."
