module tb_mock_encoder (
    input  wire clk,
    input  wire rst_n,
    input  wire enable,
    output reg  enc_a,
    output reg  enc_b
);
    reg [1:0] state;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= 2'b00;
            enc_a <= 1'b0;
            enc_b <= 1'b0;
        end else if (enable) begin
            state <= state + 1'b1;
            case (state)
                2'b00: begin enc_a <= 1'b0; enc_b <= 1'b0; end
                2'b01: begin enc_a <= 1'b0; enc_b <= 1'b1; end
                2'b10: begin enc_a <= 1'b1; enc_b <= 1'b1; end
                2'b11: begin enc_a <= 1'b1; enc_b <= 1'b0; end
            endcase
        end
    end
endmodule
