`timescale 1ns/1ps

// Accumulator: each falling clock edge, Q <- alu_rtl(Q, B).

module alu_accum (CLK, CLR, Q, B, E, S);

    // Inputs
    input logic CLK;
    input logic CLR;        // synchronous reset
    input logic E, S;       // ALU enable / subtract select
    input logic [7:0] B;

    // Accumulator register
    output logic [7:0] Q;

    // ALU result
    logic [7:0] D;

    alu_rtl U0 (.A(Q), .B(B), .S(S), .E(E), .W(D));

    always_ff @(negedge CLK) begin
        if (CLR) Q <= 8'd0;
        else     Q <= D;
    end

endmodule
