 /******************************************************************* 
* Name:
*	Calculadora1.v
* Description:
* 	3 bit Register (The one we studied in class)
* Inputs:
*  clk
*  reset
*  Data_Input
* Outputs:
* 	Data_Output
* Versión:  
*	1.0
* Author: 
*	Jorge Antonio Araiza Martinez
* Fecha: 
*	06/09/2018
*********************************************************************/
module Register_3Bit
#(
	parameter Word_Length = 6
)

(
	// Input Ports
	input clk,
	input reset,
	input [3 : 0] Data_Input,

	// Output Ports
	output [3 : 0] Data_Output
);

reg  [3 : 0] Data_reg;

always@(posedge clk or negedge reset) begin
	if(reset == 1'b0) 
		Data_reg <= 0;
	else 
		Data_reg <= Data_Input;
end

assign Data_Output = Data_reg;
endmodule 