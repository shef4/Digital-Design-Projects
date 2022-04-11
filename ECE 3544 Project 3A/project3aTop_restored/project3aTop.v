////////////////////////////////////////////////////////////////////////////////
// Filename: project3aTop.v
// Author:   Jason Thweatt
// Date:     24 October 2017
// Revision: 1
//
// This is the top-level module for ECE 3544 Project 3a.
// Do not modify the module declaration or ports in this file.
// When synthesizing to the DE1-SoC, this file should be used with the provided
// Quartus project so that the FPGA pin assignments are made correctly.
//
// YOU MUST MAKE THE PIN ASSIGNMENTS FOR THE INPUTS AND OUTPUTS OF THIS MODULE.
// FOLLOW THE INSTRUCTIONS IN THE DOCUMENT ON PIN PLACEMENT.
// CONSULT THE MANUAL FOR INFORMATION ON THE PIN LOCATIONS.

module project3aTop(SW, LED, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
   input  [9:0] SW;
   output [9:0] LED;
   output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	wire odd1t, odd2t, odd3t, odd1r, odd2r, odd3r, even1t, even2t, even3t, even1r, even2r, even3r;
	wire [6:0] bc_output;
	wire [8:0] pcinput_1t,pcinput_2t,pcinput_3t, pcinput_1r,pcinput_2r,pcinput_3r;
// This should allow you to see the values of the switches on the LEDs.

// This maps certain switches to the seven-segment display inputs.
// Use this as an example of instantiating in the top-level module, and as a
// test of your seven-segment displays. 
// You may leave these instantiations in place in your final submission, since
// Project 3A does not use the seven-segment displays.

   project3aTest U0(SW[1:0], HEX0);
	project3aTest U1(SW[3:2], HEX1);
	project3aTest U2(SW[5:4], HEX2);
	project3aTest U3(SW[7:6], HEX3);
	project3aTest U4(SW[9:8], HEX4);
   project3aTest U5(SW[9:8], HEX5);	 

// Your top-level module should conform to block diagram provided in the
// specification. It should contain:
// - Six instantiations of your 74HC280.
//   - Three represent "transmit-side" parity checkers. Use the appropriate
//     bits of SW[6:0] as the inputs to these parity checkers. YOU WILL NOT
//     USE ALL OF THE BIT OF SW[6:0] as the inputs to these parity checkers.
//   - Three represent "receive-side" parity checkers. Use the appropriate
//     outputs of the bit corrupter module as the inputs to these parity
//     checkers. YOU WILL NOT USE ALL OF THE BIT CORRUPTER outputs as the
//     inputs to these parity checkers.
// - One instantiation of your Bit Corrupter module. Use SW[6:0] as the 7-bit
//   input word. Use SW[9:7] as the index input. Use the appropriate outputs
//   of the bit corrupter module as the inputs to the "receive-side" parity
//   checkers. 
// - Three 2-input XOR gates. Connect corresponding pairs of "transmit-side" and
//   "receive-side" parity checker outputs as the inputs of your XOR gates.
   assign pcinput_1t = {4'b0000,SW[6],SW[4],SW[2],SW[0]};
	assign pcinput_2t = {4'b0000,SW[6],SW[5],SW[2],SW[1]};
	assign pcinput_3t = {4'b0000,SW[6],SW[5],SW[4],SW[3]};
   hc280_sefunmi PC1Trans(pcinput_1t, even1t, odd1t);
	hc280_sefunmi PC2Trans(pcinput_2t, even2t, odd2t);
	hc280_sefunmi PC3Trans(pcinput_3t, even3t, odd3t);
	
	assign LED[6:0] = SW[6:0];
	bit_corrupter BC(SW[9:7], SW[6:0], bc_output);
	
	assign pcinput_1r = {4'b0000,bc_output[6],bc_output[5],bc_output[4],bc_output[3]};
	assign pcinput_2r = {4'b0000,bc_output[6],bc_output[5],bc_output[2],bc_output[1]};
	assign pcinput_3r = {4'b0000,bc_output[6],bc_output[5],bc_output[4],bc_output[3]};
	hc280_sefunmi PC1Rec(pcinput_1r, even1r, odd1r);
	hc280_sefunmi PC2Rec(pcinput_2r, even2r, odd2r);
	hc280_sefunmi PC3Rec(pcinput_3r, even3r, odd3r);

	xor XOR1(LED[7], odd1r, odd1t);
	xor XOR2(LED[8], odd2r, odd2t);
	xor XOR3(LED[9], odd3r, odd3t);

endmodule

