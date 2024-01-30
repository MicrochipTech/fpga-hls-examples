echo "Running shls hw on wide_mult_axi"
cd ../wide_mult_axi
CALL shls.bat -a hw

echo "Running shls hw on texture_mapper"
cd ../texture_mapper
CALL shls.bat -a hw

cd ../Libero/

echo "Now run Libero by following the remaining steps in readme.txt."
