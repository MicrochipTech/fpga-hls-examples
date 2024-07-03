
module top_sync_vg_pattern
	(
		input  wire clk_i,
		input  wire resetb_i,
        input  wire [7:0] pattern_i,
		output wire TPG_CLK_o,
		output reg  TPG_VSYNC_o,
		output reg  TPG_HSYNC_o,
        output reg  TPG_DATA_TRIGGER_o,
		output reg  TPG_DE_o,
		output reg  TPG_FV_o,
        output      TPG_VSYNC_START_o,
        output      TPG_H_BLANK_START_o,
        output      TPG_FRAME_END_o,
        output      TPG_DATA_TRIGGER_START_o,
		output reg  [7:0] TPG_RED_o,
		output reg  [7:0] TPG_GREEN_o,
		output reg  [7:0] TPG_BLUE_o,
        output [15:0] TPG_HRES_o,
        output TPG_VSYNC_POL_o
	);
	/* ************************************* */

/* SELECT ONE OF MODES: */
//`define MODE_1080p
//`define MODE_1080i
//`define MODE_720p
`define MODE_VGA
//`define MODE_SIM

`ifdef MODE_1080p /* FORMAT 16 */
	parameter INTERLACED = 1'b0;
	parameter V_TOTAL_0 = 12'd1125;
	parameter V_FP_0 = 12'd4;
	parameter V_BP_0 = 12'd36;
	parameter V_SYNC_0 = 12'd5;
	parameter V_TOTAL_1 = 12'd0;
	parameter V_FP_1 = 12'd0;
	parameter V_BP_1 = 12'd0;
	parameter V_SYNC_1 = 12'd0;
    parameter V_SYNC_POL = 1;       // positive polarity
	parameter H_TOTAL = 12'd2200;
	parameter H_FP = 12'd88;
	parameter H_BP = 12'd148;
	parameter H_SYNC = 12'd44;
    parameter H_SYNC_POL = 1;       // positive polarity
	parameter HV_OFFSET_0 = 12'd0;
	parameter HV_OFFSET_1 = 12'd0;
	parameter PATTERN_RAMP_STEP = 20'h0222;
	parameter PATTERN_TYPE = 8'd4; // RAMP
	//parameter PATTERN_TYPE = 8'd1; // OUTLINE
`endif

`ifdef MODE_1080i /* FORMAT 5 */
	parameter INTERLACED = 1'b1;
	parameter V_TOTAL_0 = 12'd562;
	parameter V_FP_0 = 12'd2;
	parameter V_BP_0 = 12'd15;
	parameter V_SYNC_0 = 12'd5;
	parameter V_TOTAL_1 = 12'd563;
	parameter V_FP_1 = 12'd2;
	parameter V_BP_1 = 12'd16;
	parameter V_SYNC_1 = 12'd5;
    parameter V_SYNC_POL = 1;       // positive polarity
	parameter H_TOTAL = 12'd2200;
	parameter H_FP = 12'd88;
	parameter H_BP = 12'd148;
	parameter H_SYNC = 12'd44;
    parameter H_SYNC_POL = 1;       // positive polarity
	parameter HV_OFFSET_0 = 12'd0;
	parameter HV_OFFSET_1 = 12'd1100;
	parameter PATTERN_RAMP_STEP = 20'h0222; // 20'hFFFFF / 1920 act_pixels per line = 20'h0222
	parameter PATTERN_TYPE = 8'd4; // RAMP
	//parameter PATTERN_TYPE = 8'd1; // OUTLINE
`endif


`ifdef MODE_720p /* FORMAT 4 */
	parameter INTERLACED = 1'b0;
	parameter V_TOTAL_0 = 12'd750;
	parameter V_FP_0 = 12'd5;
	parameter V_BP_0 = 12'd20;
	parameter V_SYNC_0 = 12'd5;
	parameter V_TOTAL_1 = 12'd0;
	parameter V_FP_1 = 12'd0;
	parameter V_BP_1 = 12'd0;
	parameter V_SYNC_1 = 12'd0;
    parameter V_SYNC_POL = 1;       // positive polarity
	parameter H_TOTAL = 12'd1650;
	parameter H_FP = 12'd110;
	parameter H_BP = 12'd220;
	parameter H_SYNC = 12'd40;
    parameter H_SYNC_POL = 1;       // positive polarity
	parameter HV_OFFSET_0 = 12'd0;
	parameter HV_OFFSET_1 = 12'd0;
	parameter PATTERN_RAMP_STEP = 20'h0333; // 20'hFFFFF / 1280 act_pixels per line = 20'h0333
	//parameter PATTERN_TYPE = 8'd1; // BORDER.
	parameter PATTERN_TYPE = 8'd4; // RAMP
`endif

