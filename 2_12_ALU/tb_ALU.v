//File: tb_ALU.v

`timescale 1 ns / 1 ns

`include "ALU.v"

module tb_ALU;
  reg [7:0] a;
  reg [7:0] b;
  reg [8*10:0] oper;
  reg c_in;
  wire c_out;
  wire [7:0] sum;
  
  ALU a1(.c_out(c_out), .sum(sum), .oper(oper), .a(a), .b(b), .c_in(c_in));
  
  initial
  begin
    forever
    begin
      oper = "and";
      #10 oper = "abstract";
      #10 oper = "abstract_a";
      #10 oper = "or_ab";
      #10 oper = "and_ab";
      #10 oper = "not_ab";
      #10 oper = "exor";
      #10 oper = "exnor";
      #10;
    end
  end
  
  initial
  begin
    a = 8'b1111_0000;
    b = 8'b0000_1111;
    c_in = 1'b0;
    #80;
    a = 8'b11_1001;
    b = 8'b1001_0011;
    c_in = 1'b1;
  end
  
  initial
  begin
    $monitor("a=%b, b=%b, c_in=%b, oper=%s, c_out=%b, sum=%b", a, b, c_in, oper, c_out, sum);
  end
endmodule
