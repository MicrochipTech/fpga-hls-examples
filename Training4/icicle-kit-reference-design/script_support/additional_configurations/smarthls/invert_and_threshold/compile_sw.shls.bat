@echo off

ssh "root@%BOARD_IP%" "rm -f output*.bmp *.elf"
DEL  "hls_output/*.elf"

echo "Compiling w/HW module"
CALL shls.bat -a soc_sw_compile_accel

echo "Compiling SW-only"
CALL shls.bat -a soc_sw_compile_no_accel
