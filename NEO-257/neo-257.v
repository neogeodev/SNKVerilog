// SNK NEO-257 chip logic
// Part of SNKVerilog
// ©2016 furrtek

// Nothing is tested

module NEO257 (
	input [15:0] A,
	input [15:0] B,
	output [15:0] Y,
	input SELECT,
	input CS,
	input nCSL,
	input [1:0] nCSU
);

assign Y[7:0] = (CS & ~nCSL) ? SELECT ? A[7:0] : B[7:0] : 8'bzzzzzzzz;
assign Y[15:8] = (CS & ~|{nCSU}) ? SELECT ? A[15:8] : B[15:8] : 8'bzzzzzzzz;

endmodule
