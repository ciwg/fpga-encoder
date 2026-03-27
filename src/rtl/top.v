module top #(
    parameter COUNTER_WIDTH = 32
) (
    input  wire clk,
    input  wire rst_n,
    input  wire enc_a,
    input  wire enc_b,
    input  wire scl,
    inout  wire sda
);
    wire                    step_valid;
    wire                    step_dir;
    wire [COUNTER_WIDTH-1:0] count_value;
    wire                    reg_wr_en;
    wire                    reg_rd_en;
    wire [3:0]              reg_addr;
    wire [7:0]              reg_wr_data;
    wire [7:0]              reg_rd_data;
    wire                    clear_counter;

    quadrature_decoder u_quadrature_decoder (
        .clk(clk),
        .rst_n(rst_n),
        .enc_a(enc_a),
        .enc_b(enc_b),
        .step_valid(step_valid),
        .step_dir(step_dir)
    );

    position_counter #(
        .COUNTER_WIDTH(COUNTER_WIDTH)
    ) u_position_counter (
        .clk(clk),
        .rst_n(rst_n),
        .step_valid(step_valid),
        .step_dir(step_dir),
        .clear(clear_counter),
        .count(count_value)
    );

    register_file #(
        .COUNTER_WIDTH(COUNTER_WIDTH)
    ) u_register_file (
        .clk(clk),
        .rst_n(rst_n),
        .wr_en(reg_wr_en),
        .rd_en(reg_rd_en),
        .addr(reg_addr),
        .wr_data(reg_wr_data),
        .count_value(count_value),
        .rd_data(reg_rd_data),
        .clear_counter(clear_counter)
    );

    i2c_slave_if u_i2c_slave_if (
        .clk(clk),
        .rst_n(rst_n),
        .scl(scl),
        .sda(sda),
        .reg_wr_en(reg_wr_en),
        .reg_rd_en(reg_rd_en),
        .reg_addr(reg_addr),
        .reg_wr_data(reg_wr_data),
        .reg_rd_data(reg_rd_data)
    );
endmodule
