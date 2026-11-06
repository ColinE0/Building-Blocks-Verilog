`timescale 1ns/1ps

module andgate (A, B, F);

    // Inputs
    input logic A;
    input logic B;

    // Output
    output logic F;

    assign F = A & B;

endmodule
