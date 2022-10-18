--=================================================================================================
-- File Name                           : alpha_enable.vhd

-- Targeted device                     : Microsemi-SoC
-- Author                              : India Solutions Team
--
-- COPYRIGHT 2020 BY MICROSEMI
-- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS FROM MICROSEMI
-- CORP. IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM MICROSEMI FOR USE OF THIS
-- FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND NO BACK-UP OF THE FILE SHOULD BE MADE.
--
--=================================================================================================

library IEEE;

use IEEE.std_logic_1164.all;

entity alpha_enable is
  port (
    reset_i   : in  std_logic;
    sys_clk_i : in  std_logic;
    en_i      : in  std_logic;
    alpha_i   : in  std_logic_vector(7 downto 0);
    alpha_o   : out std_logic_vector(7 downto 0)
    );
end alpha_enable;

architecture architecture_alpha_enable of alpha_enable is

begin

--------------------------------------------------------------------------
-- Name       : LATCH
-- Description: Latches alpha input based enable signal
--------------------------------------------------------------------------
  LATCH :
  process(SYS_CLK_I, RESET_I)
  begin
    if RESET_I = '0' then
      alpha_o <= (others => '0');
    elsif(rising_edge(SYS_CLK_I))then
      if(en_i = '1') then
        alpha_o <= alpha_i;
      else
        alpha_o <= x"00";
      end if;
    end if;
  end process;

end architecture_alpha_enable;
