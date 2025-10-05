/*
* ----------------------------------------------------------------
* Module: Bit Synchronizer Testbench
* Description: Simple testbench for verifying the bit synchronizer
* Developed by: Daniel Santos
* 2025
* ----------------------------------------------------------------
*/

`timescale 1ns/1ns

module bit_sync_tb;
	
	// Testbench variables
	integer errors;

	// UUT inputs
	reg rst_n;
	reg clk;
	reg in;
	
	// UUT outputs
	wire out;
	
	// Unit Under Test (UUT)
    bit_sync uut (
        .rst_n(rst_n),
		.clk(clk),
		.in(in),
		.out(out)
    );
	
	// Clock generation
	always #10 clk = ~(clk);
	
    initial begin
		$dumpfile("bit_sync_tb.vcd");
        $dumpvars(0, uut);

		$display("---------------------------");		
		$display("Running testbench");
		$display("---------------------------");

		errors = 0;

		initialize();
		reset();
		run_all_tests(errors);

		$display("---------------------------");		
		$display("Total errors = %0d", errors);
		$display("---------------------------");
		$finish;
    end
	
	// Initializes the UUT signals
	task initialize;
	begin
		rst_n = 1'b0;
		clk = 1'b0;
		in = 1'b0;
	end
	endtask

	// Reset the UUT
	task reset;
	begin
		@(posedge clk);
		#1 rst_n = 1'b1;
	end	
	endtask
	
	// Changes the input value
	task set_input(input value);
	begin
		@(posedge clk);
		#1 in = value;
	end
	endtask
	
	// Read output value
	task get_output(output value);
	begin
		@(posedge clk);
		#1 value = out;
	end
	endtask
	
	// Compare the values
	task check_output(input sample, input expected, inout errors);
	begin
		if (sample == expected) begin
			$display("✅ out = %b expected = %b", sample, expected);
		end else begin
			$display("❌ out = %b expected = %b", sample, expected);
			errors = errors + 1;
		end
	end
	endtask
	
	// Run simple test
	task run_test(input value, inout errors);
		reg current, previous;
	begin
		get_output(previous);
		set_input(value);
		get_output(current);
		check_output(current, previous, errors);
		get_output(current);
		check_output(current, value, errors);
	end
	endtask
	
	// Run all tests
	task run_all_tests(inout errors);
	begin
		run_test(1'b1, errors);
		run_test(1'b0, errors);
	end
	endtask

endmodule
