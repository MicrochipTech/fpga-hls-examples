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

--=================================================================================================
-- apb3_if entity declaration
--=================================================================================================
entity apb3_if is
  generic (
    -- Specifies pwdata_i,prdata_o signal width
    g_APB3_IF_DATA_WIDTH : integer := 32;

    -- Specifies the width of constants
    g_CONST_WIDTH : integer := 12
    );
  port (
-- Port list
    -- APB reset
    preset_i : in std_logic;
    -- APB clock
    pclk_i   : in std_logic;

    -- APB slave interface
    psel_i    : in  std_logic;
    pwrite_i  : in  std_logic;
    penable_i : in  std_logic;
    paddr_i   : in  std_logic_vector(g_APB3_IF_DATA_WIDTH-1 downto 0);
    pwdata_i  : in  std_logic_vector(g_APB3_IF_DATA_WIDTH-1 downto 0);
    pready_o  : out std_logic;
    pslverr_o : out std_logic;
    prdata_o  : out std_logic_vector(g_APB3_IF_DATA_WIDTH-1 downto 0);
    
    --frame valid from camera
    frame_valid_i : in std_logic;

    r_gain_i     : in std_logic_vector(7 downto 0);
    g_gain_i     : in std_logic_vector(7 downto 0);
    b_gain_i     : in std_logic_vector(7 downto 0);
    brightness_i : in std_logic_vector(7 downto 0);
    contrast_i   : in std_logic_vector(7 downto 0);
    quality_i    : in std_logic_vector(7 downto 0);
    RGB_SUM_i    : in std_logic_vector(31 downto 0);
    frame_index_i: in std_logic_vector(1 downto 0);
    frame_bytes_i: in std_logic_vector(31 downto 0);

    mode_o         : out std_logic;
    alpha_o        : out std_logic_vector(7 downto 0);
    step_o         : out std_logic_vector(7 downto 0);
    rconst_o       : out std_logic_vector(9 downto 0);
    gconst_o       : out std_logic_vector(9 downto 0);
    bconst_o       : out std_logic_vector(9 downto 0);
    second_const_o : out std_logic_vector(19 downto 0);
    horiz_resl_o   : out std_logic_vector(15 downto 0);
    vert_resl_o    : out std_logic_vector(15 downto 0);
    quality_o      : out std_logic_vector(7 downto 0) ;
    frame_tcount_o : out std_logic_vector(3 downto 0) ;
    h264_en_o      : out std_logic;
    h264_ddrlsb_addr_o : out std_logic_vector(31 downto 0);
    h264_clr_intr_o: out std_logic
    );
end apb3_if;

--=================================================================================================
-- apb3_if architecture body
--=================================================================================================

architecture apb3_if of apb3_if is

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
--ADC Register Addresses
  constant C_ALPHA_REG_ADDR    : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"000";
  constant C_RCONST_REG_ADDR   : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"004";
  constant C_GCONST_REG_ADDR   : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"008";
  constant C_BCONST_REG_ADDR   : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"00C";
  constant C_SECOND_CONST_ADDR : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"010";
  constant C_RGAIN_ADDR        : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"020";
  constant C_GGAIN_ADDR        : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"024";
  constant C_BGAIN_ADDR        : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"028";
  constant C_CONTRAST_ADDR     : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"030";
  constant C_BRIGHTNESS_ADDR   : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"034";
  constant C_RGB_SUM_ADDR      : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"038";

  constant C_STEP_OUT_ADDR     : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"060";
  constant C_MODE_OUT_ADDR     : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"064";
  constant C_FRAME_TCOUNT_ADDR : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"070";
  constant C_QUALITY_ADDR      : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"074";
  constant C_HORIZ_RESL_ADDR   : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"078";
  constant C_VERT_RESL_ADDR    : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"07C";
  
  --H264
  constant C_FRM_BYTES_ADDR    : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"080";
  constant C_H264START_ADDR    : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"084";
  constant C_H264DDRLSB_ADDR   : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"088";
  constant C_H264DDRMSB_ADDR   : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"08C";

  constant C_ID_ROM_3_0_ADDR   : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"500";
  constant C_ID_ROM_7_4_ADDR   : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"504";
  
  signal s_frame_valid_dly1 : std_logic;
  signal s_frame_valid_re   : std_logic;
  signal s_horiz_resl       : std_logic_vector(15 downto 0);
  signal s_vert_resl        : std_logic_vector(15 downto 0);

  signal s_signature : std_logic_vector(63 downto 0) := x"48_32_36_34_00_00_00_01";--h264 0001 
  
begin


