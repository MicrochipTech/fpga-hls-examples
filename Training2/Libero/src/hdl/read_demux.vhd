--=================================================================================================
-- File Name                           : read_demux.vhd
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
-- read_demux entity declaration
--=================================================================================================
entity read_demux is

  port (
--Port list
    -- system reset
    reset_i : in std_logic;

    --Mux selection output for channel selection
    mux_sel_i : in std_logic_vector(1 downto 0);

    --Acknowledge input from Read Master
    ack_i : in std_logic;

    --Done input from Read Master
    done_i : in std_logic;

    --Data valid signal from Read Master
    data_valid_i : in std_logic;

    --R0 acknowledge to DDR Read controller
    r0_ack_o        : out std_logic;
    --R0 done to DDR Read controller
    r0_done_o       : out std_logic;
    --R0 data valid to DDR Read controller
    r0_data_valid_o : out std_logic;

    --R1 acknowledge to DDR Read controller
    r1_ack_o        : out std_logic;
    --R1 done to DDR Read controller
    r1_done_o       : out std_logic;
    --R1 data valid to DDR Read controller
    r1_data_valid_o : out std_logic;

    --R2 acknowledge to DDR Read controller     
    r2_ack_o        : out std_logic;
    --R2 done to DDR Read controller
    r2_done_o       : out std_logic;
    --R2 data valid to DDR Read controller
    r2_data_valid_o : out std_logic;

    --R3 acknowledge to DDR Read controller     
    r3_ack_o        : out std_logic;
    --R3 done to DDR Read controller
    r3_done_o       : out std_logic;
    --R3 data valid to DDR Read controller
    r3_data_valid_o : out std_logic


    );
end read_demux;


--=================================================================================================
-- read_demux architecture body
--=================================================================================================
architecture read_demux of read_demux is

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
  process(reset_i, ack_i, done_i, mux_sel_i, data_valid_i)
  begin
    if(reset_i = '0') then
      r0_ack_o        <= '0';
      r0_done_o       <= '0';
      r0_data_valid_o <= '0';
      r1_ack_o        <= '0';
      r1_done_o       <= '0';
      r1_data_valid_o <= '0';
      r2_ack_o        <= '0';
      r2_done_o       <= '0';
      r2_data_valid_o <= '0';
      r3_ack_o        <= '0';
      r3_done_o       <= '0';
      r3_data_valid_o <= '0';
    else
      case mux_sel_i is
        when "00" =>
          r0_ack_o        <= ack_i;
          r0_done_o       <= done_i;
          r0_data_valid_o <= data_valid_i;
          r1_ack_o        <= '0';
          r1_done_o       <= '0';
          r1_data_valid_o <= '0';
          r2_ack_o        <= '0';
          r2_done_o       <= '0';
          r2_data_valid_o <= '0';
          r3_ack_o        <= '0';
          r3_done_o       <= '0';
          r3_data_valid_o <= '0';
        when "01" =>
          r0_ack_o        <= '0';
          r0_done_o       <= '0';
          r0_data_valid_o <= '0';
          r1_ack_o        <= ack_i;
          r1_done_o       <= done_i;
          r1_data_valid_o <= data_valid_i;
          r2_ack_o        <= '0';
          r2_done_o       <= '0';
          r2_data_valid_o <= '0';
          r3_ack_o        <= '0';
          r3_done_o       <= '0';
          r3_data_valid_o <= '0';
        when "10" =>
          r0_ack_o        <= '0';
          r0_done_o       <= '0';
          r0_data_valid_o <= '0';
          r1_ack_o        <= '0';
          r1_done_o       <= '0';
          r1_data_valid_o <= '0';
          r2_ack_o        <= ack_i;
          r2_done_o       <= done_i;
          r2_data_valid_o <= data_valid_i;
          r3_ack_o        <= '0';
          r3_done_o       <= '0';
          r3_data_valid_o <= '0';
        when others =>
          r0_ack_o        <= '0';
          r0_done_o       <= '0';
          r0_data_valid_o <= '0';
          r1_ack_o        <= '0';
          r1_done_o       <= '0';
          r1_data_valid_o <= '0';
          r2_ack_o        <= '0';
          r2_done_o       <= '0';
          r2_data_valid_o <= '0';
          r3_ack_o        <= ack_i;
          r3_done_o       <= done_i;
          r3_data_valid_o <= data_valid_i;
      end case;
    end if;
  end process;
--=================================================================================================
-- Component Instantiations
--=================================================================================================
--NA
end read_demux;
