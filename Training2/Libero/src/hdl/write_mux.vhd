--=================================================================================================
-- File Name                           : write_mux.vhd
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
-- write_mux entity declaration
--=================================================================================================
entity write_mux is
  generic(
    --Data width of incoming data
    g_DATA_WIDTH : integer := 512;

    --Address width
    g_ADDR_WIDTH : integer := 32;

    --Burst Size width
    g_BURST_WIDTH : integer := 16
    );
  port (
--Port list
    -- system reset
    reset_i : in std_logic;

    -- System Clock
    sys_clk_i : in std_logic;

    --Mux selection output for channel selection
    mux_sel_i : in std_logic_vector(1 downto 0);

    --W0 data valid
    w0_data_valid_i  : in std_logic;
    --W0 burst size
    w0_burst_size_i  : in std_logic_vector(g_BURST_WIDTH-1 downto 0);
    --W0 write start address
    w0_wstart_addr_i : in std_logic_vector(g_ADDR_WIDTH-1 downto 0);
    --W0 data input
    w0_data_i        : in std_logic_vector(g_DATA_WIDTH-1 downto 0);

    --W1 data valid
    w1_data_valid_i  : in std_logic;
    --W1 burst size
    w1_burst_size_i  : in std_logic_vector(g_BURST_WIDTH-1 downto 0);
    --W1 write start address
    w1_wstart_addr_i : in std_logic_vector(g_ADDR_WIDTH-1 downto 0);
    --W1 data input
    w1_data_i        : in std_logic_vector(g_DATA_WIDTH-1 downto 0);

    --W2 data valid
    w2_data_valid_i  : in std_logic;
    --W2 burst size
    w2_burst_size_i  : in std_logic_vector(g_BURST_WIDTH-1 downto 0);
    --W2 write start address
    w2_wstart_addr_i : in std_logic_vector(g_ADDR_WIDTH-1 downto 0);
    --W2 data input
    w2_data_i        : in std_logic_vector(g_DATA_WIDTH-1 downto 0);

    --W3 data valid
    w3_data_valid_i  : in std_logic;
    --W3 burst size
    w3_burst_size_i  : in std_logic_vector(g_BURST_WIDTH-1 downto 0);
    --W3 write start address
    w3_wstart_addr_i : in std_logic_vector(g_ADDR_WIDTH-1 downto 0);
    --W3 data input
    w3_data_i        : in std_logic_vector(g_DATA_WIDTH-1 downto 0);

    --Data valid output
    data_valid_o  : out std_logic;
    --Burst size
    burst_size_o  : out std_logic_vector(g_BURST_WIDTH-1 downto 0);
    --Write start address
    wstart_addr_o : out std_logic_vector(g_ADDR_WIDTH-1 downto 0);
    --Data input
    data_o        : out std_logic_vector(g_DATA_WIDTH-1 downto 0)



    );
end write_mux;


--=================================================================================================
-- write_mux architecture body
--=================================================================================================
architecture write_mux of write_mux is

--=================================================================================================
-- Component declarations
--=================================================================================================

--=================================================================================================
-- Synthesis Attributes
--=================================================================================================
--NA--
--=================================================================================================
-- Signal declarations
--=================================================================================================


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
--NA

--=================================================================================================
-- Synchronous blocks
--=================================================================================================
--------------------------------------------------------------------------
-- Name       : REGISTERED_MUX
-- Description: Process to generates a MUX with registered output
--------------------------------------------------------------------------
  REGISTERED_MUX :
  process(SYS_CLK_I, RESET_I)
  begin
    if (RESET_I = '0') then
      data_valid_o  <= '0';
      burst_size_o  <= (others => '0');
      wstart_addr_o <= (others => '0');
      data_o        <= (others => '0');
    elsif rising_edge(SYS_CLK_I) then
      if(mux_sel_i = "00")then
        data_valid_o  <= w0_data_valid_i;
        burst_size_o  <= w0_burst_size_i;
        wstart_addr_o <= w0_wstart_addr_i;
        data_o        <= w0_data_i;
      elsif(mux_sel_i = "01")then
        data_valid_o  <= w1_data_valid_i;
        burst_size_o  <= w1_burst_size_i;
        wstart_addr_o <= w1_wstart_addr_i;
        data_o        <= w1_data_i;
      elsif(mux_sel_i = "10")then
        data_valid_o  <= w2_data_valid_i;
        burst_size_o  <= w2_burst_size_i;
        wstart_addr_o <= w2_wstart_addr_i;
        data_o        <= w2_data_i;
      else
        data_valid_o  <= w3_data_valid_i;
        burst_size_o  <= w3_burst_size_i;
        wstart_addr_o <= w3_wstart_addr_i;
        data_o        <= w3_data_i;
      end if;
    end if;
  end process;
--=================================================================================================
-- Component Instantiations
--=================================================================================================
--NA
end write_mux;
