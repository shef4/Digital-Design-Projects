
// Filename:     comparator_structural_sefunmi.v
// Author:       S. Ashiru
// Date Created: 27 January 2022
// Version:      1 (Date Last Modified: 27 January 2022) 
// Description:  The circuit accepts two 3-bit inputs representing 
// 		 unsigned binary numbers and provides six outputs 
//		 that represent the various results from comparing the two values.

// Time Unit = 1 ns (#1 = 1 ns)
// Simulation Precision = 1 ns
`timescale 1ns/1ns 

module tb_cmos();
   supply1 pwr;
   supply0 gnd;

   reg gate;
   reg source;
   wire nmos_drain;
   wire pmos_drain;

   nmos u2(nmos_drain, source, gate);
   pmos u1(pmos_drain, source, gate);

   initial begin	
      #1;
      {gate, source} = {gnd, gnd};
      #99;
      {gate, source}  = {gnd, pwr};
      #100;
      {gate, source}  = {pwr, gnd};
      #100;
      {gate, source}  = {pwr, pwr};
      #100;
   end
endmodule