module neo_f0(
	input nRESET,
	input nDIPRD0,
	input nDIPRD1,
	output nBITWD0,
	output nCOUNTOUT,
	input [7:0] DIPSW,
	input [7:4] M68K_ADDR,
	inout [7:0] M68K_DATA,
	input SYSTEMB,
	input TEST, SERVICE, TYPE_A, TYPE_B,
	input [3:0] COINS,
	output [5:0] nSLOT,
	output SLOTA, SLOTB, SLOTC,
	output reg [2:0] LED_LATCH,    // LEDCLK2, LEDCLK1, LEDCLK0 
	output reg [7:0] LED_DATA,
	
	input RTC_DOUT, RTC_TP,
	output RTC_DIN, RTC_CLK, RTC_STROBE
	)

	reg [2:0] REG_RTCCTRL;
	reg [2:0] SLOTS;

	// This is used (among other things) for the RTC
	assign nBITWD0 = |{nBITW0, M68K_ADDR[6:5]};

	// This is used to select NEO-I0
	assign nCOUNTOUT = |{nBITW0, ~M68K_ADDR[6:5]};

	assign RTC_DIN = REG_RTCCTRL[0];
	assign RTC_CLK = REG_RTCCTRL[1];
	assign RTC_STROBE = REG_RTCCTRL[2];

	// REG_DIPSW $300001~?, odd bytes
	// REG_SYSTYPE $300081~?, odd bytes
	assign M68K_DATA = (nDIPRD0) ? 8'bzzzzzzzz :
						(M68K_ADDR[7]) ? {TEST, TYPE_A, 6'b000000} :
						DIPSW;
	
	// REG_STATUS_A $320001~?, odd bytes
	// nDIPRD1: Output IN300~IN304 to D0~D4, and CALTP/CALDOUT to D6/D7
	assign M68K_DATA = (nDIPRD1) ? 8'bzzzzzzzz :
						{RTC_DOUT, RTC_TP, TYPE_B, COINS[3:2], SERVICE, COINS[1:0]};
	
	always @(negedge nRESET or negedge nBITW0)
	begin
		if (!nRESET)
		begin
			SLOTS <= 3'b000;
			REG_RTCCTRL <= 3'b000;
		end
		else if (!nBITWD0)
		begin
			case (M68K_ADDR[6:4])
				3'b010:
					SLOTS <= M68K_DATA[2:0];	// REG_SLOT $380021
				3'b011:
					LED_LATCH <= M68K_DATA[5:3];	// REG_LEDLATCHES $380031
				3'b100:
					LED_DATA <= M68K_DATA[7:0];	// REG_LEDDATA $380041
				3'b101:
					REG_RTCCTRL <= M68K_DATA[2:0];	// REG_RTCCTRL $380051
			endcase
		end
	end
	
	assign {SLOTC, SLOTB, SLOTA} = SYSTEMB ? SLOTS : 3'b000;

	assign nSLOT = SYSTEMB ? 
		(SLOTS == 3'b000) ? 6'b111110 :
		(SLOTS == 3'b001) ? 6'b111101 :
		(SLOTS == 3'b010) ? 6'b111011 :
		(SLOTS == 3'b011) ? 6'b110111 :
		(SLOTS == 3'b100) ? 6'b101111 :
		(SLOTS == 3'b101) ? 6'b011111 :
		6'b111111 :		// Invalid
		6'b111111 ;		// All slots disabled
	
endmodule
