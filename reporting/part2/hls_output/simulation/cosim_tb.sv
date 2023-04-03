`timescale 1 ns / 1 ns
module sobel_filter_top_tb ();
localparam NUM_CALLS = 1;
localparam AXI_VERBOSE_LEVEL = 0;

localparam INPUT_FIFO_STALL_PROB = 0;
localparam OUTPUT_FIFO_STALL_PROB = 0;
localparam MAX_STALL_CYCLES = 5;

localparam in_var_IN_SW_DAT = "sw/sobel_filter_in_var.in.sw.dat";
localparam in_var_OUT_HW_DAT = "sw/sobel_filter_in_var.out.hw.dat";
localparam out_var_IN_SW_DAT = "sw/sobel_filter_out_var.in.sw.dat";
localparam out_var_OUT_HW_DAT = "sw/sobel_filter_out_var.out.hw.dat";


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

wire in_var_clken;
wire [18 - 1:0] in_var_address_a;
wire [18 - 1:0] in_var_address_b;
wire in_var_write_en_a;
wire in_var_write_en_b;
wire in_var_read_en_a;
wire in_var_read_en_b;
wire [8 - 1:0] in_var_write_data_a;
wire [8 - 1:0] in_var_write_data_b;
wire [8 - 1:0] in_var_read_data_a;
wire [8 - 1:0] in_var_read_data_b;
wire [1 - 1:0] in_var_byte_en_a;
wire [1 - 1:0] in_var_byte_en_b;
wire out_var_clken;
wire [18 - 1:0] out_var_address_a;
wire [18 - 1:0] out_var_address_b;
wire out_var_write_en_a;
wire out_var_write_en_b;
wire out_var_read_en_a;
wire out_var_read_en_b;
wire [8 - 1:0] out_var_write_data_a;
wire [8 - 1:0] out_var_write_data_b;
wire [8 - 1:0] out_var_read_data_a;
wire [8 - 1:0] out_var_read_data_b;
wire [1 - 1:0] out_var_byte_en_a;
wire [1 - 1:0] out_var_byte_en_b;








sobel_filter_top DUT_sobel_filter_top (
   .clk( clk ),
   .reset( reset ),
   .start( start ),
   .ready( DUT_ready ),
   .finish( finish ),
   // memory argument: in_var
   .in_var_clken( in_var_clken ),
   .in_var_address_a( in_var_address_a ),
   .in_var_address_b( in_var_address_b ),
   .in_var_read_en_a( in_var_read_en_a ),
   .in_var_read_en_b( in_var_read_en_b ),
   .in_var_read_data_a( in_var_read_data_a ),
   .in_var_read_data_b( in_var_read_data_b ),
   // memory argument: out_var
   .out_var_clken( out_var_clken ),
   .out_var_address_a( out_var_address_a ),
   .out_var_address_b( out_var_address_b ),
   .out_var_read_en_a( out_var_read_en_a ),
   .out_var_read_en_b( out_var_read_en_b ),
   .out_var_read_data_a( out_var_read_data_a ),
   .out_var_read_data_b( out_var_read_data_b ),
   .out_var_write_en_a( out_var_write_en_a ),
   .out_var_write_en_b( out_var_write_en_b ),
   .out_var_write_data_a( out_var_write_data_a ),
   .out_var_write_data_b( out_var_write_data_b )

);








cosim_ram_dual_port in_var (
	.clk( clk ),
	.clken( in_var_clken ),
	.address_a( in_var_address_a ),
	.write_en_a( in_var_write_en_a ),
	.write_data_a( in_var_write_data_a ),
	.byte_en_a( in_var_byte_en_a ),
	.read_data_a( in_var_read_data_a ),
	.address_b( in_var_address_b ),
	.write_en_b( in_var_write_en_b ),
	.write_data_b( in_var_write_data_b ),
	.byte_en_b( in_var_byte_en_b ),
	.read_data_b( in_var_read_data_b )
);
defparam in_var.width_a = 8;
defparam in_var.widthad_a = 18;
defparam in_var.width_be_a = 1;
defparam in_var.numwords_a = 262144;
defparam in_var.width_b = 8;
defparam in_var.widthad_b = 18;
defparam in_var.width_be_b = 1;
defparam in_var.numwords_b = 262144;
defparam in_var.latency = 1;
defparam in_var.uses_byte_enables = 0;


// reg in_var_store_process_done;

initial begin : initialize_memory_in_var
    integer fp;
    integer calls;
    string filename;
    calls = 0;
    @(posedge clk);
    wait(reset == 0);
    while(calls < NUM_CALLS) begin
        wait (accel_start == 1 && accel_ready == 1);
        // wait (in_var_store_process_done == 1);
        // in_var_store_process_done = 0;
        if (calls < 100)
            $display("Initializing memory in_var at cycle = %d", cycle_count);
        $sformat(filename, {in_var_IN_SW_DAT,"%0d"}, calls);
        fp = $fopen(filename, "r");
        if(fp == 0) begin
            $display("Error: Could not open file '%s'", filename);
            $finish;
        end
        $readmemh(filename, in_var.regular.ram_dual_port_regular_inst.ram.ram);
        $fclose(fp);
        @(posedge clk); #1;
        calls = calls + 1;
    end
end

initial begin : store_memory_in_var
    integer fp;
    integer calls;
    string filename;
    calls = 0;
    @(posedge clk);
    wait(reset == 0);
    // in_var_store_process_done = 1;
    while(calls < NUM_CALLS) begin
        wait (accel_finish == 1);
        if (calls < 100)
            $display("Storing memory contents in_var at cycle = %d", cycle_count);
        $sformat(filename, {in_var_OUT_HW_DAT,"%0d"}, calls);
        $writememh(filename, in_var.regular.ram_dual_port_regular_inst.ram.ram);
        // in_var_store_process_done = 1;
        calls = calls + 1;
        @(posedge clk); #1; 
    end
end



cosim_ram_dual_port out_var (
	.clk( clk ),
	.clken( out_var_clken ),
	.address_a( out_var_address_a ),
	.write_en_a( out_var_write_en_a ),
	.write_data_a( out_var_write_data_a ),
	.byte_en_a( out_var_byte_en_a ),
	.read_data_a( out_var_read_data_a ),
	.address_b( out_var_address_b ),
	.write_en_b( out_var_write_en_b ),
	.write_data_b( out_var_write_data_b ),
	.byte_en_b( out_var_byte_en_b ),
	.read_data_b( out_var_read_data_b )
);
defparam out_var.width_a = 8;
defparam out_var.widthad_a = 18;
defparam out_var.width_be_a = 1;
defparam out_var.numwords_a = 262144;
defparam out_var.width_b = 8;
defparam out_var.widthad_b = 18;
defparam out_var.width_be_b = 1;
defparam out_var.numwords_b = 262144;
defparam out_var.latency = 1;
defparam out_var.uses_byte_enables = 0;


// reg out_var_store_process_done;

initial begin : initialize_memory_out_var
    integer fp;
    integer calls;
    string filename;
    calls = 0;
    @(posedge clk);
    wait(reset == 0);
    while(calls < NUM_CALLS) begin
        wait (accel_start == 1 && accel_ready == 1);
        // wait (out_var_store_process_done == 1);
        // out_var_store_process_done = 0;
        if (calls < 100)
            $display("Initializing memory out_var at cycle = %d", cycle_count);
        $sformat(filename, {out_var_IN_SW_DAT,"%0d"}, calls);
        fp = $fopen(filename, "r");
        if(fp == 0) begin
            $display("Error: Could not open file '%s'", filename);
            $finish;
        end
        $readmemh(filename, out_var.regular.ram_dual_port_regular_inst.ram.ram);
        $fclose(fp);
        @(posedge clk); #1;
        calls = calls + 1;
    end
end

initial begin : store_memory_out_var
    integer fp;
    integer calls;
    string filename;
    calls = 0;
    @(posedge clk);
    wait(reset == 0);
    // out_var_store_process_done = 1;
    while(calls < NUM_CALLS) begin
        wait (accel_finish == 1);
        if (calls < 100)
            $display("Storing memory contents out_var at cycle = %d", cycle_count);
        $sformat(filename, {out_var_OUT_HW_DAT,"%0d"}, calls);
        $writememh(filename, out_var.regular.ram_dual_port_regular_inst.ram.ram);
        // out_var_store_process_done = 1;
        calls = calls + 1;
        @(posedge clk); #1; 
    end
end



assign all_init = 0;

assign ready = DUT_ready & !all_init;
assign all_done = 1;

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
sobel_filter_top_tb sobel_filter_top_tb_inst();
initial begin : finish_condition
	while (!(sobel_filter_top_tb_inst.finished)) begin
		@(posedge clk);
	end
	$finish;
end
endmodule

`timescale 1ns / 1ns
// ©2022 Microchip Technology Inc. and its subsidiaries
//
// Subject to your compliance with these terms, you may use this Microchip
// software and any derivatives exclusively with Microchip products. You are
// responsible for complying with third party license terms applicable to your
// use of third party software (including open source software) that may
// accompany this Microchip software. SOFTWARE IS “AS IS.” NO WARRANTIES,
// WHETHER EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING
// ANY IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, OR FITNESS FOR
// A PARTICULAR PURPOSE. IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY
// INDIRECT, SPECIAL, PUNITIVE, INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST
// OR EXPENSE OF ANY KIND WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED,
// EVEN IF MICROCHIP HAS BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE
// FORESEEABLE.  TO THE FULLEST EXTENT ALLOWED BY LAW, MICROCHIP’S TOTAL
// LIABILITY ON ALL CLAIMS LATED TO THE SOFTWARE WILL NOT EXCEED AMOUNT OF
// FEES, IF ANY, YOU PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE. MICROCHIP
// OFFERS NO SUPPORT FOR THE SOFTWARE. YOU MAY CONTACT MICROCHIP AT
// https://www.microchip.com/en-us/support-and-training/design-help/client-support-services
// TO INQUIRE ABOUT SUPPORT SERVICES AND APPLICABLE FEES, IF AVAILABLE.

