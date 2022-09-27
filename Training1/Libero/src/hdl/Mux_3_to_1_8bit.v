`timescale 1 ns / 1 ns
module mux_3_to_1_8bit
#(
    parameter DATA_WIDTH = 8
)
(
	input [1:0] sel,
	input [DATA_WIDTH-1:0] a,
	input [DATA_WIDTH-1:0] b,
	input [DATA_WIDTH-1:0] c,
	output reg [DATA_WIDTH-1:0] o
);

always @(*) begin
    case (sel)
        2'b00: o = a;
        2'b01: o = b;
        2'b10: o = c;
        default: o = c;
    endcase
end

endmodule
