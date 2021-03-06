
module problem4_sefunmi(digit,hex_display);
	input [3:0] digit;
	output [6:0] hex_display;
	wire [9:0] dec4to10;
        wire enable;

	assign enable = 1'b1;
	decoder4to10_sefunmi DUT1(enable, digit, dec4to10);

	assign hex_display[0] = dec4to10[0] | dec4to10[1] | dec4to10[3] | dec4to10[5] | dec4to10[6] | dec4to10[7] | dec4to10[8] | dec4to10[9];
	assign hex_display[1] = dec4to10[0] | dec4to10[2] | dec4to10[3] | dec4to10[4] | dec4to10[5] | dec4to10[7] | dec4to10[8] | dec4to10[9];	
	assign hex_display[2] = dec4to10[0] | dec4to10[1] | dec4to10[3] | dec4to10[4] | dec4to10[5] | dec4to10[6] | dec4to10[7] | dec4to10[9]; 
	assign hex_display[3] = dec4to10[0] | dec4to10[1] | dec4to10[3] | dec4to10[6] | dec4to10[7] | dec4to10[8] | dec4to10[9]; 
	assign hex_display[4] = dec4to10[0] | dec4to10[6] | dec4to10[8] | dec4to10[9]; 	
	assign hex_display[5] = dec4to10[0] | dec4to10[1] | dec4to10[2] | dec4to10[3] | dec4to10[6] | dec4to10[9];	
	assign hex_display[6] = dec4to10[0] | dec4to10[1] | dec4to10[2] | dec4to10[3] | dec4to10[6] | dec4to10[7] | dec4to10[8]; 
endmodule