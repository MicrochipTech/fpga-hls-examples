`timescale 1 ps / 1 ps
 /*
    This module converts Video signals (RGB data, frame start, data valid) in RGB format to 
    AXI4-Stream video signals. This module uses a First-Word Fall-Through (FWFT)
    FIFO to store incoming data.
 */
module Video_AXIS_Converter # (
    parameter C_WIDTH = 8, // component (R, G, B) width
    // AXI o_tuser width. o_tuser 0 is user for Start Of 
    // Frame (SOF) and o_tuser 1 is used for End Of Frame (EOF). Other bits can be used if needed.    
    parameter TUSER_WIDTH = 2, 
    // Depth of 2048 is assuming debubble mode, as the FIFO should be able to 
    // hold 1 line of data, and 2048 is the first power of 2 that is greater
    // than 1920 (async FIFO depth should be a power of 2 per module requirement)            
    parameter FIFO_DEPTH = 4096,
    parameter PIXEL_PER_CLK = 1,
    // If there are bubbles (active tready but inactive 
    // i_tvalid) in the incoming axi stream line, use the DEBUBBLE module at 
    // input to remove bubbles from each line.
    parameter DEBUBBLE = 1
) (
    input   i_video_reset,//active high
    input   i_video_clk,
    input   i_frame_start,
    input   i_data_valid,
    input   [PIXEL_PER_CLK * C_WIDTH-1:0] i_R,   
    input   [PIXEL_PER_CLK * C_WIDTH-1:0] i_G,   
    input   [PIXEL_PER_CLK * C_WIDTH-1:0] i_B,
    input   [11:0]   i_vres,
    input   [11:0]   i_hres,
    output  reg [15:0]   o_frames_skipped, /* synthesis syn_preserve=1 */
    output  reg o_pushback_detected, /* synthesis syn_preserve=1 */
    // AXI interfaces
    input   i_axis_reset,//active high
    input   i_axis_clk,
    input   i_tready,
    output  o_tlast,
    output  o_tvalid,
    output  [TUSER_WIDTH-1:0] o_tuser,
    //all RGB components put together. R = C_WIDTH-1:0, G = 2*C_WIDTH-1:C_WIDTH,
    // B: 3*C_WIDTH-1:2*C_WIDTH 
    output  [PIXEL_PER_CLK * 3 * C_WIDTH - 1:0] o_tdata
);

    wire EOF, EOL, SOF, s, r;
    wire fifo_o_valid;
    wire axis_reset_at_videoclk;
    wire video_reset = axis_reset_at_videoclk | i_video_reset;


    reg SOF_delay;
    reg q;
    reg frame_start_delay;
    reg data_valid_fe, data_valid_re, frame_start_re;
    reg data_valid_delay [1:0];
    reg  [PIXEL_PER_CLK * 3 * C_WIDTH - 1 :0] data_i_delay[1:0];
    reg [11:0] v_count;
    reg [12:0] flush_v_count, flush_h_count;
    reg skip_frame;
    assign o_tvalid = fifo_o_valid & !skip_frame;
    assign EOL = data_valid_fe;
    assign EOF = (data_valid_fe && (v_count == i_vres - 1))? 1 : 0;
    assign SOF = data_valid_re & q;

    //SR flip-flop
    assign s = frame_start_re;
    assign r = data_valid_re;

    always @ (posedge i_video_clk or posedge video_reset) begin
        if (video_reset)
            //We assume the first pixel after video_reset is NOT the begining of a frame and wait for SOF signal
            q <= 1;
        else begin
            if (s == 1)
                q <= 1;
            else if (r == 1)
                q <= 0;
            else
                q <= q;
        end
    end
    
    //v_count, used for generating EOF
    always @ (posedge i_video_clk or posedge video_reset) begin
        if (video_reset) 
            v_count <= 0;
        else if (data_valid_fe) begin 
            if (v_count < i_vres-1)
                v_count <= v_count + 1;
            else
                v_count <= 0;
        end
    end

    integer i;
    always @ (posedge i_video_clk or posedge video_reset) begin
        if (video_reset) begin
            frame_start_delay <= 0;
            data_valid_delay[0] <= 0;
            data_valid_delay[1] <= 0;
            data_valid_fe <= 0;
            data_valid_re <= 0;
            frame_start_re <= 0;
            data_i_delay[0] <= 0;
            data_i_delay[1] <= 0;
            SOF_delay <= 0;
        end
        else begin
            SOF_delay <= SOF;

            for(i=0; i < PIXEL_PER_CLK; i = i + 1)
                data_i_delay[0][3 * C_WIDTH * i +: 3 * C_WIDTH ] <= {
                    i_R[C_WIDTH * i +: C_WIDTH],
                    i_G[C_WIDTH * i +: C_WIDTH],
                    i_B[C_WIDTH * i +: C_WIDTH]};
            data_i_delay[1] <= data_i_delay[0]; 
            data_valid_delay[0] <= i_data_valid;
            data_valid_delay[1] <= data_valid_delay[0];
            frame_start_delay <= i_frame_start;
            data_valid_fe <= (data_valid_delay[0] & !i_data_valid) ? 1 : 0;
            data_valid_re <= (!data_valid_delay[0] & i_data_valid) ? 1 : 0;
            frame_start_re <= (!frame_start_delay & i_frame_start) ? 1 : 0;
        end
    end

    // rst_sync video_rst_sync (
    //     .i_clk  (i_video_clk),
    //     .i_arst (i_axis_reset),
    //     .o_srst (axis_reset_at_videoclk)
    // );
    assign axis_reset_at_videoclk = i_axis_reset;



    //skip frame if backpressure detected at SOF
    always @ (posedge i_axis_clk) begin
        if (i_axis_reset) begin
            skip_frame <= 0; 
            o_frames_skipped <= 0;
            o_pushback_detected <= 0;
        end
        else if (fifo_o_valid && (o_tuser[0] == 1) && !i_tready && !skip_frame) begin 
            skip_frame <= 1;
            o_frames_skipped <= o_frames_skipped + 1;
            o_pushback_detected <= 1;
        end
        else if(flush_v_count == i_vres-1 && flush_h_count == i_hres-1)begin
            skip_frame <= 0;

        end
    end


    always @ (posedge i_axis_clk) begin
        if (i_axis_reset) begin
            flush_v_count <= 0;
            flush_h_count <= 0;
        end
        else if (!skip_frame) begin 
            flush_v_count <= 0;
            flush_h_count <= 0;
        end
        else if(fifo_o_valid)begin
            if (flush_h_count < i_hres-1)
                flush_h_count <= flush_h_count+1;
            else begin
                flush_h_count <= 0;
                if (flush_v_count < i_vres-1)
                    flush_v_count <= flush_v_count+1;
                else
                    flush_v_count <= 0;
            end
            
        end
    end

    axis_async_fifo #(
        .DEPTH          (FIFO_DEPTH),
        .DATA_WIDTH     (PIXEL_PER_CLK * 3 * C_WIDTH),
        .KEEP_ENABLE    (0),
        .LAST_ENABLE    (1),
        .USER_ENABLE    (1),
        .USER_WIDTH     (2),
        .FRAME_FIFO     (DEBUBBLE)
    ) FIFO_A(
        .s_clk          (i_video_clk),
        .s_rst          (video_reset),
        .s_axis_tdata   (data_i_delay[1]),
        .s_axis_tvalid  (data_valid_delay[1]),
        .s_axis_tlast   (EOL),
        .s_axis_tuser   ({EOF, SOF_delay}),

        .m_clk          (i_axis_clk),
        .m_rst          (i_axis_reset),
        .m_axis_tlast   (o_tlast),
        .m_axis_tuser   (o_tuser),
        .m_axis_tdata   (o_tdata),
        .m_axis_tvalid  (fifo_o_valid),
        .m_axis_tready  (i_tready | skip_frame)
    );
endmodule
