`timescale 1ns / 1ns
module ram_dual_port
(
	clk,
	reset,
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
parameter  synthesis_ram_style = "";
parameter  uses_byte_enables = 1'd0;
parameter  byte_width = 8;
parameter [width_a-1:0] init_value = 0; //only relevant if numwords_a == numwords_b == 1

input  clk;
input  reset;
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

localparam input_latency = ((latency - 1) >> 1);
localparam output_latency = (latency - 1) - input_latency;
integer bank_num;
integer latency_num;

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


/***********************************************************************************************************/
/* This part is replicated many times depending on the `synthesis_ram_style`, so let's make a macro for it */
/***********************************************************************************************************/
`define RAM_DUAL_PORT_POWER_UP_INITIALIZATION                                                                                                                           \
    initial begin                                                                                                                                                       \
        if (init_file != "")                                                                                                                                            \
            $readmemb(init_file, ram);                                                                                                                                  \
    end

`define RAM_DUAL_PORT_READ_AND_WRITE_LOGIC                                                                                                                              \
    if(uses_byte_enables == 1'd1) begin                                                                                                                                 \
        // Use RAM with byte enable logic                                                                                                                               \
        if (clken) begin // Port a                                                                                                                                      \
            if (write_en_a_reg[input_latency]) begin                                                                                                                    \
                for(bank_num = 0; bank_num < width_be_a; bank_num = bank_num + 1) begin                                                                                 \
                    if (byte_en_a_reg[input_latency][bank_num]) begin                                                                                                   \
                        ram[address_a_reg[input_latency]][bank_num * byte_width +: byte_width] <= write_data_a_reg[input_latency][bank_num * byte_width +: byte_width]; \
                    end                                                                                                                                                 \
                end                                                                                                                                                     \
            end                                                                                                                                                         \
        end                                                                                                                                                             \
                                                                                                                                                                        \
        if (clken) begin                                                                                                                                                \
            if(~write_en_a_reg[input_latency]) begin                                                                                                                    \
                read_data_a_wire <= ram[address_a_reg[input_latency]];                                                                                                  \
            end                                                                                                                                                         \
        end                                                                                                                                                             \
                                                                                                                                                                        \
        if (clken) begin // Port b                                                                                                                                      \
            if (write_en_b_reg[input_latency]) begin                                                                                                                    \
                for(bank_num = 0; bank_num < width_be_b; bank_num = bank_num + 1) begin                                                                                 \
                    if (byte_en_b_reg[input_latency][bank_num]) begin                                                                                                   \
                        ram[address_b_reg[input_latency]][bank_num * byte_width +: byte_width] <= write_data_b_reg[input_latency][bank_num * byte_width +: byte_width]; \
                    end                                                                                                                                                 \
                end                                                                                                                                                     \
            end                                                                                                                                                         \
        end                                                                                                                                                             \
                                                                                                                                                                        \
        if (clken) begin                                                                                                                                                \
            if(~write_en_b_reg[input_latency]) begin                                                                                                                    \
                read_data_b_wire <= ram[address_b_reg[input_latency]];                                                                                                  \
            end                                                                                                                                                         \
        end                                                                                                                                                             \
    end                                                                                                                                                                 \
    else begin                                                                                                                                                          \
        // Use RAM without byte enable logic                                                                                                                            \
        if (clken) begin // Port a                                                                                                                                      \
            if (write_en_a_reg[input_latency]) begin                                                                                                                    \
                ram[address_a_reg[input_latency]] <= write_data_a_reg[input_latency];                                                                                   \
                //read_data_a_wire <= write_data_a_reg[input_latency];                                                                                                  \
            end                                                                                                                                                         \
            else begin                                                                                                                                                  \
                read_data_a_wire <= ram[address_a_reg[input_latency]];                                                                                                  \
            end                                                                                                                                                         \
        end                                                                                                                                                             \
                                                                                                                                                                        \
        if (clken) begin // Port b                                                                                                                                      \
            if (write_en_b_reg[input_latency]) begin                                                                                                                    \
                ram[address_b_reg[input_latency]] <= write_data_b_reg[input_latency];                                                                                   \
                //read_data_b_wire <= write_data_b_reg[input_latency];                                                                                                  \
            end                                                                                                                                                         \
            else begin                                                                                                                                                  \
                read_data_b_wire <= ram[address_b_reg[input_latency]];                                                                                                  \
            end                                                                                                                                                         \
        end                                                                                                                                                             \
    end
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
            `RAM_DUAL_PORT_READ_AND_WRITE_LOGIC
        end
    end
end
else if (synthesis_ram_style == "registers" || (fpga_device == "SmartFusion2" && init_file != "") ) begin
    /* SmartFusion2 BRAM doesn't have support for mem init, but due to a Synplify limitation, Synplify
     * can actually map a logical RAM with mem init to a BRAM. This is a functional issue.
     * To get around this issue, we need to force Synplify to use only LUT in this case
     */
    reg [width_a-1:0] ram [numwords_a-1:0] /* synthesis syn_ramstyle = "registers" */;
    `RAM_DUAL_PORT_POWER_UP_INITIALIZATION
    always @ (posedge clk) begin
        `RAM_DUAL_PORT_READ_AND_WRITE_LOGIC
    end
end
// Set the genram label for cosim purpose. Right now, assuming that it's only applicable when
// numwords != 1 and there's no syn_ramstyle
else begin : genram
    reg [width_a-1:0] ram [numwords_a-1:0];
    `RAM_DUAL_PORT_POWER_UP_INITIALIZATION
    always @ (posedge clk) begin
        `RAM_DUAL_PORT_READ_AND_WRITE_LOGIC
    end
end
endgenerate


reg [(width_a-1):0] read_data_a_reg[output_latency:0];

always @(*) begin
   read_data_a_reg[0] <= read_data_a_wire;
end

always @(posedge clk)
if (clken) begin
    for (latency_num = 0; latency_num < output_latency; latency_num = latency_num + 1) begin
       read_data_a_reg[latency_num + 1] <= read_data_a_reg[latency_num];
    end
end

assign read_data_a = read_data_a_reg[output_latency];


reg [(width_b-1):0] read_data_b_reg[output_latency:0];

always @(*) begin
    read_data_b_reg[0] <= read_data_b_wire;
end

always @(posedge clk)
if (clken) begin
    for (latency_num = 0; latency_num < output_latency; latency_num = latency_num + 1) begin
        read_data_b_reg[latency_num + 1] <= read_data_b_reg[latency_num];
    end
end

assign read_data_b = read_data_b_reg[output_latency];

endmodule
