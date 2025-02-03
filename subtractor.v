module subtractor(Zin, Cin, Cout, comp);
    // Inputs 
    input [4:0] Zin;
    input [4:0] Cin; 
    // Output
    output reg comp = 1'b0;
    output reg [4:0] Cout = 4'b0;
    // Logic circuits 
    always@(*) begin
        Cout = Cin - Zin;
        if(Cin >= Zin) begin 
            comp = 0;
        end
        if(Cin < Zin) begin
            comp = 1;
        end 
    end
endmodule 