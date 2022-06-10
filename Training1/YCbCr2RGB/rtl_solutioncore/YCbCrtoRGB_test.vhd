LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;  

entity YCbCrtoRGB_test is
end YCbCrtoRGB_test;

architecture behavioral of YCbCrtoRGB_test is

    constant SYSCLK_PERIOD : time := 10 ns; -- 10MHZ
-----------------------------------------------------------
-- Core parameters
-----------------------------------------------------------
    constant G_RGB_DATA_BIT_WIDTH   : INTEGER := 8;                                                                        
    constant G_YCbCr_DATA_BIT_WIDTH : INTEGER := 8;

    signal SYSCLK         : STD_LOGIC := '0';
    signal NSYSRESET      : STD_LOGIC := '0';
    signal Y_I            : STD_LOGIC_VECTOR ((G_YCbCr_DATA_BIT_WIDTH - 1) DOWNTO 0):=x"00";
    signal Cb_I        	  : STD_LOGIC_VECTOR ((G_YCbCr_DATA_BIT_WIDTH - 1) DOWNTO 0):=x"00";
    signal Cr_I           : STD_LOGIC_VECTOR ((G_YCbCr_DATA_BIT_WIDTH - 1) DOWNTO 0):=x"00"; 
    signal DATA_VALID_I  : STD_LOGIC;
    signal RED_O          : STD_LOGIC_VECTOR ((G_RGB_DATA_BIT_WIDTH - 1) DOWNTO 0);
    signal GREEN_O        : STD_LOGIC_VECTOR ((G_RGB_DATA_BIT_WIDTH - 1) DOWNTO 0); 
	signal BLUE_O         : STD_LOGIC_VECTOR ((G_RGB_DATA_BIT_WIDTH - 1) DOWNTO 0);
	signal DATA_VALID_O  : STD_LOGIC;

	 component YCbCr2RGB
       generic (G_RGB_DATA_BIT_WIDTH   : INTEGER := 8;
                G_YCbCr_DATA_BIT_WIDTH : INTEGER := 8
                ); 
        port (
                CLOCK_I			: IN STD_LOGIC;
                RESET_N_I		: IN STD_LOGIC;
                Y_I           	: IN STD_LOGIC_VECTOR ((G_YCbCr_DATA_BIT_WIDTH - 1) DOWNTO 0);
                Cb_I         	: IN STD_LOGIC_VECTOR ((G_YCbCr_DATA_BIT_WIDTH - 1) DOWNTO 0);
                Cr_I         	: IN STD_LOGIC_VECTOR ((G_YCbCr_DATA_BIT_WIDTH - 1) DOWNTO 0);
                DATA_VALID_I   : IN STD_LOGIC;
                RED_O         	: OUT STD_LOGIC_VECTOR ((G_RGB_DATA_BIT_WIDTH - 1) DOWNTO 0); 
                GREEN_O        	: OUT STD_LOGIC_VECTOR ((G_RGB_DATA_BIT_WIDTH - 1) DOWNTO 0);
				BLUE_O        	: OUT STD_LOGIC_VECTOR ((G_RGB_DATA_BIT_WIDTH - 1) DOWNTO 0);
				DATA_VALID_O   : OUT STD_LOGIC
            );
    end component;
	
begin
    -- Clock Driver
    SYSCLK <= not SYSCLK after (SYSCLK_PERIOD / 2.0 );
PROCESS
BEGIN
	NSYSRESET <= '0';
	WAIT FOR(SYSCLK_PERIOD * 10);
	NSYSRESET <= '1';
	WAIT;
END PROCESS;

PROCESS
BEGIN
	WAIT FOR 100 ns;
		Y_I   <=x"88";
	    Cb_I  <=x"9E";
	    Cr_I  <=x"66";
	WAIT FOR 100 ns;
		Y_I   <=x"92";
	    Cb_I  <=x"94";
	    Cr_I  <=x"6C";
	WAIT FOR 100 ns;
		Y_I   <=x"6F";
	    Cb_I  <=x"8F";
	    Cr_I  <=x"C4";
	WAIT FOR 100 ns;
		Y_I   <=x"93";
	    Cb_I  <=x"78";
	    Cr_I  <=x"6E";
	WAIT;
END PROCESS;

PROCESS
BEGIN
	DATA_VALID_I <= '0';
	WAIT FOR(SYSCLK_PERIOD * 10);
	DATA_VALID_I <= '1';
	WAIT FOR(SYSCLK_PERIOD * 40);
	DATA_VALID_I <= '0';
	WAIT;
END PROCESS;

    -- Instantiate Unit Under Test:  test
	test_YCbCrRGB : YCbCr2RGB
       generic map(
                G_RGB_DATA_BIT_WIDTH    => G_RGB_DATA_BIT_WIDTH,
                G_YCbCr_DATA_BIT_WIDTH  => G_YCbCr_DATA_BIT_WIDTH
                  )
        port map( 
                CLOCK_I			=> SYSCLK,
                RESET_N_I		=> NSYSRESET,
                Y_I				=> Y_I,
                Cb_I			=> Cb_I,
                Cr_I			=> Cr_I,
                DATA_VALID_I   => DATA_VALID_I,
                RED_O     		=> RED_O,
                GREEN_O     	=> GREEN_O,
				BLUE_O	    	=> BLUE_O,
				DATA_VALID_O	=> DATA_VALID_O
                );		

end behavioral;