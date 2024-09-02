`timescale 1ns / 1ps

module bin2bcd_tb();

    logic [7:0] bin;
    logic [11:0] bcd;

    bin2bcd GEN_TB(
        .bin(bin),
        .bcd(bcd)
    );
    
    initial begin
        bin = 8'b0000_0000;
        #1 bin = 8'b0000_0001;
        #1 bin = 8'b0000_0010;
        #1 bin = 8'b0000_0100;
        #1 bin = 8'b0000_1000;
        #1 bin = 8'b0001_0000;
        #1 bin = 8'b0010_0000;
        #1 bin = 8'b0100_0000;
        #1 bin = 8'b1000_0000;
        #1 $finish;
    end

endmodule
