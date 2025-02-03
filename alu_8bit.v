`include "subtractor_8bit.v"
`include "mux2to1_8bit.v"

module alu_8bit(A, B, Select, C, Y);

    //Inputs
    input [7:0] A;
    input [7:0] B;
    input Select;
    input C;

    //Outputs
    output [7:0] Y;
    wire   [7:0] w0, w1, w2;

    //Modules
    adder_8bit U0 (.A(A), .B(B), .S(w0));
    subtractor_8bit B0 (.A(A), .B(B), .Diff(w1));
    mux2to1_8bit C0 (.A(w0), .B (w1), .C(Select), .Y(w2));

    //Assignments
    assign W = C ? w2:0;

endmodule