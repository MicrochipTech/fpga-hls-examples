Write-Host "Running shls hw on wide_mult_axi"
cd ../wide_mult_axi
shls -a hw

Write-Host "Running shls hw on texture_mapper"
cd ../texture_mapper
shls -a hw

cd ../Libero/

Write-Host "Now run Libero by following the remaining steps in readme.txt."
