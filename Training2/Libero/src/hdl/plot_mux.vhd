--=================================================================================================
-- File Name                           : plot_mux.vhd
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
-- plot_mux  entity declaration
--=================================================================================================
entity plot_mux is
  generic (
-- Generic list
    -- Specifies the width of constants
    g_CONST_WIDTH : integer := 8;

    -- Specifies width of all input and output ports
    g_STD_IO_WIDTH : integer range 10 to 18 := 18
    );
  port (
-- Port list
    -- System reset
    reset_i   : in std_logic;
    -- System clock
    sys_clk_i : in std_logic;

    -- Trigger
    start_i : in std_logic;

    -- Data Input specifies the ia input of Clarke module
    ia_i : in std_logic_vector(g_STD_IO_WIDTH-1 downto 0);

    -- Data Input specifies the ib input of Clarke module
    ib_i : in std_logic_vector(g_STD_IO_WIDTH-1 downto 0);

    -- Data Input specifies the ialpha output of Clarke module
    ialpha_i : in std_logic_vector(g_STD_IO_WIDTH-1 downto 0);

    -- Data Input specifies the ibeta output of Clarke module
    ibeta_i : in std_logic_vector(g_STD_IO_WIDTH-1 downto 0);

    -- Data Input specifies the id output of Park module
    id_i : in std_logic_vector(g_STD_IO_WIDTH-1 downto 0);

    -- Data Input specifies the iq output of Park module
    iq_i : in std_logic_vector(g_STD_IO_WIDTH-1 downto 0);

    -- Data Input specifies the valpha output of IPark module
    valpha_i : in std_logic_vector(g_STD_IO_WIDTH-1 downto 0);

    -- Data Input specifies the vbeta output of IPark module
    vbeta_i : in std_logic_vector(g_STD_IO_WIDTH-1 downto 0);

    -- Data Input specifies the output of rate limiter module
    rl_out_i : in std_logic_vector(g_STD_IO_WIDTH-1 downto 0);

    -- Data Input specifies the speed PI output
    speed_pi_out_i : in std_logic_vector(g_STD_IO_WIDTH-1 downto 0);

    -- Data Input specifies the id PI output
    id_pi_out_i : in std_logic_vector(g_STD_IO_WIDTH-1 downto 0);

    -- Data Input specifies the iq PI output
    iq_pi_out_i : in std_logic_vector(g_STD_IO_WIDTH-1 downto 0);

    -- Data Input specifies the ealpha input value
    ealpha_i : in std_logic_vector(g_STD_IO_WIDTH-1 downto 0);

    -- Data Input specifies the ebeta input value
    ebeta_i : in std_logic_vector(g_STD_IO_WIDTH-1 downto 0);

    -- Data Input specifies the ealpha filter output value
    ealpha_filter_out_i : in std_logic_vector(g_STD_IO_WIDTH-1 downto 0);

    -- Data Input specifies the ebeta filter output value
    ebeta_filter_out_i : in std_logic_vector(g_STD_IO_WIDTH-1 downto 0);

    -- Data Input specifies the PLL theta input value
    pll_theta_i : in std_logic_vector(g_STD_IO_WIDTH-1 downto 0);

    -- Data Input specifies the closed loop theta information
    theta_i : in std_logic_vector(g_STD_IO_WIDTH-1 downto 0);

    -- Data Input specifies the position estimator output
    omega_pi_out_i : in std_logic_vector(g_STD_IO_WIDTH-1 downto 0);

    -- Data Input specifies the position estimator output
    omega_filter_out_i : in std_logic_vector(g_STD_IO_WIDTH-1 downto 0);

    -- Data Input specifies the ADC output for channel 0
    adc_ch0_val_i : in std_logic_vector(g_STD_IO_WIDTH-1 downto 0);

    -- Data Input specifies the ADC output for channel 1
    adc_ch1_val_i : in std_logic_vector(g_STD_IO_WIDTH-1 downto 0);

    -- Data Input specifies the ADC output for channel 2
    adc_ch2_val_i : in std_logic_vector(g_STD_IO_WIDTH-1 downto 0);

    -- Data Input specifies the ADC output for channel 3
    adc_ch3_val_i : in std_logic_vector(g_STD_IO_WIDTH-1 downto 0);

    ch_selection_i : in std_logic_vector(31 downto 0);

    fsm_sync_done_o : out std_logic;

    channel_a_o : out std_logic_vector(15 downto 0);

    channel_b_o : out std_logic_vector(15 downto 0);

    channel_c_o : out std_logic_vector(15 downto 0);

    channel_d_o : out std_logic_vector(15 downto 0)
    );
