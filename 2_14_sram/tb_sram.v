//File: tb_sram.v

`timescale 1 ns / 1 ns

`include "sram.v"

module tb_sram;
  reg cs, wr, rd;
  reg [7:0] din;
  reg [7:0] addr;
  wire [7:0] dout;
  
  sram s1(.din(din), .dout(dout), .cs(cs), .wr(wr), .rd(rd), .addr(addr));
  
  initial
  begin
    cs = 1'b0;
    #25 cs = 1'b1;
    #40 cs = 1'b0;
    #20 cs = 1'b1;
  end
  
  initial
  begin
    din = 8'b1010_0010;
    addr = 8'b1010_0101;
    #85 addr = 8'b0101_1010;
  end
  
  initial
  begin
    wr = 1'b0;
    rd = 1'b1;
    #10 wr = 1'b1;
    #10 wr = 1'b0;
    #10 wr = 1'b1;
    #10 wr = 1'b0;
    #10 rd = 1'b0;
    #10 rd = 1'b1;
    #10 rd = 1'b0;
    #10 rd = 1'b1;
    #10 wr = 1'b1;
    #10 wr = 1'b0;
    #10 rd = 1'b0;
    #10 rd = 1'b1;
  end
  
  initial
  begin
    $monitor("At time %4t, cs = %b, wr = %b, rd = %b, addr = %d, din = %b, dout = %b", $time, cs, wr, rd, addr, din, dout);
  end
endmodule
    
    
