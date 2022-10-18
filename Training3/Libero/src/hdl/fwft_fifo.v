`timescale 1 ns / 1 ns

module fwft_fifo # (
    parameter width = 32,
    parameter widthad = 3,
    parameter depth = 8,
    parameter almost_empty_value = 2,
    parameter almost_full_value = 2,
    parameter name = "",
    parameter ramstyle = "",
    parameter disable_full_empty_check = 0
) (
    input reset,
    input clk,
    input clken,
    // Interface to source.
    output full,
    output almost_full,
    input write_en,
    input [width-1:0] write_data,
    // Interface to sink.
    output empty,
    output almost_empty,
    input read_en,
    output [width-1:0] read_data,
    // Number of words stored in the FIFO.
    output [widthad:0] usedw
);

generate
if (depth == 0) begin
	assign full = !read_en;
	assign almost_full = 1'b1;
	assign empty = !write_en;
	assign almost_empty = 1'b1;
	assign read_data = write_data;
end else if (ramstyle == "block" || ramstyle == "") begin
    fwft_fifo_bram # (
      .width (width),
      .widthad (widthad),
      .depth (depth),
      .almost_empty_value (almost_empty_value),
      .almost_full_value (almost_full_value),
      .name (name),
      .ramstyle (ramstyle),
      .disable_full_empty_check (disable_full_empty_check)
    ) fwft_fifo_bram_inst (
      .reset (reset),
      .clk (clk),
      .clken (clken),
      .full (full),
      .almost_full (almost_full),
      .write_en (write_en),
      .write_data (write_data),
      .empty (empty),
      .almost_empty (almost_empty),
      .read_en (read_en),
      .read_data (read_data),
      .usedw (usedw)
    );
end else begin // if (ramstyle == distributed || ramstyle == registers)
    fwft_fifo_lutram # (
      .width (width),
      .widthad (widthad),
      .depth (depth),
      .almost_empty_value (almost_empty_value),
      .almost_full_value (almost_full_value),
      .name (name),
      .ramstyle (ramstyle),
      .disable_full_empty_check (disable_full_empty_check)
    ) fwft_fifo_lutram_inst (
      .reset (reset),
      .clk (clk),
      .clken (clken),
      .full (full),
      .almost_full (almost_full),
      .write_en (write_en),
      .write_data (write_data),
      .empty (empty),
      .almost_empty (almost_empty),
      .read_en (read_en),
      .read_data (read_data),
      .usedw (usedw)
    );
end
endgenerate

/* synthesis translate_off */

localparam NUM_CYCLES_BETWEEN_STALL_WARNINGS = 1000000;
integer num_empty_stall_cycles = 0;
integer num_full_stall_cycles = 0;
always @ (posedge clk) begin
    if (num_empty_stall_cycles == NUM_CYCLES_BETWEEN_STALL_WARNINGS) begin
        num_empty_stall_cycles = 0;
        if (name == "")
            $display("Warning: fifo_read() has been stalled for %d cycles due to FIFO being empty.", NUM_CYCLES_BETWEEN_STALL_WARNINGS);
        else
            $display("Warning: fifo_read() from %s has been stalled for %d cycles due to FIFO being empty.", name, NUM_CYCLES_BETWEEN_STALL_WARNINGS);
    end else if (empty & read_en)
        num_empty_stall_cycles = num_empty_stall_cycles + 1;
    else
        num_empty_stall_cycles = 0;
end

always @ (posedge clk) begin
    if (num_full_stall_cycles == NUM_CYCLES_BETWEEN_STALL_WARNINGS) begin
        num_full_stall_cycles = 0;
        if (name == "")
            $display("Warning: fifo_write() has been stalled for %d cycles due to FIFO being full.", NUM_CYCLES_BETWEEN_STALL_WARNINGS);
        else
            $display("Warning: fifo_write() to %s has been stalled for %d cycles due to FIFO being full.", name, NUM_CYCLES_BETWEEN_STALL_WARNINGS);
    end else if (full & write_en)
        num_full_stall_cycles = num_full_stall_cycles + 1;
    else
        num_full_stall_cycles = 0;
end

/* synthesis translate_on */


endmodule

//--------------------------------------------
// Block-RAM-based FWFT FIFO implementation.
//--------------------------------------------

module fwft_fifo_bram # (
    parameter width = 32,
    parameter widthad = 4,
    parameter depth = 16,
    parameter almost_empty_value = 2,
    parameter almost_full_value = 2,
    parameter name = "",
    parameter ramstyle = "block",
    parameter disable_full_empty_check = 0
) (
    input reset,
    input clk,
    input clken,
    // Interface to source.
    output reg full,
    output almost_full,
    input write_en,
    input [width-1:0] write_data,
    // Interface to sink.
    output reg empty,
    output almost_empty,
    input read_en,
    output [width-1:0] read_data,
    // Number of words stored in the FIFO.
    output reg [widthad:0] usedw
);


// The output data from RAM.
wire [width-1:0] ram_data;
// An extra register to either sample fifo output or write_data.
reg [width-1:0] sample_data;
// Use a mealy FSM with 4 states to handle the special cases.
localparam [1:0] EMPTY = 2'd0;
localparam [1:0] FALL_THRU = 2'd1;
localparam [1:0] LEFT_OVER = 2'd2;
localparam [1:0] STEADY = 2'd3;
reg [1:0] state = 2'd0;

always @ (posedge clk) begin
    if (reset) begin
        state <= EMPTY;
        sample_data <= {width{1'b0}};
    end else begin
        case (state)
            EMPTY:
                if (write_en) begin
                    state <= FALL_THRU;
                    sample_data <= write_data;
                end else begin
                    state <= EMPTY;
                    sample_data <= {width{1'bX}};
                end
            FALL_THRU:  // usedw must be 1.
                if (write_en & ~read_en) begin
                    state <= STEADY;
                    sample_data <= {width{1'bX}};
                end else if (~write_en & read_en) begin
                    state <= EMPTY;
                    sample_data <= {width{1'bX}};
                end else if (~write_en & ~read_en) begin
                    state <= STEADY;
                    sample_data <= {width{1'bX}};
                end else begin // write_en & read_en
                    state <= FALL_THRU;
                    sample_data <= write_data;
                end
            LEFT_OVER:  // usedw must be > 1.
                if (usedw == 1 & read_en & ~write_en) begin
                    state <= EMPTY;
                    sample_data <= {width{1'bX}};
                end else if (usedw == 1 & read_en & write_en) begin
                    state <= FALL_THRU;
                    sample_data <= write_data;
                end else if (read_en) begin
                    state <= STEADY;
                    sample_data <= {width{1'bX}};
                end else begin // ~read_en
                    state <= LEFT_OVER;
                    sample_data <= sample_data;
                end
            STEADY:
                if (usedw == 1 & read_en & ~write_en) begin
                    state <= EMPTY;
                    sample_data <= {width{1'bX}};
                end else if (usedw == 1 & read_en & write_en) begin
                    state <= FALL_THRU;
                    sample_data <= write_data;
                end else if (~read_en) begin
                    state <= LEFT_OVER; // Only transition to LEFT_OVER.
                    sample_data <= ram_data;
                end else begin
                    state <= STEADY;
                    sample_data <= {width{1'bX}};
                end
            default: begin
                 state <= EMPTY;
                 sample_data <= {width{1'b0}};
            end
        endcase
    end
end

assign read_data = (state == LEFT_OVER || state == FALL_THRU) ? sample_data
                                                              : ram_data;

wire write_handshake = (write_en & ~full);
wire read_handshake = (read_en & ~empty);

// Full and empty.
generate
if (disable_full_empty_check) begin
    always @ (posedge clk) begin full <= 0; empty <= 0; end
end else begin
    always @ (posedge clk) begin
      if (reset) begin
        full <= 0;
        empty <= 1;
      end else begin
        full <= (full & ~read_handshake) | ((usedw == depth - 1) & (write_handshake & ~read_handshake));
        empty <= (empty & ~write_handshake) | ((usedw == 1) & (read_handshake & ~write_handshake));
      end
    end
end
endgenerate

// FIXME: may want to make almost_full/empty registers too.
assign almost_full = (usedw >= almost_full_value);
assign almost_empty= (usedw <= almost_empty_value);

// Read/Write port addresses.
reg [widthad-1:0] write_address = 0;
reg [widthad-1:0] read_address = 0;

function [widthad-1:0] increment;
    input [widthad-1:0] address;
    input integer depth;
    increment = (address == depth - 1) ? 0 : address + 1;
endfunction

always @ (posedge clk) begin
    if (reset) begin
        write_address <= 0;
        read_address <= 0;
    end else begin
        if (write_en & ~full)
            write_address <= increment(write_address, depth);
        if ((read_en & ~empty & ~(usedw==1)) | (state == FALL_THRU))
            read_address <= increment(read_address, depth);
    end
end

// Usedw.
always @ (posedge clk) begin
    if (reset) begin
        usedw <= 0;
    end else begin
        if (write_handshake & read_handshake)
            usedw <= usedw;
        else if (write_handshake)
            usedw <= usedw + 1;
        else if (read_handshake)
            usedw <= usedw - 1;
        else
            usedw <= usedw;
    end
end

/* synthesis translate_off */
initial
if ( widthad < $clog2(depth) ) begin
    $display("Error: Invalid FIFO parameter, widthad=%d, depth=%d.",
             widthad, depth);
    $finish;
end

always @ (posedge clk) begin
    if ( (state == EMPTY &&
            (usedw != 0 || read_address != write_address)) ||
         (state == FALL_THRU &&
            ((read_address + usedw) % depth != write_address)) ||
         (state == STEADY &&
            ((read_address + usedw - 1) % depth != write_address)) ||
         (state == LEFT_OVER &&
            ((read_address + usedw - 1) % depth != write_address)) ) begin
        $display("Error: FIFO read/write address mismatch with usedw.");
        $display("\t rd_addr=%d, wr_addr=%d, usedw=%d, state=%d.",
                    read_address, write_address, usedw, state);
        $finish;
    end
    if (usedw > depth) begin
        $display("Error: usedw goes out of range.");
        $finish;
    end
end

/* synthesis translate_on */

/// Instantiation of inferred ram.
ram_dual_port_fifo ram_dual_port_inst (
	.clk( clk ),
	.clken( clken ),
    // Write port, i.e., interface to source.
	.address_a( write_address ),
	.wren_a( write_en & ~full ),
    .data_a( write_data ),
	.q_a( /* unused */ ),
    // Read port, i.e., interface to sink.
	.address_b( read_address ),
	.wren_b( 1'b0 ),
	.data_b(  ),
	.q_b( ram_data )
);
defparam ram_dual_port_inst.width_a = width;
defparam ram_dual_port_inst.width_b = width;
defparam ram_dual_port_inst.widthad_a = widthad;
defparam ram_dual_port_inst.widthad_b = widthad;
defparam ram_dual_port_inst.numwords_a = depth;
defparam ram_dual_port_inst.numwords_b = depth;
defparam ram_dual_port_inst.latency = 1;
defparam ram_dual_port_inst.ramstyle = ramstyle;

endmodule

//--------------------------------------------
// LUT-RAM-based FWFT FIFO implementation.
//--------------------------------------------

module fwft_fifo_lutram # (
    parameter width = 32,
    parameter widthad = 4,
    parameter depth = 16,
    parameter almost_empty_value = 2,
    parameter almost_full_value = 2,
    parameter name = "",
    parameter ramstyle = "",
    parameter disable_full_empty_check = 0
) (
    input reset,
    input clk,
    input clken,
    // Interface to source.
    output reg full,
    output almost_full,
    input write_en,
    input [width-1:0] write_data,
    // Interface to sink.
    output reg empty,
    output almost_empty,
    input read_en,
    output [width-1:0] read_data,
    // Number of words stored in the FIFO.
    output reg [widthad:0] usedw
);

wire write_handshake = (write_en & ~full);
wire read_handshake = (read_en & ~empty);

// Full and empty.
generate
if (disable_full_empty_check) begin
    always @ (posedge clk) begin full <= 0; empty <= 0; end
end else begin
    always @ (posedge clk) begin
      if (reset) begin
        full <= 0;
        empty <= 1;
      end else begin
        full <= (full & ~read_handshake) | ((usedw == depth - 1) & (write_handshake & ~read_handshake));
        empty <= (empty & ~write_handshake) | ((usedw == 1) & (read_handshake & ~write_handshake));
      end
    end
end
endgenerate

// FIXME: may want to make almost_full/empty registers too.
assign almost_full = (usedw >= almost_full_value);
assign almost_empty= (usedw <= almost_empty_value);

// Read/Write port addresses.
reg [widthad-1:0] write_address = 0;
reg [widthad-1:0] read_address = 0;

function [widthad-1:0] increment;
    input [widthad-1:0] address;
    input integer depth;
    increment = (address == depth - 1) ? 0 : address + 1;
endfunction

always @ (posedge clk) begin
    if (reset) begin
        write_address <= 0;
        read_address <= 0;
    end else begin
        if (write_en & ~full)
            write_address <= increment(write_address, depth);
        if (read_en & ~empty)
            read_address <= increment(read_address, depth);
    end
end

// Usedw.
always @ (posedge clk) begin
    if (reset) begin
        usedw <= 0;
    end else begin
        if (write_handshake & read_handshake)
            usedw <= usedw;
        else if (write_handshake)
            usedw <= usedw + 1;
        else if (read_handshake)
            usedw <= usedw - 1;
        else
            usedw <= usedw;
    end
end

/* synthesis translate_off */
initial
if ( widthad < $clog2(depth) ) begin
    $display("Error: Invalid FIFO parameter, widthad=%d, depth=%d.",
             widthad, depth);
    $finish;
end

always @ (posedge clk) begin
    if ((read_address + usedw) % depth != write_address) begin
        $display("Error: FIFO read/write address mismatch with usedw.");
        $display("\t rd_addr=%d, wr_addr=%d, usedw=%d.",
                    read_address, write_address, usedw);
        $finish;
    end
    if (usedw > depth) begin
        $display("Error: usedw goes out of range.");
        $finish;
    end
end

/* synthesis translate_on */

/// Instantiation of inferred ram.
lutram_dual_port_fifo lutram_dual_port_inst (
	.clk( clk ),
	.clken( clken ),
    // Write port, i.e., interface to source.
	.address_a( write_address ),
	.wren_a( write_en & ~full ),
    .data_a( write_data ),
    // Read port, i.e., interface to sink.
	.address_b( read_address ),
	.q_b( read_data )
);
defparam lutram_dual_port_inst.width = width;
defparam lutram_dual_port_inst.widthad = widthad;
defparam lutram_dual_port_inst.numwords = depth;
defparam lutram_dual_port_inst.ramstyle = ramstyle;

endmodule

