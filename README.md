# SNKVerilog
Verilog definitions of custom SNK NeoGeo chips, for repairs and preservation.

Also see https://github.com/neogeodev/NeoChips

Details can be found at https://wiki.neogeodev.org/index.php?title=Category:Chips

The only 5V-tolerant parts still made with enough I/Os and small enough are Microchip ATF and Lattice 4000ZE.

Chip name | CPLD     | Cells used                          
--------- | -------- | -----------------------------------
 PCM      | LC4128ZE | <pre>70% ##############------</pre>
 NEO-257  | LC4064ZE | <pre>25% #####---------------</pre>
 NEO-273  | LC4064ZE | <pre>59% ############--------</pre>
 NEO-D0   | LC4064ZE | <pre>62% ############--------</pre>
 NEO-G0   | XC9572XL | <pre>71% ##############------</pre>
 
See [chip name].v for notes about each chip.

