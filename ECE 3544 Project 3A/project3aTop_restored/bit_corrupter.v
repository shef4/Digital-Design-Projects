// Date:        04/03/2022
// Version:     1
// Description: This module is a behavioral description of a single bit corruptor
//
// Modification History:
// Date        By   Version  Change Description
// ============================================
// 04/03/2022  SA   1        Original
////////////////////////////////////////////////////////////////////////////////
module bit_corrupter (index, input_word, output_word);
   input  [2:0] index;
   input  [7:1] input_word;
   output [7:1] output_word; 
   assign output_word = (index == 3'b000) ? input_word:
			(index == 3'b001) ? {input_word[7:2],~input_word[1]}:
			(index == 3'b010) ? {input_word[7:3],~input_word[2],input_word[1]}:
			(index == 3'b011) ? {input_word[7:4],~input_word[3],input_word[2:1]}:
			(index == 3'b100) ? {input_word[7:5],~input_word[4],input_word[3:1]}:
			(index == 3'b101) ? {input_word[7:6],~input_word[5],input_word[4:1]}:
			(index == 3'b110) ? {input_word[7],~input_word[6],input_word[5:1]}:
			(index == 3'b111) ? {~input_word[7],input_word[6:1]}:7'bxxxxxxx;
endmodule