module cosim_ram_dual_port (
	clk,
	clken,
	address_a,
	read_en_a,
	write_en_a,
	write_data_a,
	byte_en_a,
	read_data_a,
	address_b,
	read_en_b,
	write_en_b,
	write_data_b,
	byte_en_b,
	read_data_b
);

parameter  width_a = 1'd1;
parameter  widthad_a = 1'd1;
parameter  numwords_a = 1'd1;
parameter  width_be_a = 1'd1;
parameter  width_b = 1'd1;
parameter  widthad_b = 1'd1;
parameter  numwords_b = 1'd1;
parameter  width_be_b = 1'd1;
parameter  init_file = "";
parameter  latency = 1;
parameter  fpga_device = "";
parameter  uses_byte_enables = 1'd0;
parameter  synthesis_ram_style = "";

input  clk;
input  clken;
input [(widthad_a-1):0] address_a;
output wire [(width_a-1):0] read_data_a;
wire [(width_a-1):0] read_data_a_wire;
input  read_en_a;
input  write_en_a;
input [(width_a-1):0] write_data_a;
input [width_be_a-1:0] byte_en_a;
input [(widthad_b-1):0] address_b;
output wire [(width_b-1):0] read_data_b;
wire [(width_b-1):0] read_data_b_wire;
input  read_en_b;
input  write_en_b;
input [(width_b-1):0] write_data_b;
input [width_be_b-1:0] byte_en_b;

