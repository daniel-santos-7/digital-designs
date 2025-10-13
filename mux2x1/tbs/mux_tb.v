/*
* ----------------------------------------------------------------
* Module: MUX Testbench
* Description: Simple testbench for multiplexer
* Developed by: Daniel Santos
* 2025
* ----------------------------------------------------------------
*/

`timescale 1ns/1ns

module mux_tb;
	
	// Testbench variables
	integer errors;
	reg clk;
	
	localparam WIDTH = 8;

	// UUT inputs
	reg [WIDTH-1:0] in0;
	reg [WIDTH-1:0] in1;
	reg sel;
	
	// UUT outputs
	wire [WIDTH-1:0] out;
	
	// Unit Under Test (UUT)
    mux2x1 uut (
        .in0(in0),
		.in1(in1),
		.sel(sel),
		.out(out)
    );
	
	// Clock generation
	always #10 clk = ~(clk);
	
    initial begin
		$dumpfile("mux_tb.vcd");
        $dumpvars(0, uut);

		$display("---------------------------");		
		$display("Running testbench");
		$display("---------------------------");

		errors = 0;

		initialize();
		run_all_tests(10, errors);

		$display("---------------------------");		
		$display("Total errors = %0d", errors);
		$display("---------------------------");
		$finish;
    end
	
	// Initializes the UUT signals
	task initialize;
	begin
		clk = 1'b0;
		in0 = 8'h00;
		in1 = 8'h00;
		sel = 1'b0;
	end
	endtask
	
	// Changes the input value
	task set_input(input select, input [WIDTH-1:0] value);
	begin
		@(posedge clk);
		if (select == 1'b0) #1 in0 = value;
		if (select == 1'b1) #1 in1 = value;
	end
	endtask

	task set_sel(input select);
	begin
		@(posedge clk);
		#1 sel = select;
	end
	endtask

	// Read output value
	task get_output(output [WIDTH-1:0] value);
	begin
		@(posedge clk);
		#1 value = out;
	end
	endtask
	
	// Compare the values
	task check_output(input [WIDTH-1:0] sample, input [WIDTH-1:0] expected, inout errors);
	begin
		if (sample == expected) begin
			$display("✅ out = %h expected = %h", sample, expected);
		end else begin
			$display("❌ out = %h expected = %h", sample, expected);
			errors = errors + 1;
		end
	end
	endtask
	
	// Run simple test
	task run_test(input [WIDTH-1:0] value0, input [WIDTH-1:0] value1, inout errors);
		reg [WIDTH-1:0] value;
	begin
		set_input(1'b0, value0);
		set_input(1'b1, value1);
		
		set_sel(1'b0);
		get_output(value);
		check_output(value, value0, errors);
		
		set_sel(1'b1);
		get_output(value);
		check_output(value, value1, errors);
	end
	endtask
	
	// Run all tests
	task run_all_tests(input integer n, inout errors);
		reg [WIDTH-1:0] value0, value1;
	begin
		repeat (n) begin
			value0 = $random % 256;
			value1 = $random % 256;
			run_test(value0, value1, errors);
		end
	end
	endtask

endmodule
