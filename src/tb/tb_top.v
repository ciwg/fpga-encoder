`timescale 1ns/1ps

module tb_top;
    reg clk;
    reg rst_n;
    reg scl;
    wire sda;
    wire enc_a;
    wire enc_b;

    reg encoder_enable;

    top uut (
        .clk(clk),
        .rst_n(rst_n),
        .enc_a(enc_a),
        .enc_b(enc_b),
        .scl(scl),
        .sda(sda)
    );

    tb_mock_encoder u_tb_mock_encoder (
        .clk(clk),
        .rst_n(rst_n),
        .enable(encoder_enable),
        .enc_a(enc_a),
        .enc_b(enc_b)
    );

    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst_n = 1'b0;
        scl = 1'b1;
        encoder_enable = 1'b0;

        #50;
        rst_n = 1'b1;
        encoder_enable = 1'b1;

        #1000;
        encoder_enable = 1'b0;

        #100;
        $finish;
    end
endmodule
