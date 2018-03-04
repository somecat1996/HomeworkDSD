//File: comb_str.v

`timescale 1 ns / 1 ns

module comb_str(Y, A, B, C, D);
  output wire Y;
  input wire A, B, C, D;
  wire t1, t2, t3, t4;
  
  not U1(t1, D),
      U2(t2, t3);
  or  U3(t3, A, D);
  and U4(t4, t1, B, C),
      U5(Y, t2, t4);
endmodule

