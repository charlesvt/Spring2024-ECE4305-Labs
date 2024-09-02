module mod_timer
    (
        input logic clk, reset,
        input logic [15:0] max_ms,
        output logic max_tick
    );
    

    logic [32:0] r_next, r_reg;
    logic [32:0] max;
    
    assign max = max_ms * 100_000;
    
    always_ff @(posedge clk, posedge reset)
    begin
        if(reset)
            r_reg <= 0;
        else
            r_reg <= r_next;
    end
    
    always_comb
    begin
        if (r_reg == max - 1)
            begin
                max_tick = 1'b1;
                r_next = 0;
            end
        else
            begin
                max_tick = 1'b0;
                r_next = r_reg+1;
            end
    end

    
endmodule