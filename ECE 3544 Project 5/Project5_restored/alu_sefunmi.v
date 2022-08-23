

module alu_sefunmi(opcode, A, B, Result);
	input  [3:0]  opcode;
	input  [7:0]  A;
	input  [3:0]  B;
	output [15:0] Result;
	wire   [7:0]  aplusb, aminusb, negA;
	assign aplusb = (A+B);
	assign aminusb = (A + (~B) + 1)	;
	assign negA = ((~A) + 1);
	assign Result = 	(opcode == 4'h0) ? {A,B} & 16'b0111100101001001	://
							(opcode == 4'h1) ? {{8{aplusb[7]}},aplusb}		://
							(opcode == 4'h2) ? {{8{aminusb[7]}},aminusb}		://
							(opcode == 4'h3) ? {{8{negA[7]}},negA}				://		
							(opcode == 4'h4) ? {8'b00000000,~(A & B)}			://
							(opcode == 4'h5) ? {8'b00000000,~(A | B)}			://
							(opcode == 4'h6) ? {8'b00000000,A ^ B}				://
							(opcode == 4'h7) ? {8'b00000000,~A}					://
							(opcode == 4'hd) ? {8'b00000000,A}					://
							(opcode == 4'he) ? {8'b00000000,B}					://
							(opcode == 4'hf) ? {12'b000000000000,opcode}		:16'bx;
endmodule
