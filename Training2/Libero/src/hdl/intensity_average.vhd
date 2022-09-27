--=================================================================================================
-- File Name                           : intensity_average
-- Targeted device                     : Microsemi-SoC
-- Author                              : India Solutions Team
--
-- COPYRIGHT 2019 BY MICROSEMI
-- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS FROM MICROSEMI
-- CORP. IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM MICROSEMI FOR USE OF THIS
-- FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND NO BACK-UP OF THE FILE SHOULD BE MADE.
--
--=================================================================================================

-------------------------------------------------------------------------------
-- Library 
-------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_UNSIGNED.all;

-------------------------------------------------------------------------------
-- intensity average entity declaration
-------------------------------------------------------------------------------
entity intensity_average is
  port (
    RESETN_I     : in  std_logic;
    SYS_CLK_I    : in  std_logic;
    data_valid_i : in  std_logic;
    frame_end_i  : in  std_logic;
    r_i          : in  std_logic_vector(7 downto 0);
    g_i          : in  std_logic_vector(7 downto 0);
    b_i          : in  std_logic_vector(7 downto 0);
    y_o          : out std_logic_vector(31 downto 0)
    );
end intensity_average;


-------------------------------------------------------------------------------
-- intensity_average architecture body
-------------------------------------------------------------------------------
architecture architecture_intensity_average of intensity_average is

  -----------------------------------------------------------------------------
  -- Signal declarations
  -----------------------------------------------------------------------------
  signal s_sum_reg        : std_logic_vector(31 downto 0);
  signal s_sum_reg1       : std_logic_vector(31 downto 0);
  signal s_frame_end      : std_logic;
  signal s_frame_end1     : std_logic;
  signal s_frame_valid_re : std_logic;

begin

  y_o              <= s_sum_reg1;
  s_frame_valid_re <= not (s_frame_end) and s_frame_end1;

  -----------------------------------------------------------------------------
  -- Storing frame end signal in two back to back DFF
  -----------------------------------------------------------------------------
  process(SYS_CLK_I, RESETN_I)
  begin
    if (RESETN_I = '0') then
      s_frame_end  <= '0';
      s_frame_end1 <= '0';
    elsif rising_edge(SYS_CLK_I) then
      s_frame_end  <= frame_end_i;
      s_frame_end1 <= s_frame_end;
    end if;
  end process;
  ------------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  -- Adder process to add RGB inputs and store it in a register
  -----------------------------------------------------------------------------
  process(SYS_CLK_I, RESETN_I)
  begin
    if (RESETN_I = '0') then
      s_sum_reg  <= (others => '0');
      s_sum_reg1 <= (others => '0');
    elsif rising_edge(SYS_CLK_I) then
      if (s_frame_valid_re = '1') then
        s_sum_reg  <= (others => '0');
        s_sum_reg1 <= s_sum_reg;
      elsif (data_valid_i = '1') then
        s_sum_reg <= s_sum_reg + (x"000000" & '0' & r_i(7 downto 1)) + (x"000000" & g_i) + (x"000000" & "00" & b_i(7 downto 2)); end if;
    end if;
  end process;
  -----------------------------------------------------------------------------

end architecture_intensity_average;

