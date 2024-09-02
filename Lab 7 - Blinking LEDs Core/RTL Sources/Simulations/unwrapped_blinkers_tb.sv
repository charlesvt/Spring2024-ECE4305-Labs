`timescale 1ns / 1ps

module unwrapped_blinkers_tb();
    localparam T = 2; // clk period
    logic clk, reset;
    logic write;
    logic [1:0] blinker_addr;
    logic [15:0] blinker_data;
    logic [3:0] led; 
    // instantiate dut
    unwrapped_blinkers DUT (.*);
    
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
        write = 1;
        blinker_addr = 0;
        blinker_data = 1;
        
        #(T);
        blinker_addr = 1;
        blinker_data = 1;
        
        #(T);
        blinker_addr = 2;
        blinker_data = 1;
        
        #(T);
        blinker_addr = 3;
        blinker_data = 1;
        #(T);
        write = 0;
        
    end
    
endmodule