vlib work
vlog ../../async_fifo/axis_async_fifo.v ../axis_video.v axis_video_tb.v
#vlog ../../../../libs/generic/fwft_fifo/ram_dual_port_fifo.v ../../../../libs/generic/fwft_fifo/fwft_fifo.v ../axis_video.v axis_video_tb.v
vsim axis_video_tb
add wave -position insertpoint  sim:/axis_video_tb/*
add wave -position insertpoint  sim:/axis_video_tb/axis_video_dut_in/state
add wave -position insertpoint  \
sim:/axis_video_tb/axis_video_dut_in/fifo_o
config wave -signalnamewidth 1
run 500 ns
quit