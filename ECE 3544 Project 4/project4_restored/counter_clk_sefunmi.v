module counter_clk_sefunmi(clock, clear, load, count, updn, ins, state, carry);
   input        clock;     // System clock
   input        clear;     // SYNCHRONOUS ACTIVE-HIGH clear
   input        load;      // Synchronous active-high load enable
   input        count;     // Synchronous active-high count enable
   input        updn;      // Synchronous up-down control
   input  [3:0] ins;       // Parallel load inputs
   output [3:0] state;     // Counter state
   output       carry;     // Counter carry-out
   reg    [3:0] state;
   reg		carry;

   always @ (posedge clock) 
     if 			((clear == 1))													state <= 4'b0000;
     else if 	(load == 1)														state <= ins;
     else if 	((count == 1)&&(state == 4'b1001)&&(updn == 0)) 		state <= 4'b0000;
     else if 	((count == 1)&&(state == 4'b0000)&&(updn == 1)) 		state <= 4'b1001;
     else if 	((count == 1)&&(updn == 0))								state <= state + 1;
     else if 	((count == 1)&&(updn == 1))								state <= state - 1;
     else																			state <= state;

   always @ (state or count)
     if (((count == 1)&&(state == 4'b1001)&&(updn == 0))||((count == 1)&&(state == 4'd0)&&(updn == 1)))	carry = 1;
     else																															carry = 0;
	
endmodule
