`timescale 1ns/100ps

module tb_problem3_sefunmi();
   reg        clk_enable;	// Locally-created clock enable signal
   reg        init_n, in;	// Locally-created counter enable signal
   wire       clk_out, out;		// Clock produced by the clk module
   wire[3:0]  state;	


// Instantiate the clock generator with a period of 100 ns
   clk #(20) clk1(clk_enable, clk_out);

// Intantiate two versions of the counter. ctr1 uses the default values.
   problem3_sefunmi DUT(clk_out, init_n, in, out, state);

// Sequence the ENABLE and CLR signals
   initial begin
      clk_enable = 1;
      init_n = 0;
      in = 0;
      #20  in = 0;
      init_n = 1;
      #20  in = 0;
      #20  in = 1;
      #20  in = 0;
      #20  in = 0;
      #20  in = 1;
      #20  in = 0;
      #20  in = 0;
      #20  in = 0;
      #20  in = 0;
      #20  in = 1;
      #20  in = 0;
      #20  in = 0;
      #20  in = 1;
      #20  in = 0;
      #20  in = 0;
      #20  in = 1;
      #20  in = 0;
      #20  in = 0;
      init_n = 0;
      in = 0;
      clk_enable = 0;
   end
endmodule
