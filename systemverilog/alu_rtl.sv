`timescale 1ns/1ps

// 8-bit add / subtract unit. E enables the output, S selects subtract.

module alu_rtl (A, B, S, E, W);

    // Data inputs
    input logic [7:0] A, B;

    // Control inputs
    input logic S;          // 0 = add, 1 = subtract
    input logic E;          // 0 = output forced to 0

    // Output
    output logic [7:0] W;

    always_comb begin
        if (!E)      W = 8'd0;
        else if (!S) W = A + B;
        else         W = A - B;
    end

endmodule
