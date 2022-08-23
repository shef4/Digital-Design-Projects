`timescale 1ns/100ps

module tb_pay_phone_sefunmi();
   reg        clk_enable;	// Locally-created clock enable signal
   reg        init_n;	// Locally-created counter enable signal
   reg[3:0]   events_in;
   wire       clk_out;		// Clock produced by the clk module
   wire[4:0]  events_out;	


// Instantiate the clock generator with a period of 100 ns
   clk #(20) clk1(clk_enable, clk_out);

// Intantiate two versions of the counter. ctr1 uses the default values.
   pay_phone_sefunmi DUT1(clk_out, init_n, events_in, events_out);
// Sequence the ENABLE and CLR signals
   initial begin
      clk_enable = 1;
      init_n = 0;
      events_in = 4'b0000;
      #20  events_in = 4'b0000;
      init_n = 1;
      #20  events_in = 4'b1000;
      #20  events_in = 4'b0100;
      #20  events_in = 4'b0010;
      #20  events_in = 4'b0100;
      #20  events_in = 4'b0010;
      #20  events_in = 4'b0010;
      #20  events_in = 4'b0001;
      #20  events_in = 4'b0100;
      #20  events_in = 4'b0100;
      #20  events_in = 4'b0100;
      #20  events_in = 4'b0000;
      #20  events_in = 4'b0100;
      #20  events_in = 4'b0010;
      #20  events_in = 4'b0010;
      #20  events_in = 4'b1000;
      #20  events_in = 4'b1000;
      init_n = 0;
      events_in = 4'b0000;
      clk_enable = 0;
   end
endmodule

module clk(clk_en, clk_out);
   input  clk_en;		// Allow clk_out to "run" when asserted.
   output clk_out;		// Enable-controlled clock output.
   reg    clk_out;		// Variable clk_out is defined procedurally.

   parameter PERIOD = 50;	// The default period of the clock.

// Set initial value for clk_out on power-up
   initial clk_out = 0;

// Produce controlled free-running clock
   always begin
      #(PERIOD/2) if(clk_en)
         clk_out = ~clk_out;
   end

endmodule