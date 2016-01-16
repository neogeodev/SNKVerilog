// What happens when both /CE are low ? Chip auto-destructs ?

// A0~7 <= B0~7 or C0~7 (B has priority)
assign {18,17,16,15,5,4,3,2} = 40 ? 39 ? 51 ? 8'bzzzzzzzz : {14,13,12,11,9,8,7,6} : {24,23,22,21,1,64,63,62} : 8'bzzzzzzzz;
// A8~15 <= B8~15 or C8~15 (B has priority)
assign {50,49,48,47,34,33,32,31} = 52 ? 39 ? 51 ? 8'bzzzzzzzz : {46,45,44,43,30,29,28,27} : {56,55,54,53,38,37,36,35} : 8'bzzzzzzzz;

// B0~7 <= A0~7
assign {24,23,22,21,1,64,63,62} = 39 ? 8'bzzzzzzzz : 40 ? 8'bzzzzzzzz : {18,17,16,15,5,4,3,2};
// B8~15 <= A8~15
assign {56,55,54,53,38,37,36,35} = 39 ? 8'bzzzzzzzz : 52 ? 8'bzzzzzzzz : {50,49,48,47,34,33,32,31};

// C0~7 <= A0~7
assign {14,13,12,11,9,8,7,6} = 51 ? 8'bzzzzzzzz : 40 ? 8'bzzzzzzzz : {18,17,16,15,5,4,3,2};
// C8~15 <= A8~15
assign {46,45,44,43,30,29,28,27} = 51 ? 8'bzzzzzzzz : 52 ? 8'bzzzzzzzz : {50,49,48,47,34,33,32,31};

assign 41 = 40 | 39;
assign 59 = 60 & 61;