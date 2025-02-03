module top(A, B, Cin, S, Cout);

//inputs
input A;
input B;
input C;
input Cin;

//outputs
output S;
output Cout;

//assignments
assign S = A^B^A^B;
assign C = A&B&A&Cin;
assign Cout = C^Cin;

endmodule