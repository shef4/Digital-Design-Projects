

////////////////////////////////////////////////////////////////////////////////
// Filename:    tb_hc280_sefunmi.v
// Author:      S. Ashiru
// Date:        03/22/2022
// Version:     1
// Description: This module serves as a simple testbench for the counter module.
//              Two counters are instantiated and stimulated with a simple
//              sequence.
//
//              There are no inputs or outputs to this module.
//
// Modification History:
// Date        By   Version  Change Description
// ============================================
// 03/22/2022  SA   1        Original
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module tb_register10bit_sefunmi();
   reg        clk_enable;	// Locally-created clock enable signal
   reg        ctr_enable;	// Locally-created counter enable signal
   reg        ctr_clr;		// Locally-created counter clear signal
   wire       clk_out;		// Clock produced by the clk module
   wire [8:0] count1;	// Counter outputs for the two 4-bit counters
   wire [9:0] q_out;

// Instantiate the clock generator with a period of 100 ns
   clk #(100) clk1(clk_enable, clk_out);

// Intantiate two versions of the counter. ctr1 uses the default values.
   counter9bit_sefunmi ctr1(ctr_enable, ctr_clr, clk_out, count1);
// Intantiate two versions of the counter. ctr1 uses the default values.
   hc280_sefunmi hc280(count1, even, odd);
// Intantiate two versions of the counter. ctr1 uses the default values.
   register10bit_sefunmi register10bit(clk_out, {odd,count1}, q_out); 

// Sequence the ENABLE and CLR signals
   initial begin
      clk_enable = 1;
      ctr_enable = 0;
      ctr_clr = 0;
      #10  ctr_clr = 1;
      #40  ctr_clr = 0;
      #50  ctr_enable = 1;
   end
endmodule