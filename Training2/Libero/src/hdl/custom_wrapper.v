`timescale 1 ns / 1 ns
module custom_wrapper (
  input clk,
  input reset,

  input eof,
  input [15:0] ram_rd_data,
  output       ram_rd_en,
  output [9:0] ram_rd_addr,

  output reg [3:0] result
);

reg input_valid;

wire  classifier_input_valid_write_enable;
wire [7:0] classifier_input_valid_write_data;
wire [7:0] classifier_input_valid_read_data = {7'b0, input_valid};

wire [3:0] classifier_output_data;
wire       classifier_output_ready = 1;
wire       classifier_output_valid;

always @ (posedge clk)
  if (reset) result <= 0;
  else if (classifier_output_valid) result <= classifier_output_data;

always @ (posedge clk)
  if (reset)
    input_valid <= 0;
  else if (classifier_input_valid_write_enable)
    input_valid <= classifier_input_valid_write_data[0];
  else if (eof & ~input_valid)
    input_valid <= 1;

ClassifierPipeline_top ClassifierPipeline_top_inst (
  .clk    (clk),
  .reset  (reset),
  .start  (~reset),
  .ready  (),
  .finish (),

  .classifier_input_valid_write_en   (classifier_input_valid_write_enable),
  .classifier_input_valid_write_data (classifier_input_valid_write_data),
  .classifier_input_valid_read_data  (classifier_input_valid_read_data),

  .classifier_input_clken       (),
  .classifier_input_read_en_a   (ram_rd_en),
  .classifier_input_address_a   (ram_rd_addr),
  .classifier_input_read_data_a (ram_rd_data),
  // port-b is not used.
  .classifier_input_read_en_b   (),
  .classifier_input_address_b   (),
  .classifier_input_read_data_b (16'bX),

  .classifier_output       (classifier_output_data),
  .classifier_output_ready (classifier_output_ready),
  .classifier_output_valid (classifier_output_valid)
);

endmodule
