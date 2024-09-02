`timescale 1ns / 1ps

module rom_tb();
    logic clk;
    logic [7:0] addr;
    logic [7:0] data;

synch_rom_param
    #(.file("cel_to_far.mem"), .ADDR_WIDTH(8), .DATA_WIDTH(8)) GEN_TB(
    .clk(clk),
    .addr(addr),
    .data(data)
);
    
    initial begin
        clk = 0; 
        addr = 8'b0000_0000;
        #2 addr = 8'b0110_0100;
        #1 $finish;
    end
    
    always begin
        #0.5 clk = ~clk;
    end


endmodule
