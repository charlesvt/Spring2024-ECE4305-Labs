`timescale 1ns / 1ps

module multi_barrel_shifter_reverser #(parameter N = 3)(
    input logic [(2**N)-1:0] a,
    input logic [N-1:0] amt,
    input logic lr,
    output logic [(2**N)-1:0] y
);
    
    logic [(2**N)-1:0] preRev;
    logic [(2**N)-1:0] shifted;
    
    reverser #(.N(N)) preReverse(
        .a(a),
        .en(~lr),
        .y(preRev)
    );
                        
    param_right_shifter #(.N(N)) right_shift(
        .a(preRev),
        .amt(amt),
        .y(shifted)
    );
                        
    reverser #(.N(N)) postReverse(
        .a(shifted),
        .en(~lr),
        .y(y)
    );

endmodule