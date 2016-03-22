`timescale 1ns / 1ps
module Top_module(Start , Reset , Ceas , Date_seriale , Gata_operatie , date , r1 , r2 , or2 , Incarca
    );
	 
input Start , Reset , Ceas;
input [7:0]date;
output Date_seriale; 
output Gata_operatie , r1 , r2 , or2  , Incarca;

wire TxRdy  , Num12 , a1 , a2 , p , Q , or22 , Depl;

H2 h2(Start , Ceas , Reset , TxRdy , Incarca , Depl , Num12);

//scoatem din fdrse in functie de paritate 1 sau 0
CIRC_GEN_PARITI paritate(date , p);										//scoatem paritatea
and A1(a1 , Incarca , p);
and A2(a2 , Incarca , ~p);
Flip_Flop_FDRSE fdrse1(a1 , a2 , Depl , Ceas , Q1 , 1'b1);

//registrii de siftare x74_194
or Or2(or2 , Incarca , Depl);
x74_194 R1(Q1 , date[0] , date[1] , date[2] , date[3] , Incarca , or2 , Ceas , ~Reset , r1);
x74_194 R2(r1 , date[4] , date[5] , date[6] , date[7] , Incarca , or2 , Ceas , ~Reset , r2);
Flip_Flop_FDRSE fdrse2(Reset , Incarca , Depl , Ceas , Date_seriale , r2);

//count 
or Or22(or22 , Reset , Gata_operatie);
Counter c1(Depl , Ceas , or22 , Num12);
Flip_Flop_FDCE fdce(Ceas, TxRdy ,Reset , Gata_operatie);


endmodule
