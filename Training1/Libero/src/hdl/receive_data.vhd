--=================================================================================================
-- File Name                           : receive_data.vhd
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
-- receive_data entity declaration
--=================================================================================================
entity receive_data is
  port (
-- Port list
    -- System reset
    reset_i : in std_logic;

    -- System clock
    sys_clk_i : in std_logic;

    -- Data received signal from COREUART
    rx_rdy_i : in std_logic;

    -- Data input
    data_i : in std_logic_vector(7 downto 0);

    -- Output enable signal to CoreUART
    oen_o : out std_logic;

    -- Data sync output
    data_rdy_o : out std_logic;

    -- Address output
    addr_o : out std_logic_vector(15 downto 0);

    -- Data output
    data_o : out std_logic_vector(31 downto 0)

    );
end receive_data;


--=================================================================================================
-- receive_data architecture body
--=================================================================================================
architecture receive_data of receive_data is

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
                    GET_1,
                    SET_DATA_0,
                    SET_DATA_0_I1,
                    SET_DATA_0_I2,
                    SET_DATA_0_I3,
                    SET_DATA_0_I4,
                    SET_DATA_0_I5,
                    SET_DATA_1,
                    SET_DATA_1_I1,
                    SET_DATA_1_I2,
                    SET_DATA_2,
                    SET_DATA_2_I1,
                    SET_DATA_2_I2,
                    SET_DATA_3,
                    SET_DATA_3_I1,
                    SET_DATA_3_I2,
                    SET_DATA_4,
                    SET_DATA_4_I1,
                    SET_DATA_4_I2
                    );
  signal state : UART_FSM;

  signal oen_s      : std_logic;
  signal s_data_rdy : std_logic;
  signal s_addr     : std_logic_vector(15 downto 0);
  signal s_data     : std_logic_vector(31 downto 0);

begin

--=================================================================================================
-- Top level output port assignments
--=================================================================================================
  addr_o     <= s_addr;
  data_o     <= s_data;
  data_rdy_o <= s_data_rdy;
  oen_o      <= oen_s;
--=================================================================================================
-- Generate blocks
--=================================================================================================
--NA--

--=================================================================================================
-- Asynchronous blocks
--=================================================================================================

--------------------------------------------------------------------------
-- Name       : FSM_PROC
-- Description: This process implements the UART interface FSM
--------------------------------------------------------------------------
  FSM_PROC :
  process(sys_clk_i, reset_i)
  begin
    if reset_i = '0' then
      state      <= IDLE;
      oen_s      <= '1';
      s_data_rdy <= '0';
      s_addr     <= (others => '1');
      s_data     <= (others => '0');
    elsif RISING_EDGE(sys_clk_i) then
      case state is
------------------
-- IDLE state
------------------
        when IDLE =>
          s_data_rdy <= '0';
          if (rx_rdy_i = '1') then
            if(data_i = x"AA")then      --Handshake signal
              state <= GET_1;
              oen_s <= '0';
            else
              state <= IDLE;
            end if;
          else
            oen_s <= '1';
            state <= IDLE;
          end if;

------------------
-- GET_1 state
------------------
        when GET_1 =>
          if (rx_rdy_i = '1') then
            oen_s <= '0';
            if(data_i = x"BB")then
              state <= SET_DATA_0;
            else
              state <= IDLE;
            end if;
          else
            oen_s <= '1';
            state <= GET_1;
          end if;

------------------
-- SET_DATA_0 state
------------------
        when SET_DATA_0 =>
          if (rx_rdy_i = '1') then
            oen_s <= '0';
            state <= SET_DATA_0_I1;
          else
            oen_s <= '1';
            state <= SET_DATA_0;
          end if;

------------------
-- SET_DATA_0_I1 state
------------------
        when SET_DATA_0_I1 =>
          if (rx_rdy_i = '1') then
            oen_s <= '0';
            state <= SET_DATA_0_I2;
          else
            oen_s <= '1';
            state <= SET_DATA_0_I1;
          end if;

------------------
-- SET_DATA_0_I2 state
------------------
        when SET_DATA_0_I2 =>
          if (rx_rdy_i = '1') then
            oen_s               <= '0';
            s_addr(15 downto 8) <= data_i;
            state               <= SET_DATA_0_I3;
          else
            oen_s <= '1';
            state <= SET_DATA_0_I2;
          end if;
------------------
-- SET_DATA_0_I3 state
------------------
        when SET_DATA_0_I3 =>
          if (rx_rdy_i = '1') then
            oen_s <= '0';
            state <= SET_DATA_0_I4;
          else
            oen_s <= '1';
            state <= SET_DATA_0_I3;
          end if;

