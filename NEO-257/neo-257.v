// SNK NEO-257 chip logic
// Part of SNKVerilog
// ©2016 furrtek

// Fits in a XC9572XL
// Nothing is tested

module NEO257 (
	input [15:0] A,
	input [15:0] B,
	output [15:0] Y,
	input SELECT,
	input CS,
	input nOEL,
	input [1:0] nOEU
);

assign Y[7:0] = (CS & ~nOEL) ? SELECT ? B[7:0] : A[7:0] : 8'bzzzzzzzz;
assign Y[15:8] = (CS & ~|{nOEU}) ? SELECT ? B[15:8] : A[15:8] : 8'bzzzzzzzz;

endmodule
