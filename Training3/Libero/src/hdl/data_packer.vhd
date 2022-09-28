--=================================================================================================
-- File Name                           : data_packer.vhd
-- Targeted device                     : Microsemi-SoC
-- Author                              : India Solutions Team
--
-- COPYRIGHT 2019 BY MICROSEMI
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
-- data_packer entity declaration
--=================================================================================================
entity data_packer is
  port(
-- Port list
    -- System reset
    reset_i : in std_logic;

    -- System clock
    sys_clk_i : in std_logic;

    -- enable
    data_valid_i : in std_logic;

    --Frame end input
    frame_valid_i : in std_logic;

    -- Data Input
    data_i : in std_logic_vector(31 downto 0);

    -- Data Enable
    data_valid_o : out std_logic;

    -- Start DDR write
    start_ddr_w_o : out std_logic;

    -- FIFO reset
    fifo_reset_o : out std_logic;

    --Horizontal count detected
    h_count_o : out std_logic_vector(15 downto 0);

    -- Data output
    data_o : out std_logic_vector(511 downto 0)

    );
end data_packer;

--=================================================================================================
-- pattern_generator architecture body
--=================================================================================================

architecture data_packer_arch of data_packer is

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

  signal s_counter          : std_logic_vector(3 downto 0);
  signal s_h_count          : std_logic_vector(15 downto 0);
  signal s_h_count_latch    : std_logic_vector(15 downto 0);
  signal s_data_pack        : std_logic_vector(511 downto 0);
  signal s_dv_fe_ctr        : std_logic_vector(3 downto 0);
  signal s_data_valid_dly1  : std_logic;
  signal s_data_valid_dly2  : std_logic;
  signal s_data_valid_fe    : std_logic;
  signal s_frame_valid_dly1 : std_logic;
  signal s_frame_valid_dly2 : std_logic;
  signal s_frame_valid_re   : std_logic;
  signal s_dv_fe_ctr_en     : std_logic;
  signal s_ddr_start        : std_logic;
  signal s_cam_fault        : std_logic;
  signal s_cam_fault_dly1   : std_logic;
  signal s_cam_fault_dly2   : std_logic;

begin

--=================================================================================================
-- Top level output port assignments
--=================================================================================================

  data_valid_o  <= '1'         when (s_counter = "1111") else '0';
  data_o        <= s_data_pack;
  h_count_o     <= s_h_count_latch;
  start_ddr_w_o <= s_ddr_start when (s_cam_fault_dly2 = '0')  else '0';
  fifo_reset_o  <= not(s_cam_fault_dly2 or s_frame_valid_re);
--=================================================================================================
-- Generate blocks
--=================================================================================================


--=================================================================================================
-- Asynchronous blocks
--=================================================================================================
  s_data_valid_fe  <= s_data_valid_dly2 and not(s_data_valid_dly1);
  s_frame_valid_re <= s_frame_valid_dly1 and not(s_frame_valid_dly2);
--=================================================================================================
-- Synchronous blocks
--=================================================================================================

--------------------------------------------------------------------------
-- Name       : DELAY
-- Description: Process delays input signals
--------------------------------------------------------------------------
  DELAY :
  process(SYS_CLK_I, RESET_I)
  begin
    if RESET_I = '0' then
      s_data_valid_dly1  <= '0';
      s_data_valid_dly2  <= '0';
      s_frame_valid_dly1 <= '0';
      s_frame_valid_dly2 <= '0';
      s_cam_fault_dly1   <= '0';
      s_cam_fault_dly2   <= '0';
    elsif rising_edge(SYS_CLK_I) then
      s_data_valid_dly1  <= data_valid_i;
      s_data_valid_dly2  <= s_data_valid_dly1;
      s_frame_valid_dly1 <= frame_valid_i;
      s_frame_valid_dly2 <= s_frame_valid_dly1;
      s_cam_fault_dly1   <= s_cam_fault;
      s_cam_fault_dly2   <= s_cam_fault_dly1;
    end if;
  end process;

