
module problem1_sefunmi(clock, reset_n, count, state, carry);
   input        clock;     // System clock
   input        reset_n;   // Asynchronous active-low reset  
   input        count;     // Synchronous active-high count enable
   output [3:0] state;     // Counter state
   output       carry;     // Counter carry-out
   reg		state;
   reg 		carry;
   
   always @ (posedge clock) 
     if((reset_n == 1)||((count == 1)&&(state == 4'd9)))state <= 4'd0;
     else if (count == 1)				state <= state + 1;
     else						state <= state;

   always @ (state or count)
     if ((count == 1) && (state == 4'd9))	carry = 1;
     else					carry = 0;
endmodule