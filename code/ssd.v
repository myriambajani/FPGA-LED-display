////////////////////////////////////////////////////////////////////////////////////////////////////
// Filename: ssd.v
// Author: Myriam Bajani 
// Created: 25 September 2024	 
// Version:  1 (modified by MB on 25 September 2024)
// Description: This 4-input, 7 output circuit drives a seven segment display, and is intended in this 
// project to drive HEX0 on the DE10-Lite, an active-low seven-segment display.
//
// All valid codes of my character set:
// 
// 0000
// 0001
// 0010
// 0011
// 0100
// 0101
// 0110
// 0111
// 1000
// 1001
//
////////////////////////////////////////////////////////////////////////////////////////////////////


module ssd(in, out);
	input [3:0] in; 					
	output [6:0] out;					

	// Instantiate wires:
		wire an, bn, cn, dn;
	// out[6]
		wire h6w1, h6w2, h6w3;
	// out[5]
		wire h5w1;
	// out[4]
		wire h4w1;
	// out[3]
		wire h3w1, h3w2;
	// out[2]
		wire h2w1;
	// out[1]
		wire h1w1, h1w2;


	// Instantiate gates:
	
	
	// inverses
		not 	n3g(an, in[3]);
		not 	n2g(bn, in[2]);
		not 	n1g(cn, in[1]);
		not 	n0g(dn, in[0]);
		
	// out[6]
		nand 	h6g1(h6w1, bn, in[1], dn);			// (b'cd')'
		nand 	h6g2(h6w2, cn, in[0]);				// (c'd)'
		nand 	h6g3(h6w3, in[2], in[0]);			// (bd)'
		nand 	h6g4(out[6], h6w1, h6w2, h6w3); 
		
	// out[5]
		nand 	h5g1(h5w1, in[2], cn, in[0]);    // (bc'd)'
		nand 	h5g2(out[5], h5w1, h6w1);    			

	// out[4]
		nand 	h4g1(h4w1, in[3],in[0]); 			// (ad)'		
		nand 	h4g2(out[4], h4w1, h5w1, h6w1);
	
	// out[3]
		nand 	h3g1(h3w1, in[1], dn);      		// (cd')'
		nand 	h3g2(h3w2, in[3], dn);      		// (ad')'
		nand 	h3g3(out[3], h3w1, h3w2, h5w1);	
		
	// out[2]
		nand 	h2g1(h2w1, in[2], cn, dn); 		// (bc'd')'
		nand 	h2g2(out[2], an, h6w1, h2w1);	
		
	// out[1]
		nand 	h1g1(h1w1, cn, dn);	      		// (c'd')'
		nand  h1g2(h1w2, bn, dn);					// (b'd')'
		nand 	h1g3(out[1], h1w1, h1w2); 	

	// out[0]
		nand	h0g1(out[0], an, h6w3, h6w1); 

endmodule