`ifdef MODE_VGA /* FORMAT 1 */
// 640x480p@59.94/60Hz, 25.2MHz Pixelclock
	parameter INTERLACED = 1'b0;
	parameter V_TOTAL_0 = 12'd525;
	parameter V_FP_0 = 12'd10;
	parameter V_BP_0 = 12'd33;
	parameter V_SYNC_0 = 12'd2;
    parameter V_TOTAL_1 = 12'd0;
    parameter V_FP_1 = 12'd0;
	parameter V_BP_1 = 12'd0;
	parameter V_SYNC_1 = 12'd0;
    parameter  V_SYNC_POL = 0;       // negative polarity
	parameter H_TOTAL = 12'd800;
    parameter H_FP = 12'd16;
	parameter H_BP = 12'd96;
	parameter H_SYNC = 12'd48;
    parameter H_SYNC_POL = 0;       // negative polarity
	parameter HV_OFFSET_0 = 12'd0;
	parameter HV_OFFSET_1 = 12'd0;
	parameter PATTERN_RAMP_STEP = 20'h0333; // 20'hFFFFF / 1280 act_pixels per line = 20'h0333
	//parameter PATTERN_TYPE = 8'd1; // BORDER.
	parameter PATTERN_TYPE = 8'd4; // RAMP
`endif

