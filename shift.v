// shift.v
// 8-bit shift register with parallel load. Shifts toward bit 0 (SOUT);
// SIN enters at bit 7.

module shift (CLK, SIN, SH, LD, PIN, SOUT, POUT);

    // Inputs
    input        CLK;
    input        SIN;        // serial in (enters at the MSB)
    input        SH;         // shift enable
    input        LD;         // parallel load enable
    input  [7:0] PIN;        // parallel data in

    // Outputs
    output       SOUT;       // serial out (LSB)
    output [7:0] POUT;

    // State
    reg [7:0] Q = 8'd0;

    // Shift has priority over load
    always @(posedge CLK) begin
        if (SH)      Q <= {SIN, Q[7:1]};
        else if (LD) Q <= PIN;
    end

    assign SOUT = Q[0];
    assign POUT = Q;

endmodule
