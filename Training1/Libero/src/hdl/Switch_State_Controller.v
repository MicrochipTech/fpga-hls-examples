`timescale 1 ns / 1 ns
module switch_3_state_controller_top
(
    input clk,
    input reset,
	input toggle,
	output reg [1:0] sel
);

reg [2:0] toggle_reg;
reg [7:0] count;

always @(posedge clk) begin
    if (reset) begin
        toggle_reg <= 0;
        count <= 0;
        sel <= 0;
    end else begin
        // synchronize button input to clock domain
        toggle_reg <= {toggle_reg[1], toggle_reg[0], toggle};
        
        // keep a counter to prevent high frequency glitches from
        // affecting behavior, wait until 255 cycles of consistent
        // toggle input before affecting output
        if (toggle_reg[1])
            count <= (count == 255) ? count : (count + 1);
        else
            count <= 0;
        
        // after button is held down for 255 cycles, increment sel
        // on button release
        if (count == 255 && toggle_reg[2] && !toggle_reg[1]) begin
            if (sel == 2) begin
                sel <= 0;
            end else begin
                sel <= sel + 1;
            end
        end
    end
end

endmodule
