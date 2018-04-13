// SNK NEO-273 chip logic
// Part of SNKVerilog
// ©2016 furrtek

module NEO273 (
	input [19:0] P,
	output [20:5] CA,
	output CA0,
	output CA1,
	output CA2,
	output CA3,
	output [16:4] SA,
	output SA0,
	output SA1,
	output SA2,
	output nCA20,
	input PCK1B,
	input PCK2B
	);
	
	reg [19:0] C_LATCH;
	reg [15:0] S_LATCH;
	
	assign {CA3,CA2,CA1,CA0,CA[20:5]} = C_LATCH;
	assign {SA[4],SA2,SA1,SA0,SA[16:5]} = S_LATCH;
	assign nCA20 = ~CA[20];
	
	always @(posedge PCK1B)
	  C_LATCH <= P;
	
	always @(posedge PCK2B)
	  S_LATCH <= P[15:0];

endmodule
