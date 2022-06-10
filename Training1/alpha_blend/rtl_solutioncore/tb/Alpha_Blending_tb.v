/*****************************************************************************************************************************
--
--    File Name    : Alpha_Blending_tb.v 

--    Description  : This module provides the test environment for Alpha Blending IP.

					 Following files are required for the simulation :
					 Foreground_RGBA.txt --> It contains hex values which are in the following format:
											 First 2 bytes represents width of the image, next 2 bytes height of the image.
											 Then follows B,G,R and Alpha values.
											 For more details visit Microsemi Video Web Page.
--                   Background_RGB.txt -->  It contains hex values which are in the following format: 
											 First 2 bytes width of the image, next 2 bytes height of the image.
											 Then follows B,G and R values.
											 For more details visit Microsemi Video Web Page.    

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
module alpha_blend_test;
  /************************************************************************
          Parameters 
  *************************************************************************/
  parameter IMAGE_WIDTH = 60;
  parameter IMAGE_HEIGHT = 60;
  parameter FRAME_WIDTH = 320;
  parameter FRAME_HEIGHT = 200;
  parameter CLKPERIOD = 10;
  parameter IMAGE_FILE_NAME = "tb/Foreground_RGBA.txt"; 				   
  parameter FRAME_FILE_NAME = "tb/Background_RGB.txt";                                                                                                 
  //Parameters from the DUT
  parameter g_IMAGE_DATAWIDTH = 32;
  parameter g_FRAME_DATAWIDTH = 24;
  parameter g_OUTPUT_CHANNEL_DATAWIDTH = 24;
  parameter g_IMAGE_BUFFER_AWIDTH = 11;
  parameter g_FRAME_BUFFER_AWIDTH = 11;
  parameter g_IMAGE_X_Y_DATAWIDTH = 11;
  parameter g_FRAME_X_Y_DATAWIDTH = 11;
  localparam IMAGE_SIZE = ((IMAGE_WIDTH * IMAGE_HEIGHT * (g_IMAGE_DATAWIDTH / 8)) + 4);
  localparam FRAME_SIZE = ((FRAME_WIDTH * FRAME_HEIGHT * (g_FRAME_DATAWIDTH / 8)) + 4);
  localparam IMAGE_SIZE_32 = IMAGE_WIDTH * IMAGE_HEIGHT;
  localparam FRAME_SIZE_24 = FRAME_WIDTH * FRAME_HEIGHT;
  localparam[1 : 0] IMAGE_IDLE = 0,
                    IMAGE_READ = 1,
                    IMAGE_WAIT = 2,
                    IMAGE_DONE = 3;
  localparam[1 : 0] FRAME_IDLE = 0,
                    FRAME_READ = 1,
                    FRAME_WAIT = 2,
                    FRAME_DONE = 3;
  /************************************************************************
          Inputs and Outputs to the DUT 
  *************************************************************************/
  reg Clock;
  reg Reset;
  reg video_param_valid_i;
  reg[g_IMAGE_DATAWIDTH - 1 : 0] image_data_i;
  reg image_valid_i;
  reg[g_FRAME_DATAWIDTH - 1 : 0] frame_data_i;
  reg frame_valid_i;
  reg[g_FRAME_X_Y_DATAWIDTH - 1 : 0] fx_i;
  reg[g_FRAME_X_Y_DATAWIDTH - 1 : 0] fy_i;
  reg[g_FRAME_X_Y_DATAWIDTH - 1 : 0] frame_width_i;
  reg[g_FRAME_X_Y_DATAWIDTH - 1 : 0] frame_height_i;
  reg[g_IMAGE_X_Y_DATAWIDTH - 1 : 0] image_width_i;
  reg[g_IMAGE_X_Y_DATAWIDTH - 1 : 0] image_height_i;
  reg[(g_IMAGE_DATAWIDTH / 4) - 1 : 0] global_alpha_i;
  wire[g_OUTPUT_CHANNEL_DATAWIDTH - 1 : 0] vout_o;
  wire vout_valid_o;
  wire write_image_next_line_o;
  wire frame_one_line_done_o;
  wire alpha_blend_proc_compl_o;
  reg[1 : 0] image_state,
             frame_state;
  reg[7 : 0] image_8a[IMAGE_SIZE - 1 : 0];
  reg[7 : 0] image_8b[FRAME_SIZE - 1 : 0];
  reg[31 : 0] image_32[IMAGE_SIZE_32 : 0];
  reg[23 : 0] frame_24[FRAME_SIZE_24 : 0];
  reg[23 : 0] alpha_mem[FRAME_SIZE_24 - 1 : 0];
  reg[7 : 0] mem_final[(FRAME_SIZE_24 * 4) - 1 : 0];
  integer image_counter_h,
          image_counter_v,
          frame_counter_h,
          frame_counter_v;
  integer i,
          j,
          m,
          n,
          k,
          l,
          x,
          p,
	  File_1;
  integer counter,
          counter_v_out,
          counter_h_out;
  reg[3 : 0] count_done;
  initial
    begin
      $display("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      $display(">>>>>>>>            ALPHA BLENDING IP SIMULATION STARTED                            <<<<<<<");
      $display("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      Clock = 0;
      video_param_valid_i = 0;
      image_data_i = 0;
      image_valid_i = 0;
      frame_data_i = 0;
      frame_valid_i = 0;
      fx_i = 11'd0;
      fy_i = 11'd0;
      frame_width_i = FRAME_WIDTH;
      frame_height_i = FRAME_HEIGHT;
      image_width_i = IMAGE_WIDTH;
      image_height_i = IMAGE_HEIGHT;
      global_alpha_i = 8'hff;
      p = 0;
      l = 0;
      x = 0;
      k = 0;
      i = 0;
      j = 0;
      m = 0;
      n = 0;
      image_counter_h = 0;
      image_counter_v = 0;
      frame_counter_h = 0;
      frame_counter_v = 0;
      counter = 0;
      frame_state = 0;
      image_state = 0;
      count_done = 0;
      counter_v_out = 0;
      counter_h_out = 0;
    end
  /************************************************************************
          CLOCK_GEN : Generates 
  *************************************************************************/
  initial
    begin
      forever
        #(CLKPERIOD / 2)
        Clock = ~Clock;
    end
  /************************************************************************
          RESET : Generates a reset pulse 
  *************************************************************************/
  initial
    begin
    File_1 = $fopen("alpha_blended_out.txt","wb");
      Reset = 1;
      #4
      Reset = 0;
      #2
      Reset = 1;
    end
  /************************************************************************
          Read the input image 
  *************************************************************************/
  initial
    begin
      $readmemh(IMAGE_FILE_NAME, image_8a);
      for (i = 0; i <= (IMAGE_SIZE_32); i = i + 1)
        begin
          image_32[i] = ({ 24'b0, image_8a[i * 4 + 3] } << 24) | ({ 24'b0, image_8a[i * 4 + 2] } << 16) | ({ 24'b0, image_8a[i * 4 + 1] } << 8) | (image_8a[i * 4]);
        end
      $display("");
      $display("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      $display(">>>>>>>>                     IMAGE LOADED                                           <<<<<<<");
      $display("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    end
  /************************************************************************
          Process to generate video_param_valid_i pulse
  *************************************************************************/
  always
    @(posedge Clock)
    begin
      if (!Reset)
        video_param_valid_i = 0;
      else
        begin
          if (counter == 32'd2)
            video_param_valid_i = 1;
          else
            video_param_valid_i = 0;
        end
    end
  always
    @(posedge Clock)
    begin
      counter = counter + 1;
    end
  /******************************************************************************
          Debug signal: Input image veritical counter 
  *******************************************************************************/
  always
    @(posedge Clock)
    begin
      if ((Reset == 1) && (write_image_next_line_o == 1))
        image_counter_v = image_counter_v + 1;
      else
        image_counter_v = image_counter_v;
    end
  /******************************************************************************
          FSM to process the input image where each pixel consists of R,G,B and Alpha 
  *******************************************************************************/
  always
    @(posedge Clock)
    begin
      if (!Reset)
        image_state = 0;
      else
        begin
          case (image_state)
            IMAGE_IDLE:
              begin
                image_state = IMAGE_READ;
              end
            IMAGE_READ:
              begin
                if ((image_counter_h == (image_width_i)) && (Reset == 1))
                  begin
                    image_valid_i = 0;
                    image_state = IMAGE_WAIT;
                  end
                else
                  begin
                    if ((image_counter_h < (image_width_i)) && (Reset == 1))
                      begin
                        image_valid_i = 1;
                        j = j + 1;
                        image_data_i = image_32[j];
                        image_counter_h = image_counter_h + 1;
                        image_state = IMAGE_READ;
                      end
                    else
                      image_state = IMAGE_READ;
                  end
              end
            IMAGE_WAIT:
              begin
                if (image_counter_v == image_height_i)
                  begin
                    image_valid_i = 0;
                    image_state = IMAGE_DONE;
                  end
                else
                  begin
                    if (write_image_next_line_o)
                      begin
                        image_counter_h = 0;
                        image_state = IMAGE_READ;
                      end
                    else
                      begin
                        image_state = IMAGE_WAIT;
                      end
                  end
              end
            IMAGE_DONE:
              begin
                if (alpha_blend_proc_compl_o)
                  $finish;
                else
                  image_state = IMAGE_DONE;
              end
          endcase
        end
    end
  /***********************************************************************
          Read the input frame 
  ************************************************************************/
  initial
    begin
      $readmemh(FRAME_FILE_NAME, image_8b);
      for (m = 0; m <= FRAME_SIZE_24; m = m + 1)
        begin
          frame_24[m] = ({ 16'b0, image_8b[m * 3 + 3] } << 16) | ({ 16'b0, image_8b[m * 3 + 2] } << 8) | (image_8b[m * 3 + 1]);
        end
      $display("");
      $display("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      $display(">>>>>>>>                     FRAME LOADED                                           <<<<<<<");
      $display("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    end
  /******************************************************************************
          Debug signal: Input frame veritical counter 
  *******************************************************************************/
  always
    @(posedge Clock)
    begin
      if ((Reset == 1) && (frame_one_line_done_o == 1))
        frame_counter_v = frame_counter_v + 1;
      else
        frame_counter_v = frame_counter_v;
    end
  /******************************************************************************
          FSM to process the input frame where each pixel consists of R,G, and B 
  *******************************************************************************/
  always
    @(posedge Clock)
    begin
      if (!Reset)
        frame_state = 0;
      else
        begin
          case (frame_state)
            FRAME_IDLE:
              begin
                frame_state = FRAME_READ;
              end
            FRAME_READ:
              begin
                if ((frame_counter_h == (frame_width_i)) && (Reset == 1))
                  begin
                    frame_valid_i = 0;
                    frame_state = FRAME_WAIT;
                  end
                else
                  begin
                    if ((frame_counter_h < (frame_width_i)) && (Reset == 1))
                      begin
                        frame_valid_i = 1;
                        n = n + 1;
                        frame_data_i = frame_24[n];
                        frame_counter_h = frame_counter_h + 1;
                        frame_state = FRAME_READ;
                      end
                    else
                      frame_state = FRAME_READ;
                  end
              end
            FRAME_WAIT:
              begin
                if (frame_counter_v == frame_height_i)
                  begin
                    frame_valid_i = 0;
                    frame_state = FRAME_DONE;
                  end
                else
                  begin
                    if (frame_one_line_done_o)
                      begin
                        frame_counter_h = 0;
                        frame_state = FRAME_READ;
                      end
                    else
                      begin
                        frame_state = FRAME_WAIT;
                      end
                  end
              end
            FRAME_DONE:
              begin
                if (alpha_blend_proc_compl_o)
                  frame_state = FRAME_DONE;
                else
                  begin
                    if (count_done == 4'd15)
                      begin
                        $display("");
                        $display("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
                        $display(">>>>>>>>                    ALPHA BLENDING PROCESS COMPLETED                        <<<<<<<");
                        $display("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
			$fclose(File_1);
                        $finish;
                      end
                    else
                      frame_state = FRAME_DONE;
                  end
              end
          endcase
        end
    end
  always
    @(posedge Clock)
    begin
      if (!Reset)
        count_done = 0;
      else
        begin
          if (frame_state == 2'd3)
            count_done = count_done + 1;
        end
    end
  /************************************************************************
  Process to write the output RGB into a memory
  *************************************************************************/
  always
    @(posedge Clock)
    begin
      if (vout_valid_o)
        begin
          //alpha_mem[k] = vout_o;
	      $fwrite(File_1,"%x\n",vout_o[7:0]);
	      $fwrite(File_1,"%x\n",vout_o[15:8]);
	      $fwrite(File_1,"%x\n",vout_o[23:16]);

          k = k + 1;
        end
    end

  /************************************************************************
  Debug Signals: Output horizontal counter and output vertical counter
  *************************************************************************/
  always
    @(posedge Clock)
    begin
      if (counter_h_out == (FRAME_WIDTH - 1))
        counter_h_out <= 0;
      else
        begin
          if (vout_valid_o)
            counter_h_out <= counter_h_out + 1;
        end
    end
  always
    @(posedge Clock)
    begin
      if (counter_h_out == (FRAME_WIDTH - 1))
        counter_v_out <= counter_v_out + 1;
      else
        counter_v_out <= counter_v_out;
    end
  /************************************************************************
  Component instantiation
  *************************************************************************/
  alpha_blend_control #(.g_IMAGE_DATAWIDTH(g_IMAGE_DATAWIDTH), .g_FRAME_DATAWIDTH(g_FRAME_DATAWIDTH), .g_OUTPUT_CHANNEL_DATAWIDTH(g_OUTPUT_CHANNEL_DATAWIDTH), .g_IMAGE_BUFFER_AWIDTH(g_IMAGE_BUFFER_AWIDTH), .g_FRAME_BUFFER_AWIDTH(g_FRAME_BUFFER_AWIDTH), .g_IMAGE_X_Y_DATAWIDTH(g_IMAGE_X_Y_DATAWIDTH), .g_FRAME_X_Y_DATAWIDTH(g_FRAME_X_Y_DATAWIDTH)) alpha_blend_0(.SYS_CLK_I(Clock),
                                                                                                                                                                                                                                                                                                                                                                         .RESET_n_I(Reset),
                                                                                                                                                                                                                                                                                                                                                                         .video_param_valid_i(video_param_valid_i),
                                                                                                                                                                                                                                                                                                                                                                         .image_data_i(image_data_i),
                                                                                                                                                                                                                                                                                                                                                                         .image_valid_i(image_valid_i),
                                                                                                                                                                                                                                                                                                                                                                         .frame_data_i(frame_data_i),
                                                                                                                                                                                                                                                                                                                                                                         .frame_valid_i(frame_valid_i),
                                                                                                                                                                                                                                                                                                                                                                         .fx_i(fx_i),
                                                                                                                                                                                                                                                                                                                                                                         .fy_i(fy_i),
                                                                                                                                                                                                                                                                                                                                                                         .frame_width_i(frame_width_i),
                                                                                                                                                                                                                                                                                                                                                                         .frame_height_i(frame_height_i),
                                                                                                                                                                                                                                                                                                                                                                         .image_width_i(image_width_i),
                                                                                                                                                                                                                                                                                                                                                                         .image_height_i(image_height_i),
                                                                                                                                                                                                                                                                                                                                                                         .global_alpha_i(global_alpha_i),
                                                                                                                                                                                                                                                                                                                                                                         .vout_o(vout_o),
                                                                                                                                                                                                                                                                                                                                                                         .vout_valid_o(vout_valid_o),
                                                                                                                                                                                                                                                                                                                                                                         .write_image_next_line_o(write_image_next_line_o),
                                                                                                                                                                                                                                                                                                                                                                         .frame_one_line_done_o(frame_one_line_done_o),
                                                                                                                                                                                                                                                                                                                                                                         .alpha_blend_proc_compl_o(alpha_blend_proc_compl_o));
endmodule
