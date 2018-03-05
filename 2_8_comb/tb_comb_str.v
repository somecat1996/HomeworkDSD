//File: tb_comb_str.v

`timescale 1 ns / 1 ns

`include "comb_str_.v"

module tb_comb_str;
  wire y;
  reg sel, A, B, C, D;
  
  comb_str comb1(.y(y), .sel(sel), .A(A), .B(B), .C(C), .D(D));
  
  initial
  begin
    {A, B, C, D} = 4'b0;
    forever #5 {A, B, C, D} = {A, B, C, D} + 4'b1;
  end
  
  initial
  begin
    sel = 1'b0;
    forever #80 sel = ~sel;
  end
  
  initial
  begin
    $monitor("time=%tns, A=%b, B=%b, C=%b, D=%b, sel=%b, y=%b",
          $time, A, B, C, D, sel, y);
  end
endmodule
