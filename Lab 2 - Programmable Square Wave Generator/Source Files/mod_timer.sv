module mod_timer
    (
        input logic clk, reset,
        input logic [7:0] max,
        output logic max_tick
    );
    

    logic [7:0] r_next, r_reg;
    //logic [7:0] r_reg;
    
    // body
    // [1] Register segment
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

    //Above always block equivalent to 
    //assign r_next = (r_reg == max - 1)? 8'b0 : r_reg + 1'b0;
    //assign max_tick = (r_reg == max - 1)? 1'b1: 1'b0;
    
endmodule
