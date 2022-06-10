library ieeE;
use IEEE.STD_logic_1164.all;
use IEEE.numerIC_STD.all;
use ieee.std_logIC_SIGNED.all;
entity rgb2ycbcr is
generic (g_rgb_data_bIT_WIDTH: INTEGER:= 10;
G_YCBcr_data_bit_width: INTEGER:= 10); port (CLOCK_I: in std_logic;
RESET_N_I: in STD_LOGIC;
red_i: in STD_LOgic_vector((G_RGB_DATA_BIT_WIdth-1) downto 0);
green_i: in Std_logic_vector((G_RGB_DATA_BIT_WIDth-1) downto 0);
bluE_I: in std_logic_vECTOR((G_RGB_DATA_bit_width-1) downto 0);
daTA_VALID_I: in STD_LOGIC;
y_out_o: out STD_LOGIC_VECTOR((g_YCBCR_DATA_BIT_WIDTh-1) downto 0);
cb_out_o: out std_logic_VECTOR((g_ycbcr_data_bit_width-1) downto 0);
cr_out_O: out std_logic_vector((g_ycbcr_data_BIT_WIDTH-1) downto 0);
data_valid_o: out std_logic);
end rGB2YCBCR;

architecture rtl of RGB2YCBCR is

constant scaling_precision: iNTEGER := 18;

constant PRODUCT_BIT_WIDTH: INteger := g_rgb_DATA_BIT_WIDTH+SCALING_precision;

constant Y_C3: STD_LOGIC_VECTor(sCALING_PRECISION-1 downto 0) := "00"&X"41bd";

constant Y_C1: STD_LOgic_vector(SCALING_PRECISION-1 downto 0) := "00"&X"810e";

constant Y_C2: std_logic_vector(SCALING_precision-1 downto 0) := "00"&X"1910";

constant CB_C1: STD_LOGIc_vector(SCALING_PRECISION-1 downto 0) := "00"&X"25f2";

constant CB_C2: STD_LOGIC_VECtor(scaling_precision-1 downto 0) := "00"&X"4a7e";

constant CB_CR_C1: STD_LOGIC_Vector(sCALING_PRECISION-1 downto 0) := "00"&X"7070";

constant CR_C2: STD_LOGic_vector(SCALING_Precision-1 downto 0) := "00"&X"5e27";

constant CR_C3: std_logic_vector(SCALING_PRecision-1 downto 0) := "00"&X"1248";

signal ii: std_logic;

signal o0: std_logic;

signal L0: STD_LOGic;

signal I0: stD_LOGIC_VECTOR((G_RGB_DATA_BIT_width-1) downto 0);

signal O1: STD_LOGIC_VECTOR((G_RGB_DATA_BIT_width-1) downto 0);

signal L1: STD_LOGIC_VECTOR((G_RGB_DATA_BIT_WIdth-1) downto 0);

signal R_1: std_logic_vECTOR((G_RGB_DATA_BIT_WIDTH) downto 0);

signal G_1: STD_LOGIC_VECTOR((G_RGB_data_bit_width) downto 0);

signal B_1: STD_LOGIC_VECTOR((G_RGB_DATA_BIt_width) downto 0);

signal Y_1: std_logiC_VECTOR((G_YCBCR_DATA_BIT_WIDth-1) downto 0);

signal CB_1: STD_logic_vector((g_ycbcr_data_BIT_WIDTH-1) downto 0);

signal CR_1: STD_LOGIC_VECTOR((g_ycbcr_data_bit_widTH-1) downto 0);

signal Y_2: STD_LOgic_vector((product_bit_width) downto 0);

signal CB_2: std_LOGIC_VECTOR((PRODUCT_BIT_WIdth) downto 0);

signal CR_2: std_logic_vectoR((product_bit_width) downto 0);

signal Y_3: std_logic_VECTOR((PRODUCT_BIT_WIDth) downto 0);

signal Y_4: std_logic_VECTOR((PRODUCT_BIT_WIDTH) downto 0);

signal CB_3: STD_LOGIC_VECTOR((product_bit_width) downto 0);

signal CB_4: STD_LOGIC_VECTOR((PRODUCT_BIT_WIDTh) downto 0);

signal CR_3: std_logic_vectOR((prodUCT_BIT_WIDTH) downto 0);

signal CR_4: stD_LOGIC_VECTOR((PRODUCT_BIT_WIDTH) downto 0);

begin
	DATA_valid_o <= L0;
	Y_OUT_O <= Y_1;
	CB_OUT_O <= CB_1;
	CR_OUT_O <= CR_1;
	I0 <= RED_I;
	o1 <= GREEN_I;
	L1 <= blue_i;
	R_1 <= "0"&I0;
	G_1 <= "0"&O1;
	B_1 <= "0"&l1;
	i1l:
	process (CLOCK_I,RESET_N_I)
	begin
		if reset_N_I = '0' then
			ii <= '0';
			O0 <= '0';
			l0 <= '0';
		elsif rISING_EDGE(clock_i) then
			iI <= DATA_VALid_i;
			o0 <= Ii;
			L0 <= o0;
		end if;
	end process;
	ooi:
	process (CLOCK_I,RESET_N_I)
	begin
		if reset_n_i = '0' then
			Y_3 <= ( others => '0');
			Y_4 <= ( others => '0');
			CB_3 <= ( others => '0');
			CB_4 <= ( others => '0');
			CR_3 <= ( others => '0');
			CR_4 <= ( others => '0');
		elsif RISING_EDGE(CLOCK_I) then
			if (data_valid_i = '1') then
				Y_3 <= Y_C3*R_1;
				Y_4 <= Y_C1*G_1+Y_C2*B_1;
				CB_3 <= CB_C1*R_1;
				CB_4 <= (CB_C2*G_1)-(CB_CR_C1*B_1);
				CR_3 <= CB_CR_C1*R_1;
				CR_4 <= CR_C2*G_1+CR_C3*B_1;
			end if;
		end if;
	end process;
	loi:
	process (clock_i,reset_n_i)
	begin
		if RESET_N_I = '0' then
			Y_2 <= ( others => '0');
			CB_2 <= ( others => '0');
			CR_2 <= ( others => '0');
		elsif RISINg_edge(clock_i) then
			if (data_valid_i = '1') then
				Y_2 <= Y_3+Y_4;
				CB_2 <= CB_3+CB_4;
				CR_2 <= CR_3-CR_4;
			end if;
		end if;
	end process;
	IOI:
	process (CLOCK_I,reseT_N_I)
	begin
		if RESET_N_I = '0' then
			Y_1 <= ( others => '0');
			CB_1 <= ( others => '0');
			CR_1 <= ( others => '0');
		elsif RISIng_edge(CLOCK_I) then
			if (DATA_VALid_i = '1') then
				Y_1 <= 16+Y_2(PRODUCT_BIT_width-3 downto PRODUCT_bit_width-(G_YCbCr_DATA_BIT_WIDTH + 2));
				CB_1 <= 128-CB_2(PRODUCT_Bit_width-3 downto PRODUct_bit_width-(G_YCbCr_DATA_BIT_WIDTH + 2));
				CR_1 <= 128+CR_2(product_bit_width-3 downto product_bit_width-(G_YCbCr_DATA_BIT_WIDTH + 2));
			end if;
		end if;
	end process;
end rtl;
