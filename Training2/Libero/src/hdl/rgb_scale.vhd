--=================================================================================================
-- File Name                           : RGB_SCALE.vhd

-- Description                         : This module implements a scaler that scales 448x448
--                                       input frame into 28x28 output frame suitable for CNN.

-- Targeted device                     : Microsemi-SoC
-- Author                              :
--
-- SVN Revision Information            :
-- SVN $Revision                       :
-- SVN $Date                           :
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
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;


--=================================================================================================
-- RGB_SCALE entity declaration
--=================================================================================================
ENTITY RGB_SCALE IS
GENERIC(
-- Generic List
    -- Specifies the data width
    G_DATA_WIDTH        : INTEGER RANGE 0 To 24 := 24
);
PORT (
-- Port List
    -- System reset
    RESETN_I                           : IN STD_LOGIC;
    
    -- System clock
    SYS_CLK_I                          : IN STD_LOGIC;
    
    -- Data valid input
    DATA_VALID_I                       : IN STD_LOGIC;
    
    -- Data input
    DATA_I                        	   : IN STD_LOGIC_VECTOR(G_DATA_WIDTH-1 DOWNTO 0);
    
    -- Enable FIFO write
    DATA_VALID_O                       : OUT STD_LOGIC;

    -- FIFO data 
    DATA_O                			   : OUT STD_LOGIC_VECTOR(G_DATA_WIDTH-1 DOWNTO 0)
);
END RGB_SCALE;

--=================================================================================================
--RGB_SCALE Architecture body
--=================================================================================================
ARCHITECTURE RGB_SCALE_ARCH OF RGB_SCALE IS

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
SIGNAL s_line_counter           : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL s_h_counter              : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL s_v_counter              : STD_LOGIC_VECTOR(9 DOWNTO 0);

SIGNAL s_red                    : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL s_green                  : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL s_blue                   : STD_LOGIC_VECTOR(7 DOWNTO 0);

SIGNAL s_data_valid             : STD_LOGIC;
SIGNAL s_v_write                : STD_LOGIC;
SIGNAL s_h_write                : STD_LOGIC;

BEGIN


--=================================================================================================
-- Top level output port assignments
--=================================================================================================
DATA_VALID_O        <= s_data_valid;
DATA_O              <= DATA_I;

--=================================================================================================
-- GENERATE blocks
--=================================================================================================
--NA--

--=================================================================================================
-- Asynchronous blocks
--=================================================================================================
s_red               <= DATA_I(23 DOWNTO 16);
s_green             <= DATA_I(15 DOWNTO 8);
s_blue              <= DATA_I(7 DOWNTO 0);

s_data_valid        <= '1' WHEN ((s_h_write = '1') AND (s_v_write = '1')
                                 AND (DATA_VALID_I = '1')) ELSE '0';

s_v_write           <= '1' WHEN (s_v_counter = "00"&x"02") ELSE '0';
s_h_write           <= '1' WHEN (s_h_counter = "00"&x"02") ELSE '0';
--=================================================================================================
-- Synchronous blocks
--=================================================================================================
--------------------------------------------------------------------------
-- Name       : COUNTER_GEN
-- Description: Generates the vertical and horizontal counters
--------------------------------------------------------------------------
COUNTER_GEN:PROCESS (RESETN_I,SYS_CLK_I)
    BEGIN
        IF(RESETN_I = '0')THEN
            s_line_counter <= (OTHERS=>'0');
            s_h_counter    <= (OTHERS=>'0');
            s_v_counter    <= (OTHERS=>'0');
        ELSIF(rising_edge(SYS_CLK_I))THEN
            IF(DATA_VALID_I = '1')THEN
                IF(s_line_counter = "01"&x"BF")THEN
                    s_line_counter <= (OTHERS=>'0');
                ELSE
                    s_line_counter <= s_line_counter + 1;
                END IF;
                IF(s_h_counter = "00"&x"0F")THEN
                    s_h_counter <= (OTHERS=>'0');
                ELSE
                    s_h_counter <= s_h_counter + 1;
                END IF;
                IF(s_line_counter = "01"&x"BF")THEN
                    IF(s_v_counter = "00"&x"0F")THEN
                        s_v_counter <= (OTHERS=>'0');
                    ELSE
                        s_v_counter <= s_v_counter + 1;
                    END IF;
                END IF;
            END IF;
        END IF;
    END PROCESS;

--=================================================================================================
-- Component Instantiations
--=================================================================================================
 --NA--
  
END RGB_SCALE_ARCH;