localparam input_latency = ((latency - 1) >> 1);
localparam output_latency = (latency - 1) - input_latency;
localparam output_latency_inner_module = ((output_latency >= 1) ? 1 : 0);
localparam output_latency_wrapper = output_latency - output_latency_inner_module;
integer latency_num;

// additional input registers if needed
reg [(widthad_a-1):0] address_a_reg[input_latency:0];
reg  write_en_a_reg[input_latency:0];
reg [(width_a-1):0] write_data_a_reg[input_latency:0];
reg [(width_be_a-1):0] byte_en_a_reg[input_latency:0];
reg [(widthad_b-1):0] address_b_reg[input_latency:0];
reg  write_en_b_reg[input_latency:0];
reg [(width_b-1):0] write_data_b_reg[input_latency:0];
reg [(width_be_b-1):0] byte_en_b_reg[input_latency:0];

always @(*) begin
    address_a_reg[0] = address_a;
    write_en_a_reg[0] = write_en_a;
    write_data_a_reg[0] = write_data_a;
    byte_en_a_reg[0] = byte_en_a;
    address_b_reg[0] = address_b;
    write_en_b_reg[0] = write_en_b;
    write_data_b_reg[0] = write_data_b;
    byte_en_b_reg[0] = byte_en_b;
end

always @(posedge clk)
if (clken) begin
    for (latency_num = 0; latency_num < input_latency; latency_num = latency_num + 1) begin
        address_a_reg[latency_num + 1] <= address_a_reg[latency_num];
        write_en_a_reg[latency_num + 1] <= write_en_a_reg[latency_num];
        write_data_a_reg[latency_num + 1] <= write_data_a_reg[latency_num];
        byte_en_a_reg[latency_num + 1] <= byte_en_a_reg[latency_num];
        address_b_reg[latency_num + 1] <= address_b_reg[latency_num];
        write_en_b_reg[latency_num + 1] <= write_en_b_reg[latency_num];
        write_data_b_reg[latency_num + 1] <= write_data_b_reg[latency_num];
        byte_en_b_reg[latency_num + 1] <= byte_en_b_reg[latency_num];
    end
