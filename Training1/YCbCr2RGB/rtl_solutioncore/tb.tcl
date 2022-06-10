quit -sim
if {[file exists work]} {
	vdel -lib work -all;
}
if {![file exists work]} {
	vlib work;
}

vcom *.vhd
vsim YCbCrtoRGB_test

add wave -unsigned /YCbCrtoRGB_test/*

run 1000ns
