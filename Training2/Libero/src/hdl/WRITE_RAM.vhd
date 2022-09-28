--=================================================================================================
-- File Name                           : WRITE_RAM.vhd

-- Description                         : This module scales down input camera data and writes it 
--                                       into the LSRAM for display/CNN network.

-- Targeted device                     : Microsemi-SoC
-- Author                              :
--
-- SVN Revision Information            :
-- SVN $Revision                       :
-- SVN $Date                           :
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
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

--=================================================================================================
-- WRITE_RAM entity declaration
--=================================================================================================
ENTITY WRITE_RAM IS
GENERIC(
-- Generic List
    -- Specifies the data width
    G_DATA_WIDTH        : INTEGER RANGE 0 To 16 := 8;
    
    -- Specifies the ram address bit width
    G_ADDRESS_WIDTH     : INTEGER RANGE 0 To 32 := 10
);
PORT (
-- Port List
    -- System reset
    RESETN_I                           : IN STD_LOGIC;

    -- System clock
    SYS_CLK_I                          : IN STD_LOGIC;

    -- Data input
    DATA_VALID_I                       : IN STD_LOGIC;

    -- Data input
    DATA_I                             : IN STD_LOGIC_VECTOR(G_DATA_WIDTH-1 DOWNTO 0);

    -- End of frame
    EOF_O                              : OUT STD_LOGIC;
    
    -- Enable RAM write
    RAM_WR_EN_O                        : OUT STD_LOGIC;

    -- RAM data 
    DATA_O                             : OUT STD_LOGIC_VECTOR(G_DATA_WIDTH-1 DOWNTO 0);

    -- RAM address
    RAM_ADDRESS_O                      : OUT STD_LOGIC_VECTOR(G_ADDRESS_WIDTH-1 DOWNTO 0)
);
END WRITE_RAM;

--=================================================================================================
-- Architecture body
--=================================================================================================
ARCHITECTURE WRITE_RAM OF WRITE_RAM IS

--=================================================================================================
-- Component declarations
--=================================================================================================
--NA--

--=================================================================================================
-- Synthesis Attributes
--=================================================================================================
--NA--

--=================================================================================================
-- Function declarations
--=================================================================================================
--NA--

--=================================================================================================
-- Signal declarations
--=================================================================================================
SIGNAL s_ram_address            : STD_LOGIC_VECTOR(G_ADDRESS_WIDTH-1 DOWNTO 0);
SIGNAL s_data            		: STD_LOGIC_VECTOR(G_DATA_WIDTH-1 DOWNTO 0);
SIGNAL s_data_valid             : STD_LOGIC;

BEGIN


--=================================================================================================
-- Top level output port assignments
--=================================================================================================
EOF_O               <= '1' WHEN (s_ram_address = "11"&x"0F") ELSE '0';
RAM_WR_EN_O        	<= s_data_valid;
RAM_ADDRESS_O 	   	<= s_ram_address;
DATA_O				<= s_data;

--=================================================================================================
-- GENERATE blocks
--=================================================================================================
--NA--

--=================================================================================================
-- Asynchronous blocks
--=================================================================================================
--NA--

--=================================================================================================
-- Synchronous blocks
--=================================================================================================
--------------------------------------------------------------------------
-- Name       : INPUT_REGISTER
-- Description: Registers inputs
--------------------------------------------------------------------------
INPUT_REGISTER:PROCESS (RESETN_I,SYS_CLK_I)
	BEGIN
        IF(RESETN_I = '0')THEN
            s_data_valid <= '0';
            s_data       <= (OTHERS=>'0');
        ELSIF(rising_edge(SYS_CLK_I))THEN
            s_data_valid <= DATA_VALID_I;
            s_data       <= DATA_I;
        END IF;
    END PROCESS;
	
--------------------------------------------------------------------------
-- Name       : RAM_ADDRESS_GEN
-- Description: Generates the RAM address
--------------------------------------------------------------------------
RAM_ADDRESS_GEN:PROCESS (RESETN_I,SYS_CLK_I)
	BEGIN
        IF(RESETN_I = '0')THEN
            s_ram_address         <= (OTHERS=>'0'); 
        ELSIF(rising_edge(SYS_CLK_I))THEN
            IF(s_data_valid = '1')THEN
                IF(s_ram_address = "11"&x"0F")THEN
                    s_ram_address <= (OTHERS=>'0');
                ELSE
                    s_ram_address <= s_ram_address + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;

--=================================================================================================
-- Component Instantiations
--=================================================================================================
--NA--
  
END WRITE_RAM;