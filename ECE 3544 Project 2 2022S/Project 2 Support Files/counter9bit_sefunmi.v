
////////////////////////////////////////////////////////////////////////////////
// Filename:    counter9bit_sefunmi.v
// Author:      S. Ashiru
// Date:        03/22/2022
// Version:     1
// Description: This module is a behavioral description of a simple nine-bit
//              counter with enable and asynchronous clear.
//
// 		This module has three inputs and one output:
//              - enable: An active-high signal that advances the count when
//                        asserted. (input)
//              - clear:  An asynchronous active-high clear. (input)
//              - clk:    The system clock. (input)
//              - cout:	  The 9-bit counter value. (output)
//
//              This module has two parameters:
//              - CLRDEL: Delay from clear asserted to output valid
//              - CLKDEL: Delay from clk rising to output valid
//
//              This module is intended for modeling ONLY. It SHOULD NOT be used
//              as a template for a synthesizable counter module without further
//              guidance. 
//
// Modification History:
// Date        By   Version  Change Description
// ============================================
// 03/22/2022  SA   1        Original
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module counter9bit_sefunmi (enable, clear, clk, count);
   input        enable;		// Active-high counter enable.
   input        clear;		// Asynchronous active-high clear
   input        clk;		// System clock
   output [8:0] count;		// 9-bit counter output
   reg    [8:0] count;		// Variable count is defined procedurally.

   parameter CLRDEL = 10;	// Delay from clear to valid output.
   parameter CLKDEL = 15;	// Delay from clock to valid output.

// Build behavioral 4-bit up-counter with asynchronous clear
   always @(posedge clk or posedge clear) begin
      if(clear)
         count <= #CLRDEL 9'b0;
      else begin
         if(enable) begin
            if(count == 9'd511)
               count <= #CLKDEL 9'b0;
            else
               count <= #CLKDEL count + 9'd1;
         end
      end
   end

endmodule