`include "half_adder.v"
module full_adder(A, B, Cin, Cout, Sum);


//inputs
input A;
input B;
input Cin;

//outputs
output Sum;
output Cout;

//wires
wire w0;
wire w1;
wire w2;


//half adders
half_adder U0(.A(A), .B(B), .Sum(w0), .C(w1));
half_adder U1(.A(w0), .B(Cin), .Sum(Sum), .C(w2));

//assignments
assign Cout = w1 ^ w2;

endmodule