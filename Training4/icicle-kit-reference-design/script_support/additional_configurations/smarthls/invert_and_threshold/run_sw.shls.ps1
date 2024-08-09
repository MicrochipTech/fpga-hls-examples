Write-Output "---------------------"
Write-Output "Run SW-only"
shls -s soc_base_proj_run

Write-Output "---------------------"
Write-Output "Run w/HW module"
shls -s soc_accel_proj_run
