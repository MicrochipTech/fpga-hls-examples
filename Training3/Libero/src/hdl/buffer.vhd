--=================================================================================================
-- File Name                           : buffer.vhd

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
-- delay_buffer entity declaration
--=================================================================================================
entity delay_buffer is
  port(
-- Port list
    -- System reset
    reset_i : in std_logic;

    -- System reset
    sys_clk_i : in std_logic;

    -- End of frame
    eof_i : in std_logic;

    --Vertical shift input
    v_shift_i : in std_logic_vector(15 downto 0);

    --Horizontal shift input
    h_shift_i : in std_logic_vector(15 downto 0);

    --Vertical shift output
    v_shift_o : out std_logic_vector(15 downto 0);

    --Horizontal shift output
    h_shift_o : out std_logic_vector(15 downto 0)

    );
end delay_buffer;


--=================================================================================================
-- delay_buffer architecture body
--=================================================================================================

architecture delay_buffer of delay_buffer is

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

begin
--------------------------------------------------------------------------
-- Name       : SIGNAL_ASSIGHMENT
-- Description: Assigns the input to output when frame end occurs
--------------------------------------------------------------------------                              
  SIGNAL_ASSIGHMENT :
  process(sys_clk_i, reset_i)
  begin
    if(reset_i = '0') then
      v_shift_o <= (others => '0');
      h_shift_o <= (others => '0');
    elsif RISING_EDGE(sys_clk_i) then
      if(eof_i = '1') then
        v_shift_o <= v_shift_i;
        if h_shift_i > x"14" then
          h_shift_o <= h_shift_i - x"0014";
        else
          h_shift_o <= h_shift_i;
        end if;

      end if;
    end if;
  end process;

--=================================================================================================
-- Component Instantiations
--=================================================================================================
--NA--
end delay_buffer;