--=================================================================================================
-- Top level output port assignments
--=================================================================================================
  pready_o  <= '1';  -- pready_o Is always ready,there will not be any
  -- latency from the Fabric modules
  pslverr_o <= '0';  -- Slave error is always '0' as there will not be
  --any slave error.

--=================================================================================================
-- Generate blocks
--=================================================================================================

--=================================================================================================
-- Asynchronous blocks
--=================================================================================================
s_frame_valid_re <= frame_valid_i AND (NOT s_frame_valid_dly1);
--------------------------------------------------------------------------
-- Name       : READ_DECODE_PROC
-- Description: Process implements the APB read operation
--------------------------------------------------------------------------

  READ_DECODE_PROC :
  process (paddr_i, r_gain_i, g_gain_i, b_gain_i, contrast_i, brightness_i, quality_i, RGB_SUM_i)
  begin
    case paddr_i(11 downto 0) is
--------------------
-- C_RCONST_REG_ADDR
--------------------
      when C_RCONST_REG_ADDR =>
        prdata_o(9 downto 0) <= rconst_o;
        prdata_o(g_APB3_IF_DATA_WIDTH-1 downto 10)
          <= (others => '0');

--------------------
-- C_RGAIN_ADDR
--------------------
      when C_RGAIN_ADDR =>
        prdata_o(7 downto 0) <= r_gain_i;
        prdata_o(g_APB3_IF_DATA_WIDTH-1 downto 8)
          <= (others => '0');

--------------------
-- C_GGAIN_ADDR
--------------------
      when C_GGAIN_ADDR =>
        prdata_o(7 downto 0) <= g_gain_i;
        prdata_o(g_APB3_IF_DATA_WIDTH-1 downto 8)
          <= (others => '0');

--------------------
-- C_BGAIN_ADDR
--------------------
      when C_BGAIN_ADDR =>
        prdata_o(7 downto 0) <= b_gain_i;
        prdata_o(g_APB3_IF_DATA_WIDTH-1 downto 8)
          <= (others => '0');
--------------------
-- C_CONTRAST_ADDR
--------------------
      when C_CONTRAST_ADDR =>
        prdata_o(7 downto 0) <= contrast_i;
        prdata_o(g_APB3_IF_DATA_WIDTH-1 downto 8)
          <= (others => '0');
--------------------
-- C_BRIGHTNESS_ADDR
--------------------
      when C_BRIGHTNESS_ADDR =>
        prdata_o(7 downto 0) <= brightness_i;
        prdata_o(g_APB3_IF_DATA_WIDTH-1 downto 8)
          <= (others => '0');

--------------------
-- C_RGB_SUM_ADDR
--------------------
      when C_RGB_SUM_ADDR =>
        prdata_o(31 downto 0) <= RGB_SUM_i;

--------------------
-- C_QUALITY_ADDR
--------------------
      when C_QUALITY_ADDR =>
        prdata_o(7 downto 0) <= quality_i;
        prdata_o(g_APB3_IF_DATA_WIDTH-1 downto 8)
          <= (others => '0');
          
--------------------
-- C_FRM_BYTES_ADDR
--------------------
      when C_FRM_BYTES_ADDR =>
        prdata_o(g_APB3_IF_DATA_WIDTH-1 downto 0) <= "00"&frame_index_i&frame_bytes_i(27 downto 0);                  

--------------------
-- C_ID_ROM_3_0_ADDR
--------------------
      when C_ID_ROM_3_0_ADDR =>
        prdata_o(g_APB3_IF_DATA_WIDTH-1 downto 0) <= s_signature(63 downto 32);

--------------------
-- C_ID_ROM_7_4_ADDR
--------------------
      when C_ID_ROM_7_4_ADDR =>
        prdata_o(g_APB3_IF_DATA_WIDTH-1 downto 0) <= s_signature(31 downto 0);                         

--------------------
-- OTHERS
--------------------
      when others =>
        prdata_o <= (others => '0');

    end case;

  end process;

