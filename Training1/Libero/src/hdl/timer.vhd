--=================================================================================================
-- File Name                           : timer.vhd
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
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.std_logic_1164.all;

entity timer is
  port (
    -- Reset signal
    reset_i   : in  std_logic;
    -- System reset
    sys_clk_i : in  std_logic;
    -- Output pulse
    tick_o    : out std_logic;
    pulse_o   : out std_logic
    );
end timer;

--=================================================================================================
-- Architecture body
--=================================================================================================
architecture t1 of timer is
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
  signal s_out   : std_logic_vector(15 downto 0);
  signal s_pulse : std_logic;


begin
--=================================================================================================
-- Top level output port assignments
--=================================================================================================
  pulse_o <= s_pulse;
--=================================================================================================
-- Synchronous blocks
--=================================================================================================
  DELAY_PROC :
  process(reset_i, sys_clk_i)
  begin
    if (reset_i = '0') then
      s_out   <= (others => '0');
      tick_o  <= '0';
      s_pulse <= '0';
    elsif rising_edge(sys_clk_i) then
      if(s_out(15 downto 0) = x"2710")then  --50MHz clock, x"4C0000" counts = 99.61ms//2FA//C350 -> 1ms//2710 -> 0.2ms
        s_out   <= (others => '0');
        tick_o  <= '1';
        s_pulse <= not(s_pulse);
      else
        tick_o <= '0';
        s_out  <= s_out + '1';
      end if;
    end if;
  end process;


--=================================================================================================
-- Component Instantiations
--=================================================================================================
--NA--
end t1;
