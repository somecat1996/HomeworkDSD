//File: mealy.v

`timescale 1 ns / 1 ns

module mealy(flag, clk, din, rst);
  output reg flag;
  input clk, din, rst;
  
  parameter IDLE = 8'b0000_0001, A = 8'b0000_0010, B = 8'b0000_0100,
               C = 8'b0000_1000, D = 8'b0001_0000, E = 8'b0010_0000,
               F = 8'b0100_0000, G = 8'b1000_0000;
  reg [7:0] state;
  
  always @ (posedge clk, posedge rst)
  begin
    if(rst)begin state <= IDLE; flag <= 1'b0; end
    else
      case(state)
        IDLE: if(din)begin state <= IDLE; flag <= 1'b0; end
              else begin state <= A; flag <= 1'b0; end
        A:    if(din)begin state <= B; flag <= 1'b0; end
              else begin state <= A; flag <= 1'b0; end
        B:    if(din)begin state <= IDLE; flag <= 1'b0; end
              else begin state <= C; flag <= 1'b0; end
        C:    if(din)begin state <= D; flag <= 1'b0; end
              else begin state <= A; flag <= 1'b0; end
        D:    if(din)begin state <= IDLE; flag <= 1'b0; end
              else begin state <= E; flag <= 1'b0; end
        E:    if(din)begin state <= F; flag <= 1'b0; end
              else begin state <= A; flag <= 1'b0; end
        F:    if(din)begin state <= IDLE; flag <= 1'b0; end
              else begin state <= G; flag <= 1'b0; end
        G:    if(din)begin state <= F; flag <= 1'b1;end
              else begin state <= A; flag <= 1'b0;end
        default:begin state <= IDLE; flag <= 1'b0; end
      endcase
  end
endmodule
