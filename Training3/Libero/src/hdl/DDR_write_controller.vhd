--=================================================================================================
-- File Name                           : DDR_write_controller.vhd
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
-- DDR_write_controller entity declaration
--=================================================================================================
entity DDR_write_controller is
  generic(
-- Generic list
    -- Video format selection
    g_DDR_AXI_AWIDTH : integer := 32
    );
  port(
-- Port list
    -- System reset
    reset_i : in std_logic;

    -- System clock
    sys_clk_i : in std_logic;

    -- write enable
    start_i : in std_logic;

    -- write Acknowledgement input      
    write_ackn_i : in std_logic;

    -- write done input                 
    write_done_i : in std_logic;

    -- frame end signal from video source
    frame_valid_i : in std_logic;

    -- Horizontal pixel resolution
    horiz_resolution_i : in std_logic_vector(15 downto 0);

    --Frame DDR address
    frame_ddr_addr_i : in std_logic_vector(7 downto 0);

    -- write request to DDR
    write_req_o : out std_logic;

    -- Read request to fifo
    read_fifo_o : out std_logic;

    -- DDR write FRAME ADDRESS
    display_frame_addr_o : out std_logic_vector(7 downto 0);

    -- DDR write START ADDRESS
    write_start_addr_o : out std_logic_vector(g_DDR_AXI_AWIDTH-1 downto 0);

    -- Number of Bytes to write
    write_length_o : out std_logic_vector(15 downto 0)

    );
end DDR_write_controller;

--=================================================================================================
-- DDR_write_controller architecture body
--=================================================================================================

architecture DDR_write_controller of DDR_write_controller is

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


  constant c_LINE_GAP : std_logic_vector(15 downto 0) := x"1000";
  type FSM_STATE is (IDLE,
                     WRITE_REQUESTING,
                     WRITING);
  signal s_state            : FSM_STATE;
  signal s_frame_valid_dly1 : std_logic;
  signal s_frame_valid_dly2 : std_logic;
  signal s_frame_valid_re   : std_logic;
  signal s_start_dly1       : std_logic;
  signal s_start_dly2       : std_logic;
  signal s_start_dly3       : std_logic;
  signal s_start_fe         : std_logic;
  signal s_write_req        : std_logic;
  signal s_read_fifo        : std_logic;
  signal s_write_start_addr : std_logic_vector(g_DDR_AXI_AWIDTH-1 downto 0);
  signal s_counter          : std_logic_vector(15 downto 0);
  signal s_count_max        : std_logic_vector(15 downto 0);
  signal s_line_counter     : std_logic_vector(23 downto 0);
  signal s_frame_index      : std_logic_vector(1 downto 0);
  signal s_disp_frame_index : std_logic_vector(1 downto 0);


begin

--=================================================================================================
-- Top level output port assignments
--=================================================================================================

  write_req_o          <= s_write_req;
  write_start_addr_o   <= s_write_start_addr;
  write_length_o       <= s_count_max - '1';
  read_fifo_o          <= s_read_fifo;
  display_frame_addr_o <= frame_ddr_addr_i(7 downto 2) & s_disp_frame_index;

--=================================================================================================
-- Generate blocks
--=================================================================================================

--=================================================================================================
-- Asynchronous blocks
--=================================================================================================

  s_disp_frame_index <= s_frame_index - '1';
  s_frame_valid_re   <= s_frame_valid_dly1 and not(s_frame_valid_dly2);
  s_start_fe         <= s_start_dly3 and not(s_start_dly2);
  s_write_start_addr <= frame_ddr_addr_i(7 downto 2) & s_frame_index & s_line_counter;

--=================================================================================================
-- Synchronous blocks
--=================================================================================================

--------------------------------------------------------------------------
-- Name       : SIGNAL_DELAY
-- Description: Process to delay signal and find rising edge
--------------------------------------------------------------------------
  SIGNAL_DELAY :
  process(SYS_CLK_I, RESET_I)
  begin
    if (RESET_I = '0') then
      s_frame_valid_dly1 <= '0';
      s_frame_valid_dly2 <= '0';
      s_start_dly1       <= '0';
      s_start_dly2       <= '0';
      s_start_dly3       <= '0';
    elsif rising_edge(SYS_CLK_I) then
      s_frame_valid_dly1 <= frame_valid_i;
      s_frame_valid_dly2 <= s_frame_valid_dly1;
      s_start_dly1       <= start_i;
      s_start_dly2       <= s_start_dly1;
      s_start_dly3       <= s_start_dly2;
    end if;
  end process;

--------------------------------------------------------------------------
-- Name       : CORDIC_FSM_PROC
-- Description: FSM implements cordic operations
--------------------------------------------------------------------------
  CORDIC_FSM_PROC :
  process(SYS_CLK_I, RESET_I)
  begin
    if (RESET_I = '0') then
      s_state        <= IDLE;
      s_write_req    <= '0';
      s_read_fifo    <= '0';
      s_count_max    <= (others => '0');
      s_counter      <= (others => '0');
      s_frame_index  <= (others => '0');
      s_line_counter <= (others => '0');
    elsif rising_edge(SYS_CLK_I) then
      case s_state is
--------------------
-- IDLE state
--------------------
        when IDLE =>
          s_write_req <= '0';
          s_read_fifo <= '0';
          s_counter   <= (others => '0');
          if(s_frame_valid_re = '1') then
            s_frame_index  <= s_frame_index + '1';
            s_line_counter <= (others => '0');
          end if;
          if(s_start_fe = '1' and horiz_resolution_i > x"00FF") then
            s_count_max <= "0000" & horiz_resolution_i(15 downto 4);
            s_state     <= WRITE_REQUESTING;
          end if;
--------------------
-- WRITE_REQUESTING state 
--------------------
        when WRITE_REQUESTING =>
          if(write_ackn_i = '1') then
            s_write_req <= '0';
            s_state     <= WRITING;
          else
            s_write_req <= '1';
          end if;
--------------------
-- WRITING state 
--------------------
        when WRITING =>
          if(write_done_i = '1') then
            s_state        <= IDLE;
            s_line_counter <= s_line_counter + C_LINE_GAP;
          elsif(s_counter >= s_count_max) then
            s_read_fifo <= '0';
          else
            s_counter   <= s_counter + '1';
            s_read_fifo <= '1';
          end if;
--------------------
-- OTHERS state 
--------------------
        when others =>
          s_state <= IDLE;
      end case;
    end if;
  end process;

--=================================================================================================
-- Component Instantiations
--=================================================================================================
--NA--
end DDR_write_controller;
