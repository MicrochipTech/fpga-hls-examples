--=================================================================================================
-- File Name                           : synchronizer_rtl.vhd
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

entity synchronizer_circuit is
  port (
    reset_n  : in  std_logic;
    sys_clk  : in  std_logic;
    data_in  : in  std_logic;
    sync_out : out std_logic
    );
end synchronizer_circuit;


architecture behaviour of synchronizer_circuit is
  signal s_data_in : std_logic;
begin

  process(sys_clk, reset_n)
  begin
    if reset_n = '0' then
      s_data_in <= '0';
      sync_out  <= '0';
    elsif(rising_edge (sys_clk)) then
      s_data_in <= data_in;
      sync_out  <= s_data_in;
    end if;
  end process;

end behaviour;
