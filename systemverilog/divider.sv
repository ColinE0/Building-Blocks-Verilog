`timescale 1ns/1ps

// Serial divider top level. Work in progress, it does not divide yet.
// See README.md for what is still missing.

module top (STATE, CLK, Y1, Y2, Done);

    // Inputs
    input logic [4:0] Y1, Y2;
    input logic STATE;
    input logic CLK;

    // Output
    output wire Done;

    // Registers
    logic SHIFT;
    logic LOAD;

    // Wires
    wire [4:0] w1, w2, Xout;
    wire C;
    wire SH, LD, TIK;

    // Assignments
    assign SH = SHIFT;
    assign LD = LOAD;

    div dividend (.A(Xout), .Load(LD), .SH(SH), .CLK(TIK), .SU(LD), .Z(w2));
    subtractor sub0 (.Zin(Y1), .Cin(w1), .Cout(w2), .comp(C));
    control control0 (.START(STATE), .comp(C), .clock(CLK),
                      .DONE(Done), .SHIFT(SH), .LOAD(LD));

endmodule
