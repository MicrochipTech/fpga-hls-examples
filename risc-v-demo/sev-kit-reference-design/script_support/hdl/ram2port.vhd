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
library ieee;
use ieee.STD_logic_1164.all;
use ieee.NUMERIc_std.all;
use IEEE.std_logic_unsigned.all;

-------------------------------------------------------------------------------
-- intensity average entity declaration
-------------------------------------------------------------------------------
entity ram2PORT is
generic (G_BUFF_AWIDTH: INTEGER := 10;
G_DWIDTH: integer := 64); port (WCLOck_i: in std_logic;
rclock_i: in STD_LOGIC;
WE_i: in STD_LOGIC;
rd_addr_i: in std_logic_vector(G_BUFF_AWIDTH-1 downto 0);
WR_ADDR_I: in std_loGIC_VECTOR(G_BUFF_AWIDTH-1 downto 0);
wr_data_i: in STD_logic_vector(G_DWIDTH-1 downto 0);
RD_DATA_O: out STD_LOGIC_VECtor(G_DWIDTH-1 downto 0));
end RAM2port;

architecture RAM2PORT of ram2port is

type O0II is array ((2**g_buff_awidth)-1 downto 0) of sTD_LOGIC_VECTOR(g_dwidth-1 downto 0);

signal l0ii: std_logiC_VECTOR(g_buff_awidth-1 downto 0);

signal IO1L: o0ii;

attribute SYN_RAMSTYLE: STRING;

attribute syn_raMSTYLE of IO1L: signal is "lsram";

begin
rd_daTA_O <= IO1L(to_integer(UNSIGNED(l0ii)));
i0ii:
process (WCLock_i)
begin
if (RISING_EDGE(wclock_i)) then
if (WE_i = '1') then
IO1L(To_integer(UNSIGNED(wr_addr_i))) <= wr_data_i;
end if;
end if;
end process;
O1ii:
process (RCLOCK_I)
begin
if (rising_edge(RCLOCK_I)) then
L0II <= RD_addr_i;
end if;
end process;
end RAM2PORT;