end plot_mux;

--=================================================================================================
-- plot_mux architecture body
--=================================================================================================

architecture plot_mux of plot_mux is

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
--Plotting
  constant C_IA_REG_ADDR            : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"00";
  constant C_IB_REG_ADDR            : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"04";
  constant C_IALPHA_REG_ADDR        : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"08";
  constant C_IBETA_REG_ADDR         : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"0C";
  constant C_ID_PARK_REG_ADDR       : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"10";
  constant C_IQ_PARK_REG_ADDR       : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"14";
  constant C_VALPHA_IPARK_REG_ADDR  : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"18";
  constant C_VBETA_IPARK_REG_ADDR   : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"1C";
  constant C_RATE_LIMITER_OUT_ADDR  : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"20";
  constant C_SPEED_PI_OUT_ADDR      : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"24";
  constant C_ID_PI_OUT_ADDR         : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"28";
  constant C_IQ_PI_OUT_ADDR         : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"2C";
  constant C_SQMNG_THETA_OUT_ADDR   : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"30";
  constant C_CH0_DATA_VAL_ADDR      : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"38";
  constant C_CH1_DATA_VAL_ADDR      : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"3C";
  constant C_CH2_DATA_VAL_ADDR      : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"40";
  constant C_CH3_DATA_VAL_ADDR      : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"44";
--Position Estimator specific plotting
  constant C_EALPHA_OUT_ADDR        : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"50";
  constant C_EBETA_OUT_ADDR         : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"54";
  constant C_EALPHA_FILTER_OUT_ADDR : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"58";
  constant C_EBETA_FILTER_OUT_ADDR  : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"5C";
  constant C_PLL_THETA_OUT_ADDR     : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"60";
  constant C_OMEGA_PI_OUT_ADDR      : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"64";
  constant C_OMEGA_FILTER_OUT_ADDR  : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"68";

  type UART_FSM is (IDLE,
                    CH_A_DATA,
                    CH_B_DATA,
                    CH_C_DATA,
                    CH_D_DATA
                    );
  signal state       : UART_FSM;
  signal s_done      : std_logic;
  signal s_start_dly : std_logic;
  signal s_start_dtc : std_logic;

  signal s_selector  : std_logic_vector(7 downto 0);
  signal s_channel_a : std_logic_vector(g_STD_IO_WIDTH-1 downto 0);
  signal s_channel_b : std_logic_vector(g_STD_IO_WIDTH-1 downto 0);
  signal s_channel_c : std_logic_vector(g_STD_IO_WIDTH-1 downto 0);
  signal s_channel_d : std_logic_vector(g_STD_IO_WIDTH-1 downto 0);
  signal s_mux_out   : std_logic_vector(g_STD_IO_WIDTH-1 downto 0);

begin


--=================================================================================================
-- Top level output port assignments
--=================================================================================================
  channel_a_o     <= s_channel_a(17 downto 2);
  channel_b_o     <= s_channel_b(17 downto 2);
  channel_c_o     <= s_channel_c(17 downto 2);
  channel_d_o     <= s_channel_d(17 downto 2);
  fsm_sync_done_o <= s_done;
--=================================================================================================
-- Generate blocks
--=================================================================================================
--NA--

