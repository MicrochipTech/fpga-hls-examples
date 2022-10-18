`timescale 1 ns / 1 ns
module wide_mult_axi_mem_controller_register (
  clk,
  reset,
  write_en_a,
  write_en_b,
  write_data_a,
  write_data_b,
  byte_en_a,
  byte_en_b,
  read_data
);

// When byte-enable is needed, set byte_en_width and byte_size to 8.
// Otherwise, set byte_en_width to 1, and byte_size to the whole word's width. Then the byte_en_a|b input signal can be tied to 1 when the module is instantiated.
// Essentially (byte_en_width * byte_size == width).
parameter byte_en_width = 4;
parameter byte_size = 8;
parameter width = 32;
parameter init_value = 0;
parameter latency = 0;

input clk;
input reset;
input write_en_a;
input write_en_b;
input [width-1 : 0 ] write_data_a;
input [width-1 : 0 ] write_data_b;
input [byte_en_width-1 : 0 ] byte_en_a;
input [byte_en_width-1 : 0 ] byte_en_b;
reg [width-1 : 0 ] register [latency : 0];
output [width-1 : 0 ] read_data;
wire [byte_en_width-1 : 0 ] internal_byte_en_a = {byte_en_width{write_en_a}} & byte_en_a;
wire [byte_en_width-1 : 0 ] internal_byte_en_b = {byte_en_width{write_en_b}} & byte_en_b;

integer byte_idx;
always @(posedge clk) begin
  for (byte_idx = 0; byte_idx < byte_en_width; byte_idx = byte_idx + 1) begin
    if (reset) begin
      register[0][byte_idx * byte_size +: byte_size] <= init_value[byte_idx * byte_size +: byte_size];
    end else if (internal_byte_en_a[byte_idx]) begin
      register[0][byte_idx * byte_size +: byte_size] <= write_data_a[byte_idx * byte_size +: byte_size];
    end else if (internal_byte_en_b[byte_idx]) begin
      register[0][byte_idx * byte_size +: byte_size] <= write_data_b[byte_idx * byte_size +: byte_size];
    end
  end

  // synthesis translate_off
  if (|(internal_byte_en_a & internal_byte_en_b)) begin
    $display("Error: two writes to the same register with overlapped bytes.");
    $finish;
  end
  // synthesis translate_on
end

integer latency_num;
always @(posedge  clk) begin
  for (latency_num = 0; latency_num < latency; latency_num = latency_num + 1) begin
    register[latency_num + 1] <= register[latency_num];
  end
end
assign read_data = register[latency];
endmodule
