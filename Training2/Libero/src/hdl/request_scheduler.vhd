--=================================================================================================
-- File Name                           : request_scheduler.vhd
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
-- request_scheduler entity declaration
--=================================================================================================
entity request_scheduler is
  port (
--Port list
    -- system reset
    reset_i : in std_logic;

    -- system clock
    sys_clk_i : in std_logic;

    --Acknowledge input from Write Master
    ack_i : in std_logic;

    --Read/Write request from DDR Write Controllers 0-3
    req0_i : in std_logic;
    req1_i : in std_logic;
    req2_i : in std_logic;
    req3_i : in std_logic;

    --Done signal from Write Master
    done_i : in std_logic;

    --Request output signal to DDR Write Controllers
    req_o : out std_logic;

    --Mux selection output for channel selection
    mux_sel_o : out std_logic_vector(1 downto 0)
    );
end request_scheduler;

--=================================================================================================
-- request_scheduler architecture body
--=================================================================================================
architecture request_scheduler of request_scheduler is

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
  type scheduler_states is (IDLE,
                            SCAN,
                            ASSIGN_REQ,
                            ASSIGN_REQ_1,
                            WAIT_FOR_ACK,
                            WAIT_FOR_DONE);

  type matrix_4x3 is array(0 to 3) of std_logic_vector (2 downto 0);

  signal s_state      : scheduler_states;
  signal s_fifo       : matrix_4x3;
  signal s_req0_re    : std_logic;
  signal s_req1_re    : std_logic;
  signal s_req2_re    : std_logic;
  signal s_req3_re    : std_logic;
  signal s_req0_dly   : std_logic;
  signal s_req1_dly   : std_logic;
  signal s_req2_dly   : std_logic;
  signal s_req3_dly   : std_logic;
  signal s_req0_latch : std_logic;
  signal s_req1_latch : std_logic;
  signal s_req2_latch : std_logic;
  signal s_req3_latch : std_logic;
  signal s_clear_fifo : std_logic;
  signal s_write_ctr  : std_logic_vector(1 downto 0);
  signal s_read_ctr   : std_logic_vector(1 downto 0);

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
  s_req0_re <= not(s_req0_dly) and req0_i;
  s_req1_re <= not(s_req1_dly) and req1_i;
  s_req2_re <= not(s_req2_dly) and req2_i;
  s_req3_re <= not(s_req3_dly) and req3_i;
--=================================================================================================
-- Synchronous blocks
--=================================================================================================
--------------------------------------------------------------------------
-- Name       : DELAY_PROC
-- Description: Process generates delayed version of signals
--------------------------------------------------------------------------
  DELAY_PROC :
  process(sys_clk_i, reset_i)
  begin
    if(reset_i = '0') then
      s_req0_dly <= '0';
      s_req1_dly <= '0';
      s_req2_dly <= '0';
      s_req3_dly <= '0';
    elsif (RISING_EDGE(sys_clk_i)) then
      s_req0_dly <= req0_i;
      s_req1_dly <= req1_i;
      s_req2_dly <= req2_i;
      s_req3_dly <= req3_i;
    end if;
  end process;
--------------------------------------------------------------------------
-- Name       : WRITE_FIFO_PROC
-- Description: Process registers incoming requests in FIFO
--------------------------------------------------------------------------
  WRITE_FIFO_PROC :
  process(sys_clk_i, reset_i)
  begin
    if(reset_i = '0') then
      s_write_ctr  <= "00";
      s_fifo       <= (others => (others => '1'));
      s_req0_latch <= '0';
      s_req1_latch <= '0';
      s_req2_latch <= '0';
      s_req3_latch <= '0';
    elsif (RISING_EDGE(sys_clk_i)) then
      if(s_clear_fifo = '1')then
        s_fifo(to_integer(unsigned(s_read_ctr))) <= "111";
      elsif(s_req0_latch = '1')then
        s_req0_latch                              <= '0';
        s_write_ctr                               <= s_write_ctr + '1';
        s_fifo(to_integer(unsigned(s_write_ctr))) <= "000";
      elsif(s_req1_latch = '1')then
        s_req1_latch                              <= '0';
        s_write_ctr                               <= s_write_ctr + '1';
        s_fifo(to_integer(unsigned(s_write_ctr))) <= "001";
      elsif(s_req2_latch = '1')then
        s_req2_latch                              <= '0';
        s_write_ctr                               <= s_write_ctr + 1;
        s_fifo(to_integer(unsigned(s_write_ctr))) <= "010";
      elsif(s_req3_latch = '1')then
        s_req3_latch                              <= '0';
        s_write_ctr                               <= s_write_ctr + 1;
        s_fifo(to_integer(unsigned(s_write_ctr))) <= "011";
      end if;

      if(s_req0_re = '1')then
        s_req0_latch <= '1';
      end if;
      if(s_req1_re = '1')then
        s_req1_latch <= '1';
      end if;
      if(s_req2_re = '1')then
        s_req2_latch <= '1';
      end if;
      if(s_req3_re = '1')then
        s_req3_latch <= '1';
      end if;

    end if;
  end process;
--------------------------------------------------------------------------
-- Name       : FSM_PROC
-- Description: FSM implements scheduler FSM
--------------------------------------------------------------------------
  FSM_PROC :
  process(sys_clk_i, reset_i)
  begin
    if(reset_i = '0') then
      s_state      <= IDLE;
      s_read_ctr   <= "00";
      mux_sel_o    <= "00";
      req_o        <= '0';
      s_clear_fifo <= '0';
    elsif (RISING_EDGE(sys_clk_i)) then
      case s_state is
--------------------
-- IDLE state
--------------------
        when IDLE =>
          s_state <= SCAN;
--------------------
-- SCAN state
--------------------
        when SCAN =>
          case s_fifo(to_integer(unsigned(s_read_ctr))) is
            when "000" =>
              s_state   <= ASSIGN_REQ;
              mux_sel_o <= "00";
            when "001" =>
              s_state   <= ASSIGN_REQ;
              mux_sel_o <= "01";
            when "010" =>
              s_state   <= ASSIGN_REQ;
              mux_sel_o <= "10";
            when "011" =>
              s_state   <= ASSIGN_REQ;
              mux_sel_o <= "11";
            when others =>
              s_state    <= SCAN;
              s_read_ctr <= s_read_ctr + 1;
          end case;
--------------------
-- ASSIGN_REQ state
--------------------
        when ASSIGN_REQ =>
          s_state <= ASSIGN_REQ_1;

--------------------
-- ASSIGN_REQ_1 state
--------------------
        when ASSIGN_REQ_1 =>
          s_state      <= WAIT_FOR_ACK;
          req_o        <= '1';
          s_clear_fifo <= '0';
--------------------
-- WAIT_FOR_ACK state
--------------------
        when WAIT_FOR_ACK =>
          if(ack_i = '1')then
            s_clear_fifo <= '1';
            s_state      <= WAIT_FOR_DONE;
            req_o        <= '0';
          else
            s_state <= WAIT_FOR_ACK;
          end if;
--------------------
-- WAIT_FOR_DONE state
--------------------
        when WAIT_FOR_DONE =>
          s_clear_fifo <= '0';
          if(done_i = '1')then
            s_read_ctr <= s_read_ctr + 1;
            s_state    <= SCAN;
          else
            s_state <= WAIT_FOR_DONE;
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
--NA
end request_scheduler;
