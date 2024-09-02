`timescale 1ns / 1ps

module top
(
    input logic [3:0] m, n,
    input logic sys_clk, sys_rst,
    input logic ff_rst,
    output logic pulse
);

    logic max_tick;
    logic [3:0] mn;
    logic [7:0] mn_mplied;
    
    mux_2x1_4bit mn_sel(
        .x0(m),
        .x1(n),
        .select(pulse),
        .y(mn)
    );
              
    multiplier_4bit mult10(
        .mcand(mn),
        .mplier(10),
        .prod(mn_mplied)
    );
     
    mod_timer timer(
        .clk(sys_clk),
        .reset(sys_rst),
        .max(mn_mplied),
        .max_tick(max_tick));
                    
    t_ff_reset flip(
        .t(max_tick),
        .clk(sys_clk),
        .reset(ff_rst),
        .q(pulse)
    );
                
endmodule
