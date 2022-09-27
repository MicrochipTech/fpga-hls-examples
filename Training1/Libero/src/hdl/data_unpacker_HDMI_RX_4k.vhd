--=================================================================================================
-- File Name                           : data_unpacker_HDMI_RX.vhd
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
use IEEE.STD_LOGIC_SIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

--=================================================================================================
-- data_unpacker_HDMI_RX_4k entity declaration
--=================================================================================================
entity data_unpacker_HDMI_RX_4k is
  port(
-- Port list
    -- System reset
    reset_i : in std_logic;

    -- Display clock
    disp_clk_i : in std_logic;

    -- Read enable signal from DDR
    read_en_i : in std_logic;

    -- data ready from FIFO
    fifo_data_valid_i : in std_logic;

    -- Data Input
    data_i : in std_logic_vector(511 downto 0);

    -- Data Input
    horz_resl_i : in std_logic_vector(15 downto 0);

    -- data output valid
    data_valid_o : out std_logic;

    -- Read request for FIFO
    fifo_read_o : out std_logic;

    -- Number of 128 bit packets to read 
    beats_to_read_o : out std_logic_vector(15 downto 0);

    -- Data output
    data_o : out std_logic_vector(31 downto 0)

    );
end data_unpacker_HDMI_RX_4k;

--=================================================================================================
-- data_unpacker_HDMI_RX_4k architecture body
--=================================================================================================

architecture data_unpacker_HDMI_RX_4k_arch of data_unpacker_HDMI_RX_4k is

--=================================================================================================
-- Component declarations
--=================================================================================================
--NA--
--=================================================================================================
-- Synthesis Attributes
--=================================================================================================
--NA--
--=================================================================================================
-- Signal declarations
--=================================================================================================

  signal s_packet_counter   : std_logic_vector(3 downto 0);
  signal s_read_counter     : std_logic_vector(3 downto 0);
  signal s_line_count_max   : std_logic_vector(15 downto 0);
  signal s_line_counter     : std_logic_vector(15 downto 0);
  signal s_data_pack        : std_logic_vector(511 downto 0);
  signal s_data_unpacked    : std_logic_vector(7 downto 0);
  signal s_read_latch       : std_logic;
  signal s_read_fifo        : std_logic;
  signal s_ddr_read_en_dly  : std_logic;
  signal s_ddr_read_en_dly2 : std_logic;
  signal s_ddr_read_en_fe   : std_logic;

begin

--=================================================================================================
-- Top level output port assignments
--=================================================================================================


  fifo_read_o     <= s_read_fifo;
  beats_to_read_o <= "0000" & horz_resl_i(15 downto 4) - 1;
--=================================================================================================
-- Generate blocks
--=================================================================================================


--=================================================================================================
-- Asynchronous blocks
--=================================================================================================

  s_line_count_max <= "0000" & horz_resl_i(15 downto 4);
  s_ddr_read_en_fe <= s_ddr_read_en_dly2 and (not(s_ddr_read_en_dly));
--=================================================================================================
-- Synchronous blocks
--================================================================================================= 

--------------------------------------------------------------------------
-- Name       : DELAY_PROC_DISP_CLK
-- Description: Generate the delayed signals
--------------------------------------------------------------------------
  DELAY_PROC_DISP_CLK :
  process(disp_clk_i, reset_i)
  begin
    if (reset_i = '0') then
      s_ddr_read_en_dly  <= '0';
      s_ddr_read_en_dly2 <= '0';
    elsif rising_edge(disp_clk_i) then
      s_ddr_read_en_dly  <= read_en_i;
      s_ddr_read_en_dly2 <= s_ddr_read_en_dly;
    end if;
  end process;
--------------------------------------------------------------------------
-- Name       : READING_PROC
-- Description: Generate read fifo signals
--------------------------------------------------------------------------
  READING_PROC :
  process(disp_clk_i, RESET_I)
  begin
    if (RESET_I = '0') then
      s_read_latch   <= '0';
      s_read_fifo    <= '0';
      s_read_counter <= (others => '0');
    elsif rising_edge(disp_clk_i) then
      if(s_ddr_read_en_fe = '1') then
        s_read_latch <= '1';
      elsif(s_line_counter = s_line_count_max) then
        s_read_latch <= '0';
      end if;
      if(s_read_latch = '1') then
        s_read_counter <= s_read_counter + '1';
        if(s_read_counter = "0000") then
          s_read_fifo <= '1';
        else
          s_read_fifo <= '0';
        end if;
      else
        s_read_counter <= (others => '0');
        s_read_fifo    <= '0';
      end if;
    end if;
  end process;

--------------------------------------------------------------------------
-- Name       : DATA_ASSIGN
-- Description: Process assigns data based on counter value
--------------------------------------------------------------------------
  DATA_ASSIGN :
  process(disp_clk_i, RESET_I)
  begin
    if RESET_I = '0' then
      s_data_pack      <= (others => '0');
      s_line_counter   <= (others => '0');
      data_o           <= (others => '0');
      s_packet_counter <= (others => '0');
      data_valid_o     <= '0';
    elsif rising_edge(disp_clk_i) then
      if(fifo_data_valid_i = '1')then
        s_data_pack      <= x"00000000" & data_i(511 downto 32);
        data_o           <= data_i(31 downto 0);
        s_line_counter   <= s_line_counter + '1';
        s_packet_counter <= s_packet_counter + '1';
        data_valid_o     <= '1';
      else
        if(s_packet_counter /= "000") then
          s_packet_counter <= s_packet_counter + '1';
        end if;
        s_data_pack <= x"00000000" & s_data_pack(511 downto 32);
        data_o      <= s_data_pack(31 downto 0);
        if(s_read_latch = '0') then
          s_line_counter <= (others => '0');
          if(s_packet_counter = "000") then
            data_valid_o <= '0';
          end if;
        end if;
      end if;
    end if;
  end process;

--=================================================================================================
-- Component Instantiations
--=================================================================================================
--NA--
end data_unpacker_HDMI_RX_4k_arch;

