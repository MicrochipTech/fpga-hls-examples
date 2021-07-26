// Custom Verilog testbench for producer_consumer
`timescale 1 ns / 1 ns
module custom_tb;

parameter integer NUM_EXPECTED_INPUT = 1000;
parameter integer NUM_EXPECTED_OUTPUT = 10;

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

// Streaming interface signals connecting with DUT.
// Downstream, return_val.
reg ready_TO_DUT_DS;
wire valid_FROM_DUT_DS;
wire [31:0] data_FROM_DUT_DS;
// Upstream, arguments.
wire in_ready_FROM_DUT_US;
reg in_valid_TO_DUT_US;
reg [31:0] in_data_TO_DUT_US;

top_top DUT (
	.clk(clk),
	.reset(reset),
	.start(1'b1),
	.ready(),
	.finish(),
    // Return value.
    .output_fifo_ready( ready_TO_DUT_DS ),
    .output_fifo_valid( valid_FROM_DUT_DS ),
    .output_fifo( data_FROM_DUT_DS ),
    // Argument.
    .input_fifo_ready( in_ready_FROM_DUT_US ),
    .input_fifo_valid( in_valid_TO_DUT_US ),
    .input_fifo( in_data_TO_DUT_US )
);

reg [31:0] expected_output;
integer clk_cntr, match_cntr = 0, output_cntr = 0;

// Input valid signals (upstream) and ready (downstream).
always @ (posedge clk) begin
    if (reset) begin
        in_valid_TO_DUT_US <= 0;
        ready_TO_DUT_DS <= 0;
    end else begin
        if (in_data_TO_DUT_US == NUM_EXPECTED_INPUT + 1)
            in_valid_TO_DUT_US <= 0;
        else
            in_valid_TO_DUT_US <= 1;

        ready_TO_DUT_DS <= 1;
    end
end

// Input data, and expected output.
always @ (posedge clk) begin
    if (reset) begin
        in_data_TO_DUT_US <= 0;
        expected_output <= 4950;
    end else begin
        if (in_valid_TO_DUT_US & in_ready_FROM_DUT_US)
            in_data_TO_DUT_US <= in_data_TO_DUT_US + 1;
        if (valid_FROM_DUT_DS & ready_TO_DUT_DS) begin
            expected_output <= expected_output + 10000;
        end
    end
end

// Monitor to check number and correctness of outputs.
always @ (posedge clk) begin
    clk_cntr <= reset ? 0 : clk_cntr + 1;
    if (valid_FROM_DUT_DS & ready_TO_DUT_DS) begin
        output_cntr <= output_cntr + 1;
        if (expected_output == data_FROM_DUT_DS) begin
            match_cntr <= match_cntr + 1;
            // $display("At cycle %d: output matches expected value, %d == %d",
            //     clk_cntr, expected_output, data_FROM_DUT_DS);
        end else begin
            $display("At cycle %d: output != expected value, %d != %d",
                clk_cntr, data_FROM_DUT_DS, expected_output);
        end
    end
    if (output_cntr == NUM_EXPECTED_OUTPUT) begin
        if (match_cntr == output_cntr)
            $display("At cycle %d: PASS", clk_cntr);
        else
            $display("FAIL: %d matches out of %d", match_cntr, output_cntr);
        $finish;
    end
end

endmodule