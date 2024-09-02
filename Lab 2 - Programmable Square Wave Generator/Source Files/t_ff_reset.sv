module t_ff_reset(
    input logic t, clk, reset,
    output logic q
    );
    
    //always_ff @(posedge clk) // synchronous reset
    always_ff @(posedge clk, posedge reset) // asynchronous reset
    begin
        if (reset)
            q <= 0;
        else 
            if (t)
                q <= ~q;
            else
                q <= q;
    end
endmodule
