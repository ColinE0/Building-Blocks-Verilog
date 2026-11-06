`timescale 1ns/1ps

// Structural 8-bit add / subtract ALU.

module alu_8bit (A, B, Select, C, Y);

    // Inputs
    input logic [7:0] A, B;
    input logic Select;     // 0 = add, 1 = subtract
    input logic C;          // output enable

    // Output
    output logic [7:0] Y;

    // Internal results
    logic [7:0] w0, w1, w2;

    // Submodules
    adder_8bit      U0 (.A(A), .B(B), .S(w0));
    subtractor_8bit B0 (.A(A), .B(B), .Diff(w1));
    mux2to1_8bit    C0 (.A(w0), .B(w1), .C(Select), .Y(w2));

    assign Y = C ? w2 : 8'd0;

endmodule
