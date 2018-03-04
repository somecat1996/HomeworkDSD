//Flie: comb_behavior.v

`timescale 1 ns / 1 ns

module comb_behavior(Y, A, B, C, D);
  output reg Y;
  input A, B, C, D;
  
  always @ (*)
  begin
    Y <= (~(A|D))&(B&C&(~D));
  end
endmodule
