--=================================================================================================
-- File Name                           : send_data.vhd
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
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

--=================================================================================================
-- send_data entity declaration
--=================================================================================================
entity send_data is

  port (
-- Port list
    -- System reset
    reset_i : in std_logic;

    -- System clock
    sys_clk_i : in std_logic;

    -- Data received signal from COREUART
    tx_rdy_i : in std_logic;

    -- Send trigger
    start_i : in std_logic;

    -- Data input
    data_cha_i : in  std_logic_vector(15 downto 0);
    data_chb_i : in  std_logic_vector(15 downto 0);
    data_chc_i : in  std_logic_vector(15 downto 0);
    data_chd_i : in  std_logic_vector(15 downto 0);
    status_i   : in  std_logic_vector(7 downto 0);
    -- Output enable signal to CoreUART
    wen_o      : out std_logic;

    -- Address output
    data_o : out std_logic_vector(7 downto 0)

    );
end send_data;


--=================================================================================================
-- send_data architecture body
--=================================================================================================
architecture send_data of send_data is

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
  type UART_FSM is (IDLE,
                    SEND_DATA_0,
                    SEND_DATA_0I,
                    SEND_DATA_1,
                    SEND_DATA_1I,
                    SEND_DATA_2,
                    SEND_DATA_2I,
                    SEND_DATA_3,
                    SEND_DATA_3I,
                    SEND_DATA_4,
                    SEND_DATA_4I,
                    SEND_DATA_5,
                    SEND_DATA_5I,
                    SEND_DATA_6,
                    SEND_DATA_6I,
                    SEND_DATA_7,
                    SEND_DATA_7I,
                    SEND_DATA_8,
                    SEND_DATA_8I,
                    SEND_DATA_9,
                    SEND_DATA_9I,
                    SEND_DATA_10,
                    SEND_DATA_10I
                    );
  signal state : UART_FSM;

  signal wen_s       : std_logic;
  signal s_start_dtc : std_logic;
  signal s_start_dly : std_logic;
  signal s_status    : std_logic_vector(7 downto 0);
  signal data_out_s  : std_logic_vector(7 downto 0);
  signal s_data_cha  : std_logic_vector(15 downto 0);
  signal s_data_chb  : std_logic_vector(15 downto 0);
  signal s_data_chc  : std_logic_vector(15 downto 0);
  signal s_data_chd  : std_logic_vector(15 downto 0);

begin

--=================================================================================================
-- Top level output port assignments
--=================================================================================================
  wen_o  <= wen_s;
  data_o <= data_out_s;
--=================================================================================================
-- Generate blocks
--=================================================================================================
--NA--

--=================================================================================================
-- Asynchronous blocks
--=================================================================================================
  s_start_dtc <= not(s_start_dly) and start_i;
--=================================================================================================
-- Synchronous blocks
--=================================================================================================
--------------------------------------------------------------------------
-- Name       : DELAY_PROC
-- Description: This process generates the slave select signal
--------------------------------------------------------------------------
  DELAY_PROC :
  process(reset_i, sys_clk_i)
  begin
    if (reset_i = '0') then
      s_start_dly <= '0';
    elsif rising_edge(sys_clk_i) then
      s_start_dly <= start_i;
    end if;
  end process;


--------------------------------------------------------------------------
-- Name       : LATCH_PROC
-- Description: This process latches inputs at the start trigger
--------------------------------------------------------------------------
  LATCH_PROC :
  process(reset_i, sys_clk_i)
  begin
    if (reset_i = '0') then
      s_data_cha <= (others => '0');
      s_data_chb <= (others => '0');
      s_data_chc <= (others => '0');
      s_data_chd <= (others => '0');
      s_status   <= (others => '0');
    elsif rising_edge(sys_clk_i) then
      if(s_start_dtc = '1')then
        s_data_cha <= data_cha_i;
        s_data_chb <= data_chb_i;
        s_data_chc <= data_chc_i;
        s_data_chd <= data_chd_i;
        s_status   <= status_i;
      end if;
    end if;
  end process;
