// testbench: counter
// developed by: Daniel Santos
// 2022

`timescale 1ns/1ns

module counter_tb;
    
    // inputs
    reg clk;
    reg rst;
    reg cnt;

    // outputs 
    wire tc;
    wire [7:0] val;

    // tests aux
    integer n;

    // unit under test
    counter #(
        .BITS(8)
    ) uut (
        .clk(clk),
        .rst(rst),
        .cnt(cnt),
        .tc(tc),
        .val(val)
    );

    // tests
    initial begin
        $dumpfile("counter");
        $dumpvars(1, uut);

        clk = 0;
        rst = 1;
        cnt = 0;
        #1;

        for (n = 0; n < 256; n = n + 1) begin
            rst = n == 0;
            cnt = ~rst;
            clk = ~clk;
            #1;
            clk = ~clk;
            #1;
        end

        $display("expected: tc = 1, val = ff");
        $display("result:   tc = %b, val = %h", tc, val);
    end

endmodule