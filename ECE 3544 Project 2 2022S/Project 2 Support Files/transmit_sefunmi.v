////////////////////////////////////////////////////////////////////////////////
// Filename:    transmit_sefunmi.v
// Author:      S. Ashiru
// Date:        03/22/2022
// Version:     1
// Description: 
//
// Modification History:
// Date        By   Version  Change Description
// ============================================
// 03/22/2022  SA   1        Original
////////////////////////////////////////////////////////////////////////////////
module transmit_sefunmi(clk, enable, clear, data_out);
   input        clk, enable, clear;
   output [9:0] data_out;
   wire [8:0]count_out;
   wire odd,even;
   counter9bit_sefunmi U1(enable, clear, clk, count_out);
   hc280_sefunmi U2(count_out, even, odd);
   register10bit_sefunmi U3(clk,{odd,count_out}, data_out);
   
endmodule

