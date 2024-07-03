--//////////////////////////////////////////////////////////////////////////////
-- Copyright (c) 2022, Microchip Corporation
-- All rights reserved.
--
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions are met:
--     * Redistributions of source code must retain the above copyright
--       notice, this list of conditions and the following disclaimer.
--     * Redistributions in binary form must reproduce the above copyright
--       notice, this list of conditions and the following disclaimer in the
--       documentation and/or other materials provided with the distribution.
--     * Neither the name of the <organization> nor the
--       names of its contributors may be used to endorse or promote products
--       derived from this software without specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
-- ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
-- WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
-- DISCLAIMED. IN NO EVENT SHALL MICROCHIP CORPORATIONM BE LIABLE FOR ANY
-- DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
-- (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
-- LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
-- ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
-- (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
-- SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--
-- APACHE LICENSE
-- Copyright (c) 2022, Microchip Corporation 
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--    http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--//////////////////////////////////////////////////////////////////////////////

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

