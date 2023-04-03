-- ----------------------------------------------------------------------------
-- Smart High-Level Synthesis Tool Version 2023.1
-- Copyright (c) 2015-2023 Microchip Technology Inc. All Rights Reserved.
-- For support, please visit https://microchiptech.github.io/fpga-hls-docs/techsupport.html.
-- Date: Mon Apr  3 09:01:06 2023
-- ----------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;


entity row_cumulative_sum_top_vhdl is
port (
	              clk	:	in	std_logic;
	            reset	:	in	std_logic;
	            start	:	in	std_logic;
	            ready	:	out	std_logic;
	           finish	:	out	std_logic;
	       grid_clken	:	out	std_logic;
	  grid_write_en_a	:	out	std_logic;
	grid_write_data_a	:	out	std_logic_vector(31 downto 0);
	   grid_read_en_a	:	out	std_logic;
	   grid_address_a	:	out	std_logic_vector(15 downto 0);
	 grid_read_data_a	:	in	std_logic_vector(31 downto 0);
	  grid_write_en_b	:	out	std_logic;
	grid_write_data_b	:	out	std_logic_vector(31 downto 0);
	   grid_read_en_b	:	out	std_logic;
	   grid_address_b	:	out	std_logic_vector(15 downto 0);
	 grid_read_data_b	:	in	std_logic_vector(31 downto 0)
);

-- Put your code here ... 

end row_cumulative_sum_top_vhdl;

architecture behavior of row_cumulative_sum_top_vhdl is

component row_cumulative_sum_top
port (
	              clk	:	in	std_logic;
	            reset	:	in	std_logic;
	            start	:	in	std_logic;
	            ready	:	out	std_logic;
	           finish	:	out	std_logic;
	       grid_clken	:	out	std_logic;
	  grid_write_en_a	:	out	std_logic;
	grid_write_data_a	:	out	std_logic_vector(31 downto 0);
	   grid_read_en_a	:	out	std_logic;
	   grid_address_a	:	out	std_logic_vector(15 downto 0);
	 grid_read_data_a	:	in	std_logic_vector(31 downto 0);
	  grid_write_en_b	:	out	std_logic;
	grid_write_data_b	:	out	std_logic_vector(31 downto 0);
	   grid_read_en_b	:	out	std_logic;
	   grid_address_b	:	out	std_logic_vector(15 downto 0);
	 grid_read_data_b	:	in	std_logic_vector(31 downto 0)
);
end component;

begin


row_cumulative_sum_top_inst : row_cumulative_sum_top
port map (
	              clk	=>	clk,
	            reset	=>	reset,
	            start	=>	start,
	            ready	=>	ready,
	           finish	=>	finish,
	       grid_clken	=>	grid_clken,
	  grid_write_en_a	=>	grid_write_en_a,
	grid_write_data_a	=>	grid_write_data_a,
	   grid_read_en_a	=>	grid_read_en_a,
	   grid_address_a	=>	grid_address_a,
	 grid_read_data_a	=>	grid_read_data_a,
	  grid_write_en_b	=>	grid_write_en_b,
	grid_write_data_b	=>	grid_write_data_b,
	   grid_read_en_b	=>	grid_read_en_b,
	   grid_address_b	=>	grid_address_b,
	 grid_read_data_b	=>	grid_read_data_b
);


end behavior;

