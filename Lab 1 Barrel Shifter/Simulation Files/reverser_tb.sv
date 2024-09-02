`timescale 1ns / 1ps

module reverser_tb #(parameter N_tb = 3)();
    logic [(2**N_tb)-1:0] a_tb;
    logic en_tb;
    logic [(2**N_tb)-1:0] y_tb;
    
    reverser #(.N(N_tb))GEN_REVERSER(
        .a(a_tb),
        .en(en_tb),
        .y(y_tb)
    );
    
    initial begin
        a_tb = 8'b1100_0110; en_tb = 0;
        #10 en_tb = 1;
        #10 $finish;
    end

endmodule
