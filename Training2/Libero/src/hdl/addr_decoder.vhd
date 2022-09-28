--=================================================================================================
-- File Name                           : addr_decoder.vhd

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

--=================================================================================================
-- addr_decoder entity declaration
--=================================================================================================
entity addr_decoder is
  generic (
-- Generic list
    -- Specifies the width of constants
    g_CONST_WIDTH : integer := 8
    );
  port (
-- Port list
    -- Reset
    reset_i   : in std_logic;
    -- System clock
    sys_clk_i : in std_logic;

    --UART interface
    --Data ready
    data_rdy_i : in std_logic;

    --Address input
    addr_i : in std_logic_vector(7 downto 0);

    --Data input
    data_i : in std_logic_vector(31 downto 0);

    --PIP source select
    pip_select_o : out std_logic;

    --Bayer or edge detection output select
    bayer_edge_sel_o : out std_logic;

    --Selects the auto or manual movement of PIP
    pip_mode_sel_o : out std_logic;

    --B-gain
    step_o : out std_logic_vector(7 downto 0);

    --Alpha
    alpha_o : out std_logic_vector(7 downto 0);

    --R-gain
    rgain_o : out std_logic_vector(7 downto 0);

    --G-gain
    ggain_o : out std_logic_vector(7 downto 0);

    --B-gain
    bgain_o : out std_logic_vector(7 downto 0);

    --Brightness
    brightness_o : out std_logic_vector(7 downto 0);

    --Contrast
    contrast_o : out std_logic_vector(7 downto 0);

    --Brightness
    h_shift_o : out std_logic_vector(15 downto 0);

    --Contrast
    v_shift_o : out std_logic_vector(15 downto 0);

    --Horizontal PAN of Camera 1
    h_pan_c1_o : out std_logic_vector(11 downto 0);

    --Vertical PAN of Camera 1
    v_pan_c1_o : out std_logic_vector(11 downto 0);

    --Horizontal PAN of Camera 2
    h_pan_c2_o : out std_logic_vector(11 downto 0);

    --Vertical PAN of Camera 2
    v_pan_c2_o : out std_logic_vector(11 downto 0);

    -- Data Output specifies the parameter to be selected for sending UART data
    ch_selector_o : out std_logic_vector(31 downto 0);

    bayer_format0_o : out std_logic_vector(1 downto 0);

    bayer_format1_o : out std_logic_vector(1 downto 0);

    bayer_format2_o : out std_logic_vector(1 downto 0);

    alpha_hdmi_o : out std_logic_vector(7 downto 0)
    );
end addr_decoder;

--=================================================================================================
-- addr_decoder architecture body
--=================================================================================================

architecture addr_decoder of addr_decoder is

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
  constant C_ALPHA_ADDR          : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"00";
  constant C_CONTRAST_ADDR       : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"01";
  constant C_BRIGHTNESS_ADDR     : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"02";
  constant C_RGAIN_ADDR          : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"03";
  constant C_GGAIN_ADDR          : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"04";
  constant C_BGAIN_ADDR          : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"05";
  constant C_HOR_ADDR            : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"06";
  constant C_VER_ADDR            : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"07";
  constant C_PIPSEL_ADDR         : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"09";
  constant C_BAYER_EDGE_SEL_ADDR : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"0A";
  constant C_PIP_MODE_SEL_ADDR   : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"0B";
  constant C_AUTO_MODE_STEP_ADDR : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"0C";
  constant C_BAYER_FORMAT_ADDR   : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"0D";
  constant C_ALPHA_HDMI_ADDR     : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"0E";
-- Camera image panning
  constant C_HORIZ_PAN_C1_ADDR   : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"10";
  constant C_VERT_PAN_C1_ADDR    : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"11";
  constant C_HORIZ_PAN_C2_ADDR   : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"12";
  constant C_VERT_PAN_C2_ADDR    : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"13";
--Selector for Plotting
  constant C_SELECTOR_CHA_ADDR   : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"C0";


begin


--=================================================================================================
-- Top level output port assignments
--=================================================================================================


--=================================================================================================
-- Generate blocks
--=================================================================================================
--NA--

--=================================================================================================
-- Asynchronous blocks
--=================================================================================================

