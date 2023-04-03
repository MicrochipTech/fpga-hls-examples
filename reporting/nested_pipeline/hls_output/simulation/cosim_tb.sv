`timescale 1 ns / 1 ns
module row_cumulative_sum_top_tb ();
localparam NUM_CALLS = 1;
localparam AXI_VERBOSE_LEVEL = 0;

localparam INPUT_FIFO_STALL_PROB = 0;
localparam OUTPUT_FIFO_STALL_PROB = 0;
localparam MAX_STALL_CYCLES = 5;

localparam grid_IN_SW_DAT = "sw/row_cumulative_sum_grid.in.sw.dat";
localparam grid_OUT_HW_DAT = "sw/row_cumulative_sum_grid.out.hw.dat";


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

wire grid_clken;
wire [16 - 1:0] grid_address_a;
wire [16 - 1:0] grid_address_b;
wire grid_write_en_a;
wire grid_write_en_b;
wire grid_read_en_a;
wire grid_read_en_b;
wire [32 - 1:0] grid_write_data_a;
wire [32 - 1:0] grid_write_data_b;
wire [32 - 1:0] grid_read_data_a;
wire [32 - 1:0] grid_read_data_b;
wire [4 - 1:0] grid_byte_en_a;
wire [4 - 1:0] grid_byte_en_b;








row_cumulative_sum_top DUT_row_cumulative_sum_top (
   .clk( clk ),
   .reset( reset ),
   .start( start ),
   .ready( DUT_ready ),
   .finish( finish ),
   // memory argument: grid
   .grid_clken( grid_clken ),
   .grid_address_a( grid_address_a ),
   .grid_address_b( grid_address_b ),
   .grid_read_en_a( grid_read_en_a ),
   .grid_read_en_b( grid_read_en_b ),
   .grid_read_data_a( grid_read_data_a ),
   .grid_read_data_b( grid_read_data_b ),
   .grid_write_en_a( grid_write_en_a ),
   .grid_write_en_b( grid_write_en_b ),
   .grid_write_data_a( grid_write_data_a ),
   .grid_write_data_b( grid_write_data_b )

);








cosim_ram_dual_port grid (
	.clk( clk ),
	.clken( grid_clken ),
	.address_a( grid_address_a ),
	.write_en_a( grid_write_en_a ),
	.write_data_a( grid_write_data_a ),
	.byte_en_a( grid_byte_en_a ),
	.read_data_a( grid_read_data_a ),
	.address_b( grid_address_b ),
	.write_en_b( grid_write_en_b ),
	.write_data_b( grid_write_data_b ),
	.byte_en_b( grid_byte_en_b ),
	.read_data_b( grid_read_data_b )
);
defparam grid.width_a = 32;
defparam grid.widthad_a = 16;
defparam grid.width_be_a = 4;
defparam grid.numwords_a = 40000;
defparam grid.width_b = 32;
defparam grid.widthad_b = 16;
defparam grid.width_be_b = 4;
defparam grid.numwords_b = 40000;
defparam grid.latency = 1;
defparam grid.uses_byte_enables = 0;


// reg grid_store_process_done;

initial begin : initialize_memory_grid
    integer fp;
    integer calls;
    string filename;
    calls = 0;
    @(posedge clk);
    wait(reset == 0);
    while(calls < NUM_CALLS) begin
        wait (accel_start == 1 && accel_ready == 1);
        // wait (grid_store_process_done == 1);
        // grid_store_process_done = 0;
        if (calls < 100)
            $display("Initializing memory grid at cycle = %d", cycle_count);
        $sformat(filename, {grid_IN_SW_DAT,"%0d"}, calls);
        fp = $fopen(filename, "r");
        if(fp == 0) begin
            $display("Error: Could not open file '%s'", filename);
            $finish;
        end
        $readmemh(filename, grid.regular.ram_dual_port_regular_inst.ram.ram);
        $fclose(fp);
        @(posedge clk); #1;
        calls = calls + 1;
    end
end

initial begin : store_memory_grid
    integer fp;
    integer calls;
    string filename;
    calls = 0;
    @(posedge clk);
    wait(reset == 0);
    // grid_store_process_done = 1;
    while(calls < NUM_CALLS) begin
        wait (accel_finish == 1);
        if (calls < 100)
            $display("Storing memory contents grid at cycle = %d", cycle_count);
        $sformat(filename, {grid_OUT_HW_DAT,"%0d"}, calls);
        $writememh(filename, grid.regular.ram_dual_port_regular_inst.ram.ram);
        // grid_store_process_done = 1;
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
row_cumulative_sum_top_tb row_cumulative_sum_top_tb_inst();
initial begin : finish_condition
	while (!(row_cumulative_sum_top_tb_inst.finished)) begin
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
