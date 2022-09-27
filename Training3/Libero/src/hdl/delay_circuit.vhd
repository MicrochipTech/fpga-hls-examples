--=================================================================================================
-- File Name                           : delay_circuit.vhd
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

entity delay_circuit is
  port (
    reset_n      : in  std_logic;
    sys_clk      : in  std_logic;
    img_valid_i  : in  std_logic;
    img_data_i   : in  std_logic_vector(23 downto 0);
    alpha_valid_i : in  std_logic;
    img_valid_o  : out std_logic;
    img_data_o   : out std_logic_vector(23 downto 0);
    alpha_valid_o : out std_logic
    );
end delay_circuit;


architecture behaviour of delay_circuit is
  signal s_alpha_valid1 : std_logic;
  signal s_alpha_valid2 : std_logic;
  signal s_alpha_valid3 : std_logic;
begin

  process(sys_clk, reset_n)
  begin
    if reset_n = '0' then
      s_alpha_valid1 <= '0';
      s_alpha_valid2 <= '0';
      s_alpha_valid3 <= '0';
      img_valid_o   <= '0';
      img_data_o    <= (others => '0');
      alpha_valid_o  <= '0';
    elsif(rising_edge (sys_clk)) then
      s_alpha_valid1 <= alpha_valid_i;
      s_alpha_valid2 <= s_alpha_valid1;
      s_alpha_valid3 <= s_alpha_valid2;
      img_valid_o   <= img_valid_i;
      img_data_o    <= img_data_i;
      alpha_valid_o  <= s_alpha_valid3;
    end if;
  end process;

end behaviour;
