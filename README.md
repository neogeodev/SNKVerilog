# SNKVerilog
Verilog definitions of custom SNK NeoGeo chips, for repairs and preservation.

Details can be found at https://wiki.neogeodev.org/index.php?title=Category:Chips

It seems only Lattice ispMACH4000 devices are 5V-tolerant, small enough and have enough I/Os.

Chip name | CPLD     | Cells used                          | Board done | Tested
--------- | -------- | ----------------------------------- | ---------- | ------
 PCM      | LC4128ZE | <pre>70% ##############------</pre> | Nope       | Nope
 NEO-257  | LC4064ZE | <pre>25% #####---------------</pre> | Nope       | Nope
 NEO-273  | LC4064ZE | <pre>59% ############--------</pre> | Nope       | Nope
 NEO-D0   | LC4064ZE | <pre>62% ############--------</pre> | Nope       | Nope
 NEO-G0   | XC9572XL | <pre>71% ##############------</pre> | Nope       | Nope
 NEO-ZMC2 | XC9572XL | Todo                                | Nope       | Nope
 
See [chip name].v for notes about each chip.
