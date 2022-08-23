module fsm_sefunmi(clock, reset, events_in, events_out);
   input        clock;        // The system clock
   input        reset;       // Asynchronous active-low init
   input  [2:0] events_in;    // The input events
                              // - Bit 2: mode
                              // - Bit 1: action
                              // - Bit 0: stop/go
   output [9:0] events_out;   // The output events
	reg    [9:0] events_out;
   reg    [3:0] state;     // FSM state
   parameter euc = 4'b0000,  ucr = 4'b0001,ucg = 4'b0010,  ucs = 4'b0011, edc = 4'b0100, dcr1 = 4'b0101, dcr2 = 4'b1000,dcg = 4'b0110, dcs = 4'b0111;

   // State Machine
   // Make additions to the init condition and the case structure to describe the next state behavior.
   always@(posedge clock or negedge reset) begin
      if(reset == 1'b0) state <= euc;
      else begin
         case(state)
            euc:	if(events_in[1] == 1'b1) 			state <= ucr;
						else if(events_in[2] == 1'b1)		state <= edc;	
            ucr:  if(events_in[2] == 1'b1) 			state <= euc;
						else if(events_in[0] == 1'b1)		state <= ucg;
            ucg:  if(events_in[2] == 1'b1)			state <= euc;
						else if(events_in[1] == 1'b1)		state <= ucr;
						else if(events_in[0] == 1'b1)		state <= ucs;
            ucs:  if(events_in[2] == 1'b1)			state <= euc;
						else if(events_in[1] == 1'b1)		state <= ucr;
						else if(events_in[0] == 1'b1)		state <= ucg;
            edc:  if(events_in[1] == 1'b1)			state <= dcr1;
						else if(events_in[2] == 1'b1)		state <= euc;
            dcr1: if(events_in[2] == 1'b1)			state <= edc;
						else if(events_in[1] == 1'b1)		state <= dcr2;
						else if(events_in[0] == 1'b1)		state <= dcg;
				dcr2: if(events_in[2] == 1'b1)			state <= edc;
						else if(events_in[0] == 1'b1)		state <= dcg;
            dcg:  if(events_in[2] == 1'b1)			state <= edc;
						else if(events_in[1] == 1'b1)		state <= dcr1;
						else if(events_in[0] == 1'b1)		state <= dcs;
            dcs:  if(events_in[2] == 1'b1)			state <= edc;
						else if(events_in[1] == 1'b1)		state <= dcr1;
						else if(events_in[0] == 1'b1)		state <= dcg;
            default:  										state <= 4'bxxxx;
         endcase
      end
   end
										
   // Output machine
   // Make additions to the case structure to describe the output behavior for each state.
	always@(state) begin
      case(state)
         euc:      	events_out = 10'b0000110000;
         ucr:      	events_out = 10'b0000110100;
         ucg:      	events_out = 10'b0010010110;
         ucs:      	events_out = 10'b0000010101;
         edc:      	events_out = 10'b0000101000;
         dcr1:      	events_out = 10'b0001001100;
         dcr2:      	events_out = 10'b1000001100;
         dcg:      	events_out = 10'b0110001110;
         dcs:      	events_out = 10'b0000001101;
         default:  	events_out = 10'bxxxxxxxxxx;
      endcase
  end

endmodule