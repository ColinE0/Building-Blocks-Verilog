`include "alu_rtl.v"

module top(CLK, CLR, Q, B, E, S);

//Inputs
input CLK;
input CLR;
input E, S;


//Data Inputs
input [7:0] B;
wire [7:0] D;

//Outputs
output reg [7:0] Q = 0;
wire [7:0] W;

alu_rtl U0 (.A(Q), .B(B), .S(S), .E(E), .W(D));

always @(negedge CLK) begin
  if (CLR == 1)
  Q = 0;
  else
  Q <= D;
end

endmodule