Write-Host "Running shls hw on digit_recognition"
cd ../digit_recognition
shls -a hw

Write-Host "Running shls hw on RGB2YCbCr"
cd ../../Training1/RGB2YCbCr
shls -a hw

Write-Host "Running shls hw on alpha_blend"
cd ../alpha_blend
shls -a hw

cd ../../Training2/Libero/

echo "Now run Libero by following the remaining steps in readme.txt."
