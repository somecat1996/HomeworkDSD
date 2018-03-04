//File: testbench_comb.v

`timescale 1 ns / 1 ns

`include "comb_str.v"
`include "comb_dataflow.v"
`include "comb_behavior.v"
`include "comb_prim.v"

module tesstbentch_comb;
  wire [3:0] OUT;
  reg [3:0] IN;
  
  comb_str comb0(OUT[0], IN[3], IN[2], IN[1], IN[0]);
  comb_dataflow comb1(OUT[1], IN[3], IN[2], IN[1], IN[0]);
  comb_behavior comb2(OUT[2], IN[3], IN[2], IN[1], IN[0]);
  comb_prim comb3(OUT[3], IN[3], IN[2], IN[1], IN[0]);
  
  initial
  begin
    IN = 4'b0;
    forever #10 IN = IN + 4'b1;
  end
  
  initial
  begin
    $monitor("A=%b, B=%b, C=%b, D=%b, Y_str=%b, Y_dataflow=%b, Y_behavior=%b, Y_prim=%b", 
              IN[3], IN[2], IN[1], IN[0], 
              OUT[0], OUT[1], OUT[2], OUT[3]);
  end
endmodule