`ifdef MODE_SIM /* For Simulation */

// 640x3

	parameter INTERLACED = 1'b0;
	parameter V_TOTAL_0 = 12'd609;
//	parameter V_FP_0 = 12'd10;
	parameter V_FP_0 = 12'd0;
//	parameter V_BP_0 = 12'd33;
	parameter V_BP_0 = 12'd0;
	parameter V_SYNC_0 = 12'd2;
    parameter V_TOTAL_1 = 12'd0;
    parameter V_FP_1 = 12'd0;
	parameter V_BP_1 = 12'd0;
	parameter V_SYNC_1 = 12'd0;
    parameter  V_SYNC_POL = 0;       // negative polarity
	parameter H_TOTAL = 12'd800;
    parameter H_FP = 12'd16;
	parameter H_BP = 12'd96;
	parameter H_SYNC = 12'd48;
    parameter H_SYNC_POL = 0;       // negative polarity
	parameter HV_OFFSET_0 = 12'd0;
	parameter HV_OFFSET_1 = 12'd0;
	parameter PATTERN_RAMP_STEP = 20'h0333; // 20'hFFFFF / 1280 act_pixels per line = 20'h0333
	//parameter PATTERN_TYPE = 8'd1; // BORDER.
	//parameter PATTERN_TYPE = 8'd4; // RAMP
`endif

	wire [11:0] x_out;
	wire [12:0] y_out;
	wire [7:0] r_out;
	wire [7:0] g_out;
	wire [7:0] b_out;
  
    wire vs;
    wire hs;
    wire de;
    wire fv;
    
    wire data_trigger;
    
    wire vs_out;
    wire hs_out;
    wire de_out;
    wire fv_out;
        
    // registers for edge detectors
    reg fv_out_dly1;
    reg fv_out_dly2;
    reg vs_out_dly1;
    reg vs_out_dly2;
    reg hs_out_dly1;
    reg hs_out_dly2;

    reg data_trigger_out_dly1;
    reg data_trigger_out_dly2;
    
        
	/* ********************* */
	sync_vg #(.X_BITS(12), .Y_BITS(12)) sync_vg
	(
		.clk(clk_i),
		.reset(~resetb_i),      // high active sync
		.interlaced(INTERLACED),
		.clk_out(), // inverted output clock - unconnected
		.v_total_0(V_TOTAL_0),
		.v_fp_0(V_FP_0),
		.v_bp_0(V_BP_0),
		.v_sync_0(V_SYNC_0),
		.v_total_1(V_TOTAL_1),
		.v_fp_1(V_FP_1),
		.v_bp_1(V_BP_1),
		.v_sync_1(V_SYNC_1),
		.h_total(H_TOTAL),
		.h_fp(H_FP),
		.h_bp(H_BP),
		.h_sync(H_SYNC),
		.hv_offset_0(HV_OFFSET_0),
		.hv_offset_1(HV_OFFSET_1),
		.data_trigger_out(data_trigger),
		.de_out(de),
        .fv_out(fv),
		.vs_out(vs),
		.v_count_out(),
		.h_count_out(),
		.x_out(x_out),
		.y_out(y_out),
		.hs_out(hs),
		.field_out(field)
	);

	pattern_vg #(
		.B(8), // Bits per channel
		.X_BITS(12),
		.Y_BITS(12),
		.FRACTIONAL_BITS(12)) // Number of fractional bits for ramp pattern
	pattern_vg (
  		.clk_in(clk_i),
		.reset(~resetb_i),      // high active sync
		.x(x_out),
		.y(y_out[11:0]),
		.vn_in(vs),
		.hn_in(hs),
		.dn_in(de),
        .fv_in(fv),
		.r_in(8'h0), // default red channel value
		.g_in(8'h0), // default green channel value
		.b_in(8'h0), // default blue channel value
		.vn_out(vs_out),
		.hn_out(hs_out),
		.den_out(de_out),
        .fv_out(fv_out),
		.r_out(r_out),
		.g_out(g_out),
		.b_out(b_out),
		.total_active_pix(H_TOTAL - (H_FP + H_BP + H_SYNC)), // (1920) // h_total - (h_fp+h_bp+h_sync)
		.total_active_lines(INTERLACED ? (V_TOTAL_0 - (V_FP_0 + V_BP_0 + V_SYNC_0)) + (V_TOTAL_1 - (V_FP_1 + V_BP_1 + V_SYNC_1)) : (V_TOTAL_0 - (V_FP_0 + V_BP_0 + V_SYNC_0))), // originally: 13'd480
//		.pattern(PATTERN_TYPE),
		.pattern(pattern_i),
		.ramp_step(PATTERN_RAMP_STEP)
	);
	
	assign TPG_CLK_o = ~clk_i;
    
    always@(posedge clk_i or negedge resetb_i)
    if (!resetb_i)
    begin
		TPG_RED_o <= 8'h00;
		TPG_GREEN_o <= 8'h00;
		TPG_BLUE_o <=  8'h00;
		TPG_HSYNC_o <= H_SYNC_POL? 1'b0 : 1'b1;
		TPG_VSYNC_o <= V_SYNC_POL? 1'b0 : 1'b1;
        TPG_DATA_TRIGGER_o <= 1'b0;
		TPG_DE_o <= 1'b0;
		TPG_FV_o <= 1'b0;
        fv_out_dly1 <= 1'b0;
        fv_out_dly2 <= 1'b0;
        vs_out_dly1 <= 1'b0;
        vs_out_dly2 <= 1'b0;
        hs_out_dly1 <= 1'b0;
        hs_out_dly2 <= 1'b0;
        
        data_trigger_out_dly1 <= 1'b0;
        data_trigger_out_dly2 <= 1'b0;
        
    end
    else
    begin
		TPG_RED_o <= r_out;
		TPG_GREEN_o <= g_out;
		TPG_BLUE_o <=  b_out;
		TPG_HSYNC_o <= H_SYNC_POL? hs_out : ~hs_out;
		TPG_VSYNC_o <= V_SYNC_POL? vs_out : ~vs_out;
        TPG_DATA_TRIGGER_o <= data_trigger;
		TPG_DE_o <= de_out;
		TPG_FV_o <= fv_out;
                
        fv_out_dly2 <= fv_out_dly1;
        fv_out_dly1 <= fv_out;
        vs_out_dly2 <= vs_out_dly1;
        vs_out_dly1 <= vs_out;
        hs_out_dly2 <= hs_out_dly1;
        hs_out_dly1 <= hs_out;
        
        data_trigger_out_dly2 <= data_trigger_out_dly1;
        data_trigger_out_dly1 <= data_trigger;
        
       end

    // Horizontal Active Pixels
    assign TPG_HRES_o = H_TOTAL - H_FP - H_BP - H_SYNC;
    
    // VSYNC Polarity
    assign TPG_VSYNC_POL_o = V_SYNC_POL;
    
    // falling edge of fv_out indicated frame end (active area)
    assign TPG_FRAME_END_o = fv_out_dly2 && !fv_out_dly1;

    // rising edge of (internal) vs_out indicates start of V Blanking at start of frame
    assign TPG_VSYNC_START_o = !vs_out_dly2 && vs_out_dly1;
        
    // rising edge (internal) hs_out indicates start of H Blanking at start of line within active video area
    assign TPG_H_BLANK_START_o = (!hs_out_dly2 && hs_out_dly1) & fv_out;

    // rising edge of data_trigger signal
    assign TPG_DATA_TRIGGER_START_o = !data_trigger_out_dly2 && data_trigger_out_dly1;
    
endmodule

