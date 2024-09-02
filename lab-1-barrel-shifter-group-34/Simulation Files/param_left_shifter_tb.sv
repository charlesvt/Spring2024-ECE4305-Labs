`timescale 1ns / 1ps

module param_left_shifter_tb #(parameter N_tb = 3)();
    
    logic [(2**N_tb)-1:0] a_tb;
    logic [N_tb-1:0] amt_tb;
    logic [(2**N_tb)-1:0] y_tb;

    param_left_shifter #(.N(N_tb)) GEN_LSHIFTER_TB
    (
        .a(a_tb),
        .amt(amt_tb),
        .y(y_tb)
    );
    
    integer i;
    
    initial begin
        a_tb = 8'b1100_0110;
        amt_tb = 3'h0;
        for(i=1; i<(2**N_tb); i=i+1) begin
            #10 amt_tb = amt_tb + 1'b1;
        end
        
        #10 $finish;
    end
    
endmodule
