// Filename:     comparator_structural_sefunmi.v
// Author:       S. Ashiru
// Date Created: 27 January 2022
// Version:      1 (Date Last Modified: 27 January 2022) 
// Description:  The circuit accepts two 3-bit inputs representing 
// 		 unsigned binary numbers and provides six outputs 
//		 that represent the various results from comparing the two values.


module comparator_structural_sefunmi(valA, valB, aGTb, aGEb, aLTb, aLEb, aEQb, aNEb);
   input  [2:0] valA, valB;
   output       aGTb, aGEb, aLTb, aLEb, aEQb, aNEb;

   // Your module MUST consist solely of primitive logic gates.
   // Declare additional wires as needed.
   
   // A == B --- (A0'B0' + A0B0)(A1'B1' + A1B1)(A2'B2' + A2B2)
   assign aEQb = (~(valA[0]|valB[0])|(valA[0]&valB[0]))&(~(valA[1]|valB[1])|(valA[1]&valB[1]))&(~(valA[2]|valB[2])|(valA[2]&valB[2]));
   // A != B --- (A == B)'
   assign aNEb = ~aEQb;
   // A < B --- A2'B2 + [(A2'B2' + A2B2) * A1'B1] + [(A2'B2' + A2B2) *[(A1'B' + A1B1) * A0'B0]
   assign aLTb = ((~valA[2])&valB[2]) | ((~(valA[2]|valB[2]) + (valA[2]&valB[2]))&((~valA[1])&valB[1])) | ((~(valA[2]|valB[2]) | (valA[2]&valB[2])) & ((~(valA[1]|valB[1]) | (valA[1]&valB[1]))&((~valA[0])&valB[0])));
   // A <= B --- A < B + A == B
   assign aLEb = aLTb | aEQb; 
   // A > B --- (A>B + A==B)'
   assign aGTb = ~(aLTb | aEQb);
   // A >= B --- A > B + A == B
   assign aGEb = aGTb | aEQb;
endmodule
