// Simulation Precision = 1 ns
`timescale 1ns/1ns 

// Filename:    tb_problem1.v
// Author:      Sefunmi Ashiru
// Date:        2/28/2022
// Version:     1
// Description: This file contains a test bench for a 5 input circuit.
//              It uses a WHILE loop in an initial block to apply all
//              combinations of the inputs for a period of 20 ns each. 

module tb_problem1_while();

   reg  [4:0] ins;
   wire       outs;
   reg  [5:0] count;

   problem1_sefunmi dut(ins, outs);

   initial begin
      count = 0;
      while(count < 32) begin
         ins = count;
         #20;
         count = count + 1;
      end
   end

endmodule
