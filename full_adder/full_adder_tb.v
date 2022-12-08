// testbench: counter
// developed by: Daniel Santos
// 2022

`timescale 1ns/1ns

module full_adder_tb;
    
    // inputs
    reg a;
    reg b;
    reg ci;

    // outputs 
    wire co;
    wire s;

    // tests array
    reg [5:0] tests [0:7];

    // tests aux
    integer n;

    // tests errors
    integer e;

    // unit under test
    full_adder uut (
        .a(a),
        .b(b),
        .ci(ci),
        .co(co),
        .s(s)
    );

    // tests
    initial begin
        $dumpfile("full_adder");
        $dumpvars(1, uut);
        $readmemb("tests.mem", tests);

        e = 0;
        for (n = 0; n < 8; n = n + 1) begin
            a = tests[n][4];
            b = tests[n][3];
            ci = tests[n][2];
            #1;

            if (co != tests[n][1] || s != tests[n][0])
                e = e + 1;
        end

        $display("expected: \te = 0\nresult: \te = %d", e);
    end

endmodule