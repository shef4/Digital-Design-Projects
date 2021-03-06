
module problem5_sefunmi(parity_control,input_word,output_word);
	input parity_control;
	input [7:0] input_word;
	input [8:0] output_word;
	reg parity, tracker, bit_result;
	assign parity = 1'b1;//0-odd 1-even
	assign tracker = 1'b1;
	assign parity = (input_word[0] == 1'b1) ? (~tracker) :
			(input_word[0] == 1'b0) ? (tracker) :
		        1'bx;
	assign tracker = parity;
	assign parity = (input_word[1] == 1'b1) ? (~tracker) :
			(input_word[1] == 1'b0) ? (tracker) :
		        1'bx;
	assign tracker = parity;
	assign parity = (input_word[2] == 1'b1) ? (~tracker) :
			(input_word[2] == 1'b0) ? (tracker) :
		        1'bx;
	assign tracker = parity;
	assign parity = (input_word[3] == 1'b1) ? (~tracker) :
			(input_word[3] == 1'b0) ? (tracker) :
		        1'bx;
	assign tracker = parity;
	assign parity = (input_word[4] == 1'b1) ? (~tracker) :
			(input_word[4] == 1'b0) ? (tracker) :
		        1'bx;
	assign tracker = parity;
	assign parity = (input_word[5] == 1'b1) ? (~tracker) :
			(input_word[5] == 1'b0) ? (tracker) :
		        1'bx;
	assign tracker = parity;
	assign parity = (input_word[6] == 1'b1) ? (~tracker) :
			(input_word[6] == 1'b0) ? (tracker) :
		        1'bx;
	assign tracker = parity;
	assign parity = (input_word[7] == 1'b1) ? (~tracker) :
			(input_word[7] == 1'b0) ? (tracker) :
		        1'bx;
	assign tracker = parity;
	assign bit_result = parity_control ^ tracker;
	assign output_word = {input_word,bit_result};
endmodule