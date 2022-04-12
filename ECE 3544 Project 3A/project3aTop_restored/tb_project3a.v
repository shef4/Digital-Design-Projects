////////////////////////////////////////////////////////////////////////////////
// Filename:    tb_project3a.v
// Author:      J.S. Thweatt
// Date:        08 October 2015
// Version:     1
// Description: This is the skeleton of a test bench for Project 3A. UPDATE
//              THIS DESCRIPTION WHEN YOU IMPLEMENT YOUR TEST BENCH.

`timescale 1 ns/100 ps

module tb_project3a();
//  Declare regs and wires.
	reg [9:0] SW;
   wire [9:0] LED;
   wire [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	
   reg   [3:0] count;
//  Instantiate system.
	project3aTop DUT(SW, LED, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
//  Test the circuit functionality here. You should apply different combinations
//  of the inputs and observer the outputs for correctness.

	initial begin
		SW = 10'b0000000000;
      #20;  			// Wait for 20 ns
      SW = 10'b0001010101;		// Enable the decoder.
    	

      for(count = 0; count < 8; count = count + 1) begin
         SW[9:7] = count[2:0];
         #20;
      end

      SW = 10'b0000000000;
      #20;			// Wait for 20 ns.
   end

//  This is not the only module that you could have tested. As long as you can
//  write a test bench, add it to your project, and follow the instructions for
//  invoking ModelSim from Quartus, you can test any module that you create in
//  Quartus.

endmodule