--------------------------------------------------------------------------
-- Name       : H_COUNTER
-- Description: Counter to count horizontal pixels
--------------------------------------------------------------------------
  H_COUNTER :
  process(SYS_CLK_I, RESET_I)
  begin
    if RESET_I = '0' then
      s_h_count <= (others => '0');
    elsif rising_edge(SYS_CLK_I) then
      if(data_valid_i = '1')then
        s_h_count <= s_h_count + '1';
      elsif(s_data_valid_fe = '1')then
        s_h_count <= (others => '0');
      end if;
    end if;
  end process;

--------------------------------------------------------------------------
-- Name       : CAM_FAULT
-- Description: Camera data fault detection and reset process
--------------------------------------------------------------------------
  CAM_FAULT :
  process(SYS_CLK_I, RESET_I)
  begin
    if RESET_I = '0' then
      s_cam_fault <= '0';
    elsif rising_edge(SYS_CLK_I) then
      if(s_frame_valid_re = '1')then
        s_cam_fault <= '0';
      elsif(s_h_count(11) = '1')then
        s_cam_fault <= '1';
      end if;
    end if;
  end process;

--------------------------------------------------------------------------
-- Name       : BYTE_COUNT_LATCH_PROC
-- Description: Process latches s_h_count output at falling edge of data enable
--------------------------------------------------------------------------
  BYTE_COUNT_LATCH_PROC :
  process(SYS_CLK_I, RESET_I)
  begin
    if RESET_I = '0' then
      s_h_count_latch <= (others => '0');
    elsif rising_edge(SYS_CLK_I) then
      if(s_data_valid_fe = '1')then
        s_h_count_latch <= s_h_count;
      end if;
    end if;
  end process;

--------------------------------------------------------------------------
-- Name       : DATA_VALID_FE_COUNTER
-- Description: PROCESS to extend data_valid falling edge signal to 4 clock cycles
--------------------------------------------------------------------------
  DATA_VALID_FE_COUNTER :
  process(SYS_CLK_I, RESET_I)
  begin
    if RESET_I = '0' then
      s_dv_fe_ctr      <= (others => '0');
      s_dv_fe_ctr_en   <= '0';
      s_ddr_start <= '0';
    elsif rising_edge(SYS_CLK_I) then
      if(s_data_valid_fe = '1')then
        s_dv_fe_ctr_en   <= '1';
        s_ddr_start <= '1';
      elsif(s_dv_fe_ctr = x"4")then
        s_dv_fe_ctr_en   <= '0';
        s_ddr_start <= '0';
      end if;
      if(s_dv_fe_ctr_en = '1')then
        s_dv_fe_ctr <= s_dv_fe_ctr + '1';
      else
        s_dv_fe_ctr <= (others => '0');
      end if;

    end if;
  end process;

--------------------------------------------------------------------------
-- Name       : DATA_COUNTER
-- Description: Counter to count data
--------------------------------------------------------------------------
  DATA_COUNTER :
  process(SYS_CLK_I, RESET_I)
  begin
    if RESET_I = '0' then
      s_counter <= (others => '0');
    elsif rising_edge(SYS_CLK_I) then
      if(data_valid_i = '1')then
        s_counter <= s_counter + '1';
      else
        s_counter <= (others => '0');
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
      s_data_pack <= (others => '0');
    elsif rising_edge(SYS_CLK_I) then
      if(data_valid_i = '1')then
        s_data_pack <= data_i & s_data_pack(511 downto 32);
      else
        s_data_pack(479 downto 0)   <= (others => '0');
        s_data_pack(511 downto 480) <= data_i;
      end if;
    end if;
  end process;

--=================================================================================================
-- Component Instantiations
--=================================================================================================
--NA--
end data_packer_arch;
