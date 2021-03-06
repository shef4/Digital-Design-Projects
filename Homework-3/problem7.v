// Filename:    problem7.v
// Author:   Sefunmi Ashiru   
// Date:     2/28/2022  
// Version:    1 
// Description: using continuous assignment to convert the binary hex value to the active LED to represent that HEX

module sevensegdecoder_proc_sefunmi(hex_digit, hex_display);
   input  [3:0] hex_digit;
   output [6:0] hex_display;
   reg [6:0] hex_display;
   // INSERT YOUR CODE HERE
   always@(hex_digit) begin
        case(hex_digit)
           4'b0000:    hex_display = 7'b1111110;
           4'b0001:    hex_display = 7'b0110000;
           4'b0010:    hex_display = 7'b1101101;
           4'b0011:    hex_display = 7'b1111001;
	   4'b0100:    hex_display = 7'b1110011;
           4'b0101:    hex_display = 7'b1011011;
           4'b0110:    hex_display = 7'b1011111;
           4'b0111:    hex_display = 7'b1110000;
	   4'b1000:    hex_display = 7'b1111111;
           4'b1001:    hex_display = 7'b1111011;
           4'b1010:    hex_display = 7'b1110111;
           4'b1011:    hex_display = 7'b0011111;
	   4'b1100:    hex_display = 7'b1001110;
           4'b1101:    hex_display = 7'b0111101;
           4'b1110:    hex_display = 7'b1001111;
           4'b1111:    hex_display = 7'b1000111;
           default: hex_display = 7'bxxxxxxx;
        endcase
     end
endmodule

