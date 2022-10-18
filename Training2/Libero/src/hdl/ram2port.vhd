--=================================================================================================
-- File Name                           : ram2port.vhd
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
use IEEE.STD_LOGIC_UNSIGNED.all;
--USE IEEE.STD_LOGIC_ARITH.ALL;

--=================================================================================================
-- ram2port entity declaration
--=================================================================================================
entity ram2port is
  generic(
-- Generic list
    -- Video format selection
    g_BUFF_AWIDTH : integer := 10;
    g_DWIDTH      : integer := 64
    );
  port(
-- Port list
    -- Read and Write clocks
    wclock_i  : in  std_logic;
    rclock_i  : in  std_logic;
    --Write Enable
    we_i      : in  std_logic;
    --Read and Write Addresses
    rd_addr_i : in  std_logic_vector(g_BUFF_AWIDTH-1 downto 0);
    wr_addr_i : in  std_logic_vector(g_BUFF_AWIDTH-1 downto 0);
    --Write data input
    wr_data_i : in  std_logic_vector(g_DWIDTH-1 downto 0);
    --Read data outputs
    rd_data_o : out std_logic_vector(g_DWIDTH-1 downto 0)

    );
end ram2port;

--=================================================================================================
-- ram2port architecture body
--=================================================================================================

architecture ram2port of ram2port is

--=================================================================================================
-- Component declarations
--=================================================================================================
--NA

--=================================================================================================
-- Signal declarations
--=================================================================================================
  type mem_type is array ((2**g_BUFF_AWIDTH)-1 downto 0) of std_logic_vector (g_DWIDTH-1 downto 0);
  signal rd_addr_reg            : std_logic_vector(g_BUFF_AWIDTH-1 downto 0);
  signal ram                    : mem_type;
--=================================================================================================
-- Synthesis Attributes
--=================================================================================================
  attribute syn_ramstyle        : string;
  attribute syn_ramstyle of ram : signal is "lsram";
begin
--=================================================================================================
-- Top level output port assignments
--=================================================================================================
  rd_data_o <= ram(to_integer(unsigned(rd_addr_reg)));
--=================================================================================================
-- Synchronous blocks
--=================================================================================================
--------------------------------------------------------------------------
-- Name       : WRITE_PROC
-- Description: Process writes data into RAM
--------------------------------------------------------------------------
  WRITE_PROC :
  process(wclock_i)
  begin
    if(rising_edge(wclock_i))then
      if (we_i = '1') then
        ram(to_integer(unsigned(wr_addr_i))) <= wr_data_i;
      end if;
    end if;
  end process;

--------------------------------------------------------------------------
-- Name       : READ_PROC
-- Description: Process reads data from RAM
--------------------------------------------------------------------------
  READ_PROC :
  process(rclock_i)
  begin
    if(rising_edge(rclock_i))then
      rd_addr_reg <= rd_addr_i;
    end if;
  end process;

--=================================================================================================
-- Component Instantiations
--==========================================================
--NA    
end ram2port;
