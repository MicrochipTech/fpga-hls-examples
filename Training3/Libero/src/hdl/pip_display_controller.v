module pip_display_controller
(
    input             clk,
    input             reset_n,
    input             data_valid_i,
    input             pip_frame_active_i,
    input             pip_data_valid_i,
    input      [23:0] pip_data_i,
    input       [7:0] downscale_data_i,
    input       [3:0] prediction_i,
    output reg        data_valid_o,
    output reg [23:0] data_o,
    output reg  [9:0] downscale_address_o
);

localparam H_RES     = 1920;
localparam V_RES     = 1080;

localparam D_DIM     = 28;
localparam D_SIZE    = D_DIM * D_DIM;
localparam P_DIM     = 80;
localparam P_SIZE    = P_DIM * P_DIM;

localparam D_H_START = 24;
localparam D_V_START = 450;

localparam P_H_START = D_H_START + D_DIM + 10;
localparam P_V_START = 450;

reg  [1:0] select;

reg [15:0] h_counter;
reg [15:0] v_counter;

reg  [2:0] prediction_reg;
reg [31:0] prediction_reg_counter;

reg [19:0] prediction_offset;
reg [15:0] prediction_counter;
reg  [2:0] prediction_index;

wire [19:0] prediction_address;
wire  [7:0] prediction_data;

assign prediction_address = prediction_offset + prediction_counter;

always @(*) begin
    select = 0;
    if ((v_counter > D_V_START) && (v_counter <= D_V_START + D_DIM) &&
        (h_counter > D_H_START) && (h_counter <= D_H_START + D_DIM)) begin
        select = 1;
    end
    if ((v_counter > P_V_START) && (v_counter <= P_V_START + P_DIM) &&
        (h_counter > P_H_START) && (h_counter <= P_H_START + P_DIM)) begin
        select = 2;
    end
end

always @(*) begin
    case (select)
        0: begin
            data_valid_o = pip_data_valid_i && pip_frame_active_i;
            data_o = pip_data_i;
        end
        1: begin
            data_valid_o = data_valid_i;
            data_o = {8'b0, downscale_data_i, 8'b0};
        end
        2: begin
            data_valid_o = data_valid_i;
            data_o = {24{prediction_data[7-prediction_index]}};
        end
        default: begin
            data_valid_o = pip_data_valid_i && pip_frame_active_i;
            data_o = pip_data_i;
        end
    endcase
end

always @(posedge clk)
    if (!reset_n) begin
        h_counter <= 0;
        v_counter <= 0;
    end else begin
        if (data_valid_i) begin
            if (h_counter < H_RES - 1) begin
                h_counter <= h_counter + 1;
            end else begin
                h_counter <= 0;
            end
            if (h_counter == H_RES - 1) begin
                if (v_counter < V_RES - 1) begin
                    v_counter <= v_counter + 1;
                end else begin
                    v_counter <= 0;
                end
            end
        end
    end

always @(posedge clk)
    if (!reset_n) begin
        downscale_address_o <= 0;
    end else begin
        if (data_valid_i && select == 1) begin
            if (downscale_address_o < D_SIZE - 1) begin
                downscale_address_o <= downscale_address_o + 1;
            end else begin
                downscale_address_o <= 0;
            end
        end
    end

always @(posedge clk)
    if (!reset_n) begin
        prediction_reg         <= 0;
        prediction_reg_counter <= 0;
    end else begin
        if (data_valid_i) begin
            if (prediction_reg_counter == 0) begin
                prediction_reg <= prediction_i;
            end
            if (prediction_reg_counter < H_RES * V_RES * 30 - 1) begin
                prediction_reg_counter <= prediction_reg_counter + 1;
            end else begin
                prediction_reg_counter <= 0;
            end
        end
    end

always @(posedge clk)
    if (!reset_n) begin
        prediction_offset  <= 0;
        prediction_counter <= 0;
        prediction_index   <= 0;
    end else begin
        prediction_index <= prediction_address[2:0];
        if (select != 2 && prediction_counter == 0) begin
            //implements multiply by P_SIZE=80*80=6400
            //2^13 - 2^10 - 2^9 - 2^8 = 6400
            if (prediction_reg > 9) begin
                prediction_offset <= 0;
            end else begin
                prediction_offset <= (prediction_reg << 13) - (prediction_reg << 10) -
                                     (prediction_reg <<  9) - (prediction_reg <<  8);
            end
        end
        if (data_valid_i && select == 2) begin
            if (prediction_counter < P_SIZE - 1) begin
                prediction_counter <= prediction_counter + 1;
            end else begin
                prediction_counter <= 0;
            end
        end
    end

rom_single_port_h #(
    .width_a     (8),
    .widthad_a   (16),
    .numwords_a  (P_SIZE * 10),
    .latency     (1),
    .init_file   ("predictions.mem")
) prediction_images (
    .clk         (clk),
    .reset       (!reset_n),
    .clken       (1'b1),
    .read_en_a   (1'b1),
    .address_a   (prediction_address[18:3]),
    .read_data_a (prediction_data)
);

endmodule