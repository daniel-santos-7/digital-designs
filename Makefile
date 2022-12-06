# verilog digital designs
# developed by: Daniel Santos
# 2022

work:
	mkdir $@

waves:
	mkdir $@

work/counter: counter/counter.v counter/counter_tb.v work
	iverilog -o $@ $^

waves/counter.vcd: work/counter waves
	vvp $^
	mv counter.vcd waves/

.PHONY: clean
clean:
	rm -rf waves work