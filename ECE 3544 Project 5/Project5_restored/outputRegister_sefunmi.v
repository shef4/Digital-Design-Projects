

module outputRegister_sefunmi(clk, load, data, q);
	input  		  clk, load;
	input  [15:0] data;
   output [15:0] q;
   reg    [15:0] q;

	// Register with active-high clock & asynchronous load
   always @(posedge clk) begin
      if (load)
         q <= data;
   end
    

endmodule
