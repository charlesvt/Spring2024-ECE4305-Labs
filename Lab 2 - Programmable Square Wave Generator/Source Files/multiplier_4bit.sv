`timescale 1ns / 1ps

module multiplier_4bit
(
    input logic [3:0] mcand, mplier,
    output logic [7:0] prod
);

assign prod = mcand*mplier;

endmodule
