`timescale 1 ns / 1 ns

module data_receiver_fifo # (
    parameter latency = 1,
    parameter data_width = 32,
    parameter fifo_depth = $clog2(latency+1) 
) (
    input clk,
    input reset,
    input op_start, // Asserted when the operation that gives data to this data receiver start. This starts the shift register. 
    input user_enable, // Whether the return data is expected in the current cycle by the data path. 
                       // For sequential case, it should be cur_state == usedState && !fsm_stall. For pipelined case, it should be an OR gate of all user state_enables. 
    input  [data_width - 1 : 0] data_in,  // Return data from FU or RAM.
    output [data_width - 1 : 0] data_out  // Data output to datapath (user).
);

wire user_expecting_data = user_enable;
//// This shift register is to keep track of success data requests and to know
// when the valid data returns from the FU.
// <latency> cycles after a successful data request, a valid data returns.
// This shift register shifts every clock cycle.
wire data_in_valid;
generate
if (latency > 1) begin
    reg [latency - 1: 0] shift_reg_data_in_valid;
    assign data_in_valid = shift_reg_data_in_valid[latency - 1];
    always @ (posedge clk) begin
        if (reset)
            shift_reg_data_in_valid <= {(latency - 1){1'b0}};
        else
            shift_reg_data_in_valid <=
                {shift_reg_data_in_valid[latency - 2: 0], op_start};
    end
end else begin  // latency == 1.
    reg shift_reg_data_in_valid;
    assign data_in_valid = shift_reg_data_in_valid;
    always @ (posedge clk) begin
        shift_reg_data_in_valid <= reset ? 1'b0 : op_start;
    end
end
endgenerate

//// FWFT FIFO to store data.

wire fifo_full;  // Used for assertion.
wire fifo_write_en;
wire fifo_empty;
wire fifo_read_en;
wire [data_width - 1 : 0] fifo_write_data = data_in;
wire [data_width - 1 : 0] fifo_read_data;

fwft_fifo fwft_fifo_inst(
    .clk (clk),
    .reset (reset),
    .clken (1'b1),
    // Interface to source.
    .full (fifo_full),
    .write_en (fifo_write_en),
    .write_data (fifo_write_data),
    // Interface to sink.
    .empty (fifo_empty),
    .read_en (fifo_read_en),
    .read_data (fifo_read_data),
    .usedw(),
    .almost_empty(),
    .almost_full()
);
defparam
    fwft_fifo_inst.width = data_width,
    fwft_fifo_inst.widthad = fifo_depth,
    fwft_fifo_inst.depth = latency+1;

`ifndef DATA_RECEIVER_FIFO_METHOD_2
//// FIFO read, write and output MUX select.
assign fifo_write_en = data_in_valid & (!fifo_empty | !user_expecting_data);
//assign fifo_write_en = data_in_valid & !user_expecting_data;
assign fifo_read_en = user_expecting_data;// & !fifo_empty;
assign data_out = fifo_empty ? data_in : fifo_read_data;
`else
assign fifo_write_en = data_in_valid;
assign fifo_read_en = user_expecting_data & !user_stall;
assign data_out = (shift_reg_data_in_valid != shift_reg_user_expecting_data) ?  data_in : fifo_read_data;
`endif

/* synthesis translate_off */
always @ (posedge clk) begin
    if (fifo_write_en & fifo_full) begin
        $write("Error: Data receiver FIFO is full when attempting to write.\n");
        $finish;
    end
end
/* synthesis translate_on */

// Some synthesis tools (Synplify) do not natively support clog2, so we provide an
// implementation here.
function integer clog2;
    input integer value;
    begin
        value = value-1;
        for (clog2=0; value>0; clog2=clog2+1) begin        
            value = value>>1;
        end
    end
endfunction

endmodule

