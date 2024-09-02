`timescale 1ns / 1ps

module single_blinker
(
    input logic clk, reset,
    input logic [15:0] max,
    output logic q
);

logic max_tick;

    mod_timer counter(.clk(clk),
        .reset(reset),
        .max_ms(max),
        .max_tick(max_tick)
    );
                
    t_ff_reset t_flip(.t(max_tick),
        .clk(clk),
        .reset(reset),
        .q(q)
    );
    
endmodule