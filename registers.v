module div(A, Load, SH, CLK, SU, Z);
    
    // Inputs 
    input [4:0] A;
    input Load; 
    input SH; 
    input CLK; 
    input SU; 
 
    // Outputs 
    output [4:0] Z;  
    
    // Registers
    reg [8:0] Q = 8'd135;
 
    // Assignments
    assign Z = Q[8:4]; 
    
    // Always statement
    always@(posedge CLK) begin 
        if (SH == 1 && Load == 0) begin
            Q = Q << 1;
        end   
        if (SH == 0 & Load == 1) begin
           Q[8:4] = A;
           Q[0] = SU; 
        end  
        if (SH == 1 && Load == 1) begin
            Q = Q << 1;
        end 
        if (SH == 0 && Load == 0) begin 
            Q = Q;
        end
    end
 
endmodule