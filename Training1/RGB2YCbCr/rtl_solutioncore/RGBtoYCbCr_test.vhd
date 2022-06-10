LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;  

entity RGBtoYCbCr_test is
end RGBtoYCbCr_test;

architecture behavioral of RGBtoYCbCr_test is

    constant SYSCLK_PERIOD : time := 10 ns; -- 10MHZ
-----------------------------------------------------------
-- Core parameters
-----------------------------------------------------------
    constant G_RGB_DATA_BIT_WIDTH   : INTEGER := 10;                                                                        
    constant G_YCbCr_DATA_BIT_WIDTH : INTEGER := 10;

    signal SYSCLK         : STD_LOGIC := '0';
    signal NSYSRESET      : STD_LOGIC := '0';
    signal RED_I          : STD_LOGIC_VECTOR ((G_RGB_DATA_BIT_WIDTH - 1) DOWNTO 0):="00" & x"00";
    signal GREEN_I        : STD_LOGIC_VECTOR ((G_RGB_DATA_BIT_WIDTH - 1) DOWNTO 0):="00" & x"00";
    signal BLUE_I         : STD_LOGIC_VECTOR ((G_RGB_DATA_BIT_WIDTH - 1) DOWNTO 0):="00" & x"00"; 
    signal DATA_VALID_I  : STD_LOGIC;
    signal Y_OUT_O        : STD_LOGIC_VECTOR ((G_YCbCr_DATA_BIT_WIDTH - 1) DOWNTO 0);
    signal Cb_OUT_O       : STD_LOGIC_VECTOR ((G_YCbCr_DATA_BIT_WIDTH - 1) DOWNTO 0); 
	signal Cr_OUT_O       : STD_LOGIC_VECTOR ((G_YCbCr_DATA_BIT_WIDTH - 1) DOWNTO 0);
	signal DATA_VALID_O  : STD_LOGIC;

    component RGB2YCbCr
       generic (G_RGB_DATA_BIT_WIDTH   : INTEGER := 10;
                G_YCbCr_DATA_BIT_WIDTH : INTEGER := 10
                ); 
        port (
                CLOCK_I			: IN STD_LOGIC;
                RESET_N_I		: IN STD_LOGIC;
                RED_I           : IN STD_LOGIC_VECTOR ((G_RGB_DATA_BIT_WIDTH - 1) DOWNTO 0);
                GREEN_I         : IN STD_LOGIC_VECTOR ((G_RGB_DATA_BIT_WIDTH - 1) DOWNTO 0);
                BLUE_I          : IN STD_LOGIC_VECTOR ((G_RGB_DATA_BIT_WIDTH - 1) DOWNTO 0);
                DATA_VALID_I   : IN STD_LOGIC;
                Y_OUT_O         : OUT STD_LOGIC_VECTOR ((G_YCbCr_DATA_BIT_WIDTH - 1) DOWNTO 0); 
                Cb_OUT_O        : OUT STD_LOGIC_VECTOR ((G_YCbCr_DATA_BIT_WIDTH - 1) DOWNTO 0);
				Cr_OUT_O        : OUT STD_LOGIC_VECTOR ((G_YCbCr_DATA_BIT_WIDTH - 1) DOWNTO 0);
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
	DATA_VALID_I <= '0';
	WAIT FOR(SYSCLK_PERIOD * 10);
	DATA_VALID_I <= '1';
	WAIT FOR(SYSCLK_PERIOD * 40);
	DATA_VALID_I <= '0';
	WAIT;
END PROCESS;

PROCESS
BEGIN

	WAIT FOR 100 ns;
		RED_I   <="00" & x"06";
	    GREEN_I <="00" & x"09";
	    BLUE_I  <="00" & x"0C";
	WAIT FOR 100 ns; 
		RED_I   <="00" & x"17";
	    GREEN_I <="00" & x"2A";
	    BLUE_I  <="00" & x"3B";
	WAIT FOR 100 ns; 
		RED_I   <="00" & x"4D";
	    GREEN_I <="00" & x"53";
	    BLUE_I  <="00" & x"A8";
	WAIT FOR 100 ns; 
		RED_I   <="00" & x"77";
	    GREEN_I <="00" & x"8A";
	    BLUE_I  <="00" & x"98";
	WAIT;
END PROCESS;



    -- Instantiate Unit Under Test:  test
    test_RGBYCbCr : RGB2YCbCr
       generic map(
                G_RGB_DATA_BIT_WIDTH    => G_RGB_DATA_BIT_WIDTH,
                G_YCbCr_DATA_BIT_WIDTH  => G_YCbCr_DATA_BIT_WIDTH
                  )
        port map( 
                CLOCK_I			=> SYSCLK,
                RESET_N_I		=> NSYSRESET,
                RED_I			=> RED_I,
                GREEN_I			=> GREEN_I,
                BLUE_I			=> BLUE_I,
                DATA_VALID_I   => DATA_VALID_I,
                Y_OUT_O     	=> Y_OUT_O,
                Cb_OUT_O     	=> Cb_OUT_O,
				Cr_OUT_O	    => Cr_OUT_O,
				DATA_VALID_O	=> DATA_VALID_O
                );
end behavioral;
