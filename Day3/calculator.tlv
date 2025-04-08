\m5_TLV_version 1d: tl-x.org
\m5

   // =================================================
   // Welcome!  New to Makerchip? Try the "Learn" menu.
   // =================================================

   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   $val1[31:0] = $rand1[3:0];
   $val2[31:0] = $rand2[3:0];
   $op[1:0] = $rand3[1:0];
   $add[31:0] = $val1 + $val2;
   $sub[31:0] = $val1 - $val2;
   $mul[31:0] = $val1 * $val2;
   $div[31:0] = $val1 / $val2;

   $out[31:0] = ($op == 2'b00)
                     ? $add[31:0] :
                ($op == 2'b01)
                     ? $sub[31:0] :
                ($op == 2'b10)
                     ? $mul[31:0] :
                ($op = 2'b11)
                     ? $div[31:0] :
                      32'b0;

   //...

   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
