--=================================================================================================
-- File Name                           : selector.vhd
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
use IEEE.STD_LOGIC_SIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

--=================================================================================================
-- selector entity declaration
--=================================================================================================
entity selector is
  port(
-- Port list
    -- System reset
    source_select_i : in std_logic;

    --First input
    frame_start_address1_i : in std_logic_vector(7 downto 0);

    --First input
    frame_start_address2_i : in std_logic_vector(7 downto 0);

    --First input
    frame_start_address1_o : out std_logic_vector(7 downto 0);

    --First input
    frame_start_address2_o : out std_logic_vector(7 downto 0)

    );
end selector;


--=================================================================================================
-- selector architecture body
--=================================================================================================

architecture selector of selector is

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

begin
  frame_start_address2_o <= frame_start_address2_i when (source_select_i = '0') else frame_start_address1_i;
  frame_start_address1_o <= frame_start_address1_i when (source_select_i = '0') else frame_start_address2_i;
--=================================================================================================
-- Component Instantiations
--=================================================================================================
--NA--
end selector;
