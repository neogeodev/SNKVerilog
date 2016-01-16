// SNK NEO-G0 chip logic
// Part of SNKVerilog
// ©2016 furrtek

// Nothing is tested

module NEOG0 (
	inout [15:0] A,
	inout [15:0] B,
	inout [15:0] C,
	input nCEA,
	input nCEB,
	input SELECTL,
	input SELECTU,
	output ORO,
	input ANDI0,
	input ANDI1,
	output ANDO
);

// What happens when both /CE are low on the real chip ? Is there a priority, or does the chip auto-destructs ?

// A0~7 <= B0~7 or C0~7 (B has priority)
assign A[7:0] = SELECTL ? nCEA ? nCEB ? 8'bzzzzzzzz : C[7:0] : B[7:0] : 8'bzzzzzzzz;
// A8~15 <= B8~15 or C8~15 (B has priority)
assign A[15:8] = SELECTU ? nCEA ? nCEB ? 8'bzzzzzzzz : C[15:8] : B[15:8] : 8'bzzzzzzzz;

// B0~7 <= A0~7
assign B[7:0] = nCEA ? 8'bzzzzzzzz : SELECTL ? 8'bzzzzzzzz : A[7:0];
// B8~15 <= A8~15
assign B[15:8] = nCEA ? 8'bzzzzzzzz : SELECTU ? 8'bzzzzzzzz : A[15:8];

// C0~7 <= A0~7
assign C[7:0] = nCEB ? 8'bzzzzzzzz : SELECTL ? 8'bzzzzzzzz : A[7:0];
// C8~15 <= A8~15
assign C[15:8] = nCEB ? 8'bzzzzzzzz : SELECTU ? 8'bzzzzzzzz : A[15:8];

assign ORO = SELECTL | nCEA;
assign ANDO = ANDI0 & ANDI1;

endmodule
