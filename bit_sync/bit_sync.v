/*
* Module: Bit Synchronizer
* Description: 
* Developed by: Daniel Santos
* 2023
*/

module bit_sync (
	input rst_n,
	input clk,
	input in,
	output out
);
	// Synchronizer registers
	reg [1:0] sync;

	// Synchronization logic
	always @(posedge clk, negedge rst_n) begin
		if (!rst_n) begin
			sync[0] <= 1'b0;
			sync[1] <= 1'b0;
		end else begin
			sync[0] <= in;
			sync[1] <= sync[0];
		end
	end
	
	// Output
	assign out = sync[1];

endmodule
