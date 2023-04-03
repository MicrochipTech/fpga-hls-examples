-- ----------------------------------------------------------------------------
-- Smart High-Level Synthesis Tool Version 2023.1
-- Copyright (c) 2015-2023 Microchip Technology Inc. All Rights Reserved.
-- For support, please visit https://microchiptech.github.io/fpga-hls-docs/techsupport.html.
-- Date: Mon Apr  3 08:59:03 2023
-- ----------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;


entity sobel_filter_top_vhdl is
port (
	                 clk	:	in	std_logic;
	               reset	:	in	std_logic;
	               start	:	in	std_logic;
	               ready	:	out	std_logic;
	              finish	:	out	std_logic;
	        in_var_clken	:	out	std_logic;
	    in_var_read_en_a	:	out	std_logic;
	    in_var_address_a	:	out	std_logic_vector(17 downto 0);
	  in_var_read_data_a	:	in	std_logic_vector(7 downto 0);
	    in_var_read_en_b	:	out	std_logic;
	    in_var_address_b	:	out	std_logic_vector(17 downto 0);
	  in_var_read_data_b	:	in	std_logic_vector(7 downto 0);
	       out_var_clken	:	out	std_logic;
	  out_var_write_en_a	:	out	std_logic;
	out_var_write_data_a	:	out	std_logic_vector(7 downto 0);
	   out_var_read_en_a	:	out	std_logic;
	   out_var_address_a	:	out	std_logic_vector(17 downto 0);
	 out_var_read_data_a	:	in	std_logic_vector(7 downto 0);
	  out_var_write_en_b	:	out	std_logic;
	out_var_write_data_b	:	out	std_logic_vector(7 downto 0);
	   out_var_read_en_b	:	out	std_logic;
	   out_var_address_b	:	out	std_logic_vector(17 downto 0);
	 out_var_read_data_b	:	in	std_logic_vector(7 downto 0)
);

-- Put your code here ... 

end sobel_filter_top_vhdl;

architecture behavior of sobel_filter_top_vhdl is

component sobel_filter_top
port (
	                 clk	:	in	std_logic;
	               reset	:	in	std_logic;
	               start	:	in	std_logic;
	               ready	:	out	std_logic;
	              finish	:	out	std_logic;
	        in_var_clken	:	out	std_logic;
	    in_var_read_en_a	:	out	std_logic;
	    in_var_address_a	:	out	std_logic_vector(17 downto 0);
	  in_var_read_data_a	:	in	std_logic_vector(7 downto 0);
	    in_var_read_en_b	:	out	std_logic;
	    in_var_address_b	:	out	std_logic_vector(17 downto 0);
	  in_var_read_data_b	:	in	std_logic_vector(7 downto 0);
	       out_var_clken	:	out	std_logic;
	  out_var_write_en_a	:	out	std_logic;
	out_var_write_data_a	:	out	std_logic_vector(7 downto 0);
	   out_var_read_en_a	:	out	std_logic;
	   out_var_address_a	:	out	std_logic_vector(17 downto 0);
	 out_var_read_data_a	:	in	std_logic_vector(7 downto 0);
	  out_var_write_en_b	:	out	std_logic;
	out_var_write_data_b	:	out	std_logic_vector(7 downto 0);
	   out_var_read_en_b	:	out	std_logic;
	   out_var_address_b	:	out	std_logic_vector(17 downto 0);
	 out_var_read_data_b	:	in	std_logic_vector(7 downto 0)
);
end component;

begin


sobel_filter_top_inst : sobel_filter_top
port map (
	                 clk	=>	clk,
	               reset	=>	reset,
	               start	=>	start,
	               ready	=>	ready,
	              finish	=>	finish,
	        in_var_clken	=>	in_var_clken,
	    in_var_read_en_a	=>	in_var_read_en_a,
	    in_var_address_a	=>	in_var_address_a,
	  in_var_read_data_a	=>	in_var_read_data_a,
	    in_var_read_en_b	=>	in_var_read_en_b,
	    in_var_address_b	=>	in_var_address_b,
	  in_var_read_data_b	=>	in_var_read_data_b,
	       out_var_clken	=>	out_var_clken,
	  out_var_write_en_a	=>	out_var_write_en_a,
	out_var_write_data_a	=>	out_var_write_data_a,
	   out_var_read_en_a	=>	out_var_read_en_a,
	   out_var_address_a	=>	out_var_address_a,
	 out_var_read_data_a	=>	out_var_read_data_a,
	  out_var_write_en_b	=>	out_var_write_en_b,
	out_var_write_data_b	=>	out_var_write_data_b,
	   out_var_read_en_b	=>	out_var_read_en_b,
	   out_var_address_b	=>	out_var_address_b,
	 out_var_read_data_b	=>	out_var_read_data_b
);


end behavior;

