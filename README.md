# Verilog Building Blocks
![Verilog](https://img.shields.io/badge/HDL-Verilog-blue)
![Simulator](https://img.shields.io/badge/Sim-Icarus_Verilog-2C3E50)
![License](https://img.shields.io/badge/License-MIT-green.svg)

A library of digital building blocks written in Verilog, from basic gates up to an ALU,
shift register, and an accumulator, each with its own testbench. Built while learning
digital design, and cleaned up so the pieces are reusable.

## Index
| Category | Modules |
|----------|---------|
| Logic gates | `and_gate`, `orgate` |
| Adders / subtractors | `half_adder`, `full_adder`, `adder_8bit`, `subtractor`, `subtractor_8bit` |
| Mux / decode | `mux2to1`, `mux2to1_8bit`, `mux4bit`, `decoder1to2` |
| Compare | `comparator` |
| ALU | `alu_rtl` (behavioral), `alu_8bit` (structural) |
| Sequential | `shift` (shift register), `div` (load/shift register) |
| Accumulator | `alu_accum` |
| Control | `control` (serial-divide FSM) |

## Conventions
- Combinational blocks use blocking assignments (`=`) inside `always @(*)`.
- Clocked blocks use non-blocking assignments (`<=`) and, where present, a synchronous reset.
- Modules connect by name, not by position.
- Build artifacts are not committed (see `.gitignore`).

## Simulating a block
Compile the module plus its dependencies and testbench together with Icarus Verilog. Do not
`include` module files; pass them on the command line so nothing is defined twice. Example:
```
iverilog -o sim alu_8bit.v adder_8bit.v subtractor_8bit.v mux2to1_8bit.v mux2to1.v <testbench>.v
vvp sim
gtkwave <dump>.vcd
```
For the accumulator:
```
iverilog -o sim alu_accum_test.v alu_accum.v alu_rtl.v
vvp sim
```

## Status
Most blocks are small, self-contained, and reusable. The serial-divider subsystem
(`divider.v` plus `control` and `div`) is a work in progress.

## License
MIT License. See [LICENSE](LICENSE) for details.
