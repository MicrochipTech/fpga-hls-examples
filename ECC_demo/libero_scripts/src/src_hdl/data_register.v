module data_register (
	clk,
	resetn,
    data_in_en,
    data_in,
    data_out
);

parameter N = 32;

input clk;
input resetn;
input data_in_en;
input [N-1:0] data_in;
output reg [N-1:0] data_out;

always @(posedge clk) begin
    if(resetn == 0)
        data_out <= 0;
    else if (data_in_en)
        data_out <= data_in;
end

endmodule