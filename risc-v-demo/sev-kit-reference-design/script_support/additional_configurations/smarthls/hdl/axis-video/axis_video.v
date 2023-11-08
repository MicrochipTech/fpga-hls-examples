`timescale 1 ns / 1 ns

/*
    This module converts AXI4 stream signals to Video signals (RGB data,
    frame start, data valid, frame end) used to transfer data the H_264_Iframe 
    decoder midule on the video streaming pipeline. Inside this module there is 
    a First-Word Fall-Through (FWFT) FIFO that takes incoming data (RGB data,
    SOF, and EOL) as input and a control part that injects blanking and 
    generates frame start and frame end signals.

    Every time the input resolution changes, the module is reset and the data 
    inside the FIFO is flushed.   
*/
module AXIS_Video_Converter # (
    // WIDTH is per component (R, G, B)
    parameter C_WIDTH = 8,
    parameter H_BLANK = 17,
    parameter V_BLANK = 26,
    // AXIS tuser width. tuser 0 is user for Start Of
    // Frame (SOF). Other bits can be used if needed.
    parameter TUSER_WIDTH = 2, 
    // Depth of 2048 is assuming debubble mode, as the FIFO should be able to 
    // hold 1 line of data, and 2048 is the first power of 2 that is greater
    // than 1920 (async FIFO depth should be a power of 2 per module requirement)
    parameter FIFO_DEPTH = 4096,
    // If there are bubbles (active tready but inactive 
    // i_tvalid) in the incoming axi stream line, use the DEBUBBLE module at 
    // input to remove bubbles from each line.
    parameter DEBUBBLE = 1,  
    parameter PIXEL_PER_CLK = 1
) (
    input   i_video_reset, //active high
    input   i_video_clk,

    input   i_axis_reset, //active high
    input   i_axis_clk,
    // AXIS interfaces
    input   i_tlast,
    input   i_tvalid,
    input   [TUSER_WIDTH-1:0] i_tuser,
    // all RGB components put together. R = C_WIDTH-1:0, G = 2*C_WIDTH-1:C_WIDTH,
    // B: 3*C_WIDTH-1:2*C_WIDTH
    input   [3 * C_WIDTH * PIXEL_PER_CLK-1:0] i_tdata,
    input   [11:0]   i_hres,
    input   [11:0]   i_vres,
    output  o_tready,
    output  o_frame_start,
    output  o_EOF,
    output  o_data_valid,
    output  [PIXEL_PER_CLK * C_WIDTH-1:0] o_R,   
    output  [PIXEL_PER_CLK * C_WIDTH-1:0] o_G,   
    output  [PIXEL_PER_CLK * C_WIDTH-1:0] o_B
);
    localparam SOF_NUM_CYCLES = 3;
    wire fifo_full;
    wire pop_fifo, fifo_not_empty;
    wire [PIXEL_PER_CLK*3*C_WIDTH+TUSER_WIDTH:0] fifo_o;

    wire tready_int_converter, tlast_int_converter, tvalid_int_converter;
    wire [TUSER_WIDTH-1:0] tuser_int_converter;
    wire [PIXEL_PER_CLK*3*C_WIDTH-1:0] tdata_int_converter; 
    wire tready_int_debubble, tlast_int_debubble, tvalid_int_debubble;
    wire [TUSER_WIDTH-1:0] tuser_int_debubble;
    wire [PIXEL_PER_CLK*3*C_WIDTH-1:0] tdata_int_debubble;

    wire axis_reset_at_videoclk;
    wire video_reset = axis_reset_at_videoclk | i_video_reset;

    genvar i;
    generate
        for(i=0; i < PIXEL_PER_CLK; i = i + 1) begin
            assign o_B[(i + 1 ) * C_WIDTH - 1 : i * C_WIDTH] = fifo_o [i*3*C_WIDTH+C_WIDTH-1:i*3*C_WIDTH];
            assign o_G[(i + 1 ) * C_WIDTH - 1 : i * C_WIDTH] = fifo_o [i*3*C_WIDTH+2*C_WIDTH-1:i*3*C_WIDTH+C_WIDTH];
            assign o_R[(i + 1 ) * C_WIDTH - 1 : i * C_WIDTH] = fifo_o [i*3*C_WIDTH+3*C_WIDTH-1:i*3*C_WIDTH+2*C_WIDTH];
        end
    endgenerate
    assign o_tready = tready_int_converter;
    assign tlast_int_converter = i_tlast;
    assign tvalid_int_converter = i_tvalid;
    assign tuser_int_converter = i_tuser;
    assign tdata_int_converter = i_tdata;

    reg [1:0] state;    //  states : 0 - idle
                        //           1 - start (addcycles between SOF and data)
                        //           2 - transfer (includes blanking)
    reg [2:0] sof_counter;
    reg [11:0] h_count, v_count;
    wire [12:0] h_total, v_total;
    wire sof, h_active, v_active, hv_active;

    assign h_total = i_hres + H_BLANK;
    assign v_total = i_vres + V_BLANK;
    assign sof = fifo_o[PIXEL_PER_CLK*3*C_WIDTH+1];
    assign h_active = (h_count < i_hres)? 1 : 0;
    assign v_active = (v_count < i_vres)? 1 : 0;
    assign hv_active = h_active && v_active && (state == 2);
    
    // pop fifo when transferring data (hv_active), or when idle and start 
    // of frame hasn't been reached yet
    assign pop_fifo = hv_active || ( (state == 0) && !sof); 
    assign o_data_valid = hv_active && fifo_not_empty;
    assign o_frame_start = (state == 1 && sof_counter < 2)? 1 : 0;
    assign o_EOF = ((v_count == (i_vres + 20)) && (h_count < 2))? 1 : 0;


    always @(posedge i_video_clk or posedge video_reset) begin
        if (video_reset) begin
            state <= 0;
            sof_counter <= 0;
            h_count <= 0;
            v_count <= 0;
        end
        else begin
            if (state == 0 && sof && fifo_not_empty) begin
                sof_counter <= 0;
                h_count <= 0;
                v_count <= 0;
                state <= 1;
            end
            else if (state == 1) begin
                if (sof_counter < SOF_NUM_CYCLES - 1)   
                    sof_counter <= sof_counter + 1;
                else begin
                    sof_counter <= 0;
                    state <= 2;
                end
            end 
            else if (state == 2) begin
                if (fifo_not_empty || (h_count > i_hres - 1) || (v_count > i_vres - 1)) begin
                    if (h_count < h_total - 1) begin
                        h_count <= h_count + 1;
                    end
                    else begin
                        h_count <= 0;
                        if (v_count < v_total - 1)
                            v_count <= v_count + 1;
                        else
                            state <= 0;
                    end
                    
                end
            end
            else
                state <= 0;
        end
    end

    // rst_sync video_rst_sync (
    //     .i_clk  (i_video_clk),
    //     .i_arst (i_axis_reset),
    //     .o_srst (axis_reset_at_videoclk)
    // );
    assign axis_reset_at_videoclk = i_axis_reset;


    axis_async_fifo #(
        .DEPTH          (FIFO_DEPTH),
        .DATA_WIDTH     (PIXEL_PER_CLK * 3 * C_WIDTH),
        .KEEP_ENABLE    (0),
        .LAST_ENABLE    (1),
        .USER_ENABLE    (1),
        .USER_WIDTH     (2),
        .FRAME_FIFO     (DEBUBBLE)
    ) FIFO_A (
        .s_clk          (i_axis_clk),
        .s_rst          (i_axis_reset),
        .s_axis_tdata   (tdata_int_converter),
        .s_axis_tlast   (tlast_int_converter),
        .s_axis_tuser   (tuser_int_converter),
        .s_axis_tvalid  (tvalid_int_converter),
        .s_axis_tready  (tready_int_converter),
        .m_clk          (i_video_clk),
        .m_rst          (video_reset),
        .m_axis_tdata   (fifo_o[PIXEL_PER_CLK * 3 * C_WIDTH - 1 :0]),
        .m_axis_tvalid  (fifo_not_empty),
        .m_axis_tready  (pop_fifo),
        .m_axis_tlast   (fifo_o[PIXEL_PER_CLK * 3 * C_WIDTH]),
        .m_axis_tuser   (fifo_o[PIXEL_PER_CLK * 3 * C_WIDTH + 1 +: 2])
    );
endmodule




