
module inputRegister_sefunmi(clk, load, data, q);
	input  		  clk, load;
	input  [7:0] data;
   output [7:0] q;
   reg    [7:0] q;

	// Register with active-high clock & asynchronous load
   always @(posedge clk) begin
      if (load)
         q <= data;
   end
    

endmodule
