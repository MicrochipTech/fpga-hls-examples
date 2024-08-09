ssh "root@$env:BOARD_IP" "rm -f output*.bmp *.elf"
Remove-Item "hls_output/*.elf" -Force -ErrorAction SilentlyContinue

Write-Output "Compiling w/HW module"
shls -a soc_sw_compile_accel

Write-Output "Compiling SW-only"
shls -a soc_sw_compile_no_accel
