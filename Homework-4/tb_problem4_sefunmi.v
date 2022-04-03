
// Time Unit = 1 ns (#10 = 10 ns)
// Simulation Precision = 100 ps
`timescale 1ns/100ps 

////////////////////////////////////////////////////////////////////////////////////////////////////
// Filename:    tb_decoder4to16.v
// Author:      Jason Thweatt
// Date:        02 June 2017
// Version:     1
// Description: This file contains a test bench for the 4-to-16 decoder.
//              We are using it here as an introduction to the ModelSim environment.
//              The testbench is defined behaviorally. It uses a procedure to define the input
//              waveform.

// Testbenches don't have arguments. Instead, the values that we want to modify are regs. ANY VALUE
// THAT IS THE TARGET OF A PROCEDURE MUST BE A REG. The values that we wish to observe are wires.

module tb_problem4_sefunmi();
   reg  [3:0] digit;
   wire [6:0] hex_display;
   reg   [3:0] count;

// Instantiate the decoder (the identifier is DUT, or Device Under Test)

   problem4_sefunmi DUT1(digit,hex_display);

// Test input waveform - defined as an initial block (procedure)

   initial begin
      digit = 4'b0000;	
      #20;  			// Wait for 20 ns
    	
      for(count = 0; count < 10; count = count + 1) begin
         digit = count[3:0];	
         #20;
      end

      digit = 4'b0000;	
      #20;			// Wait for 20 ns.
   end

endmodule