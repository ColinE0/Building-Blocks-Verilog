`include "full_adder.v"

module adder_8bit (A, B, S);

//Inputs
input [7:0] A, B;

//Outputs
output [7:0] S;

//Wire
wire [6:0] carry;

//Assignments
full_adder U0(.A(A[0]), .B(B[0]), .Cin(1'b0),     .Cout(carry[0]), .Sum(S[0]));
full_adder U1(.A(A[1]), .B(B[1]), .Cin(carry[0]), .Cout(carry[1]), .Sum(S[1]));
full_adder U2(.A(A[2]), .B(B[2]), .Cin(carry[1]), .Cout(carry[2]), .Sum(S[2]));
full_adder U3(.A(A[3]), .B(B[3]), .Cin(carry[2]), .Cout(carry[3]), .Sum(S[3]));
full_adder U4(.A(A[4]), .B(B[4]), .Cin(carry[3]), .Cout(carry[4]), .Sum(S[4]));
full_adder U5(.A(A[5]), .B(B[5]), .Cin(carry[4]), .Cout(carry[5]), .Sum(S[5]));
full_adder U6(.A(A[6]), .B(B[6]), .Cin(carry[5]), .Cout(carry[6]), .Sum(S[6]));
full_adder U7(.A(A[7]), .B(B[7]), .Cin(carry[6]), .Cout(        ), .Sum(S[7]));

endmodule