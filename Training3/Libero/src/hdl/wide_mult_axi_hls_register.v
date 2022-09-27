`timescale 1 ns / 1 ns
module wide_mult_axi_hls_register (
    clk,
    reset,
    write_en,
    read_data,
    write_data
);

parameter width = 32;
parameter init_value = 0;
input  clk;
input  reset;
input  write_en;
input  [width-1 : 0 ] write_data;
output [width-1 : 0 ] read_data;
reg    [width-1 : 0 ] register [0 : 0];

always @(posedge clk)
begin
  if (reset)
    register[0] <= init_value;
  else if (write_en)
    register[0] <= write_data;
end
assign read_data = register[0];
endmodule