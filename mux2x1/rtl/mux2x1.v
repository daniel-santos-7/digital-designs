/*
* ----------------------------------------------------------------
* Module: MUX
* Description: Multiplexer
* Developed by: Daniel Santos
* 2025
* ----------------------------------------------------------------
*/

module mux2x1 #(
	parameter WIDTH = 8
) (
	input [WIDTH-1:0] in0,
	input [WIDTH-1:0] in1,
	input sel,
	output [WIDTH-1:0] out
);

	// output
	assign out = (sel) ? (in1) : (in0);

endmodule