--------------------------------------------------------------------------
-- Name       : FSM_PROC
-- Description: This process implements the UART interface FSM
--------------------------------------------------------------------------
  FSM_PROC :
  process(sys_clk_i, reset_i)
  begin
    if reset_i = '0' then
      state      <= IDLE;
      wen_s      <= '1';
      data_out_s <= x"CC";
    elsif RISING_EDGE(sys_clk_i) then
      case state is
------------------
-- IDLE state
------------------
        when IDLE =>

          wen_s <= '1';
          if (tx_rdy_i = '1') then
            if(s_start_dtc = '1')then   --Start
              state <= SEND_DATA_0;
            else
              state <= IDLE;
            end if;
          else
            state <= IDLE;
          end if;

------------------
-- SEND_DATA_0 state
------------------
        when SEND_DATA_0 =>
          if (tx_rdy_i = '1') then
            state <= SEND_DATA_0I;
            wen_s <= '0';
          else
            state <= SEND_DATA_0;
            wen_s <= '1';
          end if;

------------------
-- SEND_DATA_0I state
------------------
        when SEND_DATA_0I =>
          if (tx_rdy_i = '1') then
            state      <= SEND_DATA_1;
            data_out_s <= x"AA";
            wen_s      <= '0';
          else
            state <= SEND_DATA_0I;
            wen_s <= '1';
          end if;

------------------
-- SEND_DATA_1 state
------------------
        when SEND_DATA_1 =>
          if (tx_rdy_i = '1') then
            state <= SEND_DATA_1I;
            wen_s <= '0';
          else
            state <= SEND_DATA_1;
            wen_s <= '1';
          end if;

------------------
-- SEND_DATA_1I state
------------------
        when SEND_DATA_1I =>
          if (tx_rdy_i = '1') then
            state      <= SEND_DATA_2;
            data_out_s <= x"BB";
            wen_s      <= '0';
          else
            state <= SEND_DATA_1I;
            wen_s <= '1';
          end if;

------------------
-- SEND_DATA_2 state
------------------
        when SEND_DATA_2 =>
          if (tx_rdy_i = '1') then
            state <= SEND_DATA_2I;
            wen_s <= '0';
          else
            state <= SEND_DATA_2;
            wen_s <= '1';
          end if;

------------------
-- SEND_DATA_2I state
------------------
        when SEND_DATA_2I =>
          if (tx_rdy_i = '1') then
            state      <= SEND_DATA_3;
            data_out_s <= s_data_cha(15 downto 8);
            wen_s      <= '0';
          else
            state <= SEND_DATA_2I;
            wen_s <= '1';
          end if;

------------------
-- SEND_DATA_3 state
------------------
        when SEND_DATA_3 =>
          if (tx_rdy_i = '1') then
            state <= SEND_DATA_3I;
            wen_s <= '0';
          else
            state <= SEND_DATA_3;
            wen_s <= '1';
          end if;

------------------
-- SEND_DATA_3I state
------------------
        when SEND_DATA_3I =>
          if (tx_rdy_i = '1') then
            state      <= SEND_DATA_4;
            data_out_s <= s_data_cha(7 downto 0);
            wen_s      <= '0';
          else
            state <= SEND_DATA_3I;
            wen_s <= '1';
          end if;

------------------
-- SEND_DATA_4 state
------------------
        when SEND_DATA_4 =>
          if (tx_rdy_i = '1') then
            state <= SEND_DATA_4I;
            wen_s <= '0';
          else
            state <= SEND_DATA_4;
            wen_s <= '1';
          end if;

------------------
-- SEND_DATA_4I state
------------------
        when SEND_DATA_4I =>
          if (tx_rdy_i = '1') then
            state      <= SEND_DATA_5;
            data_out_s <= s_data_chb(15 downto 8);
            wen_s      <= '0';
          else
            state <= SEND_DATA_4I;
            wen_s <= '1';
          end if;