end

generate
if (uses_byte_enables == 1) begin : byte_enabled

    // instantiate byte-enabled RAM 
    cosim_ram_dual_port_byte_enabled ram_dual_port_byte_enabled_inst(
        .clk(clk),
        .clken(clken),
        .address_a(address_a_reg[input_latency]),
        .read_en_a(),
        .write_en_a(write_en_a_reg[input_latency]),
        .write_data_a(write_data_a_reg[input_latency]),
        .byte_en_a(byte_en_a_reg[input_latency]),
        .read_data_a(read_data_a_wire),
        .address_b(address_b_reg[input_latency]),
        .read_en_b(),
        .write_en_b(write_en_b_reg[input_latency]),
        .write_data_b(write_data_b_reg[input_latency]),
        .byte_en_b(byte_en_b_reg[input_latency]),
        .read_data_b(read_data_b_wire)
    );
    defparam
        ram_dual_port_byte_enabled_inst.width_a = width_a,
        ram_dual_port_byte_enabled_inst.width_be_a = width_be_a,
        ram_dual_port_byte_enabled_inst.widthad_a = widthad_a,
        ram_dual_port_byte_enabled_inst.numwords_a = numwords_a,
        ram_dual_port_byte_enabled_inst.width_b = width_b,
        ram_dual_port_byte_enabled_inst.width_be_b = width_be_b,
        ram_dual_port_byte_enabled_inst.widthad_b = widthad_b,
        ram_dual_port_byte_enabled_inst.numwords_b = numwords_b,
        ram_dual_port_byte_enabled_inst.use_output_reg = output_latency_inner_module,
        ram_dual_port_byte_enabled_inst.fpga_device = fpga_device,
        ram_dual_port_byte_enabled_inst.synthesis_ram_style = synthesis_ram_style,
        ram_dual_port_byte_enabled_inst.init_file = init_file;

end else begin : regular

    // instantiate non-byte-enabled RAM
    cosim_ram_dual_port_regular ram_dual_port_regular_inst(
        .clk(clk),
        .clken(clken),
        .address_a(address_a_reg[input_latency]),
        .read_en_a(),
        .write_en_a(write_en_a_reg[input_latency]),
        .write_data_a(write_data_a_reg[input_latency]),        
        .read_data_a(read_data_a_wire),
        .address_b(address_b_reg[input_latency]),
        .read_en_b(),
        .write_en_b(write_en_b_reg[input_latency]),
        .write_data_b(write_data_b_reg[input_latency]),        
        .read_data_b(read_data_b_wire)
    );
    defparam
        ram_dual_port_regular_inst.width_a = width_a,        
        ram_dual_port_regular_inst.widthad_a = widthad_a,
        ram_dual_port_regular_inst.numwords_a = numwords_a,
        ram_dual_port_regular_inst.width_b = width_b,        
        ram_dual_port_regular_inst.widthad_b = widthad_b,
        ram_dual_port_regular_inst.numwords_b = numwords_b,
        ram_dual_port_regular_inst.use_output_reg = output_latency_inner_module,
        ram_dual_port_regular_inst.fpga_device = fpga_device,
        ram_dual_port_regular_inst.synthesis_ram_style = synthesis_ram_style,
        ram_dual_port_regular_inst.init_file = init_file;
   
end
endgenerate

