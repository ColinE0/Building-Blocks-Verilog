`timescale 1ns/1ps

module mux2to1 (A, B, C, Y);

    // Data inputs
    input logic A;
    input logic B;

    // Control input
    input logic C;

    // Output
    output logic Y;

    assign Y = (A & ~C) | (B & C);

endmodule