--=================================================================================================
-- Asynchronous blocks
--=================================================================================================
  s_start_dtc <= start_i and not(s_start_dly);
--------------------------------------------------------------------------
-- Name       : READ_DECODE_PROC
-- Description: Process implements the APB read operation
--------------------------------------------------------------------------

  READ_DECODE_PROC :
  process (s_selector, ia_i, ib_i, ialpha_i, ibeta_i, id_i, adc_ch0_val_i, adc_ch1_val_i,
           iq_i, valpha_i, vbeta_i, rl_out_i, adc_ch2_val_i, adc_ch3_val_i,
           speed_pi_out_i, id_pi_out_i, iq_pi_out_i, ealpha_i, ebeta_i, ealpha_filter_out_i,
           ebeta_filter_out_i, omega_pi_out_i, pll_theta_i, omega_filter_out_i, theta_i)
  begin
    case s_selector is
--------------------
-- C_IA_REG_ADDR
--------------------
      when C_IA_REG_ADDR =>
        s_mux_out <= ia_i;
--------------------
-- C_IB_REG_ADDR
--------------------
      when C_IB_REG_ADDR =>
        s_mux_out <= ib_i;
--------------------
-- C_IALPHA_REG_ADDR
--------------------
      when C_IALPHA_REG_ADDR =>
        s_mux_out <= ialpha_i;
--------------------
-- C_IBETA_REG_ADDR
--------------------
      when C_IBETA_REG_ADDR =>
        s_mux_out <= ibeta_i;
--------------------
-- C_ID_PARK_REG_ADDR
--------------------
      when C_ID_PARK_REG_ADDR =>
        s_mux_out <= id_i;
--------------------
-- C_IQ_PARK_REG_ADDR
--------------------

      when C_IQ_PARK_REG_ADDR =>
        s_mux_out <= iq_i;
--------------------
-- C_VALPHA_IPARK_REG_ADDR
--------------------
      when C_VALPHA_IPARK_REG_ADDR =>
        s_mux_out <= valpha_i;
--------------------
-- C_VBETA_IPARK_REG_ADDR
--------------------
      when C_VBETA_IPARK_REG_ADDR =>
        s_mux_out <= vbeta_i;
--------------------
-- C_RATE_LIMITER_OUT_ADDR
--------------------
      when C_RATE_LIMITER_OUT_ADDR =>
        s_mux_out <= rl_out_i;
--------------------
-- C_SPEED_PI_OUT_ADDR
--------------------
      when C_SPEED_PI_OUT_ADDR =>
        s_mux_out <= speed_pi_out_i;
--------------------
-- C_ID_PI_OUT_ADDR
--------------------
      when C_ID_PI_OUT_ADDR =>
        s_mux_out <= id_pi_out_i;
--------------------
-- C_IQ_PI_OUT_ADDR
--------------------
      when C_IQ_PI_OUT_ADDR =>
        s_mux_out <= iq_pi_out_i;
--------------------
-- C_EALPHA_OUT_ADDR
--------------------
      when C_EALPHA_OUT_ADDR =>
        s_mux_out <= ealpha_i;
--------------------
-- C_EBETA_OUT_ADDR
--------------------
      when C_EBETA_OUT_ADDR =>
        s_mux_out <= ebeta_i;
--------------------
-- C_EALPHA_FILTER_OUT_ADDR
--------------------
      when C_EALPHA_FILTER_OUT_ADDR =>
        s_mux_out <= ealpha_filter_out_i;
--------------------
-- C_EBETA_FILTER_OUT_ADDR
--------------------
      when C_EBETA_FILTER_OUT_ADDR =>
        s_mux_out <= ebeta_filter_out_i;
--------------------
-- C_OMEGA_PI_OUT_ADDR
--------------------
      when C_OMEGA_PI_OUT_ADDR =>
        s_mux_out <= omega_pi_out_i;
--------------------
-- C_PLL_THETA_OUT_ADDR
--------------------
      when C_PLL_THETA_OUT_ADDR =>
        s_mux_out <= pll_theta_i;
