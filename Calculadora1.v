 /******************************************************************* 
* Name:
*	Calculadora1.v
* Description:
* 	Top Level Calculator for the ALU
* Inputs:
*	A: Input number for operations
*  B: Input number for operations
*  control: Mux Selector for operations
*  clk
*  reset
* Outputs:
* 	Carry: In case of overflow in some operations.
*  C: Will have the result of the operations made.
* Versión:  
*	1.0
* Author: 
*	Jorge Antonio Araiza Martinez
* Fecha: 
*	06/09/2018
*********************************************************************/
module Calculadora1
//Parameters//
#(
parameter Word_Length = 6
)

(
	//Input Ports//
	input  [Word_Length - 1 : 0] A,
	input  [Word_Length - 1 : 0] B,
	input  [3 : 0] Control,
	input clk,
	input reset,
	//Output Ports//
	output [Word_Length - 1 : 0] C,
	output Carry
);

//Internal Connections//
wire [Word_Length - 1 : 0] OutRegA;  //Output of Register Connected to A
wire [Word_Length - 1 : 0] OutRegB; //Output of Register Connected to B
wire [Word_Length - 1 : 0] InRegC; //Input of Register Connected to C
wire [3 : 0] OutRegControl;       //Output of Register Connected to Control
wire InRegCarry;						//Input of Register Connected to Carry

ALU
This_is_the_ALU
(
	//Input Selector//
	.A(OutRegA),
	.B(OutRegB),
	.Control(OutRegControl),
	.clk(clk),
	//Output Selector//
	.Carry(InRegCarry),
	.C(InRegC)
);

Register
This_is_the_input_Register_for_A
(
	//Input Selector//
	.clk (clk),
	.reset(reset),
	.Data_Input(A),
	//Output Selector//
	.Data_Output(OutRegA)
);

Register
This_is_the_input_Register_for_B
(
	//Input Selector//
	.clk (clk),
	.reset(reset),
	.Data_Input(B),
	//Output Selector//
	.Data_Output(OutRegB)
);

Register
This_is_the_input_Register_for_C
(
	//Input Selector//
	.clk (clk),
	.reset(reset),
	.Data_Input(InRegC),
	//Output Selector//
	.Data_Output(C)
);

Register_3Bit
This_is_the_input_Register_for_Control
(
	//Input Selector//
	.clk (clk),
	.reset(reset),
	.Data_Input(Control),
	//Output Selector//
	.Data_Output(OutRegControl)
);

Register_1Bit
This_is_the_input_Register_for_Carry
(
	//Input Selector//
	.clk (clk),
	.reset(reset),
	.Data_Input(InRegCarry),
	//Output Selector//
	.Data_Output(Carry)
);

endmodule
