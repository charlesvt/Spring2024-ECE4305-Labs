`timescale 1ns / 1ps

module multi_barrel_shifter_mux #(parameter N = 3) (
    input logic [(2**N)-1:0] a,
    input logic [N-1:0] amt,
    input logic lr,
    output logic [(2**N)-1:0] y
);
    
    logic [(2**N)-1:0] yr;
    logic [(2**N)-1:0] yl;
    
    param_left_shifter #(.N(N)) left_shift(
        .a(a),
        .amt(amt),
        .y(yl)
    );
                        
    param_right_shifter #(.N(N)) right_shift(
        .a(a),
        .amt(amt),
        .y(yr)
    );

    param_mux_2x1 #(.N(N)) selector(
        .x0(yl),
        .x1(yr),
        .sel(lr),
        .y(y)
    );                

endmodule