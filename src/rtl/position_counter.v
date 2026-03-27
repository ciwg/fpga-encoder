module position_counter #(
    parameter COUNTER_WIDTH = 32
) (
    input  wire                    clk,
    input  wire                    rst_n,
    input  wire                    step_valid,
    input  wire                    step_dir,
    input  wire                    clear,
    output reg [COUNTER_WIDTH-1:0] count
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            count <= {COUNTER_WIDTH{1'b0}};
        end else if (clear) begin
            count <= {COUNTER_WIDTH{1'b0}};
        end else if (step_valid) begin
            if (step_dir) begin
                count <= count + 1'b1;
            end else begin
                count <= count - 1'b1;
            end
        end
    end
endmodule
