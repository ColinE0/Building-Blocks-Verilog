`timescale 1ns/1ps

module comparator (A, B, A_less_B, A_equal_B, A_greater_B);

    // Inputs
    input logic [1:0] A, B;

    // Outputs
    output logic A_less_B, A_equal_B, A_greater_B;

    // Internal signals
    logic tmp1, tmp2, tmp3, tmp4, tmp5, tmp6, tmp7, CDiff;

    // A = B
    xnor u1 (tmp1, A[1], B[1]);
    xnor u2 (tmp2, A[0], B[0]);
    and u3 (A_equal_B, tmp1, tmp2);

    // A < B
    assign tmp3 = (~A[0]) & (~A[1]) & B[0];
    assign tmp4 = (~A[1]) & B[1];
    assign tmp5 = (~A[0]) & B[1] & B[0];
    assign A_less_B = tmp3 | tmp4 | tmp5;

    // A > B
    assign tmp6 = (~B[0]) & (~B[1]) & A[0];
    assign tmp7 = (~B[1]) & A[1];
    assign CDiff = (~B[0]) & A[1] & A[0];
    assign A_greater_B = tmp6 | tmp7 | CDiff;

endmodule
