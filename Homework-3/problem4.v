// name:    problem4.v
// Author:   Sefunmi Ashiru   
// Date:     2/28/2022  
// Version:    1 
// Description: This file contains a module for a 5 input circuit.
// It determines, whether or not the majority of inout values are logic 1.
// using behaviorial models

module problem4_sefunmi(vote, majority);
   input  [4:0] vote;
   output       majority;

   // F = BCD + CDE + BDE + BCE + ADE + ACE + ACD + ABE + ABD + ABC
   assign majority = (vote[1]&vote[2]&vote[3])|(vote[2]&vote[3]&vote[4])|(vote[1]&vote[3]&vote[4])|(vote[1]&vote[2]&vote[4])|(vote[0]&vote[3]&vote[4])|(vote[0]&vote[2]&vote[4])|(vote[0]&vote[2]&vote[3])|(vote[0]&vote[1]&vote[4])|(vote[0]&vote[1]&vote[3])|(vote[0]&vote[1]&vote[2]);
endmodule
