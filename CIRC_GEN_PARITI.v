`timescale 1ns / 1ps

module CIRC_GEN_PARITI(Data , paritate);
	input [7:0]Data;
	output paritate;

	assign paritate = Data[7] ^ Data[6] ^ Data[5] ^ Data[4] ^ Data[3] ^ Data[2] ^ Data[1] ^ Data[0];			//Daca numarul de 1 este par returneaza 0
																																			//Altfel return 1
endmodule
