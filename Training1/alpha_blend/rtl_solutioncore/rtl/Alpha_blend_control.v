/*****************************************************************************************************************************
--
--    File Name    : Alpha_blend_control.v

--    Description  : This module implements Alpha blending control part which controls the foreground, background images to 
--                   alpha blending block                

-- Targeted device : Microsemi-SoC                     
-- Author          : India Solutions Team

-- SVN Revision Information:
-- SVN $Revision: TBD
-- SVN $Date: TBD
--
--
--
-- COPYRIGHT 2016 BY MICROSEMI 
-- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS 
-- FROM MICROSEMI CORP.  IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM 
-- MICROSEMI FOR USE OF THIS FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND 
-- NO BACK-UP OF THE FILE SHOULD BE MADE. 
-- 

--******************************************************************************************************************************/

`timescale 1ns/1ps
module alpha_blend_control #(parameter g_IMAGE_DATAWIDTH = 32,
                             parameter g_FRAME_DATAWIDTH = 24,
                             parameter g_OUTPUT_CHANNEL_DATAWIDTH = 24,
                             parameter g_IMAGE_BUFFER_AWIDTH = 11,
                             parameter g_FRAME_BUFFER_AWIDTH = 11,
                             parameter g_IMAGE_X_Y_DATAWIDTH = 11,
                             parameter g_FRAME_X_Y_DATAWIDTH = 11)
                           (input wire SYS_CLK_I,
                            input wire RESET_n_I,
                            input wire video_param_valid_i,
                            input wire[g_IMAGE_DATAWIDTH - 1 : 0] image_data_i,
                            input wire image_valid_i,
                            input wire[g_FRAME_DATAWIDTH - 1 : 0] frame_data_i,
                            input wire frame_valid_i,
                            input wire[g_FRAME_X_Y_DATAWIDTH - 1 : 0] fx_i,
                            input wire[g_FRAME_X_Y_DATAWIDTH - 1 : 0] fy_i,
                            input wire[g_FRAME_X_Y_DATAWIDTH - 1 : 0] frame_width_i,
                            input wire[g_FRAME_X_Y_DATAWIDTH - 1 : 0] frame_height_i,
                            input wire[g_IMAGE_X_Y_DATAWIDTH - 1 : 0] image_width_i,
                            input wire[g_IMAGE_X_Y_DATAWIDTH - 1 : 0] image_height_i,
                            input wire[(g_IMAGE_DATAWIDTH / 4) - 1 : 0] global_alpha_i,
                            output wire[g_OUTPUT_CHANNEL_DATAWIDTH - 1 : 0] vout_o,
                            output wire vout_valid_o,
                            output wire write_image_next_line_o,
                            output wire frame_one_line_done_o,
                            output wire alpha_blend_proc_compl_o);
  parameter[1 : 0] ii = 2'b00,
                   OOI = 2'b01,
                   IOI = 2'b10;
  parameter[0 : 0] lOI = 1'b0,
                   oOI = 1'b1;
  parameter[2 : 0] iOI = 3'd0,
                   OII = 3'd1,
                   III = 3'd2,
                   lII = 3'd3,
                   oII = 3'd4,
                   iII = 3'd5,
                   OlI = 3'd6;
  parameter[2 : 0] IlI = 3'd0,
                   llI = 3'd1,
                   olI = 3'd2,
                   ilI = 3'd3,
                   O0I = 3'd4,
                   I0I = 3'd5,
                   l0I = 3'd6;
  parameter[1 : 0] o0I = 2'd0,
                   i0I = 2'd1,
                   O1I = 2'd2,
                   I1I = 2'd3;
  reg[1 : 0] l1I;
  reg[2 : 0] o1I;
  reg[2 : 0] i1I;
  reg[0 : 0] OoI;
  reg[1 : 0] IoI;
  reg[g_IMAGE_DATAWIDTH - 1 : 0] loI;
  reg[g_FRAME_DATAWIDTH - 1 : 0] ooI;
  reg ioI;
  reg OiI;
  reg[g_IMAGE_BUFFER_AWIDTH - 1 : 0] IiI;
  reg[g_IMAGE_X_Y_DATAWIDTH - 1 : 0] liI;
  reg[g_FRAME_BUFFER_AWIDTH - 1 : 0] oiI;
  reg[g_FRAME_X_Y_DATAWIDTH - 1 : 0] iiI;
  reg OOl;
  reg[g_FRAME_BUFFER_AWIDTH - 1 : 0] IOl;
  reg[g_FRAME_BUFFER_AWIDTH - 1 : 0] lOl;
  reg oOl;
  reg[g_FRAME_X_Y_DATAWIDTH - 1 : 0] iOl;
  reg[g_FRAME_X_Y_DATAWIDTH - 1 : 0] OIl;
  reg IIl;
  reg[g_IMAGE_BUFFER_AWIDTH - 1 : 0] lIl;
  reg oIl;
  reg iIl;
  reg Oll[4 : 0];
  reg Ill[5 : 0];
  reg[g_FRAME_X_Y_DATAWIDTH - 1 : 0] lll;
  reg[g_FRAME_X_Y_DATAWIDTH - 1 : 0] oll;
  reg[g_FRAME_X_Y_DATAWIDTH - 1 : 0] ill;
  reg[g_FRAME_X_Y_DATAWIDTH - 1 : 0] O0l;
  reg[g_IMAGE_X_Y_DATAWIDTH - 1 : 0] I0l;
  reg[g_IMAGE_X_Y_DATAWIDTH - 1 : 0] l0l;
  reg[(g_IMAGE_DATAWIDTH / 4) - 1 : 0] o0l;
  reg i0l;
  wire[g_IMAGE_DATAWIDTH - 1 : 0] O1l;
  wire[g_FRAME_DATAWIDTH - 1 : 0] I1l;
  wire l1l;
  wire o1l;
  assign write_image_next_line_o = iIl;
  assign frame_one_line_done_o = Oll[4];
  assign alpha_blend_proc_compl_o = Ill[5];
  always
    @(posedge SYS_CLK_I,
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        begin
          oll <= { g_FRAME_X_Y_DATAWIDTH { 1'b0 } };
          lll <= { g_FRAME_X_Y_DATAWIDTH { 1'b0 } };
          ill <= { g_FRAME_X_Y_DATAWIDTH { 1'b0 } };
          O0l <= { g_FRAME_X_Y_DATAWIDTH { 1'b0 } };
          I0l <= { g_IMAGE_X_Y_DATAWIDTH { 1'b0 } };
          l0l <= { g_IMAGE_X_Y_DATAWIDTH { 1'b0 } };
          o0l <= { (g_IMAGE_DATAWIDTH / 4) { 1'b0 } };
        end
      else
        begin
          if (video_param_valid_i)
            begin
              oll <= fy_i;
              lll <= fx_i;
              ill <= frame_width_i;
              O0l <= frame_height_i;
              I0l <= image_width_i;
              l0l <= image_height_i;
              o0l <= global_alpha_i;
            end
        end
    end
  always
    @(posedge SYS_CLK_I,
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        begin
          loI <= { g_IMAGE_DATAWIDTH { 1'b0 } };
          ooI <= { g_FRAME_DATAWIDTH { 1'b0 } };
          ioI <= 1'b0;
          OiI <= 1'b0;
        end
      else
        begin
          loI <= image_data_i;
          ooI <= frame_data_i;
          ioI <= image_valid_i;
          OiI <= frame_valid_i;
        end
    end
  always
    @(posedge SYS_CLK_I or
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        begin
          IiI <= { g_IMAGE_BUFFER_AWIDTH { 1'b0 } };
        end
      else
        begin
          if (IiI == (I0l - 1'b1))
            begin
              IiI <= { g_IMAGE_BUFFER_AWIDTH { 1'b0 } };
            end
          else
            begin
              if (ioI == 1'b1)
                begin
                  IiI <= IiI + 1'b1;
                end
            end
        end
    end
  always
    @(posedge SYS_CLK_I or
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        begin
          liI <= { g_IMAGE_X_Y_DATAWIDTH { 1'b0 } };
        end
      else
        begin
          if (liI == (l0l - 1'b1))
            begin
              liI <= { g_IMAGE_X_Y_DATAWIDTH { 1'b0 } };
            end
          else
            if ((IiI == (I0l - 1'b1)) && (ioI == 1'b1))
              begin
                liI <= liI + 1'b1;
              end
        end
    end
  assign o1l = ioI;
  always
    @(posedge SYS_CLK_I or
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        begin
          oiI <= { g_FRAME_BUFFER_AWIDTH { 1'b0 } };
        end
      else
        begin
          if (oiI == (ill - 1'b1))
            begin
              oiI <= { g_FRAME_BUFFER_AWIDTH { 1'b0 } };
            end
          else
            begin
              if (OiI == 1'b1)
                begin
                  oiI <= oiI + 1'b1;
                end
            end
        end
    end
  assign l1l = OiI;
  always
    @(posedge SYS_CLK_I or
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        begin
          iiI <= { g_FRAME_X_Y_DATAWIDTH { 1'b0 } };
        end
      else
        begin
          if (iiI == (O0l - 1'b1))
            begin
              iiI <= { g_FRAME_X_Y_DATAWIDTH { 1'b0 } };
            end
          else
            if ((oiI == (ill - 1'b1)) && (OiI == 1'b1))
              begin
                iiI <= iiI + 1'b1;
              end
        end
    end
  always
    @(posedge SYS_CLK_I or
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        begin
          IoI <= ii;
          OOl <= 1'b0;
        end
      else
        begin
          case (IoI)
            ii:
              begin
                OOl <= 1'b0;
                if ((oiI >= { { (g_FRAME_BUFFER_AWIDTH - 3) { 1'b0 } }, 3'd4 }) && (OiI))
                  begin
                    IoI <= OOI;
                  end
                else
                  begin
                    IoI <= ii;
                  end
              end
            OOI:
              begin
                OOl <= 1'b1;
                IoI <= IOI;
              end
            IOI:
              begin
                if (IOl == (ill - 1'b1))
                  begin
                    OOl <= 1'b0;
                    IoI <= ii;
                  end
                else
                  begin
                    OOl <= 1'b1;
                    IoI <= IOI;
                  end
              end
            default:
              begin
                IoI <= ii;
              end
          endcase
        end
    end
  always
    @(posedge SYS_CLK_I or
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        begin
          IOl <= { g_FRAME_BUFFER_AWIDTH { 1'b0 } };
        end
      else
        begin
          if (OOl)
            begin
              if (IOl == (ill - 1'b1))
                begin
                  IOl <= { g_FRAME_BUFFER_AWIDTH { 1'b0 } };
                end
              else
                begin
                  IOl <= IOl + 1'b1;
                end
            end
          else
            begin
              IOl <= { g_FRAME_BUFFER_AWIDTH { 1'b0 } };
            end
        end
    end
  always
    @(posedge SYS_CLK_I or
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        begin
          lOl <= { g_FRAME_BUFFER_AWIDTH { 1'b0 } };
        end
      else
        begin
          lOl <= IOl;
        end
    end
  always
    @(posedge SYS_CLK_I or
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        begin
          oOl <= 1'b0;
          OoI <= lOI;
        end
      else
        begin
          case (OoI)
            lOI:
              begin
                if (OOl)
                  begin
                    oOl <= 1'b1;
                    OoI <= oOI;
                  end
                else
                  begin
                    oOl <= 1'b0;
                    OoI <= lOI;
                  end
              end
            oOI:
              begin
                if (lOl == (ill - 1'b1))
                  begin
                    oOl <= 1'b0;
                    OoI <= lOI;
                  end
                else
                  begin
                    oOl <= oOl;
                    OoI <= oOI;
                  end
              end
            default:
              OoI <= lOI;
          endcase
        end
    end
  always
    @(posedge SYS_CLK_I or
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        begin
          iOl <= { g_FRAME_X_Y_DATAWIDTH { 1'b0 } };
        end
      else
        begin
          if ((iOl == (O0l - 1'b1)) && (lOl == (ill - 1'b1)))
            begin
              iOl <= { g_FRAME_X_Y_DATAWIDTH { 1'b0 } };
            end
          else
            if (lOl == (ill - 1'b1))
              begin
                iOl <= iOl + 1'b1;
              end
        end
    end
  always
    @(posedge SYS_CLK_I or
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        begin
          OIl <= { g_FRAME_X_Y_DATAWIDTH { 1'b0 } };
        end
      else
        begin
          OIl <= iOl;
        end
    end
  always
    @(posedge SYS_CLK_I or
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        begin
          i0l <= 1'b0;
        end
      else
        begin
          if ((l0l == O0l) && (I0l == ill))
            begin
              i0l <= 1'b1;
            end
          else
            begin
              i0l <= 1'b0;
            end
        end
    end
  always
    @(posedge SYS_CLK_I or
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        begin
          IIl <= 1'b0;
          i1I <= iOI;
        end
      else
        begin
          case (i1I)
            iOI:
              begin
                IIl <= 1'b0;
                if ((oiI == { { (g_FRAME_BUFFER_AWIDTH - 2) { 1'b0 } }, 2'd3 }) && (OiI) && ((lll == { g_FRAME_X_Y_DATAWIDTH { 1'b0 } }) || (i0l)))
                  begin
                    i1I <= OII;
                  end
                else
                  if ((oiI == { { (g_FRAME_BUFFER_AWIDTH - 2) { 1'b0 } }, 2'd3 }) && (OiI) && (lll == { { (g_FRAME_X_Y_DATAWIDTH - 2) { 1'b0 } }, 2'd1 }))
                    begin
                      i1I <= III;
                    end
                  else
                    if ((oiI == { { (g_FRAME_BUFFER_AWIDTH - 4) { 1'b0 } }, 4'd3 }) && (OiI) && (lll != { g_FRAME_X_Y_DATAWIDTH { 1'b0 } }) && (lll != { { (g_FRAME_X_Y_DATAWIDTH - 2) { 1'b0 } }, 2'd1 }) && (!i0l))
                      begin
                        i1I <= lII;
                      end
                    else
                      begin
                        i1I <= iOI;
                      end
              end
            OII:
              begin
                if (iOl >= oll)
                  begin
                    if (IoI == OOI)
                      begin
                        IIl <= 1'b1;
                        i1I <= oII;
                      end
                  end
                else
                  begin
                    IIl <= 1'b0;
                    i1I <= OII;
                  end
              end
            III:
              begin
                if (iOl >= oll)
                  begin
                    if (OOl)
                      begin
                        IIl <= 1'b1;
                        i1I <= oII;
                      end
                  end
                else
                  begin
                    IIl <= 1'b0;
                    i1I <= III;
                  end
              end
            lII:
              begin
                if (iOl >= oll)
                  begin
                    if (IOl == (lll - 1))
                      begin
                        IIl <= 1'b1;
                        i1I <= oII;
                      end
                  end
                else
                  begin
                    IIl <= 1'b0;
                    i1I <= lII;
                  end
              end
            oII:
              begin
                if ((IOl == (lll + I0l - 1)) || (IOl == (ill - 1'b1)))
                  begin
                    i1I <= iII;
                    IIl <= 1'b0;
                  end
                else
                  begin
                    IIl <= IIl;
                    i1I <= oII;
                  end
              end
            iII:
              begin
                IIl <= IIl;
                if (iOl == (oll + l0l - 1))
                  begin
                    i1I <= OlI;
                  end
                else
                  begin
                    i1I <= iOI;
                  end
              end
            OlI:
              begin
                IIl <= 1'b0;
                if (((iOl == (O0l - 1'b1)) && (IOl == (ill - 1'b1))))
                  begin
                    i1I <= iOI;
                  end
                else
                  begin
                    i1I <= OlI;
                  end
              end
            default:
              i1I <= iOI;
          endcase
        end
    end
  always
    @(posedge SYS_CLK_I or
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        begin
          lIl <= { g_IMAGE_BUFFER_AWIDTH { 1'b0 } };
        end
      else
        begin
          if (IIl)
            begin
              if (lIl == (I0l - 1'b1))
                begin
                  lIl <= { g_IMAGE_BUFFER_AWIDTH { 1'b0 } };
                end
              else
                begin
                  lIl <= lIl + 1'b1;
                end
            end
          else
            begin
              lIl <= { g_IMAGE_BUFFER_AWIDTH { 1'b0 } };
            end
        end
    end
  always
    @(posedge SYS_CLK_I or
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        begin
          o1I <= IlI;
          oIl <= 1'b0;
        end
      else
        begin
          case (o1I)
            IlI:
              begin
                oIl <= 1'b0;
                if ((oiI == { { (g_FRAME_BUFFER_AWIDTH - 2) { 1'b0 } }, 2'd3 }) && (OiI) && ((lll == { g_FRAME_X_Y_DATAWIDTH { 1'b0 } }) || (i0l)))
                  begin
                    o1I <= llI;
                  end
                else
                  if ((oiI == { { (g_FRAME_BUFFER_AWIDTH - 2) { 1'b0 } }, 2'd3 }) && (OiI) && (lll == { { (g_FRAME_X_Y_DATAWIDTH - 2) { 1'b0 } }, 2'd1 }))
                    begin
                      o1I <= olI;
                    end
                  else
                    if ((oiI == { { (g_FRAME_BUFFER_AWIDTH - 2) { 1'b0 } }, 2'd3 }) && (OiI) && (lll != { g_FRAME_X_Y_DATAWIDTH { 1'b0 } }) && (!i0l) && (lll != { { (g_FRAME_X_Y_DATAWIDTH - 2) { 1'b0 } }, 2'd1 }))
                      begin
                        o1I <= ilI;
                      end
                    else
                      begin
                        o1I <= IlI;
                      end
              end
            llI:
              begin
                if (iOl >= oll)
                  begin
                    if (IoI == OOI)
                      begin
                        oIl <= 1'b1;
                        o1I <= O0I;
                      end
                  end
                else
                  begin
                    oIl <= 1'b0;
                    o1I <= llI;
                  end
              end
            olI:
              begin
                if (iOl >= oll)
                  begin
                    if (IIl)
                      begin
                        oIl <= 1'b1;
                        o1I <= O0I;
                      end
                  end
                else
                  begin
                    oIl <= 1'b0;
                    o1I <= olI;
                  end
              end
            ilI:
              begin
                if (iOl >= oll)
                  begin
                    if (lOl == (lll - 1))
                      begin
                        oIl <= 1'b1;
                        o1I <= O0I;
                      end
                  end
                else
                  begin
                    oIl <= 1'b0;
                    o1I <= ilI;
                  end
              end
            O0I:
              begin
                if ((lOl == (lll + I0l - 1)) || (lOl == (ill - 1'b1)))
                  begin
                    o1I <= I0I;
                    oIl <= 1'b0;
                  end
                else
                  begin
                    oIl <= oIl;
                    o1I <= O0I;
                  end
              end
            I0I:
              begin
                oIl <= oIl;
                if (OIl == (oll + l0l - 1))
                  begin
                    o1I <= l0I;
                  end
                else
                  begin
                    o1I <= iOI;
                  end
              end
            l0I:
              begin
                oIl <= 1'b0;
                if (((iOl == (O0l - 1'b1)) && (lOl == (ill - 1'b1))))
                  begin
                    o1I <= IlI;
                  end
                else
                  begin
                    o1I <= l0I;
                  end
              end
            default:
              o1I <= IlI;
          endcase
        end
    end
  always
    @(posedge SYS_CLK_I or
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        begin
          iIl <= 1'b0;
          l1I <= o0I;
        end
      else
        begin
          case (l1I)
            o0I:
              begin
                iIl <= 1'b0;
                if ((iOl == oll) && (oiI == { { (g_FRAME_BUFFER_AWIDTH - 2) { 1'b0 } }, 2'd3 }) && (OiI))
                  begin
                    l1I <= i0I;
                  end
                else
                  begin
                    l1I <= o0I;
                  end
              end
            i0I:
              begin
                if (IOl == (lll + I0l - 1))
                  begin
                    l1I <= O1I;
                    iIl <= 1'b1;
                  end
                else
                  if (lOl == (ill - 1'b1))
                    begin
                      l1I <= I1I;
                      iIl <= 1'b1;
                    end
                  else
                    begin
                      l1I <= i0I;
                      iIl <= 1'b0;
                    end
              end
            O1I:
              begin
                iIl <= 1'b0;
                if (lOl == (ill - 1'b1))
                  begin
                    l1I <= I1I;
                  end
                else
                  begin
                    l1I <= O1I;
                  end
              end
            I1I:
              begin
                iIl <= 1'b0;
                if (iOl == (oll + l0l - 1))
                  begin
                    l1I <= o0I;
                  end
                else
                  begin
                    l1I <= i0I;
                  end
              end
            default:
              begin
                l1I <= o0I;
              end
          endcase
        end
    end
  always
    @(posedge SYS_CLK_I or
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        begin
          Oll[0] <= 1'b0;
        end
      else
        begin
          if (lOl == (ill - 1))
            begin
              Oll[0] <= 1'b1;
            end
          else
            begin
              Oll[0] <= 1'b0;
            end
        end
    end
  always
    @(posedge SYS_CLK_I or
      negedge RESET_n_I)
    begin: i1l
      integer Ool;
      if (!RESET_n_I)
        begin
          for (Ool = 1; Ool < 5; Ool = Ool + 1)
            begin
              Oll[Ool] <= 1'b0;
            end
        end
      else
        begin
          for (Ool = 1; Ool < 5; Ool = Ool + 1)
            begin
              Oll[Ool] <= Oll[Ool - 1];
            end
        end
    end
  always
    @(posedge SYS_CLK_I or
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        begin
          Ill[0] <= 1'b0;
        end
      else
        begin
          if ((lOl == (ill - 1)) && (iOl == (O0l - 1'b1)))
            begin
              Ill[0] <= 1'b1;
            end
          else
            begin
              Ill[0] <= 1'b0;
            end
        end
    end
  always
    @(posedge SYS_CLK_I or
      negedge RESET_n_I)
    begin: Iol
      integer lol;
      if (!RESET_n_I)
        begin
          for (lol = 1; lol < 6; lol = lol + 1)
            begin
              Ill[lol] <= 1'b0;
            end
        end
      else
        begin
          for (lol = 1; lol < 6; lol = lol + 1)
            begin
              Ill[lol] <= Ill[lol - 1];
            end
        end
    end
  Alpha_Blending #(.g_V1_DATAWIDTH(g_IMAGE_DATAWIDTH), .g_V2_DATAWIDTH(g_FRAME_DATAWIDTH), .g_OUTPUT_DATAWIDTH(g_OUTPUT_CHANNEL_DATAWIDTH)) ool(.SYS_CLK_I(SYS_CLK_I),
                                                                                                                                                .RESET_n_I(RESET_n_I),
                                                                                                                                                .V1_RDATA_i(O1l),
                                                                                                                                                .V2_RDATA_i(I1l),
                                                                                                                                                .AG_i(o0l),
                                                                                                                                                .Valid_i(oOl),
                                                                                                                                                .Start_Alpha_blend_i(oIl),
                                                                                                                                                .Vout_o(vout_o),
                                                                                                                                                .Vout_valid_o(vout_valid_o));
  ramDualPort_alpha #(.DATA_WIDTH(g_IMAGE_DATAWIDTH), .ADDRESS_WIDTH(g_IMAGE_BUFFER_AWIDTH)) iol(.clk(SYS_CLK_I),
                                                                                                 .addr_a(IiI),
                                                                                                 .data_a(loI),
                                                                                                 .we_a(o1l),
                                                                                                 .addr_b(lIl),
                                                                                                 .q_b(O1l));
  ramDualPort_alpha #(.DATA_WIDTH(g_FRAME_DATAWIDTH), .ADDRESS_WIDTH(g_FRAME_BUFFER_AWIDTH)) Oil(.clk(SYS_CLK_I),
                                                                                                 .addr_a(oiI),
                                                                                                 .data_a(ooI),
                                                                                                 .we_a(l1l),
                                                                                                 .addr_b(IOl),
                                                                                                 .q_b(I1l));
endmodule
