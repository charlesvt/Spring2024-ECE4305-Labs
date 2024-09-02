`timescale 1ns / 1ps

module temp_converter_tb();
    logic clk;
    logic [7:0] din;
    logic format;
    logic [7:0] dout;

    temp_converter GEN_TB(
        .clk(clk),
        .din(din),
        .format(format),
        .dout(dout)
    );
    
    always begin
        #0.5 clk = ~clk;
    end

    initial begin
        clk = 0; format = 0;
        din = 8'b0000_0000;
        #1 din = 8'b0110_0100;
        #1 format = 1; din = 8'b0010_0000;
        #1 din = 8'b1101_0100;
        #1 $finish;
    end
    
endmodule
