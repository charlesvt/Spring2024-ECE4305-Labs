`timescale 1ns / 1ps

module reverser #(parameter N = 3)(
    input logic [(2**N)-1:0] a,
    input logic en,
    output logic [(2**N)-1:0] y
);
    
    logic [(2**N)-1:0] temp = 0;
    
    always_comb 
    begin
        for(int i = 0; i < 2**N; i++)
        begin
            temp[(2**N)-1-i] = a[i];
        end
    end
    
    assign y = en? temp: a;
    
endmodule