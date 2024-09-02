`timescale 1ns / 1ps

module single_blinker_tb();
    localparam T = 2; // clk period
    logic clk, reset;
    logic [15:0] max;
    logic q;
    
    // instantiate dut
    single_blinker DUT (.*);
    
    // test vectors
    
    always
    begin
        clk = 1'b0;     // clk initially set to 0
        #( T / 2 );     // after T/2 ns (5ns)
        clk = 1'b1;     // clk set to 1
        #( T / 2 );     // another T/2 ns before looping
    end
    
    // initial reset
    initial
    begin
        reset = 1'b1;
        @(negedge clk)
            reset = 1'b0;
    end
    
    initial
    begin
        max = 16'd1;
    end
    
endmodule