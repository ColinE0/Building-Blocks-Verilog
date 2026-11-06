`timescale 1ns/1ps

module subtractor (Zin, Cin, Cout, comp);

    // Inputs
    input logic [4:0] Zin;
    input logic [4:0] Cin;

    // Outputs
    output logic comp = 1'b0;
    output logic [4:0] Cout = 5'd0;

    always_comb begin
        Cout = Cin - Zin;
        if (Cin >= Zin) comp = 1'b0;
        if (Cin < Zin)  comp = 1'b1;
    end

endmodule
