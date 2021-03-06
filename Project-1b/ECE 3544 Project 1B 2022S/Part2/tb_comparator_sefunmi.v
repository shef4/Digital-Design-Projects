// Filename:     tb_comparator_sefunmi.v
// Author:       S. Ashiru
// Date Created: 20 Febuary 2022
// Version:      1 (Date Last Modified: 20 Febuary 2022) 
// Description:  The file test a circuit which accepts two 3-bit inputs representing 
// 		 unsigned binary numbers and provides six outputs that represent 
//               the various results from comparing the two values, by using continuous assignment

// Time Unit = 1 ns (#1 = 1 ns)
// Simulation Precision = 1 ns
`timescale 1ns/1ns 

module tb_comparator_sefunmi();
   reg   [2:0] valA, valB;
   wire aGTb, aGEb, aLTb, aLEb, aEQb, aNEb;

   reg   [3:0] count;

// Instantiate the decoder (the identifier is dut, or "device under test").
   comparator_continuous_sefunmi css(valA, valB, aGTb, aGEb, aLTb, aLEb, aEQb, aNEb);

// Test input stimulus, defined as an initial block (procedure).
   initial begin	// At time t = 0, the decoder is DISABLED and dec_in = 4'b0000.
      valA = 3'b100;
      valB = 3'b000;
      #50;  			// Wait for 50 ns
    	
// We can use a loop to avoid long procedures. There are many other options to write test benches easily!
// NOTE THE DIFFERENCES IN SYNTAX BETWEEN C AND VERILOG!

// With the decoder enabled, the FOR-loop causes dec_in to take in each possible 4-bit value for 50 ns.

      for(count = 0; count < 8; count = count + 1) begin
         valB = count[3:0];
         #50;
      end

      valB = 4'b000;		// Set dec_in = 0000.
      #50;			// Wait for 50 ns.
   end



endmodule
