// Address decoding, is everything in sync with AS ?
assign ROMZONE = |{A23I,A22I,A21,A20};                   // 000000 0FFFFF
assign WRAMZONE = |{A23I,A22I,A21,~A20};                 // 100000 1FFFFF
assign PORTZONE = |{A23I,A22I,~A21,A20};                 // 200000 2FFFFF
assign CTRL1ZONE = |{A23I,A22I,~A21,~A20,A19,A18,A17};   // 300000 31FFFF
assign ICOMZONE = |{A23I,A22I,~A21,~A20,A19,A18,~A17};   // 320000 33FFFF
assign CTRL2ZONE = |{A23I,A22I,~A21,~A20,A19,~A18,A17};  // 340000 35FFFF

assign BITW0 = |{A23I,A22I,~A21,~A20,~A19,A18,A17};      // 380000 39FFFF ?
assign BITW1 = |{A23I,A22I,~A21,~A20,~A19,A18,~A17};     // 3A0000 3BFFFF ?
assign LSPCZONE = |{A23I,A22I,~A21,~A20,~A19,~A18};      // 3C0000 3DFFFF

assign PAL = |{A23I,~A22I};                              // 400000 7FFFFF
assign CARDZONE = |{~A23I,A22I};                         // 800000 BFFFFF
assign SROMZONE = |{~A23I,~A22I,A21,A20};                // C00000 CFFFFF
assign SRAMZONE = |{~A23I,~A22I,A21,~A20};               // D00000 DFFFFF

assign WORDACCSS = LDS|UDS;

assign ROMOEL = ~RW | LDS | ROMZONE;
assign ROMOEU = ~RW | UDS | ROMZONE;
assign PORTOEL = ~RW | LDS | PORTZONE;
assign PORTOEU = ~RW | UDS | PORTZONE;
assign PORTWEL = RW | LDS | PORTZONE;
assign PORTWEU = RW | UDS | PORTZONE;
assign PADRS = PORTZONE;
assign WRL = ~RW | LDS | WRAMZONE;
assign WRU = ~RW | UDS | WRAMZONE;
assign WWL = RW | LDS | WRAMZONE;
assign WWU = RW | UDS | WRAMZONE;
assign SROMOEL = ~RW | LDS | SROMZONE;
assign SROMOEU = ~RW | UDS | SROMZONE;
assign SRAMOEL = ~RW | LDS | SRAMZONE;
assign SRAMOEU = ~RW | UDS | SRAMZONE;
assign SRAMWEL = RW | LDS | SRAMZONE;
assign SRAMWEU = RW | UDS | SRAMZONE;

assign DIPRD0 = ? // Asks NEO-F0 for dipswitches on D0~7 ?

// Not sure about word access, is it LDS|UDS or LDS&UDS or nothing at all ?
assign LSPOE = ~RW | WORDACCESS | LSPCZONE;
assign LSPWE = RW | WORDACCESS | LSPCZONE;
assign CRDO = ~RW | WORDACCESS | CARDZONE;
assign CRDW = RW | WORDACCESS | CARDZONE;
assign CRDC = CRDO & CRDC;

// Inter-CPU comm.
// To do

// Inputs
// To do

// Wait states
// To do