// additional output registers if needed
reg [(width_a-1):0] read_data_a_reg[output_latency_wrapper:0];

always @(*) begin
   read_data_a_reg[0] <= read_data_a_wire;
end

always @(posedge clk)
if (clken) begin
    for (latency_num = 0; latency_num < output_latency_wrapper; latency_num = latency_num + 1) begin
       read_data_a_reg[latency_num + 1] <= read_data_a_reg[latency_num];
    end
end

assign read_data_a = read_data_a_reg[output_latency_wrapper];

reg [(width_b-1):0] read_data_b_reg[output_latency_wrapper:0];

always @(*) begin
    read_data_b_reg[0] <= read_data_b_wire;
end

always @(posedge clk)
if (clken) begin
    for (latency_num = 0; latency_num < output_latency_wrapper; latency_num = latency_num + 1) begin
        read_data_b_reg[latency_num + 1] <= read_data_b_reg[latency_num];
    end
end

assign read_data_b = read_data_b_reg[output_latency_wrapper];

endmodule

// define all the logic that will be used multiple times in different modules

`define SHLS_RAM_DUAL_PORT_INITIALIZATION      \
    initial begin                              \
        if (init_file != "")                   \
            $readmemb(init_file, ram);         \
    end

`define SHLS_RAM_DUAL_PORT_BYTE_ENABLE_LOGIC                                                                                        \
    always @ (posedge clk) begin                                                                                                    \
        if (clken) begin                                                                                                            \
            if (write_en_a) begin                                                                                                   \
                for(bank_num = 0; bank_num < width_be_a; bank_num = bank_num + 1) begin                                             \
                    if (byte_en_a[bank_num]) begin                                                                                  \
                        ram[address_a][bank_num * byte_width +: byte_width] <= write_data_a[bank_num * byte_width +: byte_width];   \
                    end                                                                                                             \
                end                                                                                                                 \
            end else begin                                                                                                          \
                read_data_a_wire <= ram[address_a];                                                                                 \
            end                                                                                                                     \
        end                                                                                                                         \
        if (clken) begin                                                                                                            \
            if (write_en_b) begin                                                                                                   \
                for(bank_num = 0; bank_num < width_be_b; bank_num = bank_num + 1) begin                                             \
                    if (byte_en_b[bank_num]) begin                                                                                  \
                        ram[address_b][bank_num * byte_width +: byte_width] <= write_data_b[bank_num * byte_width +: byte_width];   \
                    end                                                                                                             \
                end                                                                                                                 \
            end else begin                                                                                                          \
                read_data_b_wire <= ram[address_b];                                                                                 \
            end                                                                                                                     \
        end                                                                                                                         \
    end

`define SHLS_RAM_DUAL_PORT_LOGIC                        \
    always @ (posedge clk) begin                        \
        if (clken) begin                                \
            if (write_en_a) begin                       \
                ram[address_a] <= write_data_a;         \
            end else begin                              \
                read_data_a_wire <= ram[address_a];     \
            end                                         \
        end                                             \
        if (clken) begin                                \
            if (write_en_b) begin                       \
                ram[address_b] <= write_data_b;         \
            end else begin                              \
                read_data_b_wire <= ram[address_b];     \
            end                                         \
        end                                             \
    end 

`define SHLS_RAM_DUAL_PORT_LOGIC_OUTPUT_REG                                         \
    reg [(width_a-1):0] read_data_a_reg/* synthesis syn_allow_retiming = 0 */;      \
    always @(posedge clk)                                                           \
    if (clken) begin                                                                \
        read_data_a_reg <= read_data_a_wire;                                        \
    end                                                                             \
    assign read_data_a = read_data_a_reg;                                           \
    reg [(width_b-1):0] read_data_b_reg/* synthesis syn_allow_retiming = 0 */;      \
    always @(posedge clk)                                                           \
    if (clken) begin                                                                \
        read_data_b_reg <= read_data_b_wire;                                        \
    end                                                                             \
    assign read_data_b = read_data_b_reg;

module cosim_ram_dual_port_byte_enabled (
	clk,
	clken,
	address_a,
	read_en_a,
	write_en_a,
	write_data_a,
	byte_en_a,
	read_data_a,
	address_b,
	read_en_b,
	write_en_b,
	write_data_b,
	byte_en_b,
	read_data_b
);

