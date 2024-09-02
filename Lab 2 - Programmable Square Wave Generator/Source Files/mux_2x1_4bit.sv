`timescale 1ns / 1ps

module mux_2x1_4bit
(
    input logic [3:0] x0, x1,
    input logic select,
    output logic [3:0] y
);

assign y = (select == 1)? x0: x1;

endmodule
