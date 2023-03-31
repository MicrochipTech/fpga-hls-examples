`timescale 1 ns / 1 ns
module sum_collatz_top_tb ();
localparam NUM_CALLS = 1;
localparam AXI_VERBOSE_LEVEL = 0;

localparam INPUT_FIFO_STALL_PROB = 0;
localparam OUTPUT_FIFO_STALL_PROB = 0;
localparam MAX_STALL_CYCLES = 5;

localparam return_val_OUT_HW_DAT = "sw/sum_collatz_return_val.out.hw.dat";
localparam return_val_OUT_SW_DAT = "sw/sum_collatz_return_val.out.sw.dat";
localparam n_IN_SW_DAT = "sw/sum_collatz_n.in.sw.dat";


integer output_ports_finished = 0;
//integer mismatches = 0;

reg clk;
initial clk = 0;
always @(clk) clk <= #10 ~clk;

wire finish;
reg ready;
reg DUT_ready;

// start.
reg start;
// reset.
reg reset;
reg ready_TO_DUT_DS;
wire all_init;
initial begin : start_block
    integer i;
    integer calls;
    ready_TO_DUT_DS = 0;
    start = 0;
    calls = 0;
    reset = 1;
    repeat (10) @(negedge clk);
    reset = 0;
    @(posedge clk)
    while(calls < NUM_CALLS) begin
        wait(all_init == 0)
        start = 1;
    	 ready_TO_DUT_DS = 1;
        @(posedge clk) #1;
        start = 0;
        wait (finish == 1)
    	 ready_TO_DUT_DS = 0;
        @(posedge clk)
        calls = calls + 1;
    end
end

reg accel_start;
reg accel_ready;
reg accel_finish;
assign accel_start = start;
assign accel_ready = ready;
assign accel_finish = finish;


integer cycle_count = 0;
always @ (posedge clk) begin
    if (reset)
        cycle_count <= 0;
    else if (!all_init)
        cycle_count <= cycle_count + 1;
end

wire [31:0] return_val;
reg [31:0] n;








sum_collatz_top DUT_sum_collatz_top (
   .clk( clk ),
   .reset( reset ),
   .start( start ),
   .ready( DUT_ready ),
   .finish( finish ),
   .return_val( return_val ),
   // Constant argument: n
   .n( n )

);



initial begin : read_n
    integer transfers;
    integer i;
    integer fp;
    integer calls;
    integer ret;
    integer call_num;
    reg [31:0] __legup_in;
    fp = $fopen(n_IN_SW_DAT, "r");
    if(fp == 0) begin
        $display("Error: Could not open file '%s'", n_IN_SW_DAT);
        $finish;
    end
    calls = 0;
    while(calls < NUM_CALLS) begin
        ret = $fscanf(fp, "Call %d: %d transfers\n", call_num, transfers);
        if (ret !== 2) begin
            $display("Error: Could not parse file '%s'", n_IN_SW_DAT);
            $finish;
        end
        if (calls < 100)
            $display("Initializing constant argument n at cycle = %d", cycle_count);
        for (i = 0; i < transfers; i = i + 1) begin
            ret = $fscanf(fp, "%x\n", __legup_in);
            if (ret !== 1) begin
                $display("Error: Could not parse file '%s'", n_IN_SW_DAT);
                $finish;
            end

            // There is a possibility here that the argument name could be the
            // same as one of the local variables. In this case a silent
            // failure is possible since the simulator will just use the local
            // variable, whereas here we want to write the argument. So
            // specify the argument hierarchically.
            cosim_tb.sum_collatz_top_tb_inst.n = __legup_in;
            wait (accel_start == 1 && accel_ready == 1);
            @(posedge clk); #1;
        end
        calls = calls + 1;
    end
    $fclose(fp);
end



reg return_val_done = 0;
initial begin : write_return_val
    integer transfers;
    integer i;
    integer fp_out;
    integer fp_golden;
    integer calls;
    integer ret;
    integer call_num;
    reg [31:0] expected_output;
    fp_out = $fopen(return_val_OUT_HW_DAT, "w");
    if(fp_out == 0) begin
        $display("Error: Could not open file '%s'", return_val_OUT_HW_DAT);
        $finish;
    end
    fp_golden = $fopen(return_val_OUT_SW_DAT, "r");
    if(fp_golden == 0) begin
        $display("Error: Could not open file '%s'", return_val_OUT_SW_DAT);
        $finish;
    end
    calls = 0;
    return_val_done = 0;
    while(calls < NUM_CALLS) begin
        if (finish) begin
            ret = $fscanf(fp_golden, "Call %d: %d transfers\n", call_num, transfers);
            if (ret !== 2) begin
                $display("Error: Could not parse file '%s'", return_val_OUT_SW_DAT);
                $finish;
            end
            // TODO: number of transfers is read from golden output. Should be determined from start/finish
            ret = $fscanf(fp_golden, "%x\n", expected_output);
            if (ret !== 1) begin
                $display("Error: Could not parse file '%s'", return_val_OUT_SW_DAT);
                $finish;
            end
            if (calls < 100)
                $display("Storing return value return_val at cycle = %d", cycle_count);
            $fwrite(fp_out, "Call %d: %d transfers\n", calls, transfers);
            // There is a possibility here that the argument name could be the
            // same as one of the local variables. In this case a silent
            // failure is possible since the simulator will just use the local
            // variable, whereas here we want to write the argument. So
            // specify the argument hierarchically.
            $fwrite(fp_out,"%x\n", cosim_tb.sum_collatz_top_tb_inst.return_val);
            //if (expected_output !== cosim_tb.sum_collatz_top_tb_inst.return_val) begin
                //mismatches = mismatches + 1;
                //$display("Error: SW/HW co-simulation mismatch at return_val (number: %d). Expected != Actual. 0x%x != 0x%x",
                        //calls, expected_output, return_val);
            //end
            calls = calls + 1;
        end
        @(posedge clk);
    end
    $fclose(fp_out);
    $fclose(fp_golden);
    return_val_done = 1;
end




assign all_init = 0;

assign ready = DUT_ready & !all_init;
assign all_done = 1 && return_val_done;

reg finished;

initial begin : finish_condition
    integer finish_count;
    finished = 0;
    finish_count = 0;
    while (finish_count < NUM_CALLS) begin
        if (finish) begin
            finish_count = finish_count + 1;
            if ((finish_count < 100) || (finish_count >= 100 && finish_count % 100 == 0))
                $display("%d / %d function calls completed.", finish_count, NUM_CALLS);
            if (finish_count == 100)
                $display("\n### Suppressing repeated log messages after 100-th calls. ###\n\n");
        end
        wait(all_init == 0);
        @(posedge clk);
    end
    while (!all_done) begin
        @(posedge clk);
    end
    $display("Number of calls: %d", NUM_CALLS);
    $display("Cycle latency: %d", cycle_count);
    //if (mismatches != 0) begin
        //$display("Error: %d mismatches between SW and HW simulation", mismatches);
        //$display("SW/HW co-simulation result: FAIL");
    //end
    finished = 1;
end

endmodule
module cosim_tb();
initial $display("Running SW/HW co-simulation...");reg clk;
initial clk = 0;
always @(clk) clk <= #10 ~clk;
sum_collatz_top_tb sum_collatz_top_tb_inst();
initial begin : finish_condition
	while (!(sum_collatz_top_tb_inst.finished)) begin
		@(posedge clk);
	end
	$finish;
end
endmodule
