

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

module tb_problem5_sefunmi();
   reg parity_control;
   reg [7:0] input_word;
   wire [8:0] output_word;
   reg [2:0] count;

// Instantiate the decoder (the identifier is DUT, or Device Under Test)

   problem5_sefunmi DUT1(parity_control,input_word,output_word);

// Test input waveform - defined as an initial block (procedure)

   initial begin
      input_word = 8'b0110100;	
      parity_control = 1'b0;
      #20;  			// Wait for 20 ns
    	
      for(count = 0; count < 4; count = count + 1) begin
	 input_word[0] = count[1];
         parity_control = count[0];	
         #20;
      end

      input_word = 8'b0110100;
      parity_control = 1'b0;
      #20;			// Wait for 20 ns.
   end

endmodule