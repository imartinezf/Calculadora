 /******************************************************************* 
* Name:
*	Register.v
* Description:
* 	This module is a register with parameter.
* Inputs:
*	clk: Clock signal 
*  reset: reset signal
*	Data_Input: Data to lache data 
* Outputs:
* 	Mux_Output: Data to provide lached data
* Versi�n:  
*	1.0
* Author: 
*	Jos� Luis Pizano Escalante
* Fecha: 
*	07/02/2013 
*********************************************************************/

 module Register
#(
	parameter WORD_LENGTH = 8
)

(
	// Input Ports
	input clk,
	input reset,
	input [WORD_LENGTH-1 : 0] Data_Input,

	// Output Ports
	output [WORD_LENGTH-1 : 0] Data_Output
);

reg  [WORD_LENGTH-1 : 0] Data_reg;

always@(negedge clk or negedge reset) begin
	if(clk == 1'b0) 
		Data_reg <= 0;
	else 
		Data_reg <= Data_Input;
end

assign Data_Output = Data_reg;

endmodule