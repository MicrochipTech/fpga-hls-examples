--=================================================================================================
-- File Name                           : apb3_if.vhd
-- Targeted device                     : Microsemi-SoC
-- Author                              : India Solutions Team
--
-- COPYRIGHT 2019 BY MICROSEMI
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

    r_gain_i     : in std_logic_vector(7 downto 0);
    g_gain_i     : in std_logic_vector(7 downto 0);
    b_gain_i     : in std_logic_vector(7 downto 0);
    brightness_i : in std_logic_vector(7 downto 0);
    contrast_i   : in std_logic_vector(7 downto 0);
    frame_end_i  : in std_logic;
    RGB_SUM_B1   : in std_logic_vector(31 downto 0);
    RGB_SUM_B2   : in std_logic_vector(31 downto 0);

    mode_o         : out std_logic;
    alpha_o        : out std_logic_vector(7 downto 0);
    step_o         : out std_logic_vector(7 downto 0);
    rconst_o       : out std_logic_vector(9 downto 0);
    gconst_o       : out std_logic_vector(9 downto 0);
    bconst_o       : out std_logic_vector(9 downto 0);
    second_const_o : out std_logic_vector(19 downto 0);
    frame_tcount_o : out std_logic_vector(3 downto 0);

    HORZ_RES_IN_O       : out std_logic_vector(15 downto 0);
    VERT_RES_IN_O       : out std_logic_vector(15 downto 0);
    HORZ_RES_OUT_O      : out std_logic_vector(15 downto 0);
    VERT_RES_OUT_O      : out std_logic_vector(15 downto 0);
    SCALE_FACTOR_HORZ_O : out std_logic_vector(15 downto 0);
    SCALE_FACTOR_VERT_O : out std_logic_vector(15 downto 0);

    RED_FRAME_DDR_ADDR_O        : out std_logic_vector(31 downto 0);
    GREEN_FRAME_DDR_ADDR_O      : out std_logic_vector(31 downto 0);
    BLUE_FRAME_DDR_ADDR_O       : out std_logic_vector(31 downto 0);
    HORZ_RES_DDR_RD_OUT_O       : out std_logic_vector(15 downto 0);
    DDR_READ_FRAME_START_ADDR_O : out std_logic_vector(31 downto 0);
    SCALAR_RESET_O              : out std_logic

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
  constant C_ALPHA_REG_ADDR          : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"000";
  constant C_RCONST_REG_ADDR         : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"004";
  constant C_GCONST_REG_ADDR         : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"008";
  constant C_BCONST_REG_ADDR         : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"00C";
  constant C_SECOND_CONST_ADDR       : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"010";
  constant C_RGAIN_ADDR              : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"020";
  constant C_GGAIN_ADDR              : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"024";
  constant C_BGAIN_ADDR              : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"028";
  constant C_CONTRAST_ADDR           : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"030";
  constant C_BRIGHTNESS_ADDR         : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"034";
  constant C_RGB_SUM_ADDR_B1         : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"038";
  constant C_RGB_SUM_ADDR_B2         : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"03c";
  constant C_STEP_OUT_ADDR           : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"060";
  constant C_MODE_OUT_ADDR           : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"064";
  constant C_FRAME_TCOUNT_ADDR       : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"070";
  constant HORZ_RES_IN_ADDR          : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"080";
  constant VERT_RES_IN_ADDR          : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"084";
  constant HORZ_RES_OUT_ADDR         : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"088";
  constant VERT_RES_OUT_ADDR         : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"08C";
  constant SCALE_FACTOR_HORZ_ADDR    : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"090";
  constant SCALE_FACTOR_VERT_ADDR    : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"094";
  constant RED_FRAME_DDR_ADDR        : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"098";
  constant GREEN_FRAME_DDR_ADDR      : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"09C";
  constant BLUE_FRAME_DDR_ADDR       : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"100";
  constant HORZ_RES_DDR_RD_OUT_ADDR  : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"104";
  constant DDR_READ_FRAME_START_ADDR : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"108";

  signal s_scaler_hres_in  : std_logic_vector(15 downto 0);
  signal s_scaler_vres_in  : std_logic_vector(15 downto 0);
  signal s_scaler_hres_out : std_logic_vector(15 downto 0);
  signal s_scaler_vres_out : std_logic_vector(15 downto 0);
  signal s_scaler_hscale   : std_logic_vector(15 downto 0);
  signal s_scaler_vscale   : std_logic_vector(15 downto 0);
  signal s_frame_end_fe    : std_logic;
  signal s_frame_end_dly1  : std_logic;
  signal s_frame_end_dly2  : std_logic;

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
  s_frame_end_fe <= ((not (s_frame_end_dly1)) and s_frame_end_dly2);

--------------------------------------------------------------------------
-- Name       : READ_DECODE_PROC
-- Description: Process implements the APB read operation
--------------------------------------------------------------------------

  READ_DECODE_PROC :
  process (paddr_i, r_gain_i, g_gain_i, b_gain_i, contrast_i, brightness_i, RGB_SUM_B1, RGB_SUM_B2)
  begin
    case paddr_i(11 downto 0) is
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
-- C_RGB_SUM_ADDR_B1
--------------------
      when C_RGB_SUM_ADDR_B1 =>
        prdata_o <= RGB_SUM_B1;
