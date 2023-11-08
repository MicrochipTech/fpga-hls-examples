`timescale 1 ps / 1 ps
/*
    This testbench tests the Video_AXIS module and writes the output frame to a
    file
*/

module axis_video_tb();

    parameter C_WIDTH = 8; // component (R, G, B) width
    parameter HRES = 100;
    parameter VRES = 100;
    parameter TUSER_WIDTH = 2; //AXIS tuser width. tuser 0 is user for Start Of
			// Frame (SOF). Other bits can be used if needed.
    parameter FIFO_DEPTH = 32 ;
    parameter CLOCK_PERIOD = 10;

    reg clk, reset; 

    reg tlast_I, tvalid_I;
    reg [TUSER_WIDTH-1:0] tuser_I;
    reg [3*C_WIDTH-1:0] tdata_I;
    wire [C_WIDTH-1:0] o_R, o_G, o_B;
    wire o_tready, frame_start, frame_end, data_enable_O;

    initial clk = 0;
    always @(clk) clk <= #(CLOCK_PERIOD/2) ~clk;


    integer i, j, h, w, cnt, c;
    initial begin
        tvalid_I <= 0;

        reset = 1;
        for (c=0; c<5; c=c+1)
            @(posedge clk) ;
        # CLOCK_PERIOD;
        reset = 0;
        cnt = 0;
        
        for(i=0; i<2; i = i + 1)begin
            for(w = 0; w < VRES; w = w+1)begin
                for(h = 0; h < HRES;) begin
                    tvalid_I <= 1;
                    tdata_I <= cnt;
                    if (h == 0 && w == 0)
                        tuser_I[0] <= 1;
                    else
                        tuser_I[0] <= 0;
                    if (w == VRES - 1 && h == HRES - 1)
                        tuser_I[1] <= 1;
                    else
                        tuser_I[1] <= 0;
                    if (h == HRES - 1)
                        tlast_I <= 1;
                    else    
                        tlast_I <= 0;
                    if(o_tready) begin
                        cnt <= cnt + 1;
                        h = h+1;
                    end
                    # CLOCK_PERIOD;
                    if (h % 30 == 0)begin
                        tvalid_I <= 0;    
                        for(j=0; j<4; j = j + 1)
                            # CLOCK_PERIOD;
                        tvalid_I <= 1;    
                    end
                end
            end

        end
        tvalid_I <= 0;
    end

  
    //axis-video module instantiation
    //active high reset
    AXIS_Video_Converter # (
    .C_WIDTH(C_WIDTH), 
    .TUSER_WIDTH(TUSER_WIDTH),
    .DEBUBBLE(1)
    ) axis_video_dut_in (
    .i_video_reset(reset),//active high
    .i_video_clk(clk),
    .i_axis_reset(reset),//active high
    .i_axis_clk(clk),
    .i_tlast(tlast_I),
    .i_tvalid(tvalid_I),
    .i_tuser(tuser_I),
    .i_tdata(tdata_I),
    .i_hres(HRES),
    .i_vres(VRES),
    .o_tready(o_tready),
    .o_frame_start(frame_start),
    .o_EOF(frame_end),
    .o_data_valid(data_enable_O),
    .o_R(o_R),   
    .o_G(o_G),   
    .o_B(o_B)
    );

    
    


endmodule
