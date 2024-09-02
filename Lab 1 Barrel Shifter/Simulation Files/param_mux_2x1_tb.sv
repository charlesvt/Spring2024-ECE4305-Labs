`timescale 1ns / 1ps

module param_mux_2x1_tb #(parameter N_tb = 3)();
    logic [(2**N_tb)-1:0] x0_tb;
    logic [(2**N_tb)-1:0] x1_tb;
    logic sel_tb;
    logic [(2**N_tb)-1:0] y_tb;
    
    param_mux_2x1 GEN_MUX(
        .x0(x0_tb),
        .x1(x1_tb),
        .sel(sel_tb),
        .y(y_tb)
    );
    
    initial begin
        x0_tb = 8'h0F; x1_tb = 8'hF0; sel_tb = 0;
        #10 sel_tb = 1;
        #10 $finish;
    end
    
endmodule
