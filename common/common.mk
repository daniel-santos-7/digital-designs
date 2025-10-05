WORK_DIR  ?= work
WAVES_DIR ?= waves

RTL_DIR	?= rtl
TBS_DIR ?= tbs

RTL_SRC ?= $(wildcard $(RTL_DIR)/*.v)
TBS_SRC ?= $(wildcard $(TBS_DIR)/*.v)

OUT_FILE ?= sim.out
VCD_FILE ?= dump.vcd

.PHONY: all run clean

all: run

$(WORK_DIR) $(WAVES_DIR):
	@mkdir -p $@

$(WORK_DIR)/$(OUT_FILE): $(RTL_SRC) $(TBS_SRC) | $(WORK_DIR)
	@iverilog -Wall $^ -o $@

$(WAVES_DIR)/$(VCD_FILE): $(WORK_DIR)/$(OUT_FILE) | $(WAVES_DIR)
	@vvp $<
	@mv *.vcd $@

run: $(WAVES_DIR)/dump.vcd
	@gtkwave $< &

clean:
	@rm -rf $(WORK_DIR) $(WAVES_DIR)
