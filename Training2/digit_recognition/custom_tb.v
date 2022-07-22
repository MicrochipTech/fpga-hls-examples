// Custom Verilog testbench for ClassifierPipeline
`timescale 1 ns / 1 ns
module custom_tb;

`define NUM_IMAGES 10
localparam NUM_PIXELS = `NUM_IMAGES * 784;

// clk.
reg clk;
initial clk = 0;
always @(clk) clk <= #5 ~clk;

// reset.
reg reset = 1;
initial begin
    @(negedge clk);
    @(negedge clk);
    reset <= 0;
end

// Read test images 0-9
// These are the same digits used in the software testbench just in mem format
reg [7:0] test_images [0 : NUM_PIXELS - 1];
initial
  $readmemh("../../test_images.mem", test_images);

integer cycle_count = 0;
integer frame_idx = 0;

// Accelerator interface.
wire  classifier_input_valid_write_en;
wire [7:0] classifier_input_valid_write_data;
wire [7:0] classifier_input_valid_read_data;

wire [9:0] classifier_input_a0_a0_a0_address_a;
reg [15:0] classifier_input_a0_a0_a0_read_data_a;

wire [3:0] classifier_output_data;
wire       classifier_output_ready = 1;
wire       classifier_output_valid;

// input_valid.
reg input_valid;
always @ (posedge clk) begin
  if (reset) begin
    input_valid <= 0;
    frame_idx <= 0;
  end else if (~input_valid) begin
    input_valid <= 1;
  end else if (classifier_input_valid_write_en) begin
    frame_idx <= frame_idx + 1;
    input_valid <= classifier_input_valid_write_data;
  end
end
assign classifier_input_valid_read_data = {7'b0, input_valid};

// Input ram.
always @ (posedge clk) begin
  if (reset)
    classifier_input_a0_a0_a0_read_data_a <= 0;
  else
    classifier_input_a0_a0_a0_read_data_a <= {8'b0, test_images[frame_idx * 784 + classifier_input_a0_a0_a0_address_a]};
end

always @ (posedge clk) begin
  if (reset) begin
    cycle_count <= 0;
  end else begin
    cycle_count <= cycle_count + 1;
  end
end

// Delay the printing by one clock cycle so that it always prints after the
// Classifier prints out the highest confidence.  We need consistent printing
// order to keep buildbot passing.
reg out_valid_reg;
reg [3:0] out_data_reg;

// Print out prediction results
integer last_output_cycle = 0;
integer i = 0;
always @ (posedge clk) begin
  out_valid_reg <= classifier_output_valid;
  out_data_reg <= classifier_output_data;

  if (out_valid_reg) begin
    $write("Prediction: %d (cycle gap since last output = %d)\n", out_data_reg, cycle_count - last_output_cycle);
    last_output_cycle <= cycle_count;
    if (i == `NUM_IMAGES - 1)
      #1 $finish;
    else
      i <= i + 1;
  end
end

ClassifierPipeline_top DUT (
  .clk (clk),
  .reset (reset),
  .start (~reset),
  .finish (),

  .classifier_input_valid_write_en (classifier_input_valid_write_en),
  .classifier_input_valid_write_data (classifier_input_valid_write_data),
  .classifier_input_valid_read_data (classifier_input_valid_read_data),

  .classifier_input_clken (),
  .classifier_input_address_a (classifier_input_a0_a0_a0_address_a),
  .classifier_input_read_data_a (classifier_input_a0_a0_a0_read_data_a),
  .classifier_input_read_data_b (16'bX /* should be unused */),

  .classifier_output       (classifier_output_data),
  .classifier_output_ready (classifier_output_ready),
  .classifier_output_valid (classifier_output_valid)
);

endmodule
