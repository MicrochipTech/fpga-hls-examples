`timescale 1 ns / 1 ns
module rom_single_port
(
    clk,
    reset,
    clken,
    read_en_a,
    address_a,
    read_data_a
);

parameter width_a = 1'd1;
parameter widthad_a = 1'd1;
parameter numwords_a = 1'd1;
parameter init_file = "";
parameter latency = 1;
parameter fpga_device = "";
parameter synthesis_ram_style = "";

input  clk;
input  reset;
input  clken;
input  read_en_a;
input [(widthad_a-1):0] address_a;
output wire [(width_a-1):0] read_data_a;
reg [(width_a-1):0] read_data_a_wire;

reg [width_a-1:0] ram [numwords_a-1:0];

initial begin
    if (init_file != "")
        $readmemb(init_file, ram);
end

localparam input_latency = ((latency - 1) >> 1);
localparam output_latency = (latency - 1) - input_latency;
integer j;

reg [(widthad_a-1):0] address_a_reg[input_latency:0];

always @(*) begin
    address_a_reg[0] = address_a;
end

always @(posedge clk)
if (clken) begin
    for (j = 0; j < input_latency; j=j+1) begin
        address_a_reg[j+1] <= address_a_reg[j];
    end
end

always @ (posedge clk)
if (clken) begin
    read_data_a_wire <= ram[address_a_reg[input_latency]];
end

reg [(width_a-1):0] read_data_a_reg[output_latency:0];

always @(*) begin
    read_data_a_reg[0] <= read_data_a_wire;
end

always @(posedge clk)
if (clken) begin
    for (j = 0; j < output_latency; j=j+1) begin
        read_data_a_reg[j+1] <= read_data_a_reg[j];
    end
end

assign read_data_a = read_data_a_reg[output_latency];

endmodule
