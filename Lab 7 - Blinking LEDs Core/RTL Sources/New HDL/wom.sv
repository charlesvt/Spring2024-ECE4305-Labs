module wom
    #(parameter ADDR_WIDTH = 2, DATA_WIDTH = 16)
    (
        input logic clk,
        input logic we,
        input logic [ADDR_WIDTH - 1: 0] w_addr, // writing address
        input logic [DATA_WIDTH - 1: 0] w_data,
        output logic [DATA_WIDTH - 1: 0] r_data0,
        output logic [DATA_WIDTH - 1: 0] r_data1,
        output logic [DATA_WIDTH - 1: 0] r_data2,
        output logic [DATA_WIDTH - 1: 0] r_data3
    );
    
    // signal declaration
    logic [DATA_WIDTH - 1: 0] memory [0: 2 ** ADDR_WIDTH - 1];
    
    // write operation
    always_ff @(posedge clk)
    begin
        if (we)
            memory[w_addr] <= w_data;
    end
            
    // read operation
    assign r_data0 = memory[2'b00];
    assign r_data1 = memory[2'b01];
    assign r_data2 = memory[2'b10];
    assign r_data3 = memory[2'b11];
endmodule