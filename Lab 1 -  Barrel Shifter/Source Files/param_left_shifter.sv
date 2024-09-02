`timescale 1ns / 1ps

module param_left_shifter #(parameter N = 3) (
    input logic [(2**N)-1:0] a,
    input logic [N-1:0] amt,
    output logic [(2**N)-1:0] y
);

    logic [(2**N)-1:0] temp;
    
    always_comb
    begin
        temp = a;
        for(int i = 0; i < N; i++) begin
            if(amt[i] == 1)
                for(int j = (2**i); j > 0; j--)
                    temp = {temp[(2**N)-2:0],temp[(2**N)-1]};
        end
    end
       
   assign y = temp;
        
endmodule