--------------------
-- C_RGB_SUM_ADDR_B2
--------------------
      when C_RGB_SUM_ADDR_B2 =>
        prdata_o <= RGB_SUM_B2;
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
-- Name       : WRITE_DECODE_PROC
-- Description: Process implements the APB write operation
--------------------------------------------------------------------------
  WRITE_DECODE_PROC :
  process (preset_i, pclk_i)
  begin
    if(preset_i = '0')then
      alpha_o        <= x"FF";
      rconst_o       <= "00"&x"7F";
      gconst_o       <= "00"&x"7F";
      bconst_o       <= "00"&x"7F";
      step_o         <= x"01";
      mode_o         <= '1';
      second_const_o <= (others => '0');

      RED_FRAME_DDR_ADDR_O   <= x"04054800";
      GREEN_FRAME_DDR_ADDR_O <= x"0402A400";
      BLUE_FRAME_DDR_ADDR_O  <= X"04000000";

      HORZ_RES_DDR_RD_OUT_O <= X"01C0";

      DDR_READ_FRAME_START_ADDR_O <= X"0C000000";

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
-- HORZ_RES_IN_ADDR
--------------------
          when HORZ_RES_IN_ADDR =>
            s_scaler_hres_in <= pwdata_i(15 downto 0);

--------------------
-- VERT_RES_IN_ADDR
--------------------
          when VERT_RES_IN_ADDR =>
            s_scaler_vres_in <= pwdata_i(15 downto 0);

--------------------
-- HORZ_RES_OUT_ADDR
--------------------
          when HORZ_RES_OUT_ADDR =>
            s_scaler_hres_out <= pwdata_i(15 downto 0);

--------------------
-- VERT_RES_OUT_ADDR
--------------------
          when VERT_RES_OUT_ADDR =>
            s_scaler_vres_out <= pwdata_i(15 downto 0);

--------------------
-- SCALE_FACTOR_HORZ_ADDR
--------------------
          when SCALE_FACTOR_HORZ_ADDR =>
            s_scaler_hscale <= pwdata_i(15 downto 0);

--------------------
-- SCALE_FACTOR_VERT_ADDR
--------------------
          when SCALE_FACTOR_VERT_ADDR =>
            s_scaler_vscale <= pwdata_i(15 downto 0);

--------------------
-- RED_FRAME_DDR_ADDR
--------------------
          when RED_FRAME_DDR_ADDR =>
            RED_FRAME_DDR_ADDR_O <= pwdata_i(31 downto 0);

--------------------
-- GREEN_FRAME_DDR_ADDR
--------------------
          when GREEN_FRAME_DDR_ADDR =>
            GREEN_FRAME_DDR_ADDR_O <= pwdata_i(31 downto 0);
--------------------
-- BLUE_FRAME_DDR_ADDR
--------------------
          when BLUE_FRAME_DDR_ADDR =>
            BLUE_FRAME_DDR_ADDR_O <= pwdata_i(31 downto 0);
--------------------
-- HORZ_RES_DDR_RD
--------------------
          when HORZ_RES_DDR_RD_OUT_ADDR =>
            HORZ_RES_DDR_RD_OUT_O <= pwdata_i(15 downto 0);
--------------------
-- DDR_READ_FRAME_START_ADD
--------------------
          when DDR_READ_FRAME_START_ADDR =>
            DDR_READ_FRAME_START_ADDR_O <= pwdata_i(31 downto 0);

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
-- Name       : scalar data assignment process
-- Description: Process implements the data write operation for scaler
--------------------------------------------------------------------------    
  proc : process (preset_i, pclk_i)
  begin
    if (preset_i = '0') then
      s_frame_end_dly1    <= '0';
      s_frame_end_dly2    <= '0';
      HORZ_RES_IN_O       <= x"0780";
      VERT_RES_IN_O       <= x"0438";
      HORZ_RES_OUT_O      <= x"03C0";
      VERT_RES_OUT_O      <= x"021C";
      SCALE_FACTOR_HORZ_O <= x"07FE";
      SCALE_FACTOR_VERT_O <= x"07FE";
      SCALAR_RESET_O      <= '1';
    elsif (pclk_i'event and pclk_i = '1') then
      s_frame_end_dly1 <= frame_end_i;
      s_frame_end_dly2 <= s_frame_end_dly1;

      if (s_frame_end_fe = '1') then
        HORZ_RES_IN_O       <= s_scaler_hres_in;
        VERT_RES_IN_O       <= s_scaler_vres_in;
        HORZ_RES_OUT_O      <= s_scaler_hres_out;
        VERT_RES_OUT_O      <= s_scaler_vres_out;
        SCALE_FACTOR_HORZ_O <= s_scaler_hscale;
        SCALE_FACTOR_VERT_O <= s_scaler_vscale;
        SCALAR_RESET_O      <= '0';
      else
        SCALAR_RESET_O <= '1';
      end if;
    end if;
  end process;



--=================================================================================================
-- Component Instantiations
--=================================================================================================
--NA--

end architecture apb3_if;
