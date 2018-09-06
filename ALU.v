 /******************************************************************* 
* Name:
*	Calculadora1.v
* Description:
* 	1 bit Register (The one we studied in class)
* Inputs:
*  A
*  B
*  Control
*  clk
* Outputs:
* 	Carry
*  C
* Versión:  
*	1.0
* Author: 
*	Jorge Antonio Araiza Martinez
* Fecha: 
*	06/09/2018
*********************************************************************/
module ALU
#(
	parameter Word_Length = 6
)
(
	//Inputs//
	input [Word_Length - 1 : 0] A,
	input [Word_Length - 1 : 0] B,
	input [3 : 0] Control,
	input clk,
	//Outputs//
	output Carry,
	output [Word_Length - 1 : 0] C

);

reg [Word_Length : 0]     CarryComparator;
reg [Word_Length : 0] 	  OverFlowDetector;
reg [Word_Length : 0] 	  CompaDos;

always @(A,B)
begin
	//Suma//
	if (Control == 4'b0000) 
	begin
			OverFlowDetector[Word_Length : 0] <= A + B;
			CarryComparator [Word_Length - 1 : 0] <= OverFlowDetector [Word_Length - 1 : 0];
			CarryComparator [Word_Length] <= OverFlowDetector [Word_Length];
			
	end
	//Resta//
	else if (Control == 4'b0001)
	begin
			if(A>B)
			CarryComparator <= A- B;
			else
			CarryComparator <= B- A;
			CarryComparator[Word_Length] <= 1'b0;
	end
	//Multiplicación//
	else if (Control == 4'b0010)
	begin
			CarryComparator[Word_Length - 1 : 0] <=A*B;
			CarryComparator[Word_Length] <= 1'b0;
	end
	//A Negado//
	else if(Control == 4'b0011)
	begin
			CarryComparator <= ~A;
			CarryComparator[Word_Length] <= 1'b0;
			
	end
	//A Complemento a 2//
	else if(Control == 4'b0100)
	begin
			CompaDos <= 6'b000001;
			CarryComparator[Word_Length - 1 : 0] <= ~A+CompaDos;
			CarryComparator[Word_Length] <= 1'b0;
	end
	//AND//
	else if(Control == 4'b0101)
	begin
			CarryComparator[Word_Length - 1 : 0] <=A&B;
			CarryComparator[Word_Length] <= 1'b0;
	end
	//OR//
	else if(Control == 4'b0110)
	begin
			CarryComparator[Word_Length - 1 : 0] <=A|B;
			CarryComparator[Word_Length] <= 1'b0;
	end
	//XOR//
	else if(Control == 4'b0111)
	begin
			CarryComparator[Word_Length - 1 : 0] <=A^B;
			CarryComparator[Word_Length] <= 1'b0;
	end
	//Corrimiento Izquierda//
	else if(Control == 4'b1000)
	begin
			CarryComparator[Word_Length - 2 : 0] <= A << B[3:0];
		   CarryComparator[Word_Length - 1 : 4] <= 2'b00;
	end
	//Corrimiento Derecha//
	else
	begin
			CarryComparator[Word_Length - 2 : 0] <= A >> B[3:0];
			CarryComparator[Word_Length - 1 : 4] <= 2'b00;
	end
end
assign C     = CarryComparator[Word_Length - 1 : 0];
assign Carry = CarryComparator [Word_Length];
endmodule

