--=================================================================================================
-- File Name                           : ramDualPort.vhd

-- Description                         : This module implements dual port ram .

-- Targeted device                     : Microsemi-SoC
-- Author                              : India Solutions Team
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
USE IEEE.STD_LOGIC_SIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

--=================================================================================================
-- ramDualPort entity declaration
--=================================================================================================

ENTITY ramDualPort IS                                                                                           
  GENERIC ( 
    -- Generic List
	-- Specifies the data width,address width,buffer depth
            DATA_WIDTH    : INTEGER := 8;                                                                            
            ADDRESS_WIDTH : INTEGER := 10;                                                                             
            BUFF_DEPTH    : INTEGER := 1024                                                                            
          );                                                                                                          
  PORT(                                                                                                               
  --Inputs                                                                                                            
    clk       :  IN   STD_LOGIC;                                                                                      
    we_a      :  IN   STD_LOGIC;                                                                                      
    re_b      :  IN   STD_LOGIC;                                                                                      
    addr_a    :  IN   STD_LOGIC_VECTOR ((ADDRESS_WIDTH -1) DOWNTO 0);                                                 
    addr_b    :  IN   STD_LOGIC_VECTOR ((ADDRESS_WIDTH -1) DOWNTO 0);                                                 
    data_a    :  IN   STD_LOGIC_VECTOR ((DATA_WIDTH -1) DOWNTO 0);

  --Outputs
    q_b       :  OUT  STD_LOGIC_VECTOR ((DATA_WIDTH -1) DOWNTO 0)
  );
END ramDualPort;
--=================================================================================================
-- FCL architecture declaration
--=================================================================================================
ARCHITECTURE ramDualPort OF ramDualPort IS
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
--Declare the RAM variable
  TYPE t_ram_reg IS ARRAY((BUFF_DEPTH-1) DOWNTO 0) of std_logic_vector ((DATA_WIDTH -1) DOWNTO 0);
  SIGNAL ram   : t_ram_reg;  

  ATTRIBUTE syn_ramstyle : string;
  ATTRIBUTE syn_ramstyle OF ram : SIGNAL IS "lsram"; 
  
  SIGNAL q_b_reg : std_logic_vector ((DATA_WIDTH -1) DOWNTO 0);

BEGIN
--=================================================================================================
-- Top level output port assignments
--=================================================================================================
  q_b <= q_b_reg;

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
-- Name       : p_WrRam
-- Description: Process to write in to RAM array
-------------------------------------------------------------------------- 

  p_WrRam: PROCESS(clk)
  BEGIN
    IF rising_edge(clk) THEN 
      IF (we_a = '1') THEN
	    IF (conv_integer(addr_a) <= (BUFF_DEPTH-1)) THEN
          ram (conv_integer(addr_a)) <= data_a;
		ELSE
		  null;
		END IF;
      END IF;
    END IF;
  END PROCESS p_WrRam;
 
--------------------------------------------------------------------------
-- Name       : p_RdRam
-- Description: Process to Read from RAM array
-------------------------------------------------------------------------- 
  p_RdRam: PROCESS(clk)
  BEGIN
    IF rising_edge(clk) THEN
      IF (re_b = '0') THEN
        NULL; 
      ELSE
	    IF (conv_integer(addr_b) <= (BUFF_DEPTH-1)) THEN
          q_b_reg <= ram (conv_integer(addr_b));
		ELSE
		  q_b_reg <= (others => '0'); 
        END IF;
      END IF;
    END IF;
  END PROCESS p_RdRam;
--=================================================================================================
-- Component Instantiations
--=================================================================================================
--NA--
END ramDualPort; 