------------------
-- SEND_DATA_5 state
------------------
        when SEND_DATA_5 =>
          if (tx_rdy_i = '1') then
            state <= SEND_DATA_5I;
            wen_s <= '0';
          else
            state <= SEND_DATA_5;
            wen_s <= '1';
          end if;

------------------
-- SEND_DATA_5I state
------------------
        when SEND_DATA_5I =>
          if (tx_rdy_i = '1') then
            state      <= SEND_DATA_6;
            data_out_s <= s_data_chb(7 downto 0);
            wen_s      <= '0';
          else
            state <= SEND_DATA_5I;
            wen_s <= '1';
          end if;

------------------
-- SEND_DATA_6 state
------------------
        when SEND_DATA_6 =>
          if (tx_rdy_i = '1') then
            state <= SEND_DATA_6I;
            wen_s <= '0';
          else
            state <= SEND_DATA_6;
            wen_s <= '1';
          end if;

------------------
-- SEND_DATA_6I state
------------------
        when SEND_DATA_6I =>
          if (tx_rdy_i = '1') then
            state      <= SEND_DATA_7;
            data_out_s <= s_data_chc(15 downto 8);
            wen_s      <= '0';
          else
            state <= SEND_DATA_6I;
            wen_s <= '1';
          end if;

------------------
-- SEND_DATA_7 state
------------------
        when SEND_DATA_7 =>
          if (tx_rdy_i = '1') then
            state <= SEND_DATA_7I;
            wen_s <= '0';
          else
            state <= SEND_DATA_7;
            wen_s <= '1';
          end if;

------------------
-- SEND_DATA_7I state
------------------
        when SEND_DATA_7I =>
          if (tx_rdy_i = '1') then
            state      <= SEND_DATA_8;
            data_out_s <= s_data_chc(7 downto 0);
            wen_s      <= '0';
          else
            state <= SEND_DATA_7I;
            wen_s <= '1';
          end if;

------------------
-- SEND_DATA_8 state
------------------
        when SEND_DATA_8 =>
          if (tx_rdy_i = '1') then
            state <= SEND_DATA_8I;
            wen_s <= '0';
          else
            state <= SEND_DATA_8;
            wen_s <= '1';
          end if;

------------------
-- SEND_DATA_8I state
------------------
        when SEND_DATA_8I =>
          if (tx_rdy_i = '1') then
            state      <= SEND_DATA_9;
            data_out_s <= s_data_chd(15 downto 8);
            wen_s      <= '0';
          else
            state <= SEND_DATA_8I;
            wen_s <= '1';
          end if;

------------------
-- SEND_DATA_9 state
------------------
        when SEND_DATA_9 =>
          if (tx_rdy_i = '1') then
            state <= SEND_DATA_9I;
            wen_s <= '0';
          else
            state <= SEND_DATA_9;
            wen_s <= '1';
          end if;

------------------
-- SEND_DATA_9I state
------------------
        when SEND_DATA_9I =>
          if (tx_rdy_i = '1') then
            state      <= SEND_DATA_10;
            data_out_s <= s_data_chd(7 downto 0);
            wen_s      <= '0';
          else
            state <= SEND_DATA_9I;
            wen_s <= '1';
          end if;

------------------
-- SEND_DATA_10 state
------------------
        when SEND_DATA_10 =>
          if (tx_rdy_i = '1') then
            state <= SEND_DATA_10I;
            wen_s <= '0';
          else
            state <= SEND_DATA_10;
            wen_s <= '1';
          end if;

------------------
-- SEND_DATA_10I state
------------------
        when SEND_DATA_10I =>
          if (tx_rdy_i = '1') then
            state      <= IDLE;
            data_out_s <= s_status;
            wen_s      <= '0';
          else
            state <= SEND_DATA_10I;
            wen_s <= '1';
          end if;

--------------------
-- OTHERS state
--------------------
        when others =>
          wen_s      <= '1';
          data_out_s <= (others => '0');
          state      <= IDLE;

      end case;
    end if;

  end process;

--=================================================================================================
-- Component Instantiations
--=================================================================================================
--NA--

end send_data;
