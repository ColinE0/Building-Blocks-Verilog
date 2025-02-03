`include "adder_8bit.v"

module subtractor_8bit(A, B, Diff);

//Input
input [7:0] A, B;

//Output
output [7:0] Diff;

//Wire
wire [6:0] carry;

//Assignments

    full_adder U7(.A(A[7]), .B(~B[7]), .Cin(carry[6]), .Cout(        ), .Sum(Diff[7]));
    full_adder U6(.A(A[6]), .B(~B[6]), .Cin(carry[5]), .Cout(carry[6]), .Sum(Diff[6]));
    full_adder U5(.A(A[5]), .B(~B[5]), .Cin(carry[4]), .Cout(carry[5]), .Sum(Diff[5]));
    full_adder U4(.A(A[4]), .B(~B[4]), .Cin(carry[3]), .Cout(carry[4]), .Sum(Diff[4]));
    full_adder U3(.A(A[3]), .B(~B[3]), .Cin(carry[2]), .Cout(carry[3]), .Sum(Diff[3]));
    full_adder U2(.A(A[2]), .B(~B[2]), .Cin(carry[1]), .Cout(carry[2]), .Sum(Diff[2]));
    full_adder U1(.A(A[1]), .B(~B[1]), .Cin(carry[0]), .Cout(carry[1]), .Sum(Diff[1]));
    full_adder U0(.A(A[0]), .B(~B[0]), .Cin(1'b1),     .Cout(carry[0]), .Sum(Diff[0]));

endmodule