// alu_8bit.v
// Structural 8-bit add / subtract ALU built from an adder, a subtractor, and a mux.
// Select picks add vs subtract; C enables the output.

module alu_8bit (A, B, Select, C, Y);

    // Inputs
    input  [7:0] A;
    input  [7:0] B;
    input        Select;     // 0 = add result, 1 = subtract result
    input        C;          // output enable

    // Output
    output [7:0] Y;

    // Internal results
    wire [7:0] w0, w1, w2;

    // Submodules
    adder_8bit      U0 (.A(A), .B(B), .S(w0));
    subtractor_8bit B0 (.A(A), .B(B), .Diff(w1));
    mux2to1_8bit    C0 (.A(w0), .B(w1), .C(Select), .Y(w2));

    assign Y = C ? w2 : 8'd0;

endmodule
