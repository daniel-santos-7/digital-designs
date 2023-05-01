// module: parity_checker
// description: this module can be used to check the parity of a bit stream of any length.
// developed by: Daniel Santos
// 2023

module parity_checker # (
    parameter integer WIDTH = 32'd8
)(
    input rst_n,
    input clk,
    input check,
    input [WIDTH-1:0] data,
    output reg res
);

    // the "res" output goes high if the bit stream has an odd number of bits equal to "1"
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n)
            res <= 1'b0;
        else if (check)
            res <= ^{data, res};
    end

endmodule