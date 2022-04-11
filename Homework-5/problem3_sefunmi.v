
module problem3_sefunmi(clock, init_n, in, out, state);
   input        clock;
   input        init_n;   // Let's use an ASYNCHRONOUS and ACTIVE-LOW init.
   input        in;
   output       out;
   output [3:0] state;    // The state doesn't have to be an output. Including it as one makes it easier to debug.
                          // Replace the question mark with an appropriate number to represent the size of state.
   reg[3:0] state;     // FSM state
   reg      out;       // The output is the target of a procedure.
      // Declare a state having a sufficient number of bits for the number of states in your reduced table.

   // Declare a set of parameters to represent the states of your reduced table.
   // Follow the pattern started below.

   parameter sXXX = 4'b0000, s0XX = 4'b0001, s1XX = 4'b0010, s00X = 4'b0011, sX1X = 4'b0100, s10X = 4'b0101, sX00 = 4'b0110, s001 = 4'b0111, sX10 = 4'b1000, sX11 = 4'b1001, s101 = 4'b1010;

   // State Machine
   // Make additions to the init condition and the case structure to describe the next state behavior.
   always@(posedge clock or negedge init_n) begin
      if(init_n == 1'b0)
         state <= sXXX;
      else begin
         case(state)
            sXXX:    if(in == 1'b0)
                        state <= s0XX;
		     else
                        state <= s1XX;
            s0XX:    if(in == 1'b0)
                        state <= s00X;
		     else
                        state <= sX1X;
            s1XX:    if(in == 1'b0)
                        state <= s10X;
		     else
                        state <= sX1X;
            s00X:    if(in == 1'b0)
                        state <= sX00;
		     else
                        state <= s001;
            sX1X:    if(in == 1'b0)
                        state <= sX10;
		     else
                        state <= sX11;
            s10X:    if(in == 1'b0)
                        state <= sX00;
		     else
                        state <= s101;
            sX00:    if(in == 1'b1)
                        state <= s001;
            s001:    if(in == 1'b0)
                        state <= sX10;
		     else
                        state <= sX11;
            sX10:    if(in == 1'b0)
                        state <= sX00;
		     else
                        state <= s101;
            sX11:    if(in == 1'b0)
                        state <= sX10;
            s101:    if(in == 1'b0)
                        state <= sX10;
		     else
                        state <= sX11;
            default: state <= 4'bxxxx;
         endcase
      end
   end

   // Output machine
   // Make additions to the case structure to describe the output behavior for each state.
   always@(state) begin
      case(state)
         sXXX:      out = 1'b0; 
         s0XX:      out = 1'b0; 
         s1XX:      out = 1'b0;   
         s00X:      out = 1'b0;    
         sX1X:      out = 1'b0; 
         s10X:      out = 1'b0;
         sX00:      out = 1'b0;
         s001:      out = 1'b1;
         sX10:      out = 1'b0;
         sX11:      out = 1'b0;
         s101:      out = 1'b0;
         default:   out = 1'bx;
      endcase
  end

endmodule