# SystemVerilog versions

SystemVerilog versions of every block and testbench in the repo root, plus three new
benches (`alu_rtl_test`, `subtractor_test`, `registers_test`). Module names and ports
match the `.v` files. Signals are `logic`, combinational blocks use `always_comb`, and
clocked blocks use `always_ff`.

## Running the tests
Needs Icarus Verilog with `iverilog` and `vvp` on PATH. From the repo root:
```
python systemverilog/run_tests.py
```
This builds and runs every bench with `-g2012 -Wall` and stops at the first one that
does not print `PASS`. Add `--waves` to keep the VCDs in `systemverilog/waves/`.

To run one bench by hand from this folder:
```
iverilog -g2012 -Wall -s alu_8bit_test -o sim.vvp alu_8bit_test.sv alu_8bit.sv adder_8bit.sv subtractor_8bit.sv full_adder.sv half_adder.sv mux2to1_8bit.sv mux2to1.sv
vvp sim.vvp +waves
```
Pass every module file on the command line, nothing is `include`d. Don't mix the `.v`
and `.sv` files in one build, since they use the same module names.

Every bench also passes in Vivado xsim 2025.1.

## Testbenches
- Combinational blocks are checked against every input combination: 65,536 cases for
  the 8-bit adder and subtractor, 131,072 for the 8-bit mux, and 262,144 for each ALU.
- The shift register, the `div` register, and the accumulator are checked on every clock
  for load, shift, hold, and wraparound, and to make sure nothing changes on the wrong edge.
- The controller bench runs one controller with comp = 0 and one with comp = 1 through
  all four rounds to DONE.
- Each bench counts its failures and ends with a `PASS` or `FAIL` line.

## Known gaps
- The serial divider (`divider.sv`) is still a work in progress. TIK, w1, and Xout have
  no driver, SH, LD, and w2 have more than one, and Y2 is not used yet. `divider_test`
  only checks that it builds and runs. The register, subtractor, and controller each
  have their own bench.
- The controller runs once. count is not reloaded after DONE, and the outputs are X
  while it sits idle before START.
- The accumulator clocks on the falling edge, and E = 0 clears it instead of holding.
