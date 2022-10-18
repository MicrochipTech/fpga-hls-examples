// bus_inverter.v
module bus_inverter
#(
    parameter DWIDTH = 8
)
(
    input  [DWIDTH-1:0] data_i,
    output [DWIDTH-1:0] data_o
);

assign data_o = ~data_i;

endmodule