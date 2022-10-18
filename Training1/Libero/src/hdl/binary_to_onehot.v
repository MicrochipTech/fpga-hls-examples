module binary_to_onehot
(
    input [1:0] binary,
    output reg [2:0] onehot
);

always @(*) begin
    case (binary)
    2'b00: onehot = 3'b001;
    2'b01: onehot = 3'b010;
    2'b10: onehot = 3'b100;
    default: onehot = 3'b000;
    endcase
end

endmodule