reg [15:0] S_LATCH;

assign {Q18,Q17,Q16,Q15,Q14,Q13,Q12,Q11,Q8,Q7,Q6,Q5,Q4,Q3,Q2,Q1} = S_LATCH;

always @(posedge PCK2B)
  S_LATCH <= {55,54,53,52,31,30,29,28,22,21,20,19,63,62,61,60};

assign SYNCOUT = SYNCIN ^ SYNCREV;

assign ORO0 = ORI0 | ORI1;

assign ROMOE = ROMOEL & ROMOEU;

// More to do...
