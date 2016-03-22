`timescale 1ns / 1ps
module Flip_Flop_FDCE(CLK,CE,ReSet,Q);

input CLK,CE,ReSet;
output reg Q;

always@(posedge CLK)
	begin
		if(ReSet == 1'b1)
			Q = 1'b0;
		else if(CE == 1'b1)
			Q = 1'b1;
	end
endmodule
