# verilog digital designs
# developed by: Daniel Santos
# 2022

work:
	mkdir $@

waves:
	mkdir $@

work/counter: counter/counter.v counter/counter_tb.v work
	iverilog -o $@ $^

work/full_adder: full_adder/full_adder.v full_adder/full_adder_tb.v work
	iverilog -o $@ $^

work/parity_checker: parity_checker/parity_checker.v parity_checker/parity_checker_tb.v work
	iverilog -o $@ $^

waves/counter.vcd: work/counter waves
	vvp $^
	mv counter.vcd waves/

waves/full_adder.vcd: work/full_adder waves
	vvp $^
	mv full_adder.vcd waves/

waves/parity_checker.vcd: work/parity_checker waves
	vvp $^
	mv parity_checker.vcd waves/

.PHONY: clean
clean:
	rm -rf waves work