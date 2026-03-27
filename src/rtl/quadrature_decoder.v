module quadrature_decoder (
    input  wire clk,
    input  wire rst_n,
    input  wire enc_a,
    input  wire enc_b,
    output reg  step_valid,
    output reg  step_dir
);
    reg [1:0] enc_prev;
    reg [1:0] enc_curr;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            enc_prev   <= 2'b00;
            enc_curr   <= 2'b00;
            step_valid <= 1'b0;
            step_dir   <= 1'b0;
        end else begin
            enc_prev   <= enc_curr;
            enc_curr   <= {enc_a, enc_b};
            step_valid <= 1'b0;

            case ({enc_prev, enc_curr})
                4'b0001,
                4'b0111,
                4'b1110,
                4'b1000: begin
                    step_valid <= 1'b1;
                    step_dir   <= 1'b1;
                end
                4'b0010,
                4'b1011,
                4'b1101,
                4'b0100: begin
                    step_valid <= 1'b1;
                    step_dir   <= 1'b0;
                end
                default: begin
                    step_valid <= 1'b0;
                    step_dir   <= step_dir;
                end
            endcase
        end
    end
endmodule
