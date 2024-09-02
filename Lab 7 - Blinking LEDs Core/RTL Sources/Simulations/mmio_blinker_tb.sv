`timescale 1ns / 1ps

module mmio_blinker_tb #(parameter LED = 4)();
    localparam T = 2; // clk period
    logic clk;
    logic reset;
    logic cs;
    logic read;
    logic write;
    logic [4:0] addr;
    logic [31:0] wr_data;
    logic [31:0] rd_data;
    logic [LED - 1:0] led;

    // instantiate dut
    mmio_blinker UUT (.*);
    
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
        cs = 1;
        read = 0;
        write = 1;
        
        addr = 4'd0;
        wr_data = 32'b1;
        
        #(T);
        addr = 4'd1;
        wr_data = 32'b1;
        
        #(T);
        addr = 4'd2;
        wr_data = 32'b1;
        
        #(T);
        addr = 4'd3;
        wr_data = 32'b1;

        #(T);
        write = 0;
        
    end

endmodule