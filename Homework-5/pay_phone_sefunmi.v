module pay_phone_sefunmi(clock, init_n, events_in, events_out);
   input        clock;        // The system clock
   input        init_n;       // Asynchronous active-low init
   input  [3:0] events_in;    // The input events
                              // - Bit 3: quarter_in
                              // - Bit 2: dime_in
                              // - Bit 1: nickel_in
                              // - Bit 0: coin_release
   output [4:0] events_out;   // The output events
                              // - Bit 4: connect
                              // - Bit 3: dime_out1
                              // - Bit 2: dime_out2
                              // - Bit 1: nickel_out
                              // - Bit 0: coin_dump
   reg    [3:0] state;     // FSM state
   reg    [4:0] events_out;       // The output is the target of a procedure.
   // Declare a state having a sufficient number of bits for the number of states in your reduced table.

   // Declare a set of parameters to represent the states of your reduced table.
   // Follow the pattern started below.

   parameter l00 = 4'b0000, l05 = 4'b0001, l10 = 4'b0010, l15 = 4'b0011, l20 = 4'b0100, c25 = 4'b0101, c30 = 4'b0110, c35 = 4'b0111, c40 = 4'b1000, c45 =  4'b1001, rel = 4'b1010;

   // State Machine
   // Make additions to the init condition and the case structure to describe the next state behavior.
   always@(posedge clock or negedge init_n) begin
      if(init_n == 1'b0)
         state <= l00;
      else begin
         case(state)
            l00:     if(events_in[3] == 1'b1)
                        state <= c25;
		     else if(events_in[2] == 1'b1)
                        state <= l10;
                     else if(events_in[1] == 1'b1)
                        state <= l05;
                     else if(events_in[0] == 1'b1)
                        state <= rel;
            l05:     if(events_in[3] == 1'b1)
                        state <= c30;
		     else if(events_in[2] == 1'b1)
                        state <= l15;
                     else if(events_in[1] == 1'b1)
                        state <= l10;
                     else if(events_in[0] == 1'b1)
                        state <= rel;
            l10:     if(events_in[3] == 1'b1)
                        state <= c35;
		     else if(events_in[2] == 1'b1)
                        state <= l20;
                     else if(events_in[1] == 1'b1)
                        state <= l15;
                     else if(events_in[0] == 1'b1)
                        state <= rel;
            l15:     if(events_in[3] == 1'b1)
                        state <= c40;
		     else if(events_in[2] == 1'b1)
                        state <= c25;
                     else if(events_in[1] == 1'b1)
                        state <= l20;
                     else if(events_in[0] == 1'b1)
                        state <= rel;
            l20:     if(events_in[3] == 1'b1)
                        state <= c45;
		     else if(events_in[2] == 1'b1)
                        state <= c30;
                     else if(events_in[1] == 1'b1)
                        state <= c25;
                     else if(events_in[0] == 1'b1)
                        state <= rel;
            c25:     if(events_in[2] == 1'b1)
                        state <= l10;
                     else if(events_in[1] == 1'b1)
                        state <= l05;
                     else if(events_in[0] == 1'b1)
                        state <= rel;
            c30:     if(events_in[3] == 1'b1)
                        state <= c25;
		     else if(events_in[2] == 1'b1)
                        state <= l10;
                     else if(events_in[1] == 1'b1)
                        state <= l05;
                     else if(events_in[0] == 1'b1)
                        state <= rel;
            c35:     if(events_in[3] == 1'b1)
                        state <= c25;
		     else if(events_in[2] == 1'b1)
                        state <= l10;
                     else if(events_in[1] == 1'b1)
                        state <= l05;
                     else if(events_in[0] == 1'b1)
                        state <= rel;
            c40:    if(events_in[3] == 1'b1)
                        state <= c25;
		     else if(events_in[2] == 1'b1)
                        state <= l10;
                     else if(events_in[1] == 1'b1)
                        state <= l05;
                     else if(events_in[0] == 1'b1)
                        state <= rel;
            c45:    if(events_in[3] == 1'b1)
                        state <= c25;
		     else if(events_in[2] == 1'b1)
                        state <= l10;
                     else if(events_in[1] == 1'b1)
                        state <= l05;
                     else if(events_in[0] == 1'b1)
                        state <= rel;
            rel:    if(events_in[3] == 1'b1)
                        state <= c25;
		     else if(events_in[2] == 1'b1)
                        state <= l10;
                     else if(events_in[1] == 1'b1)
                        state <= l05;
                     else if(events_in[0] == 1'b1)
                        state <= rel;
            default:  state <= 4'bxxxx;
         endcase
      end
   end

   // Output machine
   // Make additions to the case structure to describe the output behavior for each state.
   always@(state) begin
      case(state)
         l00:      events_out = 5'b00000;
         l05:      events_out = 5'b00000;
         l10:      events_out = 5'b00000;
         l15:      events_out = 5'b00000;
         l20:      events_out = 5'b00000;
         c25:      events_out = 5'b10000;
         c30:      events_out = 5'b10010;
         c35:      events_out = 5'b11000;
         c40:      events_out = 5'b11010;
         c45:      events_out = 5'b11100;
         rel:      events_out = 5'b00001;
         default:  events_out = 5'bxxxxx;
      endcase
  end

endmodule