--=================================================================================================
-- Synchronous blocks
--=================================================================================================
--------------------------------------------------------------------------
-- Name       : H264_CLE_INTR_PROC
-- Description: Process to clear h264 interrupt
--------------------------------------------------------------------------
  H264_CLE_INTR_PROC :
  process (preset_i, pclk_i)
  begin
    if(preset_i = '0')then
      h264_clr_intr_o  <= '0';
    elsif (pclk_i'event and pclk_i = '1') then
      if ((psel_i = '1') and (penable_i = '1') and (pwrite_i = '0')) then  
        if( paddr_i(11 downto 0) = C_FRM_BYTES_ADDR ) then
          h264_clr_intr_o <= '1';
        end if;
      else
        h264_clr_intr_o <= '0';
      end if;  
    end if;
  end process;    
--------------------------------------------------------------------------
-- Name       : WRITE_DECODE_PROC
-- Description: Process implements the APB write operation
--------------------------------------------------------------------------
  WRITE_DECODE_PROC :
  process (preset_i, pclk_i)
  begin
    if(preset_i = '0')then
      alpha_o        <= x"FF";
      rconst_o       <= "00"&x"7A";
      gconst_o       <= "00"&x"66";
      bconst_o       <= "00"&x"8A";
      step_o         <= x"01";
      mode_o         <= '1';
      second_const_o <= (others => '0');
      s_horiz_resl   <= x"0500" ; -- 1280
      s_vert_resl    <= x"02D0" ; -- 720
      -- s_horiz_resl   <= x"01b0" ; -- 432
      -- s_vert_resl    <= x"00f0" ; -- 240  

      quality_o      <= x"1E" ;
      h264_ddrlsb_addr_o <= x"AE000000";
      h264_en_o      <= '0';
    elsif (pclk_i'event and pclk_i = '1') then
      if ((psel_i = '1') and (pwrite_i = '1') and (penable_i = '1')) then
        case paddr_i(11 downto 0) is
--------------------
-- C_RCONST_REG_ADDR
--------------------
          when C_RCONST_REG_ADDR =>
            rconst_o <= pwdata_i(9 downto 0);

--------------------
-- C_ALPHA_REG_ADDR
--------------------
          when C_ALPHA_REG_ADDR =>
            alpha_o <= pwdata_i(7 downto 0);
--------------------
-- C_GCONST_REG_ADDR
--------------------
          when C_GCONST_REG_ADDR =>
            gconst_o <= pwdata_i(9 downto 0);
--------------------
-- C_BCONST_REG_ADDR
--------------------
          when C_BCONST_REG_ADDR =>
            bconst_o <= pwdata_i(9 downto 0);

--------------------
-- C_SECOND_CONST_ADDR
--------------------
          when C_SECOND_CONST_ADDR =>
            second_const_o <= pwdata_i(19 downto 0);

--------------------
-- C_STEP_OUT_ADDR
--------------------
          when C_STEP_OUT_ADDR =>
            step_o <= pwdata_i(7 downto 0);
--------------------
-- C_MODE_OUT_ADDR
--------------------
          when C_MODE_OUT_ADDR =>
            mode_o <= pwdata_i(0);

--------------------
-- C_FRAME_TCOUNT_ADDR
--------------------
          when C_FRAME_TCOUNT_ADDR =>
            frame_tcount_o <= pwdata_i(3 downto 0);

--------------------
-- C_QUALITY_ADDR
--------------------
          when C_QUALITY_ADDR =>
            quality_o <= pwdata_i(7 downto 0);

--------------------
-- C_HORIZ_RESL_ADDR
--------------------
          when C_HORIZ_RESL_ADDR =>
            s_horiz_resl <= pwdata_i(15 downto 0);

--------------------
-- C_VERT_RESL_ADDR
--------------------
          when C_VERT_RESL_ADDR =>
            s_vert_resl  <= pwdata_i(15 downto 0);
            
--------------------
-- C_H264START_ADDR
--------------------
          when C_H264START_ADDR =>
            h264_en_o  <= pwdata_i(0);
            
--------------------
-- C_H264DDRLSB_ADDR
--------------------
          when C_H264DDRLSB_ADDR =>
            h264_ddrlsb_addr_o  <= pwdata_i;

--------------------
-- OTHERS
--------------------
          when others =>
            null;
        end case;
      end if;
    end if;
  end process;
--------------------------------------------------------------------------
-- Name       : DLY_PROC
-- Description: Process to delay the signals
--------------------------------------------------------------------------
  DLY_PROC :
  process (preset_i, pclk_i)
  begin
    if(preset_i = '0')then
      s_frame_valid_dly1 <= '0';
      horiz_resl_o       <= x"0500" ; -- 1280
      vert_resl_o        <= x"02D0" ; -- 720
      -- horiz_resl_o       <= x"01b0" ; -- 432
      -- vert_resl_o        <= x"00f0" ;   -- 240  
    elsif (pclk_i'event and pclk_i = '1') then
      s_frame_valid_dly1 <= frame_valid_i;
      if (s_frame_valid_re = '1') then
        horiz_resl_o     <= s_horiz_resl;
        vert_resl_o      <= s_vert_resl;
      end if;  
    end if;
  end process;  
--=================================================================================================
-- Component Instantiations
--=================================================================================================
--NA--

end architecture apb3_if;
