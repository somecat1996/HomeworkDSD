//File: tb_comb_y1.v

`timescale 1 ns / 1 ns

`include "comb_y1.v"

module tb_comb_Y1;
  wire y;
  reg [2:0] in;
  
  comb_Y1 comb(.Y(y), .A(in[2]), .B(in[1]), .C(in[0]));
  
  initial
  begin
    in = 3'b0;
    forever #10 in = in + 3'b1;
  end
  
  initial
  begin
    $monitor("A=%b, B=%b, C=%b, Y=%b", in[2], in[1], in[0], y);
  end
endmodule
