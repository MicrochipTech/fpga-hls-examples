module hls_control (
	clk,
    uart_start,
    hls_finish,
	hls_start
);

input clk;
input uart_start;
input hls_finish;
output reg hls_start;

reg uart_start_prev;

always @(posedge clk) begin
    uart_start_prev <= uart_start;
end

always @(posedge clk) begin
    // start HLS module when detected 0->1 transition on uart_start
    hls_start <= uart_start & (~uart_start_prev);
    if (hls_finish) hls_start <= 0;
end

endmodule