module delay
(
    input clk,
    input reset,
    input valid_i,
    output valid_o,
	input [7:0] data_i,
	output [7:0] data_o
);

reg valid_reg;
reg [7:0] data_reg;

assign valid_o = valid_reg;
assign data_o = data_reg;

always @(posedge clk) begin
    if (reset) begin
        valid_reg <= 0;
        data_reg <= 0;
    end else begin
        valid_reg <= valid_i;
        data_reg <= data_i;
    end
end

endmodule
