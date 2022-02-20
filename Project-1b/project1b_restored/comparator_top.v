////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Filename:    comparator_top.v
// Author:      Jason Thweatt
// Date:        17 February 2022
// Version:     1
// Description: This is the board interface for the comparator circuit.
//
////////////////////////////////////////////////////////////////////////////////////////////////////


module comparator_top(SW, LED);
	input  [5:0] LED;
	output [5:0] SW;
	
// Module instances u1 and u2 are instances of your modules from Projects 1A and 1B.
// Add the two comparator source files to this project.
// Modify the module instance names to match the names of your files. 
// ONLY ONE INSTANCE CAN BE ACTIVE AT A TIME. One instance should always be commented out.

//                                 (valA   , valB   , aGTb  , aGEb  , aLTb  , aLEb  , aEQb  , aNEb  );
// comparator_structural_sefunmi u1(SW[5:3], SW[2:0], LED[5], LED[4], LED[3], LED[2], LED[1], LED[0]);
	comparator_continuous_sefunmi u2(SW[5:3], SW[2:0], LED[5], LED[4], LED[3], LED[2], LED[1], LED[0]);

endmodule
