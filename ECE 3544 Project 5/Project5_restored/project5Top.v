////////////////////////////////////////////////////////////////////////////////
// Modify this header with your name, date, etc.

// Filename: project5Top.v
// Author:   Jason Thweatt
// Date:     28 November 2019
// Revision: 2
// 
// Description: 
// This is the top level module for ECE 3544 Project 5.
// Do not modify the module declarations or ports in this file.
// Make a pin assignment before you program your board with this design!

module project5Top(CLOCK_50, KEY, SW, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0, LED);
	input        CLOCK_50;
	input  [3:0] KEY;
	input  [9:0] SW;
	output [6:0] HEX5;
	output [6:0] HEX4;
	output [6:0] HEX3;
	output [6:0] HEX2;
	output [6:0] HEX1;
	output [6:0] HEX0;
	output [9:0] LED;
	wire 			mult_enable, enter, reset;
	wire	 [7:0]	q_a, q_b;
	wire	 [3:0]   q_o;
	wire	 [15:0]	q_r,Result;
	wire	 [3:0]	events_out;
// You should add your reg/wire/parameter declarations here.
	

//=======================================================
// Module instantiantions
//=======================================================

// You should add your module instances here. You may also add continuous assignments as appropriate.
	buttonpressed 	EBP(CLOCK_50, 1'b1, KEY[1], enter);
	buttonpressed 	RBP(CLOCK_50, 1'b1, KEY[0], reset);
	
	controlUnit_sefunmi CU(CLOCK_50, (~reset), {SW[3:0],enter}, events_out);
	
	inputRegister_sefunmi REGO(CLOCK_50, (events_out[2] && (~events_out[1]) && (~events_out[0])), SW[7:0], q_o);
	inputRegister_sefunmi REGA(CLOCK_50, ((~events_out[2]) && events_out[1] && (~events_out[0])), SW[7:0], q_a);
	inputRegister_sefunmi REGB(CLOCK_50, ((~events_out[2]) && (~events_out[1]) && events_out[0]), SW[7:0], q_b);
	
	assign mult_enable = ((~events_out[2]) && (~events_out[1]) && (~events_out[0]));
	
	functionUnit_sefunmi FU(CLOCK_50,mult_enable, q_o[3:0], q_a, q_b, Result);
	
	hex_display   bit30(Result[3:0], HEX0);
	hex_display   bit74(Result[7:4], HEX1);
	hex_display   bitb8(Result[11:8], HEX2);
	hex_display   bitfc(Result[15:12], HEX3);
	
endmodule
