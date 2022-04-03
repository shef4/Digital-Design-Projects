
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

module tb_channel1_sefunmi();
   reg        clk_enable;	// Locally-created clock enable signal
   reg        ctr_enable;	// Locally-created counter enable signal
   reg        ctr_clr;		// Locally-created counter clear signal
   wire       clk_out;		// Clock produced by the clk module
   wire [9:0] data_transmited;	// Counter outputs for the two 4-bit counters
   wire [8:0] data_received;
   wire data_valid;
// Instantiate the clock generator with a period of 1 ns
   clk #(1) clk1(clk_enable, clk_out);

// Intantiate two versions of the counter. ctr1 uses the default values.
   transmit_sefunmi transmiter(clk, ctr_enable, ctr_clr, data_transmited);
// Intantiate two versions of the counter. ctr1 uses the default values.
   receive_sefunmi receiver(clk, data_transmited, data_valid, data_received);

// Sequence the ENABLE and CLR signals
   initial begin
      clk_enable = 1;
      ctr_enable = 0;
      ctr_clr = 0;
      #10  ctr_clr = 1;
      #40  ctr_clr = 0;
      #50  ctr_enable = 1;
      #400 ctr_enable = 0;
      #200 ctr_enable = 1;
      #300 ctr_clr = 1;
      #60  ctr_clr = 0;
   end
endmodule
