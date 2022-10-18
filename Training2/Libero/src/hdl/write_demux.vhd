--=================================================================================================
-- File Name                           : write_demux.vhd
-- Targeted device                     : Microsemi-SoC
-- Author                              : India Solutions Team
--
-- COPYRIGHT 2020 BY MICROSEMI
-- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS FROM MICROSEMI
-- CORP. IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM MICROSEMI FOR USE OF THIS
-- FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND NO BACK-UP OF THE FILE SHOULD BE MADE.
--
--=================================================================================================

--=================================================================================================
-- Libraries
--=================================================================================================
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
--=================================================================================================
-- write_demux entity declaration
--=================================================================================================
entity write_demux is
  port (
--Port list
    -- system reset
    reset_i : in std_logic;

    --Mux selection output for channel selection
    mux_sel_i : in std_logic_vector(1 downto 0);

    --Acknowledge input from Write Master
    ack_i : in std_logic;

    --Done input from Write Master
    done_i : in std_logic;

    --W0 acknowledge to DDR Write controller
    w0_ack_o  : out std_logic;
    --W0 done to DDR Write controller
    w0_done_o : out std_logic;
    --W1 acknowledge to DDR Write controller
    w1_ack_o  : out std_logic;
    --W1 done to DDR Write controller
    w1_done_o : out std_logic;
    --W2 acknowledge to DDR Write controller    
    w2_ack_o  : out std_logic;
    --W2 done to DDR Write controller
    w2_done_o : out std_logic;
    --W3 acknowledge to DDR Write controller    
    w3_ack_o  : out std_logic;
    --W3 done to DDR Write controller
    w3_done_o : out std_logic


    );
end write_demux;


--=================================================================================================
-- write_demux architecture body
--=================================================================================================
architecture write_demux of write_demux is

--=================================================================================================
-- Component declarations
--=================================================================================================

--=================================================================================================
-- Synthesis Attributes
--=================================================================================================
--NA--
--=================================================================================================
-- Signal declarations
--=================================================================================================


begin
--=================================================================================================
-- Top level output port assignments
--=================================================================================================


--=================================================================================================
-- Generate blocks
--=================================================================================================
--NA--
--=================================================================================================
-- Asynchronous blocks
--=================================================================================================
--------------------------------------------------------------------------
-- Name       : DEMUX_PROC
-- Description: Process to generate Iout based on enable signal
--------------------------------------------------------------------------
  DEMUX_PROC :
  process(reset_i, ack_i, done_i, mux_sel_i)
  begin
    if(reset_i = '0') then
      w0_ack_o  <= '0';
      w0_done_o <= '0';
      w1_ack_o  <= '0';
      w1_done_o <= '0';
      w2_ack_o  <= '0';
      w2_done_o <= '0';
      w3_ack_o  <= '0';
      w3_done_o <= '0';
    else
      case mux_sel_i is
        when "00" =>
          w0_ack_o  <= ack_i;
          w0_done_o <= done_i;
          w1_ack_o  <= '0';
          w1_done_o <= '0';
          w2_ack_o  <= '0';
          w2_done_o <= '0';
          w3_ack_o  <= '0';
          w3_done_o <= '0';
        when "01" =>
          w0_ack_o  <= '0';
          w0_done_o <= '0';
          w1_ack_o  <= ack_i;
          w1_done_o <= done_i;
          w2_ack_o  <= '0';
          w2_done_o <= '0';
          w3_ack_o  <= '0';
          w3_done_o <= '0';
        when "10" =>
          w0_ack_o  <= '0';
          w0_done_o <= '0';
          w1_ack_o  <= '0';
          w1_done_o <= '0';
          w2_ack_o  <= ack_i;
          w2_done_o <= done_i;
          w3_ack_o  <= '0';
          w3_done_o <= '0';
        when others =>
          w0_ack_o  <= '0';
          w0_done_o <= '0';
          w1_ack_o  <= '0';
          w1_done_o <= '0';
          w2_ack_o  <= '0';
          w2_done_o <= '0';
          w3_ack_o  <= ack_i;
          w3_done_o <= done_i;
      end case;
    end if;
  end process;
--=================================================================================================
-- Component Instantiations
--=================================================================================================
--NA
end write_demux;
