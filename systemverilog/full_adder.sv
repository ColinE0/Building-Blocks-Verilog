`timescale 1ns/1ps

module full_adder (A, B, Cin, Cout, Sum);

    // Inputs
    input logic A;
    input logic B;
    input logic Cin;

    // Outputs
    output logic Sum;
    output logic Cout;

    // Internal signals
    logic w0, w1, w2;

    // Half adders
    half_adder U0 (.A(A), .B(B), .Sum(w0), .C(w1));
    half_adder U1 (.A(w0), .B(Cin), .Sum(Sum), .C(w2));

    assign Cout = w1 ^ w2;

endmodule
