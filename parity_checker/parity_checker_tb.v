`timescale 1ns/1ns

module parity_checker_tb;

    // inputs
    reg rst_n;
    reg clk;
    reg check;
    reg [7:0] data;

    // outputs
    wire res;

    parity_checker dut (
        .rst_n(rst_n),
        .clk(clk),
        .check(check),
        .data(data),
        .res(res)
    );
    
    initial begin
        clk = 1'b0;
        forever #100 clk = ~clk;
    end
    
    initial begin
        $dumpfile("parity_checker");
        $dumpvars(0, parity_checker_tb);

        rst_n = 1'b0;
        data = 8'b0;
        check = 1'b0;
        @(posedge clk);

        rst_n = 1'b1;
        @(posedge clk);
        
        data = 8'b00000001;
        check = 1'b1;
        @(posedge clk);
        check = 1'b0;
        @(posedge clk);
        
        data = 8'b01000001;
        check = 1'b1;
        @(posedge clk);
        check = 1'b0;
        @(posedge clk);

        data = 8'b00110001;
        check = 1'b1;
        @(posedge clk);
        check = 1'b0;
        @(posedge clk);

        data = 8'b11110001;
        check = 1'b1;
        @(posedge clk);
        check = 1'b0;
        @(posedge clk);

        data = 8'b00110111;
        check = 1'b1;
        @(posedge clk);
        check = 1'b0;
        @(posedge clk);

        data = 8'b00000000;
        check = 1'b1;
        @(posedge clk);
        check = 1'b0;
        @(posedge clk);

        data = 8'b11111111;
        check = 1'b1;
        @(posedge clk);
        check = 1'b0;
        @(posedge clk);

        data = 8'b00000001;
        check = 1'b1;
        @(posedge clk);
        check = 1'b0;
        @(posedge clk);
        
        $finish;
    end

endmodule
