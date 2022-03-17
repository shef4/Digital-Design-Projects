// Filename:    problem1.v
// Author:   Sefunmi Ashiru   
// Date:     2/28/2022  
// Version:    1 
// Description: This file contains a module for a 5 input circuit.
// It determines, whether or not the majrity of inout values are logic 1.
// using strututral models

module problem1_sefunmi(vote, majority);
   input  [4:0] vote;
   output       majority;
   wire b_c_d, c_d_e, b_d_e, b_c_e, a_d_e, a_c_e, a_c_d, a_b_e, a_b_d, a_b_c;

   // F = BCD + CDE + BDE + BCE + ADE + ACE + ACD + ABE + ABD + ABC
   and(b_c_d, vote[1], vote[2], vote[3]);
   and(c_d_e, vote[2], vote[3], vote[4]);
   and(b_d_e, vote[1], vote[3], vote[4]);
   and(b_c_e, vote[1], vote[2], vote[4]);
   and(a_d_e, vote[0], vote[3], vote[4]);
   and(a_c_e, vote[0], vote[2], vote[4]);
   and(a_c_d, vote[0], vote[2], vote[3]);
   and(a_b_e, vote[0], vote[1], vote[4]);
   and(a_b_d, vote[0], vote[1], vote[3]);
   and(a_b_c, vote[0], vote[1], vote[2]);

   or(majority, b_c_d,c_d_e, b_d_e, b_c_e, a_d_e, a_c_e, a_c_d, a_b_e, a_b_d, a_b_c);

endmodule
