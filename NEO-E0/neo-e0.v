assign AND0 = ANI0 & ANI1;
assign {A23I,A22I} = A[23:22] ^ 2{~|{A[21:7],^A[23:22],VEC}};

// Memcard address stuff
// To do
