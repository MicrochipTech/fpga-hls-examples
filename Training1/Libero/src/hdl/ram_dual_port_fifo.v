`timescale 1 ns / 1 ns

module ram_dual_port_fifo # (
    parameter  width_a = 1'd0,
    parameter  width_b = 1'd0,
    parameter  widthad_a = 1'd0,
    parameter  widthad_b = 1'd0,
    parameter  numwords_a = 1'd0,
    parameter  numwords_b = 1'd0,
    parameter  latency = 1,
    parameter  ramstyle = ""
) (
    input  clk,
    input  clken,
    input [(widthad_a-1):0] address_a,
    input [(widthad_b-1):0] address_b,
    output wire [(width_a-1):0] q_a,
    output wire [(width_b-1):0] q_b,
    input  wren_a,
    input  wren_b,
    input [(width_a-1):0] data_a,
    input [(width_b-1):0] data_b
);

(* ramstyle = ramstyle, ram_style = ramstyle *) reg [width_a-1:0] ram[numwords_a-1:0];

reg [(width_a-1):0] q_a_wire;
reg [(width_b-1):0] q_b_wire;

always @ (posedge clk)
  if (clken) begin // Port A
    if (wren_a) begin
      ram[address_a] <= data_a;
      q_a_wire <= {width_a{1'bX}};
    end else
      q_a_wire <= ram[address_a];
  end

always @ (posedge clk)
  if (clken) begin // Port b
    if (wren_b) begin
      ram[address_b] <= data_b;
      q_b_wire <= {width_b{1'bX}};
    end else
      q_b_wire <= ram[address_b];
  end

integer j;
reg [(width_a-1):0] q_a_reg[latency:1], q_b_reg[latency:1];

always @(*) begin
   q_a_reg[1] <= q_a_wire;
   q_b_reg[1] <= q_b_wire;
end

always @(posedge clk)
  if (clken) begin
    for (j = 1; j < latency; j=j+1) begin
      q_a_reg[j+1] <= q_a_reg[j];
      q_b_reg[j+1] <= q_b_reg[j];
    end
  end

assign q_a = (clken) ? q_a_reg[latency] : 0;
assign q_b = (clken) ? q_b_reg[latency] : 0;

endmodule

// Zero-cycle read latency and One-cycle write latency.
// Port A is for write, Port B is for read.
module lutram_dual_port_fifo # (
    parameter  width = 1'd0,
    parameter  widthad = 1'd0,
    parameter  numwords = 1'd0,
    parameter  ramstyle = ""
) (
    input  clk,
    input  clken,
    input [widthad - 1:0] address_a,
    input  wren_a,
    input [width - 1:0] data_a,
    input [widthad - 1:0] address_b,
    output [width - 1:0] q_b
);

(* ramstyle = ramstyle, ram_style = ramstyle *) reg [width - 1:0] ram [numwords - 1:0];

assign q_b = ram[address_b];

always @ (posedge clk) begin
  if (clken & wren_a) ram[address_a] <= data_a;
end

endmodule

