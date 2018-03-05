//File: sram.v

`timescale 1 ns / 1 ns

module sram(dout, din, addr, wr, rd, cs);
  output [7:0] dout;
  input [7:0] din;
  input [7:0] addr;
  input wr, rd, cs;
  reg [7:0] mem [0:255];
  reg [7:0] data;
  
  assign dout = ( cs && !rd ) ? data : 8'bz;
  
  always @ (posedge wr)
  begin
    if(cs)
    mem[addr] <= din;
  end
  
  always @ (negedge rd)
  begin
    data <= mem[addr];
  end
endmodule
  
  
