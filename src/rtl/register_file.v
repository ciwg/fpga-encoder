module register_file #(
    parameter COUNTER_WIDTH = 32
) (
    input  wire                    clk,
    input  wire                    rst_n,
    input  wire                    wr_en,
    input  wire                    rd_en,
    input  wire [3:0]              addr,
    input  wire [7:0]              wr_data,
    input  wire [COUNTER_WIDTH-1:0] count_value,
    output reg  [7:0]              rd_data,
    output reg                     clear_counter
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            clear_counter <= 1'b0;
        end else begin
            clear_counter <= 1'b0;
            if (wr_en && (addr == 4'h4) && wr_data[0]) begin
                clear_counter <= 1'b1;
            end
        end
    end

    always @(*) begin
        rd_data = 8'h00;
        if (rd_en) begin
            case (addr)
                4'h0: rd_data = count_value[7:0];
                4'h1: rd_data = count_value[15:8];
                4'h2: rd_data = count_value[23:16];
                4'h3: rd_data = count_value[31:24];
                4'h4: rd_data = 8'h01;
                default: rd_data = 8'h00;
            endcase
        end
    end
endmodule