--------------------
-- C_OMEGA_FILTER_OUT_ADDR
--------------------
      when C_OMEGA_FILTER_OUT_ADDR =>
        s_mux_out <= omega_filter_out_i;
--------------------
-- C_SQMNG_THETA_OUT_ADDR
--------------------
      when C_SQMNG_THETA_OUT_ADDR =>
        s_mux_out <= theta_i;
--------------------
-- C_CH0_DATA_VAL_ADDR
--------------------
      when C_CH0_DATA_VAL_ADDR =>
        s_mux_out <= adc_ch0_val_i;
--------------------
-- C_CH1_DATA_VAL_ADDR
--------------------
      when C_CH1_DATA_VAL_ADDR =>
        s_mux_out <= adc_ch1_val_i;
--------------------
-- C_CH2_DATA_VAL_ADDR
--------------------
      when C_CH2_DATA_VAL_ADDR =>
        s_mux_out <= adc_ch2_val_i;
--------------------
-- C_CH3_DATA_VAL_ADDR
--------------------
      when C_CH3_DATA_VAL_ADDR =>
        s_mux_out <= adc_ch3_val_i;
--------------------
-- OTHERS
--------------------
      when others =>
        s_mux_out <= (others => '0');

    end case;

  end process;

--=================================================================================================
-- Synchronous blocks
--=================================================================================================
--------------------------------------------------------------------------
-- Name       : DELAY_PROC
-- Description: This process generates the slave select signal
--------------------------------------------------------------------------
  DELAY_PROC :
  process(reset_i, sys_clk_i)
  begin
    if (reset_i = '0') then
      s_start_dly <= '0';
    elsif rising_edge(sys_clk_i) then
      s_start_dly <= start_i;
    end if;
  end process;
--------------------------------------------------------------------------
-- Name       : FSM_PROC
-- Description: This process implements the UART interface FSM
--------------------------------------------------------------------------
  FSM_PROC :
  process(sys_clk_i, reset_i)
  begin
    if reset_i = '0' then
      s_done      <= '0';
      s_selector  <= (others => '0');
      s_channel_a <= (others => '0');
      s_channel_b <= (others => '0');
      s_channel_c <= (others => '0');
      s_channel_d <= (others => '0');
      state       <= IDLE;
    elsif RISING_EDGE(sys_clk_i) then
      case state is
------------------
-- IDLE state
------------------
        when IDLE =>
          if (s_start_dtc = '1') then
            s_done     <= '0';
            state      <= CH_A_DATA;
            s_selector <= ch_selection_i(7 downto 0);
          else
            s_done <= '1';
            state  <= IDLE;
          end if;
------------------
-- CH_A_DATA state
------------------
        when CH_A_DATA =>
          s_selector  <= ch_selection_i(15 downto 8);
          state       <= CH_B_DATA;
          s_channel_a <= s_mux_out;
------------------
-- CH_B_DATA state
------------------
        when CH_B_DATA =>
          s_selector  <= ch_selection_i(23 downto 16);
          state       <= CH_C_DATA;
          s_channel_b <= s_mux_out;
------------------
-- CH_C_DATA state
------------------
        when CH_C_DATA =>
          s_selector  <= ch_selection_i(31 downto 24);
          state       <= CH_D_DATA;
          s_channel_c <= s_mux_out;
------------------
-- CH_D_DATA state
------------------
        when CH_D_DATA =>
          state       <= IDLE;
          s_channel_d <= s_mux_out;

--------------------
-- OTHERS state
--------------------
        when others =>
          s_done      <= '0';
          s_selector  <= (others => '0');
          s_channel_a <= (others => '0');
          s_channel_b <= (others => '0');
          s_channel_c <= (others => '0');
          s_channel_d <= (others => '0');
          state       <= IDLE;

      end case;
    end if;

  end process;


--=================================================================================================
-- Component Instantiations
--=================================================================================================
--NA--

end architecture plot_mux;
