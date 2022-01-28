// Filename:     comparator_structural_sefunmi.v
// Author:       S. Ashiru
// Date Created: 27 January 2022
// Version:      1 (Date Last Modified: 27 January 2022) 
// Description:  The circuit accepts two 3-bit inputs representing 
// 		 unsigned binary numbers and provides six outputs 
//		 that represent the various results from comparing the two values.

// Time Unit = 1 ns (#1 = 1 ns)
// Simulation Precision = 1 ns
`timescale 1ns/1ns 

module tb_comparator_sefunmi();
     reg  a, b, c_in;
     wire sum, c_out;
     
     adder1bit dut1(a, b, c_in, sum, c_out);
     initial begin
        {a, b, c_in} = 3?b000;
        #20 {a, b, c_in} = 3?b001;
        #20 {a, b, c_in} = 3?b010;
        #20 {a, b, c_in} = 3?b011;
        #20 {a, b, c_in} = 3?b100;
        #20 {a, b, c_in} = 3?b101;
        #20 {a, b, c_in} = 3?b110;
        #20 {a, b, c_in} = 3?b111;
        #20;


endmodule
