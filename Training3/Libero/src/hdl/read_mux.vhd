--=================================================================================================
-- File Name                           : read_mux.vhd
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
-- read_mux entity declaration
--=================================================================================================
entity read_mux is
  generic(
    --Burst size width
    g_BURST_SIZE_WIDTH : integer := 16
    );
  port (
--Port list
    --Mux selection output for channel selection
    mux_sel_i : in std_logic_vector(1 downto 0);

    --R0 burst size
    r0_burst_size_i  : in std_logic_vector(g_BURST_SIZE_WIDTH-1 downto 0);
    --R0 write start address
    r0_rstart_addr_i : in std_logic_vector(31 downto 0);

    --R1 burst size
    r1_burst_size_i  : in std_logic_vector(g_BURST_SIZE_WIDTH-1 downto 0);
    --R1 write start address
    r1_rstart_addr_i : in std_logic_vector(31 downto 0);

    --R2 burst size
    r2_burst_size_i  : in std_logic_vector(g_BURST_SIZE_WIDTH-1 downto 0);
    --R2 write start address
    r2_rstart_addr_i : in std_logic_vector(31 downto 0);

    --R3 burst size
    r3_burst_size_i  : in std_logic_vector(g_BURST_SIZE_WIDTH-1 downto 0);
    --R3 write start address
    r3_rstart_addr_i : in std_logic_vector(31 downto 0);

    --Burst size
    burst_size_o  : out std_logic_vector(g_BURST_SIZE_WIDTH-1 downto 0);
    --Read start address
    rstart_addr_o : out std_logic_vector(31 downto 0)



    );
end read_mux;


--=================================================================================================
-- read_mux architecture body
--=================================================================================================
architecture read_mux of read_mux is

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

  burst_size_o <= r0_burst_size_i when mux_sel_i = "00" else
                  r1_burst_size_i when mux_sel_i = "01" else
                  r2_burst_size_i when mux_sel_i = "10" else
                  r3_burst_size_i;

  rstart_addr_o <= r0_rstart_addr_i when mux_sel_i = "00" else
                   r1_rstart_addr_i when mux_sel_i = "01" else
                   r2_rstart_addr_i when mux_sel_i = "10" else
                   r3_rstart_addr_i;

--=================================================================================================
-- Generate blocks
--=================================================================================================
--NA--
--=================================================================================================
-- Asynchronous blocks
--=================================================================================================
--NA
--=================================================================================================
-- Component Instantiations
--=================================================================================================
--NA
end read_mux;
