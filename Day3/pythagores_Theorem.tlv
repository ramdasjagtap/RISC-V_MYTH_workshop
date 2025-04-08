\m5_TLV_version 1d: tl-x.org
\m5
\SV
	`include "sqrt32.v"
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   // pythagores theorem.
   |calc
      @1
         $reset = *reset;
      ?$valid
         @1
            $aa_sq[7:0] = $aa[3:0] * $aa[3:0];
            $bb_sq[7:0] = $bb[3:0] * $bb[3:0];
         @2
            $cc_sq[7:0] = $aa_sq[7:0] + $bb_sq[7:0];
         @3
            $cc[3:0] = sqrt($cc_sq[7:0]);
      @4
         $tot_dist[7:0] =
              $reset ? '0 :
              $valid ? >>1$tot_dist + $cc :
                       >>1$tot_dist;
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
