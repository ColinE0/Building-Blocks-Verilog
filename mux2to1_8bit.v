`include "mux2to1.v"

module mux2to1_8bit (A, B, C, Y);

// Data inputs
input [7:0] A; 
input [7:0] B;


// Control input
input C;

// Outputs
output [7:0] Y;

//Generator
genvar i;
generate
    for (i = 7; i >= 0; i = i - 1) 
    begin
        mux2to1 U0 (A[i], B[i], C, Y[i]);
    end
endgenerate

endmodule