------------------
-- SET_DATA_0_I4 state
------------------
        when SET_DATA_0_I4 =>
          if (rx_rdy_i = '1') then
            oen_s <= '0';
            state <= SET_DATA_0_I5;
          else
            oen_s <= '1';
            state <= SET_DATA_0_I4;
          end if;

------------------
-- SET_DATA_0_I5 state
------------------
        when SET_DATA_0_I5 =>
          if (rx_rdy_i = '1') then
            oen_s              <= '0';
            s_addr(7 downto 0) <= data_i;
            state              <= SET_DATA_1;
          else
            oen_s <= '1';
            state <= SET_DATA_0_I5;
          end if;
------------------
-- SET_DATA_1 state
------------------
        when SET_DATA_1 =>
          if (rx_rdy_i = '1') then
            oen_s <= '0';
            state <= SET_DATA_1_I1;
          else
            oen_s <= '1';
            state <= SET_DATA_1;
          end if;
------------------
-- SET_DATA_1_I1 state
------------------
        when SET_DATA_1_I1 =>
          if (rx_rdy_i = '1') then
            oen_s <= '0';
            state <= SET_DATA_1_I2;
          else
            oen_s <= '1';
            state <= SET_DATA_1_I1;
          end if;
------------------
-- SET_DATA_1_I2 state
------------------
        when SET_DATA_1_I2 =>
          if (rx_rdy_i = '1') then
            oen_s                <= '0';
            s_data(31 downto 24) <= data_i;
            state                <= SET_DATA_2;
          else
            oen_s <= '1';
            state <= SET_DATA_1_I2;
          end if;

------------------
-- SET_DATA_2 state
------------------
        when SET_DATA_2 =>
          if (rx_rdy_i = '1') then
            oen_s <= '0';
            state <= SET_DATA_2_I1;
          else
            oen_s <= '1';
            state <= SET_DATA_2;
          end if;
------------------
-- SET_DATA_2_I1 state
------------------
        when SET_DATA_2_I1 =>
          if (rx_rdy_i = '1') then
            oen_s <= '0';
            state <= SET_DATA_2_I2;
          else
            oen_s <= '1';
            state <= SET_DATA_2_I1;
          end if;
------------------
-- SET_DATA_2_I2 state
------------------
        when SET_DATA_2_I2 =>
          if (rx_rdy_i = '1') then
            oen_s                <= '0';
            s_data(23 downto 16) <= data_i;
            state                <= SET_DATA_3;
          else
            oen_s <= '1';
            state <= SET_DATA_2_I2;
          end if;
------------------
-- SET_DATA_3 state
------------------
        when SET_DATA_3 =>
          if (rx_rdy_i = '1') then
            oen_s <= '0';
            state <= SET_DATA_3_I1;
          else
            oen_s <= '1';
            state <= SET_DATA_3;
          end if;
------------------
-- SET_DATA_3_I1 state
------------------
        when SET_DATA_3_I1 =>
          if (rx_rdy_i = '1') then
            oen_s <= '0';
            state <= SET_DATA_3_I2;
          else
            oen_s <= '1';
            state <= SET_DATA_3_I1;
          end if;
------------------
-- SET_DATA_3_I2 state
------------------
        when SET_DATA_3_I2 =>
          if (rx_rdy_i = '1') then
            oen_s               <= '0';
            s_data(15 downto 8) <= data_i;
            state               <= SET_DATA_4;
          else
            oen_s <= '1';
            state <= SET_DATA_3_I2;
          end if;
------------------
-- SET_DATA_4 state
------------------
        when SET_DATA_4 =>
          if (rx_rdy_i = '1') then
            oen_s <= '0';
            state <= SET_DATA_4_I1;
          else
            oen_s <= '1';
            state <= SET_DATA_4;
          end if;
------------------
-- SET_DATA_4_I1 state
------------------
        when SET_DATA_4_I1 =>
          if (rx_rdy_i = '1') then
            oen_s <= '0';
            state <= SET_DATA_4_I2;
          else
            oen_s <= '1';
            state <= SET_DATA_4_I1;
          end if;
------------------
-- SET_DATA_4_I2 state
------------------
        when SET_DATA_4_I2 =>
          if (rx_rdy_i = '1') then
            oen_s              <= '0';
            s_data(7 downto 0) <= data_i;
            s_data_rdy         <= '1';
            state              <= IDLE;
          else
            oen_s <= '1';
            state <= SET_DATA_4_I2;
          end if;
--------------------
-- OTHERS state
--------------------
        when others =>
          oen_s  <= '1';
          s_data <= (others => '0');
          s_addr <= (others => '0');
          state  <= IDLE;

      end case;
    end if;

  end process;

--=================================================================================================
-- Component Instantiations
--=================================================================================================
--NA--

end receive_data;
