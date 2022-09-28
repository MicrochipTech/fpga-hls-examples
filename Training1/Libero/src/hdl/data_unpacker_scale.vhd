--=================================================================================================
-- File Name                           : data_unpacker_scale.vhd
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
-- data_unpacker_scale entity declaration
--=================================================================================================
entity data_unpacker_scale is
  port(
-- Port list
    -- System reset
    reset_i : in std_logic;

    -- System clock
    sys_clk_i : in std_logic;

    -- Read enable signal from DDR
    read_en_i : in std_logic;

    -- Frame active
    frame_active_i : in std_logic;

    -- data ready from FIFO
    fifo_data_valid_i : in std_logic;

    -- Data Input
    data_i : in std_logic_vector(511 downto 0);

    -- Data Input
    horz_resl_i : in std_logic_vector(15 downto 0);

    -- Horizontal shift for the PIP
    h_shift_i : in std_logic_vector(15 downto 0);

    -- data output valid
    data_valid_o : out std_logic;

    -- Reqd request for FIFO
    fifo_read_o : out std_logic;

    -- Packets to be read from DDR
    beats_to_read_o : out std_logic_vector(15 downto 0);

    -- Data output
    data_o : out std_logic_vector(7 downto 0)
    );
end data_unpacker_scale;

--=================================================================================================
-- data_unpacker_scale architecture body
--=================================================================================================

architecture data_unpacker_scale_arch of data_unpacker_scale is

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

  signal s_packet_counter   : std_logic_vector(5 downto 0);
  signal s_read_counter     : std_logic_vector(4 downto 0);
  signal s_line_counter     : std_logic_vector(15 downto 0);
  signal s_shift_counter    : std_logic_vector(15 downto 0);
  signal s_line_count_max   : std_logic_vector(15 downto 0);
  signal s_data_pack        : std_logic_vector(511 downto 0);
  signal s_data_unpacked    : std_logic_vector(7 downto 0);
  signal s_data_unpacked_3  : std_logic_vector(23 downto 0);
  signal s_read_latch       : std_logic;
  signal s_read_fifo        : std_logic;
  signal s_count_en         : std_logic;
  signal s_ddr_read_en_dly  : std_logic;
  signal s_ddr_read_en_dly2 : std_logic;
  signal s_ddr_read_en_fe   : std_logic;

begin

--=================================================================================================
-- Top level output port assignments
--=================================================================================================

  data_o          <= s_data_unpacked_3(7 downto 0);
  fifo_read_o     <= s_read_fifo;
  beats_to_read_o <= "000000" & horz_resl_i(15 downto 6) - 1;

--=================================================================================================
-- Generate blocks
--=================================================================================================


--=================================================================================================
-- Asynchronous blocks
--=================================================================================================

  s_line_count_max <= "000000" & horz_resl_i(15 downto 6);
  s_ddr_read_en_fe <= s_ddr_read_en_dly2 and (not(s_ddr_read_en_dly));

--=================================================================================================
-- Synchronous blocks
--=================================================================================================

--------------------------------------------------------------------------
-- Name       : DELAY_PROC_DISP_CLK
-- Description: Generate the delayed signals
--------------------------------------------------------------------------
  DELAY_PROC_DISP_CLK :
  process(SYS_CLK_I, RESET_I)
  begin
    if (reset_i = '0') then
      s_ddr_read_en_dly  <= '0';
      s_ddr_read_en_dly2 <= '0';
    elsif rising_edge(SYS_CLK_I) then
      s_ddr_read_en_dly  <= read_en_i;
      s_ddr_read_en_dly2 <= s_ddr_read_en_dly;
    end if;
  end process;

--------------------------------------------------------------------------
-- Name       : READING_PROC
-- Description: Generate read fifo signals
--------------------------------------------------------------------------
  READING_PROC :
  process(SYS_CLK_I, RESET_I)
  begin
    if (RESET_I = '0') then
      s_read_latch    <= '0';
      s_read_fifo     <= '0';
      s_count_en      <= '0';
      s_read_counter  <= (others => '0');
      s_shift_counter <= (others => '0');
    elsif rising_edge(SYS_CLK_I) then
      if(s_ddr_read_en_fe = '1' and frame_active_i = '1') then
        s_count_en <= '1';
      elsif(s_shift_counter >= h_shift_i) then
        s_count_en   <= '0';
        s_read_latch <= '1';
      end if;
      if(s_count_en = '1') then
        s_shift_counter <= s_shift_counter + '1';
      elsif(s_read_latch = '0') then
        s_shift_counter <= (others => '0');
      end if;
      if(s_line_counter >= s_line_count_max) then
        s_read_latch <= '0';
      end if;
      if(s_read_latch = '1') then
        if(s_read_counter = "10011") then
          s_read_counter <= (others => '0');
        else
          s_read_counter <= s_read_counter + '1';
        end if;
        if(s_read_counter = "10011") then
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
  process(SYS_CLK_I, RESET_I)
  begin
    if RESET_I = '0' then
      s_data_pack       <= (others => '0');
      s_line_counter    <= (others => '0');
      s_data_unpacked   <= (others => '0');
      s_data_unpacked_3 <= (others => '0');
      s_packet_counter  <= (others => '0');
      data_valid_o      <= '0';
    elsif rising_edge(SYS_CLK_I) then
      if(fifo_data_valid_i = '1')then
        s_data_pack       <= x"000000" & data_i(511 downto 24);
        s_data_unpacked_3 <= data_i(23 downto 0);
        s_line_counter    <= s_line_counter + '1';
        if(s_packet_counter = "010011") then
          s_packet_counter <= (others => '0');
        else
          s_packet_counter <= s_packet_counter + '1';
        end if;
        data_valid_o <= '1';
      else
        if(s_packet_counter = "000000") then
          s_packet_counter <= s_packet_counter;
        else
          if(s_packet_counter = "010011") then
            s_packet_counter <= (others => '0');
          else
            s_packet_counter <= s_packet_counter + '1';
          end if;
        end if;
        s_data_pack       <= x"000000" & s_data_pack(511 downto 24);
        s_data_unpacked_3 <= s_data_pack(23 downto 0);
        if(s_read_latch = '0') then
          s_line_counter <= (others => '0');
          if(s_packet_counter = "000000") then
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
end data_unpacker_scale_arch;
