// module: counter
// developed by: Daniel Santos
// 2022

module counter #(
    parameter BITS = 8
) (
    input clk,
    input rst,
    input cnt,
    output tc,
    output [BITS-1:0] val
);
    
    reg [BITS-1:0] data;

    always @(posedge clk) begin
        if (rst)
            data <= 0;
        else if (cnt)
            data <= data + 1;
    end

    assign tc = data == {BITS{1'b1}};
    assign val = data;

endmodule