 /******************************************************************* 
* Name:
*	Calculadora1.v
* Description:
* 	1 bit Register (The one we studied in class)
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

 module Register_1Bit
 #(
	parameter Word_Length = 6
)
(
	// Input Ports
	input clk,
	input reset,
	input Data_Input,

	// Output Ports
	output Data_Output
);

reg  Data_reg;

always@(posedge clk or negedge reset) begin
	if(reset == 1'b0) 
		Data_reg <= 0;
	else 
		Data_reg <= Data_Input;
end

assign Data_Output = Data_reg;

endmodule 