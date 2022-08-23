////////////////////////////////////////////////////////////////////////////////
// Modify this header with your name, date, etc.
// Filename: project5Top.v
// Author:   Jason Thweatt
// Date:     28 November 2019
// Revision: 2
// 
// Description: 
// This is the top level module for ECE 3544 Project 5.
// Do not modify the module declarations or ports in this file.
// Make a pin assignment before you program your board with this design!

module controlUnit_sefunmi(clock, reset, events_in, events_out);
	input        clock;        // The system clock
   input        reset;       // Asynchronous active-low init
   input  [4:0] events_in;    // The input events
                              // - Bit [4:1]: opcode
                              // - Bit 0: enable
   output [2:0] events_out;   // The output events
	reg    [2:0] events_out;
   reg    [3:0] state;     // FSM state
	reg    [4:0] ctr;
	
   parameter  op = 4'b0000, op_a = 4'b0001, op_b = 4'b0010, op_m = 4'b0011;

   // State Machine
   // Make additions to the init condition and the case structure to describe the next state behavior.
   always@(posedge clock or negedge reset) begin
      if(reset == 1'b0) state <= op;
      else begin
         case(state)
            op:		if(events_in[0] == 1'b1 && ~(events_in[4:1] == 4'hf)) 																				state <= op_a;
            op_a:  	if(events_in[0] == 1'b1 && (events_in[4:1] == 4'h3|| events_in[4:1] == 4'h7 || events_in[4:1] == 4'hd)) 				state <= op;
							else if(events_in[0] == 1'b1)																													state <= op_b;
            op_b:  	if(events_in[0] == 1'b1 && (events_in[4:1] == 4'hc))																					state <= op_m;
							else if(events_in[0] == 1'b1)																													state <= op;
				op_m:  	if(events_in[0] == 1'b1 && (ctr == 4'b1000))		begin
								ctr <= 4'b0000;
								state <= op;
							end
							else if (events_in[0] == 1'b1) ctr <= ctr + 1;
            default:  																																						state <= 4'bxxxx;
         endcase
      end
   end
										
   // Output machine
   // Make additions to the case structure to describe the output behavior for each state.
	always@(state) begin
      case(state)
         op:      	   if(events_in[4:1] == 4'hf) 																																								events_out = 4'b1100;
								else 																																																events_out = 4'b0100;
         op_a:    	   if(events_in[4:1] == 4'h3|| events_in[4:1] == 4'h7 || events_in[4:1] == 4'hd) 																							events_out = 4'b1010;
								else  																																															events_out = 4'b0010;
         op_b:      		if(~(events_in[4:1] == 4'h3)|| ~(events_in[4:1] == 4'h7) || ~(events_in[4:1] == 4'hd) || ~(events_in[4:1] == 4'hc) || ~(events_in[4:1] == 4'hf)) 	events_out = 4'b1001;
								else																																																events_out = 4'b0001;
			op_m:      																																																			events_out = 4'b1000;
         default:  																																																			events_out = 4'bxxxx;
      endcase
  end
							  
endmodule
