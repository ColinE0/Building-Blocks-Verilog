module orgate (A, B, F);

//inputs
input A;
input B;

//output
output F;

//gate
assign F = A | B;

endmodule