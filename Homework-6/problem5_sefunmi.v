
module problem5_sefunmi(clock, reset_n, state);
   input        clock;
   input        reset_n;        // SYNCHRONOUS ACTIVE-LOW RESET;
   output [3:0] state;
   reg    [3:0] state;
   wire 	load,clear,count, updn;
   wire   [3:0] ins;

   problem4_sefunmi ctr4(clock, clear, load, count, updn, ins, state, carry);
  
   always @ (posedge clock) begin
     if ((reset_n == 0))	
	begin
	   {clear, load, count, updn, ins} = 8'b10000000;
	end
     else begin
	case(state)
	   0: 		{clear, load, count, updn, ins} = 8'b00100000;
	   1: 		{clear, load, count, updn, ins} = 8'b00100000;
	   2: 		{clear, load, count, updn, ins} = 8'b00100000;
	   3: 		{clear, load, count, updn, ins} = 8'b00100000;
	   4: 		{clear, load, count, updn, ins} = 8'b00100000;
	   5: 		{clear, load, count, updn, ins} = 8'b00100000;
	   6: 		{clear, load, count, updn, ins} = 8'b00100000;
	   7: 		{clear, load, count, updn, ins} = 8'b01001111;
	   15: 		{clear, load, count, updn, ins} = 8'b00110000;
	   14: 		{clear, load, count, updn, ins} = 8'b00110000;
	   13: 		{clear, load, count, updn, ins} = 8'b00110000;
	   12: 		{clear, load, count, updn, ins} = 8'b00110000;
	   11: 		{clear, load, count, updn, ins} = 8'b00110000;
	   10: 		{clear, load, count, updn, ins} = 8'b00110000;
	   9: 		{clear, load, count, updn, ins} = 8'b00110000;
	   8: 		{clear, load, count, updn, ins} = 8'b10000000;
	   default: 	{clear, load, count, updn, ins} = 8'b00000000;
	endcase
      end
end
endmodule