
module decoder4to10_sefunmi(enable, dec_in, dec_out);
	input enable;
	input [3:0] dec_in;
	output [9:0] dec_out;
	wire [9:0] outs;

	assign outs = 	(dec_in == 4'b0000) ? 10'b00000000001 : 
						(dec_in == 4'b0001) ? 10'b00000000010 :
						(dec_in == 4'b0010) ? 10'b00000000100 :
						(dec_in == 4'b0011) ? 10'b00000001000 :
						(dec_in == 4'b0100) ? 10'b00000010000 :
						(dec_in == 4'b0101) ? 10'b00000100000 :
						(dec_in == 4'b0110) ? 10'b00001000000 : 
						(dec_in == 4'b0111) ? 10'b00010000000 :
						(dec_in == 4'b1000) ? 10'b00100000000 : 
						(dec_in == 4'b1001) ? 10'b01000000000 :
						(dec_in == 4'b1010) ? 10'b10000000000 : 10'bxxxxxxxxxx;
	assign dec_out = enable ? outs  : 10'b00000000000;
endmodule