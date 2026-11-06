`timescale 1ns/1ps

// 8-bit shift register. SIN enters bit 7; SOUT is bit 0.

module shift (CLK, SIN, SH, LD, PIN, SOUT, POUT);

    // Inputs
    input logic CLK;
    input logic SIN;
    input logic SH;
    input logic LD;
    input logic [7:0] PIN;

    // Outputs
    output logic SOUT;
    output logic [7:0] POUT;

    // State
    logic [7:0] Q = 8'd0;

    // Shift has priority over load
    always_ff @(posedge CLK) begin
        if (SH)      Q <= {SIN, Q[7:1]};
        else if (LD) Q <= PIN;
    end

    assign SOUT = Q[0];
    assign POUT = Q;

endmodule
