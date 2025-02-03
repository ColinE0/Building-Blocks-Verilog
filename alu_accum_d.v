`include "alu_rtl.v"

module alu_accum (A, S, CLK, W);
    // INPUTS
    input [7:0] A;
    input S, CLK;
    // OUTPUTS
    output [7:0] W;
    reg [7:0]tmp = 8'b00000000;
    // RTL IMPLEMENTATION
always @(negedge CLK)
begin 
      if (S) 
        tmp = 8'b00000000;
      else 
        tmp [7:0] = (tmp[7:0] + A[7:0]); 
    end 
  assign W[7:0] = tmp[7:0]; 
endmodule