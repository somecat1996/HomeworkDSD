//File: tb_seq_detect.v

`timescale 1 ns / 1 ns

`include "seq_detect.v"

module seq_recognize_tb;
  wire p_flag;
  reg p_clk, p_rst_n, p_din;
  reg [31 : 0] data = 32'b0110_1110_1100_0100_1010_1011_0011_0110;
  integer i;
  
  initial
  begin
    p_rst_n = 1'b0;
    #25 p_rst_n = 1'b1;
  end
  
  initial
  begin
    p_clk = 0;
    forever #10 p_clk = ~p_clk;
  end
  
  initial
  begin
    p_din = 0;
    #35;
    for ( i = 0; i < 32; i = i+1)
    begin
      p_din = data[31];
      data = data << 1;
      #20;
    end
  end
  
  seq_detect u( .flag(p_flag), .clk(p_clk), .rst_n(p_rst_n), .din(p_din) );
endmodule
