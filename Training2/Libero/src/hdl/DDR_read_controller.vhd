--=================================================================================================
-- File Name                           : DDR_read_controller.vhd
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
-- DDR_read_controller entity declaration
--=================================================================================================
entity DDR_read_controller is
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

    -- Read enable
    read_en_i : in std_logic;

    -- Read Acknowledgement input
    read_ackn_i : in std_logic;

    -- Read done input
    read_done_i : in std_logic;

    -- Vertical sync signal
    frame_end_i : in std_logic;

    -- DDR READ START ADDRESS
    frame_start_addr_i : in std_logic_vector(7 downto 0);

    -- Horizontal PAN value
    h_pan_i : in std_logic_vector(11 downto 0);

    -- Vertical PAN value
    v_pan_i : in std_logic_vector(11 downto 0);

    -- Read request to DDR
    read_req_o : out std_logic;

    -- DDR READ START ADDRESS
    read_start_addr_o : out std_logic_vector(g_DDR_AXI_AWIDTH-1 downto 0)

    );
end DDR_read_controller;

--=================================================================================================
-- DDR_read_controller architecture body
--=================================================================================================

architecture DDR_read_controller of DDR_read_controller is

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
                     READ_TRIG,
                     READING);
  signal s_state           : FSM_STATE;
  signal s_read_en_dly1    : std_logic;
  signal s_read_en_dly2    : std_logic;
  signal s_read_en_re      : std_logic;
  signal s_read_req        : std_logic;
  signal s_read_start_addr : std_logic_vector(g_DDR_AXI_AWIDTH-1 downto 0);
  signal s_pan_h           : std_logic_vector(11 downto 0);
  signal s_pan_h_dly       : std_logic_vector(11 downto 0);
  signal s_pan_v           : std_logic_vector(11 downto 0);
  signal s_pan_v_dly       : std_logic_vector(11 downto 0);

begin

--=================================================================================================
-- Top level output port assignments
--=================================================================================================

  read_req_o        <= s_read_req;
  read_start_addr_o <= s_read_start_addr;

--=================================================================================================
-- Generate blocks
--=================================================================================================

--=================================================================================================
-- Asynchronous blocks
--=================================================================================================


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
      s_read_en_dly1 <= '0';
      s_read_en_dly2 <= '0';
      s_read_en_re   <= '0';
      s_pan_h        <= (others => '0');
      s_pan_h_dly    <= (others => '0');
      s_pan_v        <= (others => '0');
      s_pan_v_dly    <= (others => '0');
    elsif rising_edge(SYS_CLK_I) then
      s_read_en_dly1 <= read_en_i;
      s_read_en_dly2 <= s_read_en_dly1;
      s_read_en_re   <= s_read_en_dly1 and not(s_read_en_dly2);
      s_pan_h        <= h_pan_i;
      s_pan_v        <= v_pan_i;
      s_pan_h_dly    <= s_pan_h;
      s_pan_v_dly    <= s_pan_v;
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
      s_state           <= IDLE;
      s_read_req        <= '0';
      s_read_start_addr <= frame_start_addr_i & s_pan_v_dly & s_pan_h_dly;
    elsif rising_edge(SYS_CLK_I) then
      case s_state is
--------------------
-- IDLE state
--------------------
        when IDLE =>
          s_read_req <= '0';
          if(frame_end_i = '1') then
            s_read_start_addr <= frame_start_addr_i & s_pan_v_dly & s_pan_h_dly;
          end if;
          if(s_read_en_re = '1') then
            s_state <= READ_TRIG;
          end if;
--------------------
-- READ_TRIG state 
--------------------
        when READ_TRIG =>
          if(read_ackn_i = '1') then
            s_read_req <= '0';
            s_state    <= READING;
          else
            s_read_req <= '1';
          end if;
--------------------
-- READING state 
--------------------
        when READING =>
          if(read_done_i = '1') then
            s_state           <= IDLE;
            s_read_start_addr <= s_read_start_addr + c_LINE_GAP;
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
end DDR_read_controller;
