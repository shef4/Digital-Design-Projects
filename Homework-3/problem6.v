
// Filename:    problem6.v
// Author:   Sefunmi Ashiru   
// Date:     2/28/2022  
// Version:    1 
// Description: using continuous assignment to convert the binary hex value to the active LED to represent that HEX

module sevensegdecoder_cont_sefunmi(hex_digit, hex_display);
   input  [3:0] hex_digit;
   output [6:0] hex_display;

   assign hex_display = (hex_digit == 4'b0000) ? 7'b1111110:
			(hex_digit == 4'b0001) ? 7'b0110000:
            		(hex_digit == 4'b0010) ? 7'b1101101:
			(hex_digit == 4'b0011) ? 7'b1111001:
            		(hex_digit == 4'b0100) ? 7'b1110011:
			(hex_digit == 4'b0101) ? 7'b1011011:
            		(hex_digit == 4'b0110) ? 7'b1011111:
			(hex_digit == 4'b0111) ? 7'b1110000:
            		(hex_digit == 4'b1000) ? 7'b1111111:
			(hex_digit == 4'b1001) ? 7'b1111011:
            		(hex_digit == 4'b1010) ? 7'b1110111:
			(hex_digit == 4'b1011) ? 7'b0011111:
            		(hex_digit == 4'b1100) ? 7'b1001110:
			(hex_digit == 4'b1101) ? 7'b0111101:
            		(hex_digit == 4'b1110) ? 7'b1001111:
             		(hex_digit == 4'b1111) ? 7'b1000111: 7'bxxxxxxx;
endmodule
