module unwrapped_blinkers
   (
    input logic clk, reset, 
    input logic write,
    input logic [1:0] blinker_addr,
    input logic [15:0] blinker_data,
    output logic [3:0] led
   );
   
   logic [15:0] max0, max1, max2, max3;
   
    wom #(.ADDR_WIDTH(2), .DATA_WIDTH(16)) agony(
        .clk(clk),
        .we(write),
        .w_addr(blinker_addr),
        .w_data(blinker_data),
        .r_data0(max0),
        .r_data1(max1),
        .r_data2(max2),
        .r_data3(max3)
    );

    single_blinker blinker0(
        .clk(clk),
        .reset(reset),
        .max(max0),
        .q(led[0])
    );
    
    single_blinker blinker1(
        .clk(clk),
        .reset(reset),
        .max(max1),
        .q(led[1])
    );
     
    single_blinker blinker2(
        .clk(clk),
        .reset(reset),
        .max(max2),
        .q(led[2])
    );
                            
    single_blinker blinker3(
        .clk(clk),
        .reset(reset),
        .max(max3),
        .q(led[3])
    );
        
endmodule
       