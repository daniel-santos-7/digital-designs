RTL_DIR=rtl
TBS_DIR=tbs

RTL=$(RTL_DIR)/bit_sync.v
TBS=$(TBS_DIR)/bit_sync_tb.v

work:
	mkdir $@

waves:
	mkdir $@

work/bit_sync_tb: $(RTL) $(TBS)
	iverilog -o $@ $^

waves/bit_sync_tb.vcd: work/bit_sync_tb
	vvp $^
	mv bit_sync_tb.vcd $@
