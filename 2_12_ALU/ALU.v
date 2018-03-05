//File: ALU.v

`timescale 1 ns / 1 ns

module ALU(c_out, sum, oper, a, b, c_in);
  output reg c_out;
  output reg [7:0] sum;
  input [8*10:0] oper;
  input [7:0] a;
  input [7:0] b;
  input c_in;
  
  always @ (*)
  begin
    case(oper)
      "and":{c_out, sum} <= {1'b0, a} + {1'b0, b} + {8'b0, c_in};
      "abstract":{c_out, sum} <= {1'b0, a} + {1'b0, ~b} + {8'b0, c_in};
      "abstract_a":{c_out, sum} <= {1'b0, ~a} + {1'b0, b} + {1'b0, ~c_in};
      "or_ab":{c_out, sum} <= {1'b0, a|b};
      "and_ab":{c_out, sum} <= {1'b0, a&b};
      "not_ab":{c_out, sum} <= {1'b0, (~a)&b};
      "exor":{c_out, sum} <= {1'b0, a^b};
      "exnor":{c_out, sum} <= {1'b0, a~^b};
      default:{c_out, sum} <= 9'bx;
    endcase
  end
endmodule
