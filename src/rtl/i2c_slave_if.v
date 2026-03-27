module i2c_slave_if (
    input  wire       clk,
    input  wire       rst_n,
    input  wire       scl,
    inout  wire       sda,
    output wire       reg_wr_en,
    output wire       reg_rd_en,
    output wire [3:0] reg_addr,
    output wire [7:0] reg_wr_data,
    input  wire [7:0] reg_rd_data
);
    assign reg_wr_en   = 1'b0;
    assign reg_rd_en   = 1'b0;
    assign reg_addr    = 4'h0;
    assign reg_wr_data = 8'h00;
    assign sda         = 1'bz;

    // Placeholder for eventual I2C slave integration. This can be replaced
    // by an external core once the register protocol is fixed.
endmodule
