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

module tb_problem3_sefunmi();
   reg         enable;
   reg   [2:0] select;
   reg   [7:0] mux_in;
   wire [1:0] mux_out;
   reg   [3:0] count;

// Instantiate the decoder (the identifier is DUT, or Device Under Test)

   mux8to1_sefunmi DUT1(enable,select, mux_in, mux_out[0]);
   mux8to1_delay_sefunmi DUT2(enable,select, mux_in, mux_out[1]);
// Test input waveform - defined as an initial block (procedure)

   initial begin
      mux_in = 8'b10101010;	
      select = 3'b000;
      enable = 1'b0;
      #20;  			// Wait for 20 ns
      enable = 1'b1;		// Enable the decoder.
    	
// We can use a loop to avoid long procedures. There are many other options to write test benches easily!
// With the decoder enabled, the FOR-loop causes dec_in to take in each possible 4-bit value for 20 ns.

      for(count = 0; count < 8; count = count + 1) begin
         select = count[2:0];
         #20;
      end

      mux_in = 8'b10101010;	
      select = 3'b000;
      #20;			// Wait for 20 ns.
      enable = 1'b0;		// Disable the decoder.
      #20;			// Wait for 20 ns.
   end

endmodule
