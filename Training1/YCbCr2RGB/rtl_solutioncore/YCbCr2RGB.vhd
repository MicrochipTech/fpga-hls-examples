library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_sTD.all;
use IEEE.STd_logic_signed.all;
entity ycbcr2rgb is
generic (G_rgb_data_bit_width: INTeger := 8;
g_ycbcr_data_bit_width: INTEGER := 8); port (clock_I: in STD_LOGic;
RESET_n_i: in std_logIC;
y_i: in std_logic_vector((G_YCBCR_DATA_bit_width-1) downto 0);
CB_I: in STD_logic_vector((g_ycbcr_data_bit_width-1) downto 0);
Cr_i: in std_logic_vector((g_ycbcR_DATA_BIT_WIDTH-1) downto 0);
DATA_VAlid_i: in STD_LOGIC;
RED_O: out std_logic_vECTOR((g_rgb_data_bit_widtH-1) downto 0);
green_o: out STD_logic_vector((G_RGB_DATA_BIT_Width-1) downto 0);
BLUE_O: out std_logic_vector((G_RGB_DATA_BIT_WIDth-1) downto 0);
DATA_VALID_O: out std_logic);
end YCBCR2rgb;

architecture RTL of YCBCR2RGB is

constant scaling_precisioN: integer := 18;

constant PRoduct_bit_width: INTEGER := G_YCBCR_DATA_BIT_width+scaling_preciSION;

constant Oli: std_LOGIC_VECTOR(SCAling_precision-1 downto 0) := "00"&X"950a";

constant lli: STd_logic_vector(SCALING_precision-1 downto 0) := "00"&X"cc4b";

constant ILI: std_logiC_VECTOR(SCALINg_precision-1 downto 0) := "00"&X"3225";

constant OII: std_logic_vector(scaling_pRECISION-1 downto 0) := "00"&X"680f";

constant LII: STD_LOGic_vector(scaling_precisION-1 downto 0) := "01"&X"0235";

signal iI: STD_LOGic;

signal O0: Std_logic;

signal L0: STD_LOGIC;

signal Iii: STD_logic_vector(PRODUCT_BIT_WIDTH-1 downto 0);
 
signal O0I: STD_LOGIC_VECTor(product_bit_width-1 downto 0); 

signal L0i: std_logic_vector(product_BIT_WIDTH-1 downto 0);

signal I0I: STD_logic_vector((g_ycbcr_data_bit_WIDTH-1) downto 0);

signal O1I: STD_LOGIC_VECTor((G_YCBCR_data_bit_width-1) downto 0);

signal l1i: std_logic_vector((G_YCBCR_DATA_bit_width-1) downto 0);

signal i1i: std_logic_vector((G_ycbcr_data_bit_width+1) downto 0);

signal oo0: STD_LOGIC_VECTOR((g_ycbcr_data_bit_widtH+1) downto 0);

signal LO0: STD_LOGic_vector((G_YCBCR_DATA_BIT_width+1) downto 0);

signal io0: std_LOGIC_VECTOR((G_RGB_DATa_bit_width-1) downto 0);

signal OL0: STD_LOGIC_vector((G_RGb_data_bit_width-1) downto 0);

signal LL0: STD_Logic_vector((G_RGB_DATA_BIT_Width-1) downto 0);

signal il0: std_logic_vector((PRODUCT_bit_width+1) downto 0);

signal oi0: stD_LOGIC_VECTOR((product_bit_WIDTH+1) downto 0);

signal li0: STD_LOGIC_VECTOR((pRODUCT_BIT_WIDTH+1) downto 0);

signal II0: STD_LOGIC_vector((PRODUCT_BIT_WIDTH+1) downto 0);

signal O00: Std_logic_vector((PROduct_bit_width+1) downto 0);

signal l00: std_logic_veCTOR((product_bit_width+1) downto 0);

signal i00: std_loGIC_VECTOR((product_BIT_WIDTH+1) downto 0);

