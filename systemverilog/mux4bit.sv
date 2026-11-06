`timescale 1ns/1ps

module mux4bit (A, B, C, Y);

    // Data inputs
    input logic [3:0] A;
    input logic [3:0] B;

    // Control input
    input logic C;

    // Output
    output logic [3:0] Y;

    always_comb begin
        if (C == 0) Y = A;
        else        Y = B;
    end

endmodule
