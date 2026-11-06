`timescale 1ns/1ps

module mux2to1_8bit (A, B, C, Y);

    // Data inputs
    input logic [7:0] A;
    input logic [7:0] B;

    // Control input
    input logic C;

    // Output
    output logic [7:0] Y;

    // One mux per bit
    genvar i;
    generate
        for (i = 7; i >= 0; i = i - 1) begin : mux_bits
            mux2to1 U0 (.A(A[i]), .B(B[i]), .C(C), .Y(Y[i]));
        end
    endgenerate

endmodule
