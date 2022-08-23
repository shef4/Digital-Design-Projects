
module hex_display(digit,hex_display);
	input [3:0] digit;
	output [6:0] hex_display;
	wire [15:0] dec4to16;
   wire enable;

	assign enable = 1'b1;
	decoder4to16_sefunmi DUT1(enable, digit, dec4to16);

	assign hex_display[0] = dec4to16[1] | dec4to16[4] | dec4to16[11] | dec4to16[13];
	assign hex_display[1] = dec4to16[5] | dec4to16[6] | dec4to16[11] | dec4to16[12] | dec4to16[14] | dec4to16[15];	
	assign hex_display[2] = dec4to16[2] | dec4to16[12] | dec4to16[14] | dec4to16[15]; 
	assign hex_display[3] = dec4to16[1] | dec4to16[4] | dec4to16[7] | dec4to16[10] | dec4to16[15]; 
	assign hex_display[4] = dec4to16[1] | dec4to16[3] | dec4to16[4] | dec4to16[5] | dec4to16[7] | dec4to16[9]; 	
	assign hex_display[5] = dec4to16[1] | dec4to16[2] | dec4to16[3] | dec4to16[7]| dec4to16[13];	
	assign hex_display[6] = dec4to16[0] | dec4to16[1] | dec4to16[7] | dec4to16[12]; 
endmodule