--=================================================================================================
-- Synchronous blocks
--=================================================================================================
--------------------------------------------------------------------------
-- Name       : WRITE_DECODE_PROC
-- Description: Process implements the APB write operation
--------------------------------------------------------------------------
  WRITE_DECODE_PROC :
  process (reset_i, sys_clk_i)
  begin
    if(reset_i = '0')then
      pip_select_o     <= '0';
      pip_mode_sel_o   <= '1';
      bayer_edge_sel_o <= '0';
      step_o           <= x"01";
      alpha_o          <= x"FF";
      contrast_o       <= x"80";
      brightness_o     <= x"80";
      rgain_o          <= x"AF";
      ggain_o          <= x"64";
      bgain_o          <= x"96";
      ch_selector_o    <= x"24142C68";
      h_shift_o        <= x"0014";
      v_shift_o        <= x"0000";
      h_pan_c1_o       <= x"3C0";
      v_pan_c1_o       <= x"21C";
      h_pan_c2_o       <= x"3C0";
      v_pan_c2_o       <= x"21C";
      bayer_format0_o  <= "10";
      bayer_format1_o  <= "10";
      bayer_format2_o  <= "10";
      alpha_hdmi_o     <= x"80";

    elsif (RISING_EDGE(sys_clk_i)) then
      if (data_rdy_i = '1') then
        case addr_i(7 downto 0) is
--------------------
-- C_PIPSEL_ADDR
--------------------
          when C_PIPSEL_ADDR =>
            pip_select_o <= data_i(0);
--------------------
-- C_PIP_MODE_SEL_ADDR
--------------------
          when C_PIP_MODE_SEL_ADDR =>
            pip_mode_sel_o <= data_i(0);
--------------------
-- C_BAYER_EDGE_SEL_ADDR
--------------------
          when C_BAYER_EDGE_SEL_ADDR =>
            bayer_edge_sel_o <= data_i(0);
--------------------
-- C_AUTO_MODE_STEP_ADDR
--------------------
          when C_AUTO_MODE_STEP_ADDR =>
            step_o <= data_i(7 downto 0);

--------------------
-- C_ALPHA_ADDR
--------------------
          when C_ALPHA_ADDR =>
            alpha_o <= data_i(7 downto 0);

--------------------
-- C_CONTRAST_ADDR
--------------------
          when C_CONTRAST_ADDR =>
            contrast_o <= data_i(7 downto 0);
--------------------
-- C_BRIGHTNESS_ADDR
--------------------
          when C_BRIGHTNESS_ADDR =>
            brightness_o <= data_i(7 downto 0);

--------------------
-- C_RGAIN_ADDR
--------------------
          when C_RGAIN_ADDR =>
            rgain_o <= data_i(7 downto 0);

--------------------
-- C_GGAIN_ADDR
--------------------
          when C_GGAIN_ADDR =>
            ggain_o <= data_i(7 downto 0);

--------------------
-- C_BGAIN_ADDR
--------------------
          when C_BGAIN_ADDR =>
            bgain_o <= data_i(7 downto 0);
--------------------
-- C_HOR_ADDR
--------------------
          when C_HOR_ADDR =>
            h_shift_o <= data_i(15 downto 0);

--------------------
-- C_VER_ADDR
--------------------
          when C_VER_ADDR =>
            v_shift_o <= data_i(15 downto 0);

--------------------
-- C_HORIZ_PAN_C1_ADDR
--------------------
          when C_HORIZ_PAN_C1_ADDR =>
            h_pan_c1_o <= data_i(11 downto 0);

--------------------
-- C_VERT_PAN_C1_ADDR
--------------------
          when C_VERT_PAN_C1_ADDR =>
            v_pan_c1_o <= data_i(11 downto 0);

--------------------
-- C_HORIZ_PAN_C2_ADDR
--------------------
          when C_HORIZ_PAN_C2_ADDR =>
            h_pan_c2_o <= data_i(11 downto 0);

--------------------
-- C_VERT_PAN_C2_ADDR
--------------------
          when C_VERT_PAN_C2_ADDR =>
            v_pan_c2_o <= data_i(11 downto 0);

--------------------
-- C_SELECTOR_CHA_ADDR
--------------------
          when C_SELECTOR_CHA_ADDR =>
            ch_selector_o <= data_i;


--------------------
-- C_BAYER_FORMAT_ADDR
--------------------
          when C_BAYER_FORMAT_ADDR =>
            bayer_format0_o <= data_i(1 downto 0);
            bayer_format1_o <= data_i(5 downto 4);
            bayer_format2_o <= data_i(9 downto 8);

--------------------
-- C_ALPHA_HDMI_ADDR
--------------------
          when C_ALPHA_HDMI_ADDR =>
            alpha_hdmi_o <= data_i(7 downto 0);
--------------------
-- OTHERS
--------------------
          when others =>
            null;
        end case;
      end if;
    end if;
  end process;

--=================================================================================================
-- Component Instantiations
--=================================================================================================
--NA--

end architecture addr_decoder;
