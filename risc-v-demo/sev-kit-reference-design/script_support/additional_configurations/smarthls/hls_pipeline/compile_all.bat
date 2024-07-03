@echo "off"

CALL compile_and_copy.bat fpga riscv_64 

CALL compile_and_copy.bat cpu riscv_64

echo "ALL DONE!"
