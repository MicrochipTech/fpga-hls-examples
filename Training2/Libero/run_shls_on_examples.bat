echo "Running shls hw on digit_recognition"
cd ../digit_recognition
CALL shls.bat -a hw

echo "Running shls hw on RGB2YCbCr"
cd ../../Training1/RGB2YCbCr
CALL shls.bat -a hw

echo "Running shls hw on alpha_blend"
cd ../alpha_blend
CALL shls.bat -a hw

cd ../../Training2/Libero/

echo "Now run Libero by following the remaining steps in readme.txt."
