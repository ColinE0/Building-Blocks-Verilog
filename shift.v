`include "controller.v"

module shift(CLK, SIN, SH, LD, PIN, SOUT, POUT);
    
    //Inputs
    input CLK, SIN, SH, LD;
    input [7:0] PIN;
    
    //Outputs
    output SOUT;
    output [7:0] POUT;
    //Wire
    reg [7:0] Q = 8'b0000;

    //Clock
    always@(posedge CLK) begin
        if(SH) begin
            Q[0] = Q[1];
            Q[1] = Q[2];
            Q[2] = Q[3];
            Q[3] = Q[4];
            Q[4] = Q[5];
            Q[5] = Q[6];
            Q[6] = Q[7];
            Q[7] = SIN;
        end else if (LD) begin
            Q = PIN;
        end
    end

    //Assignment
    assign SOUT = Q[0];
    assign POUT = Q;

endmodule