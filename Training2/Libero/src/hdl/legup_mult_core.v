// combinational generic multiplier
`timescale 1ns / 1ns
module legup_mult_core(
    dataa,
    datab,
    result  
);

parameter widtha = 32;
parameter widthb = 32;
parameter widthp = 64;
parameter representation = "UNSIGNED";

input [widtha-1:0] dataa;
input [widthb-1:0] datab;
output wire [widthp-1:0] result;

generate
if (representation == "UNSIGNED") begin
  legup_mult_unsigned legup_mult_unsigned_inst(
    .dataa(dataa),
    .datab(datab),
    .result(result) 
  );
  defparam legup_mult_unsigned_inst.widtha = widtha;
  defparam legup_mult_unsigned_inst.widthb = widthb;
  defparam legup_mult_unsigned_inst.widthp = widthp;
end else begin
  legup_mult_signed legup_mult_signed_inst(
    .dataa(dataa),
    .datab(datab),
    .result(result) 
  );
  defparam legup_mult_signed_inst.widtha = widtha;
  defparam legup_mult_signed_inst.widthb = widthb;
  defparam legup_mult_signed_inst.widthp = widthp;
end

endgenerate

endmodule

// unsigned combinational multiplier
module legup_mult_unsigned(
    dataa,
    datab,
    result  
);

parameter widtha = 32;
parameter widthb = 32;
parameter widthp = 64;

input [widtha-1:0] dataa;
input [widthb-1:0] datab;
output reg [widthp-1:0] result;

always @(*) begin
  result = dataa * datab;
end   

endmodule

// signed combinational multiplier
module legup_mult_signed(
    dataa,
    datab,
    result  
);

parameter widtha = 32;
parameter widthb = 32;
parameter widthp = 64;

input signed [widtha-1:0] dataa;
input signed [widthb-1:0] datab;
output reg signed [widthp-1:0] result;

always @(*) begin
  result = dataa * datab;
end   

endmodule
