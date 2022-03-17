// Simulation Precision = 1 ns
`timescale 1ns/1ns 

// Filename:    tb_problem6and7.v
// Author:      Sefunmi Ashiru
// Date:        2/28/2022
// Version:     1
// Description: This file contains a test bench for a hex binary to LED convertion for prodecural and continuous assignment

module tb_problem6and7();

   reg  [3:0]  ins;
   wire [6:0] out1,out2;
   reg  [4:0] count;

   sevensegdecoder_proc_sefunmi dut7(ins, out1);
   sevensegdecoder_cont_sefunmi dut6(ins, out2);
   initial begin
      count = 0;
      while(count < 16) begin
         ins = count;
         #20;
         count = count + 1;
      end
   end

endmodule 
