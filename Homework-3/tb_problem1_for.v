
// Simulation Precision = 1 ns
`timescale 1ns/1ns 

// Filename:    tb_problem1.v
// Author:      Jason Thweatt
// Date:        09 September 2015
// Version:     1
// Description: This file contains a test bench for a 5 input circuit.
//              It uses a WHILE loop in an initial block to apply all
//              combinations of the inputs for a period of 20 ns each. 

module tb_problem1_for();

   reg  [4:0] ins;
   wire [1:0] out;
   reg  [5:0] count;

   problem1_sefunmi dut1(ins, out[0]);
   problem4_sefunmi dut4(ins, out[1]);
   initial begin
      count = 0;
      for(count = 0; count < 32; count = count + 1) begin
         ins = count;
         #20;
      end
   end

endmodule
