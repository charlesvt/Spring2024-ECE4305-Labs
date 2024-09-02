`timescale 1ns / 1ps

module param_mux_2x1 #(parameter N = 3)(
    input logic [(2**N)-1:0] x0,
    input logic [(2**N)-1:0] x1,
    input logic sel,
    output logic [(2**N)-1:0] y
);
  
    assign y = sel? x1: x0;

endmodule