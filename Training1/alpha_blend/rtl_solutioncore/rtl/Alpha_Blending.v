/*****************************************************************************************************************************
--
--    File Name    : Alpha_Blending.v 

--    Description  : This module implements Alpha blending of the image
--                   

-- Targeted device : Microsemi-SoC                     
-- Author          : India Solutions Team

-- SVN Revision Information:
-- SVN $Revision: TBD
-- SVN $Date: TBD
--
--
--
-- COPYRIGHT 2015 BY MICROSEMI 
-- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS 
-- FROM MICROSEMI CORP.  IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM 
-- MICROSEMI FOR USE OF THIS FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND 
-- NO BACK-UP OF THE FILE SHOULD BE MADE. 
-- 

--******************************************************************************************************************************/

module Alpha_Blending #(parameter g_V1_DATAWIDTH = 32,
                        parameter g_V2_DATAWIDTH = 24,
                        parameter g_OUTPUT_DATAWIDTH = 24)
                      (input SYS_CLK_I,
                       input RESET_n_I,
                       input[g_V1_DATAWIDTH - 1 : 0] V1_RDATA_i,
                       input[g_V2_DATAWIDTH - 1 : 0] V2_RDATA_i,
                       input[(g_V1_DATAWIDTH / 4) - 1 : 0] AG_i,
                       input Valid_i,
                       input Start_Alpha_blend_i,
                       output reg[(g_OUTPUT_DATAWIDTH - 1) : 0] Vout_o,
                       output reg Vout_valid_o);
  reg[((g_V1_DATAWIDTH / 4) - 1) : 0] O;
  reg[((g_V1_DATAWIDTH / 4) - 1) : 0] I;
  reg[((g_V1_DATAWIDTH / 4) - 1) : 0] l;
  reg[((g_V1_DATAWIDTH / 4) - 1) : 0] o;
  reg[((g_V2_DATAWIDTH / 3) - 1) : 0] i;
  reg[((g_V2_DATAWIDTH / 3) - 1) : 0] OI;
  reg[((g_V2_DATAWIDTH / 3) - 1) : 0] II;
  reg lI;
  reg oI;
  reg[(g_V1_DATAWIDTH + 1) : 0] iI;
  reg[(g_V1_DATAWIDTH + 1) : 0] Ol;
  reg[(g_V1_DATAWIDTH + 1) : 0] Il;
  reg[(g_V1_DATAWIDTH + 1) : 0] ll;
  reg[(g_V1_DATAWIDTH + 1) : 0] ol;
  reg[(g_V1_DATAWIDTH + 1) : 0] il;
  reg[(g_V1_DATAWIDTH + 2) : 0] O0;
  reg[(g_V1_DATAWIDTH + 2) : 0] I0;
  reg[(g_V1_DATAWIDTH + 2) : 0] l0;
  reg[(g_V1_DATAWIDTH + 1) : 0] o0;
  reg[(g_V1_DATAWIDTH + 1) : 0] i0;
  reg[(g_V1_DATAWIDTH + 1) : 0] O1;
  reg I1;
  reg l1;
  reg o1;
  reg[((g_V1_DATAWIDTH / 4) - 1) : 0] i1;
  reg[((g_V1_DATAWIDTH / 4) - 1) : 0] Oo;
  reg[((g_V1_DATAWIDTH / 4) - 1) : 0] Io;
  reg[((g_V1_DATAWIDTH / 4) - 1) : 0] lo;
  reg[((g_V2_DATAWIDTH / 3) - 1) : 0] oo;
  reg[((g_V2_DATAWIDTH / 3) - 1) : 0] io;
  reg[((g_V2_DATAWIDTH / 3) - 1) : 0] Oi;
  reg[7 : 0] Ii;
  reg li;
  reg oi;
  always
    @(posedge SYS_CLK_I,
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        begin
          O <= { (g_V1_DATAWIDTH / 4) { 1'b0 } };
          I <= { (g_V1_DATAWIDTH / 4) { 1'b0 } };
          l <= { (g_V1_DATAWIDTH / 4) { 1'b0 } };
          o <= { (g_V1_DATAWIDTH / 4) { 1'b0 } };
          i <= { (g_V2_DATAWIDTH / 3) { 1'b0 } };
          OI <= { (g_V2_DATAWIDTH / 3) { 1'b0 } };
          II <= { (g_V2_DATAWIDTH / 3) { 1'b0 } };
          lI <= 1'b0;
          oI <= 1'b0;
        end
      else
        begin
          if (Valid_i)
            begin
              o <= V1_RDATA_i[g_V1_DATAWIDTH - 1 : 24];
              O <= V1_RDATA_i[23 : 16];
              I <= V1_RDATA_i[15 : 8];
              l <= V1_RDATA_i[7 : 0];
              i <= V2_RDATA_i[g_V2_DATAWIDTH - 1 : 16];
              OI <= V2_RDATA_i[15 : 8];
              II <= V2_RDATA_i[7 : 0];
              lI <= 1'b1;
              oI <= Start_Alpha_blend_i;
            end
          else
            begin
              O <= { (g_V1_DATAWIDTH / 4) { 1'b0 } };
              I <= { (g_V1_DATAWIDTH / 4) { 1'b0 } };
              l <= { (g_V1_DATAWIDTH / 4) { 1'b0 } };
              o <= { (g_V1_DATAWIDTH / 4) { 1'b0 } };
              i <= { (g_V2_DATAWIDTH / 3) { 1'b0 } };
              OI <= { (g_V2_DATAWIDTH / 3) { 1'b0 } };
              II <= { (g_V2_DATAWIDTH / 3) { 1'b0 } };
              lI <= 1'b0;
              oI <= 1'b0;
            end
        end
    end
  always
    @(posedge SYS_CLK_I,
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        begin
          Ii <= 8'd0;
          i1 <= { (g_V1_DATAWIDTH / 4) { 1'b0 } };
          oo <= { (g_V2_DATAWIDTH / 3) { 1'b0 } };
          Oo <= { (g_V1_DATAWIDTH / 4) { 1'b0 } };
          io <= { (g_V2_DATAWIDTH / 3) { 1'b0 } };
          Io <= { (g_V1_DATAWIDTH / 4) { 1'b0 } };
          Oi <= { (g_V2_DATAWIDTH / 3) { 1'b0 } };
          lo <= { (g_V1_DATAWIDTH / 4) { 1'b0 } };
          oi <= 0;
          li <= 0;
        end
      else
        begin
          if (lI)
            begin
              Ii <= (8'hFF - o);
              i1 <= O;
              oo <= i;
              Oo <= I;
              io <= OI;
              Io <= l;
              Oi <= II;
              lo <= o;
              oi <= 1;
              li <= oI;
            end
          else
            begin
              Ii <= 8'd0;
              i1 <= { (g_V1_DATAWIDTH / 4) { 1'b0 } };
              oo <= { (g_V2_DATAWIDTH / 3) { 1'b0 } };
              Oo <= { (g_V1_DATAWIDTH / 4) { 1'b0 } };
              io <= { (g_V2_DATAWIDTH / 3) { 1'b0 } };
              Io <= { (g_V1_DATAWIDTH / 4) { 1'b0 } };
              Oi <= { (g_V2_DATAWIDTH / 3) { 1'b0 } };
              lo <= { (g_V1_DATAWIDTH / 4) { 1'b0 } };
              oi <= 0;
              li <= 0;
            end
        end
    end
  always
    @(posedge SYS_CLK_I,
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        begin
          iI <= { (g_V1_DATAWIDTH + 2) { 1'b0 } };
          Ol <= { (g_V1_DATAWIDTH + 2) { 1'b0 } };
          Il <= { (g_V1_DATAWIDTH + 2) { 1'b0 } };
          ll <= { (g_V1_DATAWIDTH + 2) { 1'b0 } };
          ol <= { (g_V1_DATAWIDTH + 2) { 1'b0 } };
          il <= { (g_V1_DATAWIDTH + 2) { 1'b0 } };
          I1 <= 1'b0;
        end
      else
        begin
          if (oi)
            begin
              I1 <= 1'b1;
              if (li)
                begin
                  iI <= ({ i1, i1, i1[7] } * { lo, lo, 1'b0 });
                  ll <= ({ oo, oo, oo[7] } * { Ii, Ii, 1'b0 });
                  Ol <= ({ Oo, Oo, Oo[7] } * { lo, lo, 1'b0 });
                  ol <= ({ io, io, io[7] } * { Ii, Ii, 1'b0 });
                  Il <= ({ Io, Io, Io[7] } * { lo, lo, 1'b0 });
                  il <= ({ Oi, Oi, Oi[7] } * { Ii, Ii, 1'b0 });
                end
              else
                begin
                  iI <= { (g_V1_DATAWIDTH + 2) { 1'b0 } };
                  Ol <= { (g_V1_DATAWIDTH + 2) { 1'b0 } };
                  Il <= { (g_V1_DATAWIDTH + 2) { 1'b0 } };
                  ll <= { oo, 26'h000000 };
                  ol <= { io, 26'h000000 };
                  il <= { Oi, 26'h000000 };
                end
            end
          else
            I1 <= 1'b0;
        end
    end
  always
    @(posedge SYS_CLK_I,
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        begin
          O0 <= { (g_V1_DATAWIDTH + 3) { 1'b0 } };
          I0 <= { (g_V1_DATAWIDTH + 3) { 1'b0 } };
          l0 <= { (g_V1_DATAWIDTH + 3) { 1'b0 } };
          l1 <= 1'b0;
        end
      else
        begin
          l1 <= I1;
          O0 <= ll + iI;
          I0 <= ol + Ol;
          l0 <= il + Il;
        end
    end
  always
    @(posedge SYS_CLK_I,
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        begin
          o0 <= { (g_V1_DATAWIDTH + 2) { 1'b0 } };
        end
      else
        begin
          if (O0[g_V1_DATAWIDTH + 2] == 1'b1)
            o0 <= ({ O0[g_V1_DATAWIDTH + 2 : g_V1_DATAWIDTH - 5], O0[g_V1_DATAWIDTH + 2 : g_V1_DATAWIDTH - 5], O0[g_V1_DATAWIDTH + 2] } * { AG_i, AG_i, 1'b0 });
          else
            o0 <= ({ O0[g_V1_DATAWIDTH + 1 : g_V1_DATAWIDTH - 6], O0[g_V1_DATAWIDTH + 1 : g_V1_DATAWIDTH - 6], O0[g_V1_DATAWIDTH + 1] } * { AG_i, AG_i, 1'b0 });
        end
    end
  always
    @(posedge SYS_CLK_I,
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        begin
          i0 <= { (g_V1_DATAWIDTH + 2) { 1'b0 } };
        end
      else
        begin
          if (I0[g_V1_DATAWIDTH + 2] == 1'b1)
            i0 <= ({ I0[g_V1_DATAWIDTH + 2 : g_V1_DATAWIDTH - 5], I0[g_V1_DATAWIDTH + 2 : g_V1_DATAWIDTH - 5], I0[g_V1_DATAWIDTH + 2] } * { AG_i, AG_i, 1'b0 });
          else
            i0 <= ({ I0[g_V1_DATAWIDTH + 1 : g_V1_DATAWIDTH - 6], I0[g_V1_DATAWIDTH + 1 : g_V1_DATAWIDTH - 6], I0[g_V1_DATAWIDTH + 1] } * { AG_i, AG_i, 1'b0 });
        end
    end
  always
    @(posedge SYS_CLK_I,
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        begin
          O1 <= { (g_V1_DATAWIDTH + 2) { 1'b0 } };
        end
      else
        begin
          if (l0[g_V1_DATAWIDTH + 2] == 1'b1)
            O1 <= ({ l0[g_V1_DATAWIDTH + 2 : g_V1_DATAWIDTH - 5], l0[g_V1_DATAWIDTH + 2 : g_V1_DATAWIDTH - 5], l0[g_V1_DATAWIDTH + 2] } * { AG_i, AG_i, 1'b0 });
          else
            O1 <= ({ l0[g_V1_DATAWIDTH + 1 : g_V1_DATAWIDTH - 6], l0[g_V1_DATAWIDTH + 1 : g_V1_DATAWIDTH - 6], l0[g_V1_DATAWIDTH + 1] } * { AG_i, AG_i, 1'b0 });
        end
    end
  always
    @(posedge SYS_CLK_I,
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        begin
          o1 <= 1'b0;
        end
      else
        begin
          o1 <= l1;
        end
    end
  always
    @(posedge SYS_CLK_I,
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        begin
          Vout_o <= { g_OUTPUT_DATAWIDTH { 1'b0 } };
          Vout_valid_o <= 1'b0;
        end
      else
        begin
          if (o1)
            begin
              Vout_o <= { o0[g_V1_DATAWIDTH + 1 : g_V1_DATAWIDTH - 6], i0[g_V1_DATAWIDTH + 1 : g_V1_DATAWIDTH - 6], O1[g_V1_DATAWIDTH + 1 : g_V1_DATAWIDTH - 6] };
              Vout_valid_o <= 1'b1;
            end
          else
            begin
              Vout_o <= { g_OUTPUT_DATAWIDTH { 1'b0 } };
              Vout_valid_o <= 1'b0;
            end
        end
    end
endmodule
