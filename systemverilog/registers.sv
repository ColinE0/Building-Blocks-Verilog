`timescale 1ns/1ps

module div (A, Load, SH, CLK, SU, Z);

    // Inputs
    input logic [4:0] A;
    input logic Load;
    input logic SH;
    input logic CLK;
    input logic SU;

    // Output
    output wire [4:0] Z;

    // Register, powers up at 135
    logic [8:0] Q = 9'd135;

    assign Z = Q[8:4];

    // Shift has priority over load
    always_ff @(posedge CLK) begin
        if (SH == 1'b1 && Load == 1'b0) begin
            Q <= Q << 1;
        end
        if (SH == 1'b0 && Load == 1'b1) begin
            Q[8:4] <= A;
            Q[0] <= SU;
        end
        if (SH == 1'b1 && Load == 1'b1) begin
            Q <= Q << 1;
        end
    end

endmodule
