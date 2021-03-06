// Filename:     comparator_continuous_sefunmi.v
// Author:       S. Ashiru
// Date Created: 20 Febuary 2022
// Version:      1 (Date Last Modified: 20 Febuary 2022) 
// Description:  The circuit accepts two 3-bit inputs representing 
// 		 unsigned binary numbers and provides six outputs that represent 
//               the various results from comparing the two values, by using continuous assignment.



module comparator_continuous_sefunmi(valA, valB, aGTb, aGEb, aLTb, aLEb, aEQb, aNEb);
   input  [2:0] valA, valB;
   output       aGTb, aGEb, aLTb, aLEb, aEQb, aNEb;

   // Your module MUST use continuous assignment and dataflow operators.
   // Your module MUST NOT use procedural assignment.
   // Declare additional wires as needed.
   
   // A == B 
   assign aEQb = (valA == valB);
   // A != B 
   assign aNEb = (valA != valB);
   // A < B 
   assign aLTb = (valA < valB);
   // A <= B 
   assign aLEb = (aLTb <= aEQb); 
   // A > B 
   assign aGTb = (aLTb > aEQb);
   // A >= B
   assign aGEb =  (valA >= aEQb);

endmodule
