//File: tb_comb_y2.v

`timescale 1 ns / 1 ns

`include "comb_y2.v"

module tb_comb_Y2;
  wire y;
  reg [3:0] in;
  
  comb_Y2 comb(.Y(y), .A(in[3]), .B(in[2]), .C(in[1]), .D(in[0]));
  
  initial
  begin
    in = 4'b0;
    forever #10 in = in + 4'b1;
  end
  
  initial
  begin
    $monitor("A=%b, B=%b, C=%b, D=%b, Y=%b", in[3], in[2], in[1], in[0], y);
  end
endmodule
