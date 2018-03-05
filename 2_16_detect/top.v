//File: top.v

`timescale 1 ns / 1 ns

`include "mealy.v"
`include "moore.v"

module top;
  wire mealy_f, moore_f;
  reg clk, rst, din;
  reg [31:0] data = 32'b0110_1010_1010_0011_0110_0001_0101_0101;
  integer i;
  
  mealy m1(.flag(mealy_f), .clk(clk), .rst(rst), .din(din));
  moore m2(.flag(moore_f), .clk(clk), .rst(rst), .din(din));
  
  initial
  begin
    rst = 1'b1;
    #25 rst = 1'b0;
  end
  
  initial
  begin
    clk = 0;
    forever #10 clk = ~clk;
  end
  
  initial
  begin
    din = 0;
    #30;
    for ( i = 0; i < 32; i = i+1)
    begin
      din = data[0];
      data = data >> 1;
      #20;
    end
  end
endmodule
