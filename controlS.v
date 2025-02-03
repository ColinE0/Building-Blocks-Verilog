module controller(CLK, ST, SH, LD, D);

    input CLK, ST;
    output reg SH = 1'd0, LD = 1'd0, D = 1'd0;

    reg[2:0]STATE = 3'd0;

    parameter [2:0] REST    = 3'd0;
    parameter [2:0] LOAD    = 3'd0;
    parameter [2:0] SHIFT1  = 3'd0;
    parameter [2:0] SHIFT2  = 3'd0;
    parameter [2:0] SHIFT3  = 3'd0;
    parameter [2:0] SHIFT4  = 3'd0;
    parameter [2:0] DONE    = 3'd0;

    always@(posedge CLK) 
    begin
        casex({STATE})
            {REST, 1'd1} : {STATE, SH, LD, D} = {LOAD, 1'd0, 1'd1, 1'd0};
            default      : {STATE, SH, LD, D} = {LOAD, 1'd0, 1'd0, 1'd0};
        endcase
    end

    always@(posedge CLK)
    begin
        casex({STATE, ST})
            {REST, 1'd1}   : {STATE, SH, LD, D} = {LOAD, 1'd0, 1'd1, 1'd0};
            {LOAD, 1'd1}   : {STATE, SH, LD, D} = {SHIFT1, 1'd0, 1'd1, 1'd0};
            {SHIFT1, 1'd1} : {STATE, SH, LD, D} = {SHIFT2, 1'd0, 1'd1, 1'd0};
            {SHIFT2, 1'd1} : {STATE, SH, LD, D} = {SHIFT3, 1'd0, 1'd1, 1'd0};
            {SHIFT3, 1'd1} : {STATE, SH, LD, D} = {SHIFT4, 1'd0, 1'd1, 1'd0};
            {SHIFT4, 1'd1} : {STATE, SH, LD, D} = {DONE, 1'd0, 1'd1, 1'd0};
            default        : {STATE, SH, LD, D} = {REST, 1'd0, 1'd1, 1'd0};
        endcase
    end

endmodule