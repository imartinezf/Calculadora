 /******************************************************************* 
* Name:
*	ClkReg.v
* Description:
* 	This module is Registers for the Alu with a Clock signal.
* Inputs:
*	clock:
*  In_Data: Input data
* Outputs:
* 	Out_Data: Output data
* Versión:  
*	1.0
* Author: 
*	Iván Martínez Flores
* Fecha: 
*	01/09/2018 
*********************************************************************/
module alu	
#(
	parameter WORD_LENGTH = 8
)

(
	input clock,
	input [WORD_LENGTH - 1:0] Data_in,
	output [WORD_LENGTH - 1:0] Data_out
);

reg [WORD_LENGTH - 1:0] Data_reg;

always@(posedge clock)
	begin
		Data_reg <= Data_in;
	end
	assign Data_out = Data_reg;
endmodule