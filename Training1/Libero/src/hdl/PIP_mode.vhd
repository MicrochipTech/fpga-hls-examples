--=================================================================================================
-- File Name                           : PIP_mode.vhd
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
-- pip_mode entity declaration
--=================================================================================================
entity pip_mode is
  port(
-- Port list
    -- System reset
    reset_i : in std_logic;

    -- System reset
    sys_clk_i : in std_logic;

    --Vertical shift input
    step_i : in std_logic_vector(7 downto 0);

    --Vertical shift input
    v_shift_i : in std_logic_vector(15 downto 0);

    --Horizontal shift input
    h_shift_i : in std_logic_vector(15 downto 0);

    --Mode selection
    mode_i : in std_logic;

    --Vertical shift output
    v_shift_o : out std_logic_vector(15 downto 0);

    --Horizontal shift output
    h_shift_o : out std_logic_vector(15 downto 0)

    );
end pip_mode;


--=================================================================================================
-- pip_mode architecture body
--=================================================================================================

architecture pip_mode of pip_mode is


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
  signal s_h_direction : std_logic;
  signal s_v_direction : std_logic;

  signal s_h_counter : std_logic_vector(15 downto 0);
  signal s_v_counter : std_logic_vector(15 downto 0);
  signal s_counter   : std_logic_vector(21 downto 0);
begin
  v_shift_o <= s_v_counter when (mode_i = '1') else v_shift_i;
  h_shift_o <= s_h_counter when (mode_i = '1') else h_shift_i;
--------------------------------------------------------------------------
-- Name       : COUNTER
-- Description: Assigns the input to output when frame end occurs
--------------------------------------------------------------------------                              
  COUNTER :
  process(sys_clk_i, reset_i)
  begin
    if(reset_i = '0') then
      s_counter <= (others => '0');
    elsif RISING_EDGE(sys_clk_i) then
      if(s_counter(20) = '1') then
        s_counter <= (others => '0');
      else
        s_counter <= s_counter + 1;
      end if;
    end if;
  end process;
--------------------------------------------------------------------------
-- Name       : SIGNAL_ASSIGHMENT
-- Description: Assigns the input to output when frame end occurs
--------------------------------------------------------------------------                              
  SIGNAL_ASSIGHMENT :
  process(sys_clk_i, reset_i)
  begin
    if(reset_i = '0') then
      s_h_counter   <= x"001E";
      s_v_counter   <= x"0000";
      s_h_direction <= '0';
      s_v_direction <= '0';
    elsif RISING_EDGE(sys_clk_i) then
      if(s_counter(20) = '1') then
        if(s_h_counter >= 1330) then
          s_h_direction <= '1';
        elsif(s_h_counter <= 30) then
          s_h_direction <= '0';
        end if;
        if(s_v_counter >= 708) then
          s_v_direction <= '1';
        elsif(s_v_counter <= 0) then
          s_v_direction <= '0';
        end if;
        if(s_h_direction = '1') then
          s_h_counter <= s_h_counter - step_i;
        else
          s_h_counter <= s_h_counter + step_i;
        end if;
        if(s_v_direction = '1') then
          s_v_counter <= s_v_counter - step_i;
        else
          s_v_counter <= s_v_counter + step_i;
        end if;
      end if;
    end if;
  end process;

--=================================================================================================
-- Component Instantiations
--=================================================================================================
--NA--
end pip_mode;
