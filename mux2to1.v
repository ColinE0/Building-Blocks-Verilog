module mux2to1 (A, B, C, Y);

// DATA INPUTS
input A;
input B;

//CONTROL INPUTS
input C;

//OUTPUTS
output Y;

// LOGIC CIRCUIT
assign Y = (A & ~C) | (B & C);

endmodule