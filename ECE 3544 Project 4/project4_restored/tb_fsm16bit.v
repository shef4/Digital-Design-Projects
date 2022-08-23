////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Filename:    tb_fsm16bit.v
// Author:      Jason Thweatt
// Date:        28 March 2017
// Version:     2
// Description: FSM testbench.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ns

module tb_fsm_sefunmi();
	reg         clock, reset, enable, check, mode, direction;
	reg  [13:0] events_out;
	wire [15:0] count;

	// Intantiate two versions of the counter. ctr1 uses the default values.
   fsm_sefunmi DUT1(clk_out, init_n, events_in, events_out);
	// Test the counter functionality here.
	// You should set up a 50 MHz clock, along with the various control and input signals.
	// Avoid using the Project 2 clock module, since it is not synthesizable.
	// Adding it to this project will cause Quartus to complain about its synthesizability.

// Sequence the ENABLE and CLR signals
   initial begin
      clk_enable = 1;
      init_n = 0;
      events_in = 4'b0000;
      #20  events_in = 4'b0000;
      init_n = 1;
      #20  events_in = 4'b1000;
      #20  events_in = 4'b1100;
      #20  events_in = 4'b1010;
      #20  events_in = 4'b1100;
      #20  events_in = 4'b1010;
      init_n = 0;
      events_in = 4'b0000;
      clk_enable = 0;
   end
endmodule
