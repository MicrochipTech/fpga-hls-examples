-- ----------------------------------------------------------------------------
-- Smart High-Level Synthesis Tool Version 2023.1
-- Copyright (c) 2015-2023 Microchip Technology Inc. All Rights Reserved.
-- For support, please visit https://microchiptech.github.io/fpga-hls-docs/techsupport.html.
-- Date: Fri Mar 31 13:28:27 2023
-- ----------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;


entity top_function_top_vhdl is
port (
	       clk	:	in	std_logic;
	     reset	:	in	std_logic;
	     start	:	in	std_logic;
	     ready	:	out	std_logic;
	    finish	:	out	std_logic;
	return_val	:	out	std_logic_vector(31 downto 0);
	         n	:	in	std_logic_vector(31 downto 0)
);

-- Put your code here ... 

end top_function_top_vhdl;

architecture behavior of top_function_top_vhdl is

component top_function_top
port (
	       clk	:	in	std_logic;
	     reset	:	in	std_logic;
	     start	:	in	std_logic;
	     ready	:	out	std_logic;
	    finish	:	out	std_logic;
	return_val	:	out	std_logic_vector(31 downto 0);
	         n	:	in	std_logic_vector(31 downto 0)
);
end component;

begin


top_function_top_inst : top_function_top
port map (
	       clk	=>	clk,
	     reset	=>	reset,
	     start	=>	start,
	     ready	=>	ready,
	    finish	=>	finish,
	return_val	=>	return_val,
	         n	=>	n
);


end behavior;

