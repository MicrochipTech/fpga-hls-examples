quit -sim
if {[file exists work]} {
	vdel -lib work -all;
}
if {![file exists work]} {
	vlib work;
}

vcom *.vhd
vsim RGBtoYCbCr_test 

add wave -unsigned /RGBtoYCbCr_test/*

run 1000ns
