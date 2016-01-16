assign SLOT_NB = {SLOTC,SLOTB,SLOTA};

// Not sure about the behavior if SLOT_NB > 5
assign {SLOT5,SLOT4,SLOT3,SLOT2,SLOT1,SLOT0} =
  SYSTEMB ? 6'b111111 :
  (SLOT_NB == 3'b000) ? 6'b111110 :
  (SLOT_NB == 3'b001) ? 6'b111101 :
  (SLOT_NB == 3'b010) ? 6'b111011 :
  (SLOT_NB == 3'b011) ? 6'b110111 :
  (SLOT_NB == 3'b100) ? 6'b101111 :
  (SLOT_NB == 3'b101) ? 6'b011111 :
  8'b111111;

// Not sure about 6'b000000
assign D[7:0] = (DIPRD|~IN3) ? 8'bzzzzzzzz : A7 ? {IN01,IN00,6'b000000} : DIP[7:0];

// What is D5 ?
assign D[7:0] = (~DIPRD|IN3) ? 8'bzzzzzzzz : {CALDOUT,CALTP,1'b0,IN304,IN303,IN302,IN301,IN300};
