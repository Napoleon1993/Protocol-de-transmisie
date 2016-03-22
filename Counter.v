`timescale 1ns / 1ps

module Counter(CE , CLK , CLR, Semnal);

input CE,CLK,CLR;
reg [3:0]Count = 4'b0001;
output reg Semnal;



always @(posedge CLK)
	begin
		Semnal = 1'b0;															//semnalul de iesire este mereu 0 mai putin in cazul in care counterul a ajuns la 12
		if(CLR == 1'b1)														//in cazul in care Clear este 0 resetam counterul
			begin
				Count = 4'b0001;
				Semnal = 1'b0;
			end
		else
				if(CE == 1'b1)														//Incrementam counterul doar in cazul in care clockul este active
					begin
						Count = Count + 1'b1;
						if(Count == 4'b1011)											//In cazul in care am ajuns la 12 semnalul de iesire este 1 si resetam counterul
							Semnal = 1'b1;	
					end
	end
endmodule
