// SNK NEO-273 chip logic
// Part of SNKVerilog
// ©2016 furrtek

module clocks(
	input CLK_24M,
	input nRESETP,
	output CLK_12M,
	output reg CLK_68KCLK = 1'b0,
	output CLK_68KCLKB,
	output CLK_6MB,
	output reg CLK_1MB
	);
	
	reg [2:0] CLK_DIV;
	wire CLK_3M;
	
	always @(posedge CLK_24M)
		CLK_68KCLK <= ~CLK_68KCLK;
	
	assign CLK_68KCLKB = ~CLK_68KCLK;
	
	always @(negedge CLK_24M or negedge nRESETP)
	begin
		if (!nRESETP)
			CLK_DIV <= 3'b100;
		else
			CLK_DIV <= CLK_DIV + 1'b1;
	end
	
	assign CLK_12M = CLK_DIV[0];
	assign CLK_6MB = ~CLK_DIV[1];
	assign CLK_3M = CLK_DIV[2];
	
	always @(posedge CLK_12M)
		CLK_1MB <= ~CLK_3M;
	
endmodule
