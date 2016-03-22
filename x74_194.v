`timescale 1ns / 1ps

module x74_194(SLI , D , C , B , A , S0 , S1 , CLK , CLR , out);

input SLI,A,B,C,D,S0,S1,CLK,CLR;
output reg out;
reg[3:0] Q;

always @(posedge CLK)
	begin
		if(CLR == 1'b0)
			begin
				Q = 4'b0000;
			end
		else if (S0 == 1'b1 && S1 == 1'b1)							//Daca ambii sunt 1 se face load si daca ambii sunt 0 nu se intampla nimic
			begin
				Q = {A,B,C,D};
			end
		else if (S0 == 1'b0 && S1 == 1'b1)							//Siftare la dreapta si pe prima pozitie punem SLI
			begin
				Q = Q << 1'b1;
				Q[0] = SLI;
			end
		else if (S0 == 1'b1 && S1 == 1'b0) 							//siftare la stanga si pe ultima pozitie punem SLI
			begin 
				Q = Q >> 1'b1;
				Q[3] = SLI;
			end
		out = Q[3];
	end

endmodule