parameter  width_a = 1'd1;
parameter  widthad_a = 1'd1;
parameter  numwords_a = 1'd1;
parameter  width_be_a = 1'd1;
parameter  width_b = 1'd1;
parameter  widthad_b = 1'd1;
parameter  numwords_b = 1'd1;
parameter  width_be_b = 1'd1;
parameter  init_file = "";
parameter  use_output_reg = 0;
parameter  fpga_device = "";
parameter  synthesis_ram_style = "";
localparam  byte_width = 8;
integer bank_num;

input  clk;
input  clken;
input [(widthad_a-1):0] address_a;
output wire [(width_a-1):0] read_data_a;
reg [(width_a-1):0] read_data_a_wire;
input  read_en_a;
input  write_en_a;
input [(width_a-1):0] write_data_a;
input [width_be_a-1:0] byte_en_a;
input [(widthad_b-1):0] address_b;
output wire [(width_b-1):0] read_data_b;
reg [(width_b-1):0] read_data_b_wire;
input  read_en_b;
input  write_en_b;
input [(width_b-1):0] write_data_b;
input [width_be_b-1:0] byte_en_b;

generate
if (synthesis_ram_style == "registers" || (fpga_device == "SmartFusion2" && init_file != "") ) begin

    reg [width_a-1:0] ram [numwords_a-1:0] /* synthesis syn_ramstyle = "registers" */;
    `SHLS_RAM_DUAL_PORT_INITIALIZATION
    `SHLS_RAM_DUAL_PORT_BYTE_ENABLE_LOGIC

end else begin : ram

    reg [width_a-1:0] ram [numwords_a-1:0];
    `SHLS_RAM_DUAL_PORT_INITIALIZATION
    `SHLS_RAM_DUAL_PORT_BYTE_ENABLE_LOGIC

end
endgenerate

generate
if (use_output_reg == 1) begin

    // if using output registers
    `SHLS_RAM_DUAL_PORT_LOGIC_OUTPUT_REG

end else begin

    // if not using output registers
    assign read_data_a = read_data_a_wire;
    assign read_data_b = read_data_b_wire;

end
endgenerate

endmodule

module cosim_ram_dual_port_regular (
	clk,
	clken,
	address_a,
	read_en_a,
	write_en_a,
	write_data_a,
	read_data_a,
	address_b,
	read_en_b,
	write_en_b,
	write_data_b,
	read_data_b
);

parameter  width_a = 1'd1;
parameter  widthad_a = 1'd1;
parameter  numwords_a = 1'd1;
parameter  width_b = 1'd1;
parameter  widthad_b = 1'd1;
parameter  numwords_b = 1'd1;
parameter  init_file = "";
parameter  use_output_reg = 0;
parameter  fpga_device = "";
parameter  synthesis_ram_style = "";

input  clk;
input  clken;
input [(widthad_a-1):0] address_a;
output wire [(width_a-1):0] read_data_a;
reg [(width_a-1):0] read_data_a_wire;
input  read_en_a;
input  write_en_a;
input [(width_a-1):0] write_data_a;
input [(widthad_b-1):0] address_b;
output wire [(width_b-1):0] read_data_b;
reg [(width_b-1):0] read_data_b_wire;
input  read_en_b;
input  write_en_b;
input [(width_b-1):0] write_data_b;

generate
if (synthesis_ram_style == "registers" || (fpga_device == "SmartFusion2" && init_file != "") ) begin

    reg [width_a-1:0] ram [numwords_a-1:0] /* synthesis syn_ramstyle = "registers" */;
    `SHLS_RAM_DUAL_PORT_INITIALIZATION
    `SHLS_RAM_DUAL_PORT_LOGIC

end else begin : ram

    reg [width_a-1:0] ram [numwords_a-1:0];
    `SHLS_RAM_DUAL_PORT_INITIALIZATION
    `SHLS_RAM_DUAL_PORT_LOGIC

end
endgenerate

generate
if (use_output_reg == 1) begin

    // if using output registers
    `SHLS_RAM_DUAL_PORT_LOGIC_OUTPUT_REG

end else begin

    // if not using output registers
    assign read_data_a = read_data_a_wire;
    assign read_data_b = read_data_b_wire;

end
endgenerate
        
endmodule
