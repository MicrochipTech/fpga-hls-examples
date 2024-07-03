#!/bin/bash

set -eu

ssh root@$BOARD_IP "rm -f output*.bmp *.elf"
rm -f hls_output/*.elf

echo "Compiling w/HW module"
shls -a soc_sw_compile_accel 

echo "Compiling SW-only"
shls -a soc_sw_compile_no_accel 
