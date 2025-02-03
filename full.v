`include "half_adder.v"
module top(A, B, Cin, S, Cout);

//inputs
input A;
input B;
input Cin;

//outputs
output S;
output Cout;

//assignments
assign S = A^B^Cin;
assign Cout = ;

endmodule