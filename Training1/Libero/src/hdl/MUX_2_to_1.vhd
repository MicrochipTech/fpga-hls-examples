--=================================================================================================
-- File Name                           : MUX_2_to_1.vhd
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
-- MUX_2_to_1 entity declaration
--=================================================================================================
entity MUX_2_to_1 is
  port(
-- Port list
    -- System reset
    selection_line_i : in std_logic;

    --First input
    input1_i : in std_logic_vector(23 downto 0);

    --Second input      
    input2_i : in std_logic_vector(23 downto 0);

    --First input
    output_o : out std_logic_vector(23 downto 0)

    );
end MUX_2_to_1;


--=================================================================================================
-- MUX_2_to_1 architecture body
--=================================================================================================

architecture MUX_2_to_1 of MUX_2_to_1 is

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
  output_o <= input1_i when (selection_line_i = '1') else input2_i;

--=================================================================================================
-- Component Instantiations
--=================================================================================================
--NA--
end MUX_2_to_1;
