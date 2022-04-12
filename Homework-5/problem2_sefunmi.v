
module problem2_sefunmi(clock, init_n, ins, out);
   input        clock;     // System clock.
   input        init_n;    // Let's have the init be ASYNCHRONOUS and ACTIVE-LOW.
   input  [1:0] ins;       // This is {x1, x0} from the state table.
   output       out;       // This is z from the state table.
   reg    [1:0] state;     // FSM state
   reg    [1:0] out;       // The output is the target of a procedure.
   // Declare a state having a sufficient number of bits for the number of states in your reduced table.

   // Declare a set of parameters to represent the states of your reduced table.
   // Follow the pattern started below.

   parameter sA = 2'b00, sB = 2'b01, sC = 2'b10;

   // State Machine
   // Make additions to the init condition and the case structure to describe the next state behavior.
   always@(posedge clock or negedge init_n) begin
      if(init_n == 1'b0)
         state <= sA;
      else begin
         case(state)
            sA:      if(ins[1] == 1'b1)
                        state <= sB;
            sB:      if(ins[0]^ins[1] == 1'b1)
                        state <= sA;
		     else if(ins == 2'b11)
                        state <= sC;
            sC:      if(!(ins == 2'b00))
                        state <= sA;
            default: state <= 2'bxx;
         endcase
      end
   end

   // Output machine
   // Make additions to the case structure to describe the output behavior for each state.
   always@(state) begin
      case(state)
         sA:      out = 1'b0;
         sB:      out = 1'b1;
         sC:      out = 1'b1;
         default: out = 1'bx;
      endcase
  end

endmodule