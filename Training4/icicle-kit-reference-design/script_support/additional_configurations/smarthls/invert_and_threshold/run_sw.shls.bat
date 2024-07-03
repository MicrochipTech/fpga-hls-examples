@echo off

echo "---------------------"
echo "Run SW-only"
CALL shls.bat "-s" "soc_base_proj_run"

echo "---------------------"
echo "Run w/HW module"
CALL shls.bat "-s" "soc_accel_proj_run"
