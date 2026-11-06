`timescale 1ns/1ps

module half_adder (A, B, C, Sum);

    // Inputs
    input logic A;
    input logic B;

    // Outputs
    output logic C;
    output logic Sum;

    // Assignments
    assign C = A & B;
    assign Sum = A ^ B;

endmodule
