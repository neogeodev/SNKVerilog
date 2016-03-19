input CLK_68KCLKB,
input nSDROE, nSDRMPX,
input nSDPOE, nSDPMPX,
inout [7:0] SDRAD,
input [9:8] SDRA,
input [23:20] SDRA,
inout [7:0] SDPAD,
input [11:8] SDPA,
input [7:0] D,
output [23:0] A

reg [1:0] COUNT;
reg [7:0] RDLATCH;
reg [7:0] PDLATCH;
reg [23:0] RALATCH;
reg [23:0] PALATCH;

assign SDRMPX = ~nSDRMPX;
assign SDPMPX = ~nSDPMPX;
assign SDPOE = ~nSDPOE;
assign nCEN = COUNT[1];
assign nCLR = nSDPOE;

always @(posedge CLK_68KCLKB)
begin
	if (!nCLR)
		COUNT <= 2'b0;
	else
		if (!nCEN) COUNT <= COUNT + 1'b1;
end

assign SDRAD = nSDROE ? 8'bzzzzzzzz : RDLATCH;
always @(nCEN)
	if (nCEN) RDLATCH <= D;

assign SDPAD = nSDPOE ? 8'bzzzzzzzz : PDLATCH;
always @(SDPOE)
	if (SDPOE) PDLATCH <= D;

assign A = nSDPOE ? RALATCH : PALATCH;

always @(posedge nSDRMPX)
begin
	RALATCH[7:0] <= SDRAD[7:0];
	RALATCH[9:8] <= SDRA[9:8];
end
always @(posedge SDRMPX)
begin
	RALATCH[17:10] <= SDRAD[7:0];
	RALATCH[23:18] <= {SDRA[23:20], SDRA[9:8]};
end

always @(posedge nSDPMPX)
begin
	PALATCH[7:0] <= SDPAD[7:0];
	PALATCH[11:8] <= SDPA[11:8];
end
always @(posedge SDPMPX)
begin
	PALATCH[19:12] <= SDPAD[7:0];
	PALATCH[23:20] <= SDPA[11:8];
end
