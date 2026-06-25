// alu_accum.v
// Accumulator: each clock, Q <- alu_rtl(Q, B) under control of E and S.

module alu_accum (CLK, CLR, Q, B, E, S);

    // Inputs
    input        CLK;
    input        CLR;        // synchronous reset
    input        E, S;       // ALU enable / subtract select
    input  [7:0] B;

    // Output (accumulator register)
    output reg [7:0] Q;

    // ALU result
    wire [7:0] D;

    alu_rtl U0 (.A(Q), .B(B), .S(S), .E(E), .W(D));

    always @(negedge CLK) begin
        if (CLR) Q <= 8'd0;
        else     Q <= D;
    end

endmodule
