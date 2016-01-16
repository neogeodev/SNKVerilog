reg [1:0] CKDIV;
reg [2:0] SDIV;
reg 1MB;
reg [5:0] OUT;
reg [2:0] BNK;

assign XOUT = ~XIN;
assign 24M = XOUT;
assign 12M = CKDIV[0];
assign 6MB = ~CKDIV[1];
 
// Guessing the clock divider is a counter ?
always @(posedge 24M)
begin
  if (RESETP)
  begin
    1MB <= 1;
    SDIV <= 0;
    CKDIV <= 0;
  end
  else
  begin
    if (SDIV == 5)
    begin
      1MB <= ~1MB;
      SDIV <= 0;
    end
    else
      SDIV <= SDIV + 1;
    CKDIV <= CKDIV + 1;
  end
end

// Z80 address decode
// To do

assign {OUT6,OUT5,OUT4,OUT3,OUT2,OUT1} = RESETP ? OUT : 6'b000000;
assign {BNK2,BNK1,BNK0} = RESETP ? BNK : 3'b000;

always @(negedge BITWD0)
begin
  if (!A4)
    OUT <= D[5:0];
  else
    BNK <= D[2:0];
end
