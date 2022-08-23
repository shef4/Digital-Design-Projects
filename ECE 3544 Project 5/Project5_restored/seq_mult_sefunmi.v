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

module seq_mult_sefunmi(enable, clk, A, B, Result);
	input clk, enable;
   input [7:0] A, B;
   output [15:0] Result;
   reg [15:0] Result;
   reg [15:0] multiplier;
   reg [15:0] multiplicand;
   reg [4:0] ctr;

	always @(posedge clk) begin
		if (enable == 1'b0) begin
			Result   <= 0;
			ctr     <= 0;
			multiplier <= {{8{A[7]}}, A};
			multiplicand <= {{8{B[7]}}, B};
		end 
		else begin 
			multiplicand = multiplicand << 1;
			if(multiplier[ctr]==1) begin
			  Result <= Result + multiplicand;
			end
			ctr <= ctr+1;
		end 
	end 
    

endmodule
