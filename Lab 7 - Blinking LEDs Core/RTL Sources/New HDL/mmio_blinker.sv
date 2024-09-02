`timescale 1ns / 1ps

module mmio_blinker #(parameter LED = 4)(
    input  logic clk,
    input  logic reset,
    // slot interface
    input  logic cs,
    input  logic read,
    input  logic write,
    input  logic [4:0] addr,
    input  logic [31:0] wr_data,
    output logic [31:0] rd_data,
    output logic [LED - 1:0] led
   );
   
   // signal declaration
   logic valid_addr;
   assign valid_addr = (addr[1:0]==2'b00) || (addr[1:0]==2'b01) || (addr[1:0]==2'b10) || (addr[1:0]==2'b11);
   
   //Instantiate Blinkers
   unwrapped_blinkers blinkers(
       .clk(clk),
       .reset(reset), 
       .write(wr_en),
       .blinker_addr(addr[1:0]),
       .blinker_data(wr_data[15:0]),
       .led(led)
   );
            
   // decoding logic
   assign wr_en = write && cs && valid_addr;
   
   // slot read interface
   assign rd_data = 0;
   
endmodule
