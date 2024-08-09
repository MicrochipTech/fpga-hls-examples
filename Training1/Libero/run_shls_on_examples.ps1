# Usage:
#
#   .\run_shls_on_examples.ps1
#

Write-Host "Running shls hw on Canny_FIFO_Switch"
cd ../Canny_FIFO_Switch
shls hw

Write-Host "Running shls hw on Gaussian_FIFO_Pipelined"
cd ../Gaussian_FIFO_Pipelined
shls hw

Write-Host "Running shls hw on RGB2YCbCr"
cd ../RGB2YCbCr
shls hw

Write-Host "Running shls hw on YCbCr2RGB"
cd ../YCbCr2RGB
shls hw

Write-Host "Running shls hw on alpha_blend"
cd ../alpha_blend
shls hw

cd ../Libero/

Write-Host "Now run Libero by following the remaining steps in readme.txt."
