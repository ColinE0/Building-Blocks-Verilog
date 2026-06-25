// alu_rtl.v
// 8-bit add / subtract unit. E enables the output, S selects subtract.

module alu_rtl (A, B, S, E, W);

    // Inputs
    input  [7:0] A;
    input  [7:0] B;

    // Control inputs
    input        S;          // 0 = add, 1 = subtract
    input        E;          // 0 = output forced to 0

    // Data output
    output reg [7:0] W;

    // Operation
    always @(*) begin
        if (!E)      W = 8'd0;
        else if (!S) W = A + B;
        else         W = A - B;
    end

endmodule
