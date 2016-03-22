`timescale 1ns / 1ps

module H2(START , CLK , RESET , TXRDY , INCARCA , DEPL , NUM12);

input START , CLK , RESET , NUM12;
output reg TXRDY , INCARCA , DEPL;
reg [2:0]stareCurenta = 3'b000;
reg [2:0]stareUrmatoare = 3'b000;


always @(posedge CLK)
	begin
		INCARCA = 1'b0;
		TXRDY = 1'b0;
		DEPL = 1'b0;
		if(RESET == 1'b1)
			stareCurenta = 3'b000;
			
		if(stareCurenta == 3'b000)
			if(START == 1'b0)
				begin
					stareUrmatoare = stareUrmatoare + 1;
				end
		if(stareCurenta == 3'b0001)
			begin
				INCARCA = 1'b1;
				stareUrmatoare = stareUrmatoare+2;
			end
			
		if(stareCurenta == 3'b011)
			begin
				DEPL = 1'b1;
				stareUrmatoare = stareUrmatoare + 1;
			end
			
		if(stareCurenta == 3'b100)
			if(NUM12 == 1'b1)
				begin
					TXRDY = 1'b1;
					stareUrmatoare = stareUrmatoare + 1;
				end
			else 
				DEPL = 1'b1;
				
		if(stareCurenta == 3'b101)
			if(TXRDY == 1'b1)
				stareUrmatoare = 3'b000;
		stareCurenta = stareUrmatoare;
	end
endmodule
