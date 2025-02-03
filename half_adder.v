module half_adder (A, B, C, Sum);

//inputs
input A;
input B;

//outputs
output C;
output Sum;

//assignments
assign C = A&B;
assign Sum = A^B;

endmodule