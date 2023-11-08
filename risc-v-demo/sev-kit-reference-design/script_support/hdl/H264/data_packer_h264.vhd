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

--=================================================================================================
-- Libraries
--=================================================================================================
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.math_real."ceil";
use IEEE.math_real."log2";
--=================================================================================================
-- data_packer_h264 entity declaration
--=================================================================================================
entity data_packer_h264 is
  generic(
-- Generic list
    g_IP_DW          : integer := 8; -- input data width should be powers of 2
    g_OP_DW          : integer := 512   -- output data width 
    );
  port(
-- Port list
    -- System reset
    reset_i       : in std_logic;

    -- System clock
    sys_clk_i     : in std_logic;

    -- enable
    data_valid_i  : in std_logic;

    --Frame end input
    frame_end_i   : in std_logic;

    -- Data Input
    data_i        : in std_logic_vector(g_IP_DW-1 downto 0);

    -- Data Enable
    data_valid_o  : out std_logic;

    -- Data output
    data_o        : out std_logic_vector(g_OP_DW-1 downto 0)

    );
end data_packer_h264;

--=================================================================================================
-- data_packer_h264 architecture body
--=================================================================================================

architecture data_packer_h264 of data_packer_h264 is

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
  CONSTANT C_MC             : INTEGER := g_OP_DW / g_IP_DW;--max count
  CONSTANT C_CW             : INTEGER := integer(ceil(log2(real(C_MC))));--counter width
  CONSTANT C_MAX_WLEN       : INTEGER := 32;--max burst length/ number of data valids
  TYPE DATA_ARRAY IS ARRAY (0 to C_MC-1) OF STD_LOGIC_VECTOR(g_IP_DW-1 DOWNTO 0);
  signal s_data_arr	        : DATA_ARRAY;
  signal s_counter          : std_logic_vector(C_CW-1 downto 0); -- input data count
  signal s_data_pack        : std_logic_vector(g_OP_DW-1 downto 0);  
  signal s_frame_end_sr     : std_logic_vector(5 downto 0);  
  signal s_frame_end_re     : std_logic;
  signal s_frame_end_re_dly : std_logic;
  signal s_buf_wr_done_dly1 : std_logic;
  signal s_buf_wr_done_dly2 : std_logic;  
  signal s_data_valid_out   : std_logic;
  signal s_ones             : std_logic_vector(C_CW-1 downto 0);

begin

--=================================================================================================
-- Top level output port assignments
--=================================================================================================
  data_o           <= s_data_pack;
  data_valid_o     <= s_data_valid_out;
--=================================================================================================
-- Generate blocks
--=================================================================================================
--------------------------------------------------------------------------
-- Name       : GENERATE_DATA_PACK
-- Description: data packing
--------------------------------------------------------------------------  
GENERATE_DATA_PACK: FOR I IN 0 TO C_MC-1 GENERATE
  s_data_pack(g_IP_DW*(I+1)-1 DOWNTO g_IP_DW*I) <= s_data_arr(I);
  DATA_PACK_PROC:
    PROCESS(SYS_CLK_I,RESET_I)
    BEGIN
       IF (RESET_I = '0') THEN
          s_data_arr(I)          <= (OTHERS=>'0'); 
       ELSIF rising_edge(SYS_CLK_I) THEN
          IF(data_valid_i = '1' AND s_counter = 0) THEN
             IF (I > 0) THEN
               s_data_arr(I)     <= (OTHERS=>'0');
             ELSE
               s_data_arr(I)     <= data_i;
             END IF;  
          ELSIF(data_valid_i = '1' AND s_counter = I) THEN
             s_data_arr(I)       <= data_i; 
          END IF;
       END IF;
    END PROCESS;
END GENERATE GENERATE_DATA_PACK;
--=================================================================================================
-- Asynchronous blocks
--=================================================================================================
  s_frame_end_re <= s_frame_end_sr(4) and not(s_frame_end_sr(5));
  s_ones         <= (others => '1');
--=================================================================================================
-- Synchronous blocks
--=================================================================================================
--------------------------------------------------------------------------
-- Name       : DELAY
-- Description: Process delays input signals
--------------------------------------------------------------------------
  DELAY :
  process(SYS_CLK_I, RESET_I)
  begin
    if RESET_I = '0' then
      s_frame_end_sr <= (others => '0');
      s_frame_end_re_dly <= '0';
    elsif rising_edge(SYS_CLK_I) then
      s_frame_end_sr     <= s_frame_end_sr(4 downto 0) & frame_end_i;
      s_frame_end_re_dly <= s_frame_end_re;
    end if;
  end process;
  
--------------------------------------------------------------------------
-- Name       : DATA_COUNTER
-- Description: Counter to count data
--------------------------------------------------------------------------
  DATA_COUNTER :
  process(SYS_CLK_I, RESET_I)
  begin
    if RESET_I = '0' then
      s_counter <= (others => '0');
    elsif rising_edge(SYS_CLK_I) then
      if(data_valid_i = '1')then
        s_counter <= s_counter + '1';
      elsif (s_frame_end_re = '1') then
        s_counter <= (others => '0');  
      end if;
    end if;
  end process;

--------------------------------------------------------------------------
-- Name       : DATA_VALID
-- Description: Process to generate data valid output
--------------------------------------------------------------------------
  DATA_VALID :
  process(SYS_CLK_I, RESET_I)
  begin
    if RESET_I = '0' then
      s_data_valid_out <= '0';
    elsif rising_edge(SYS_CLK_I) then
      if ((data_valid_i = '1' AND s_counter = s_ones) OR 
         (s_frame_end_re = '1' AND s_counter /= 0)) then
        s_data_valid_out  <= '1';
      else
        s_data_valid_out  <= '0';
      end if;
    end if;
  end process;  
--=================================================================================================
-- Component Instantiations
--=================================================================================================
--NA--
end data_packer_h264;
