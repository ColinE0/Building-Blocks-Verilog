//mux2to1 from scratch 

module mux2to1scratch (A, B, C, Y);

//input
input A;
input B;

//control input
input C;

//output
output Y;

//implementation

assign Y = (A & ~C) | (B & C);

endmodule