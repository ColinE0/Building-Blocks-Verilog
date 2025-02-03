`include "controller.v"
`include "registers.v"
`include "subtractor.v"
 
module top(STATE, CLK,  Y1, Y2, Done);
    // Inputs
    input [4:0] Y1, Y2;
    input STATE; 
    input CLK;
 
    // Outputs
    output Done;
 
    // Registers
    reg SHIFT;
    reg LOAD; 

    // Wires
    wire [4:0] w1, w2, Xin, Xout; 
    wire C; 
    wire SH; 
    wire LD;
    
    // Assignments
    assign SH = SHIFT;
    assign LD = LOAD;
 
    
    div dividend (.A(Xout), .Load(LD), .SH(SH), .CLK(TIK), .SU(LD), .Z(w2));
    
    subtractor sub0 (.Zin(Y1), .Cin(w1), .Cout(w2), .comp(C));
    
    control control0 (.START(STATE), .comp(C), .clock(CLK), .DONE(Done), .SHIFT(SH), .LOAD(LD));
 
endmodule 