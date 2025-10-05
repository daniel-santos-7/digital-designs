# Bit Synchronizer (bit_sync)

<p align="center">
  <img src="img/bit_sync.png" alt="Bit Synchronizer">
</p>

## Description

The `bit_sync` directory contains a **Verilog implementation of a bit synchronizer**.

It is designed to safely transfer single-bit signals across **different clock domains**, minimizing **metastability** and ensuring reliable signal integrity in digital systems.

## Directory Structure

```bash
bit_sync/
├── img/
│ └── bit_sync.png   # Illustrative diagram of the synchronizer
├── rtl/
│ └── bit_sync.v     # Main bit synchronizer module
├── tbs/
│ └── bit_sync_tb.v  # Testbench for simulation
├── Makefile         # Build and simulation commands
└── README.md        # This file
```

## Simulation

To simulate the design:

The project uses a **Makefile** to compile, simulate, and view waveforms:

1. Make sure you have **Icarus Verilog** and **GTKWave** installed.  
2. In this directory, run:

```bash
make
```

This will compile the RTL and testbench, simulate the design, and open the waveform viewer (GTKWave).

To clean generated files, run:

```bash
make clean
```

## License

This project is licensed under the MIT License – see the [LICENSE](LICENSE) file for details.
