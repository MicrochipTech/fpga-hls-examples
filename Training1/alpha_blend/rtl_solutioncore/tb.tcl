quit -sim
if {[file exists work]} {
	vdel -lib work -all;
}
if {![file exists work]} {
	vlib work;
}

vlog rtl/*.v tb/*.v
vsim alpha_blend_test

add wave -unsigned /alpha_blend_test/*
add wave -hex /alpha_blend_test/alpha_blend_0/ool/*

run 1000000ns