signal O10: std_logic_vector((PRODUCt_bit_width+1) downto 0);

signal L10: STD_LOGIc_vector((product_bit_width+1) downto 0);

begin
data_valid_o <= L0;
RED_O <= io0;
GREEN_O <= ol0;
BLUE_O <= LL0;
i0i <= Y_I;
O1I <= cb_i;
l1i <= cr_i;
i1i <= "00"&I0i;
OO0 <= "00"&O1I;
lo0 <= "00"&l1i;
Iii(23 downto 0)<= x"6F75E3";
Iii(product_BIT_WIDTH-1 downto 24)<= (others => '0');
O0I(23 downto 0)<= x"43C9BA";
O0I(product_bit_width-1 downto 24)<= (others => '0');
L0i(23 downto 0)<= x"8A6B02";
L0i(product_BIT_WIDTH-1 downto 24)<= (others => '0');
I1L:
process (cloCK_I,RESET_N_I)
begin
if RESET_n_i = '0' then
II <= '0';
o0 <= '0';
l0 <= '0';
elsif rising_edge(CLOCK_I) then
ii <= dATA_VALID_I;
O0 <= ii;
l0 <= O0;
end if;
end process;
I10:
process (clock_I,RESET_N_I)
begin
if rESET_N_I = '0' then
ii0 <= ( others => '0');
O00 <= ( others => '0');
L00 <= ( others => '0');
i00 <= ( others => '0');
O10 <= ( others => '0');
L10 <= ( others => '0');
elsif RISING_EDGE(clock_i) then
if (dATA_VALID_I = '1') then
II0 <= oli*i1i;
o00 <= III-lli*lo0;
L00 <= oli*I1I;
I00 <= ILI*OO0+oii*LO0-o0i;
o10 <= oli*I1I;
l10 <= L0I-LII*oo0;
end if;
end if;
end process;
oO1:
process (clock_i,reset_n_i)
begin
if reset_n_i = '0' then
IL0 <= ( others => '0');
OI0 <= ( others => '0');
LI0 <= ( others => '0');
elsif RISING_EDge(CLOCK_I) then
if (DATA_VALID_I = '1') then
il0 <= ii0-o00;
oi0 <= L00-I00;
LI0 <= O10-L10;
end if;
end if;
end process;
LO1:
process (Clock_i,reset_n_i)
begin
if reset_n_i = '0' then
Io0 <= ( others => '0');
ol0 <= ( others => '0');
lL0 <= ( others => '0');
elsif RISING_edge(clock_i) then
if (DATa_valid_i = '1') then
if (il0(product_BIT_WIDTH-1 downto product_bit_width-3) = "111") then
io0 <= ( others => '0');
elsif (il0(Product_bit_width-1 downto product_bit_width-3) = "000") then
IO0 <= il0(PRODUCT_BIT_WIDTH-4 downto PRODuct_bit_width-(G_RGB_DATa_bit_width + 3));
else
IO0 <= ( others => '1');
end if;
if (oi0(product_bit_width-1 downto product_bit_width-3) = "111") then
OL0 <= ( others => '0');
elsif (OI0(product_bit_wiDTH-1 downto PRODUCT_BIT_Width-3) = "000") then
ol0 <= OI0(PRODUCT_bit_width-4 downto PRODUCt_bit_width-(G_RGb_data_bit_width + 3));
else
ol0 <= ( others => '1');
end if;
if (li0(product_bit_wiDTH-1 downto PRODUCT_bit_width-3) = "111") then
LL0 <= ( others => '0');
elsif (LI0(PRODUCT_BIT_width-1 downto product_bit_width-3) = "000") then
LL0 <= LI0(product_BIT_WIDTH-4 downto product_BIT_WIDTH-(G_RGB_DATA_BIT_Width + 3));
else
ll0 <= ( others => '1');
end if;
end if;
end if;
end process;
end RTL;
