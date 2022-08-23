
module problem6_sefunmi(clock, reset_n, enable, state, out);
   input        clock;     // System clock
   input        reset_n;   // Asynchronous active-low reset
   input        enable;    // Synchronous active-high count enable
   output [18:0]state;     // Counter state.
   output       out;       // Output pulse.
   reg 		out;
   reg 	 [18:0] state;

   always @ (posedge clock) 
     if(reset_n == 0 || ((count == 1)&&(state == 19'd499999)))	state <= 19'd0;
     else if (count == 1)					state <= state + 1;
     else							state <= state;

   always @ (state or count)
     if ((count == 1)&&(state == 19'd499999))			out = 1;
     else							out = 0;

endmodule