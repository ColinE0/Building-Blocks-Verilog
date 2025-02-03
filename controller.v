module control(START, comp, clock, DONE, SHIFT, LOAD);
 
    // inputs 
    input START;
    input comp;
    input clock;
 
    // registers
    reg [3:0] count = 4;
    reg [3:0] STATE = 8'd0;
    output reg SHIFT = 8'd0;
    output reg LOAD = 8'd0;
    output reg DONE= 8'd0;
 
    // parameters
    parameter S0 = 8'd0;
    parameter S1 = 8'd1;
    parameter S2 = 8'd2;
    parameter S3 = 8'd3;
    parameter S4 = 8'd4;
    
    //Positive edge clock
    always @(posedge clock)       
    begin
        casex({STATE, START, count, comp})
            {S0, 1'd1, 4'dX, 1'dX}: 
            begin 
                STATE = S1;
                SHIFT = 1;
                LOAD  = 0;
                DONE  = 0;
            end

            {S1, 1'dX, 4'dx, 1'dx}: 
            begin 
                count = count - 1;
                if (comp == 0) 
                begin
                    STATE = S2;
                    SHIFT = 0;
                    LOAD = 1;
                    DONE = 0;
                end 
                else 
                begin
                    STATE = S3;
                    SHIFT = 0;
                    LOAD = 0;
                    DONE = 0;
                end
            end 
                    
            {S2, 1'dX, 4'dx, 1'd0}: 
            begin
                if (count == 0) 
                begin 
                    STATE = S4;
                    SHIFT = 0;
                    LOAD = 0;
                    DONE = 1;
                end 
                else 
                begin
                    STATE = S1;
                    SHIFT = 1;
                    LOAD = 0;
                    DONE =0;                            
                end
            end

            {S3, 1'dX, 4'dx, 1'd1}: 
            begin
                SHIFT = 0;
                LOAD = 0;
                DONE = 0;

                if (count == 0) 
                begin 
                    STATE = S4;
                    SHIFT = 0;
                    LOAD = 0;
                    DONE = 1;
                end 
                else 
                begin
                    STATE = S1;
                    SHIFT = 1;
                    LOAD = 0;
                    DONE = 0;
                end
            end

            {S4, 1'dX, 4'd0, 1'dX}: 
            begin 
                SHIFT = 0; 
                LOAD =0;
                DONE = 1;
            end
            default : {STATE, SHIFT, LOAD, DONE} = {S0, 1'dX, 1'dX, 1'dX};             
        endcase
    end  
endmodule 