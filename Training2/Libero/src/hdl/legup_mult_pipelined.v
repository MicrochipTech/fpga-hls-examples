// generic multiplier with parameterizable pipeline stages
`timescale 1ns / 1ns
module legup_mult_pipelined(
    clock,
    aclr,
    clken, 
    dataa,
    datab,
    result  
);

parameter widtha = 32;
parameter widthb = 32;
parameter widthp = 64;
parameter pipeline = 3;
parameter representation = "UNSIGNED";
parameter preserve_module_hierarchy = 0;

input clock;
input aclr;
input clken; 
input [widtha-1:0] dataa;
input [widthb-1:0] datab;
output [widthp-1:0] result;


if (preserve_module_hierarchy == 1) begin
    `define PRESERVE_MULT_MODULE_SYNTH_ATTR /* synthesis syn_hier = fixed */
end

legup_mult_pipelined_core legup_mult_pipelined_core_inst(
    .clock(clock),
    .aclr(aclr),
    .clken(clken),
    .dataa(dataa),
    .datab(datab),
    .result(result) 
);
defparam legup_mult_pipelined_core_inst.widtha = widtha;
defparam legup_mult_pipelined_core_inst.widthb = widthb;
defparam legup_mult_pipelined_core_inst.widthp = widthp;
defparam legup_mult_pipelined_core_inst.pipeline = pipeline;
defparam legup_mult_pipelined_core_inst.representation = representation;

endmodule

module legup_mult_pipelined_core(
    clock,
    aclr,
    clken, 
    dataa,
    datab,
    result  
)`PRESERVE_MULT_MODULE_SYNTH_ATTR;

parameter widtha = 32;
parameter widthb = 32;
parameter widthp = 64;
parameter pipeline = 3;
parameter representation = "UNSIGNED";
localparam num_input_pipelines = pipeline >> 1;
localparam num_output_pipelines = pipeline - num_input_pipelines;

input clock;
input aclr;
input clken; 
input [widtha-1:0] dataa;
input [widthb-1:0] datab;
output [widthp-1:0] result;

reg [widtha-1:0] dataa_reg [num_input_pipelines:0]/* synthesis syn_preserve=1 */;
reg [widthb-1:0] datab_reg [num_input_pipelines:0]/* synthesis syn_preserve=1 */;
reg [widthp-1:0] result_reg [num_output_pipelines:0]/* synthesis syn_preserve=1 */;
wire [widthp-1:0] result_wire;

// instantiate multiplier with 0 pipeline stages
legup_mult_core legup_mult_core_inst(
    .dataa(dataa_reg[num_input_pipelines]),
    .datab(datab_reg[num_input_pipelines]),
    .result(result_wire) 
);
defparam legup_mult_core_inst.widtha = widtha;
defparam legup_mult_core_inst.widthb = widthb;
defparam legup_mult_core_inst.widthp = widthp;
defparam legup_mult_core_inst.representation = representation;

integer input_stage;
always @(*)
begin
  dataa_reg[0] <= dataa;
  datab_reg[0] <= datab;
end

always @(posedge clock)
begin    
  for (input_stage=0; input_stage<num_input_pipelines; input_stage=input_stage+1) begin
    if (aclr) begin
      dataa_reg[input_stage+1] <= 'd0;
      datab_reg[input_stage+1] <= 'd0;
    end else if (clken) begin
      dataa_reg[input_stage+1] <= dataa_reg[input_stage];
      datab_reg[input_stage+1] <= datab_reg[input_stage];
    end
  end
end

integer output_stage;
always @(*)
begin
  result_reg[0] <= result_wire;
end

always @(posedge clock)
begin    
  for (output_stage=0; output_stage<num_output_pipelines; output_stage=output_stage+1) begin
    if (aclr) begin
       result_reg[output_stage+1] <= 'd0;
    end else if (clken) begin
       result_reg[output_stage+1] <= result_reg[output_stage];
    end
  end
end

assign result = result_reg[num_output_pipelines];

endmodule
