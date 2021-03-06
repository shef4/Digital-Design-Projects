module problem1_sefunmi(a,b,c,d,f);
	input a,b,c,d;
	output f;
	wire [3:0] abcd;
	wire [15:0] dec_abcd;
	wire en, zero;
	assign zero = 1'b0;
	assign en = 1'b1;
	assign abcd = {a,b,c,d};
	decoder4to16_sefunmi DUT1(en, abcd,dec_abcd);

	assign f = dec_abcd[0] | dec_abcd[2] | dec_abcd[3] | dec_abcd[5] | dec_abcd[8] | dec_abcd[9] | dec_abcd[11] | dec_abcd[14] | zero;
endmodule
