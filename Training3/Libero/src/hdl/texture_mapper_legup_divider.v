module texture_mapper_legup_divider # (
  parameter stages = 32, 
  parameter width_n = stages, // widths equal the number of pipeline stages 
  parameter width_d = stages,
  parameter is_signed = 1
) (
  input clock, 
  input aclr, 
  input clken, 
  input [width_n - 1:0] numer, 
  input [width_d - 1:0] denom, 
  output [width_n - 1:0] quotient,
  output [width_d - 1:0] remain
);

// instantiate divider core
generate 
  // if using generic divider
  if (is_signed == 1) begin
    // instantiate signed divider core
    texture_mapper_div_signed divider (
      .clock (clock),
      .aclr (aclr),
      .clken (clken),
      .numer (numer),
      .denom (denom),
      .quotient (quotient),
      .remain (remain)
    );
    defparam
      divider.width_n = width_n,
      divider.width_d = width_d,
      divider.stages = stages;

  end else begin 
    // instantiate unsigned divider core
    texture_mapper_div_unsigned divider (
      .clock (clock),
      .aclr (aclr),
      .clken (clken),
      .numer (numer),
      .denom (denom),
      .quotient (quotient),
      .remain (remain)
    );
    defparam
      divider.width_n = width_n,
      divider.width_d = width_d,
      divider.stages = stages;

    end
endgenerate

endmodule
