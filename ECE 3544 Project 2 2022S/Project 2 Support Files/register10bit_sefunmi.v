////////////////////////////////////////////////////////////////////////////////
// Filename:    register10bit_sefunmi.v
// Author:      S. Ashiru
// Date:        03/23/2022
// Version:     1
// Description: This module is a behavioral description of the 74HC280.
//              A 9-bit odd/even parity generator/checker. 
//
// 		This module has one inputs and two output:
//              - data_in: The 9-bit data stream. (input)
//              - even:  An active-high signal to identiy parity is even.(output)
//              - odd:  An active-high signal to identiy parity is odd.(output)
//
//              This module has two parameters:
//              - CLRDEL: Delay from clear asserted to output valid
//              - CLKDEL: Delay from clk rising to output valid
//
// Modification History:
// Date        By   Version  Change Description
// ============================================
// 03/22/2022  SA   1        Original
////////////////////////////////////////////////////////////////////////////////

module register10bit_sefunmi(clk, d_in, q_out); 
   input        clk;
   input  [9:0] d_in; 
   output [9:0] q_out; 
   reg [9:0] q_out;


   always@(posedge clk) begin
        q_out <= d_in;
   end
endmodule
