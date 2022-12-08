// module: full adder
// developed by: Daniel Santos
// 2022

module full_adder (
    input a,
    input b,
    input ci,
    output co,
    output s
);
    
    assign s = a ^ b ^ ci;
    assign co = a & b | (a ^ b) & ci;

endmodule