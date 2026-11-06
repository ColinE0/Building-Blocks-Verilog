`timescale 1ns/1ps

module orgate (A, B, F);

    // Inputs
    input logic A;
    input logic B;

    // Output
    output logic F;

    assign F = A | B;

endmodule
