`timescale 1 ns / 1 ns
module ram_single_port
(
    clk,
    reset,
    clken,
    read_en_a,
    write_en_a,
    address_a,
    byte_en_a,
    write_data_a,
    read_data_a
);
 
parameter  width_a = 1'd0;
parameter  widthad_a = 1'd0;
parameter  width_be_a = 1'd0;
parameter  numwords_a = 1'd0;
parameter  init_file = "";
parameter  latency = 1;
parameter  fpga_device = "";
parameter  synthesis_ram_style = "";
parameter  uses_byte_enables = 1'd0;
parameter  byte_width = 8;
parameter [width_a-1:0] init_value = 0; //only relevant if numwords_a == 1

input clk, reset, clken, write_en_a, read_en_a;
input [widthad_a-1:0] address_a;
input [width_a-1:0] write_data_a;
input [width_be_a-1:0] byte_en_a;
output [width_a-1:0] read_data_a;
reg [(width_a-1):0] read_data_a_wire;

localparam output_latency = ((latency - 1) >> 1);
localparam input_latency = (latency - 1) - output_latency;
integer bank_num;
integer latency_num;

reg [(widthad_a-1):0] address_a_reg[input_latency:0];
reg  write_en_a_reg[input_latency:0];
reg [(width_a-1):0] write_data_a_reg[input_latency:0];
reg [(width_be_a-1):0] byte_en_a_reg[input_latency:0];

wire [widthad_a-1:0] wr_address_a;
assign wr_address_a = write_en_a_reg[input_latency] ? address_a_reg[input_latency] : 0;

always @(*) begin
    address_a_reg[0] = address_a;
    write_en_a_reg[0] = write_en_a;
    write_data_a_reg[0] = write_data_a;
    byte_en_a_reg[0] = byte_en_a;
end

always @(posedge clk) begin
    if (clken) begin
        for (latency_num = 0; latency_num < input_latency; latency_num=latency_num+1) begin
            address_a_reg[latency_num+1] <= address_a_reg[latency_num];
            write_en_a_reg[latency_num+1] <= write_en_a_reg[latency_num];
            write_data_a_reg[latency_num+1] <= write_data_a_reg[latency_num];
            byte_en_a_reg[latency_num + 1] <= byte_en_a_reg[latency_num];
        end
    end
end


/***********************************************************************************************************/
/* This part is replicated many times depending on the `synthesis_ram_style`, so let's make a macro for it */
/***********************************************************************************************************/
`define RAM_SINGLE_PORT_POWER_UP_INITIALIZATION                                                                                                         \
    initial begin                                                                                                                                       \
        if (init_file != "")                                                                                                                            \
            $readmemb(init_file, ram);                                                                                                                  \
    end

`define RAM_SINGLE_PORT_READ_AND_WRITE_LOGIC                                                                                                            \
    if(uses_byte_enables == 1) begin                                                                                                                    \
        // Use RAM with byte enable logic                                                                                                               \
        if (clken) begin // Port a: write port                                                                                                          \
            if (write_en_a_reg[input_latency]) begin                                                                                                    \
                for(bank_num=0; bank_num < width_be_a; bank_num = bank_num + 1) begin                                                                   \
                    if (byte_en_a_reg[input_latency][bank_num])                                                                                         \
                        ram[wr_address_a][bank_num * byte_width +: byte_width] <= write_data_a_reg[input_latency][bank_num * byte_width +: byte_width]; \
                end                                                                                                                                     \
            end                                                                                                                                         \
        end                                                                                                                                             \
    end                                                                                                                                                 \
    else begin                                                                                                                                          \
        // Use RAM without byte enable logic                                                                                                            \
        if (clken) begin // Port a: write port                                                                                                          \
            if (write_en_a_reg[input_latency])                                                                                                          \
                ram[wr_address_a] <= write_data_a_reg[input_latency];                                                                                   \
        end                                                                                                                                             \
    end                                                                                                                                                 \
                                                                                                                                                        \
    if (clken)                                                                                                                                          \
        read_data_a_wire <= ram[address_a_reg[input_latency]];
/***********************************************************************************************************/
/***********************************************************************************************************/
/***********************************************************************************************************/


generate
// We support reset only for the case numwords == 1.
if (numwords_a == 1) begin
    // Even though it's practically a single reg, we use an array of size 1 here to make use of the above macros.
    // Also, to be extra sure that this case will not use a block RAM for area concern, we'll explicitly set
    // synt_ramstyle to "registers".
    reg [width_a-1:0] ram [0:0] /* synthesis syn_ramstyle = "registers" */;
    initial ram[0] = init_value;

    always @ (posedge clk) begin
        if (reset)
            ram[0] <= init_value;
        else begin
            `RAM_SINGLE_PORT_READ_AND_WRITE_LOGIC
        end
    end
end
else if (synthesis_ram_style == "registers" || (fpga_device == "SmartFusion2" && init_file != "") ) begin
    /* SmartFusion2 BRAM doesn't have support for mem init, but due to a Synplify limitation, Synplify
     * can actually map a logical RAM with mem init to a BRAM. This is a functional issue.
     * To get around this issue, we need to force Synplify to use only LUT in this case
     */
    reg [width_a-1:0] ram [numwords_a-1:0] /* synthesis syn_ramstyle = "registers" */;
    `RAM_SINGLE_PORT_POWER_UP_INITIALIZATION
    always @ (posedge clk) begin
        `RAM_SINGLE_PORT_READ_AND_WRITE_LOGIC
    end
end
else if (synthesis_ram_style == "lsram") begin
    reg [width_a-1:0] ram [numwords_a-1:0] /* synthesis syn_ramstyle = "lsram" */;
    `RAM_SINGLE_PORT_POWER_UP_INITIALIZATION
    always @ (posedge clk) begin
        `RAM_SINGLE_PORT_READ_AND_WRITE_LOGIC
    end
end
else if (synthesis_ram_style == "uram") begin
    reg [width_a-1:0] ram [numwords_a-1:0] /* synthesis syn_ramstyle = "uram" */;
    `RAM_SINGLE_PORT_POWER_UP_INITIALIZATION
    always @ (posedge clk) begin
        `RAM_SINGLE_PORT_READ_AND_WRITE_LOGIC
    end
end
else begin
    reg [width_a-1:0] ram [numwords_a-1:0];
    `RAM_SINGLE_PORT_POWER_UP_INITIALIZATION
    always @ (posedge clk) begin
        `RAM_SINGLE_PORT_READ_AND_WRITE_LOGIC
    end
end
endgenerate


reg [(width_a-1):0] read_data_a_reg[output_latency:0];

always @(*) begin
   read_data_a_reg[0] <= read_data_a_wire;
end

always @(posedge clk) begin
    if (clken) begin
        for (latency_num = 0; latency_num < output_latency; latency_num=latency_num+1) begin
            read_data_a_reg[latency_num+1] <= read_data_a_reg[latency_num];
        end
    end
end

assign read_data_a = read_data_a_reg[output_latency];


endmodule
