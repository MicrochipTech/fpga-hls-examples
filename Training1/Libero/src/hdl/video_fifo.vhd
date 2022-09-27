--=================================================================================================
-- File Name                           : video_fifo.vhd
-- Targeted device                     : Microsemi-SoC
-- Author                              : India Solutions Team
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
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
--USE IEEE.STD_LOGIC_ARITH.ALL;

--=================================================================================================
-- video_fifo entity declaration
--=================================================================================================
entity video_fifo is
  generic(
-- Generic list
    -- Video format selection
    g_VIDEO_FIFO_AWIDTH          : integer := 12;
    g_INPUT_VIDEO_DATA_BIT_WIDTH : integer := 24;
    g_HALF_EMPTY_THRESHOLD       : integer := 1280
    );
  port(
-- Port list
    -- System reset
    wclock_i      : in  std_logic;
    wresetn_i     : in  std_logic;
    wen_i         : in  std_logic;
    wdata_i       : in  std_logic_vector(g_INPUT_VIDEO_DATA_BIT_WIDTH-1 downto 0);
    wfull_o       : out std_logic;
    wafull_o      : out std_logic;
    wdata_count_o : out std_logic_vector(g_VIDEO_FIFO_AWIDTH-1 downto 0);
    rclock_i      : in  std_logic;
    rresetn_i     : in  std_logic;
    ren_i         : in  std_logic;
    rdata_o       : out std_logic_vector(g_INPUT_VIDEO_DATA_BIT_WIDTH-1 downto 0);
    rdata_rdy_o   : out std_logic;
    rempty_o      : out std_logic;
    raempty_o     : out std_logic;
    rhempty_o     : out std_logic;
    rdata_count_o : out std_logic_vector(g_VIDEO_FIFO_AWIDTH-1 downto 0)
    );
end video_fifo;

--=================================================================================================
-- video_fifo architecture body
--=================================================================================================

architecture video_fifo of video_fifo is

--=================================================================================================
-- Component declarations
--=================================================================================================
  component ram2port
    generic(
      g_BUFF_AWIDTH : integer := 9;
      g_DWIDTH      : integer := 32
      );
    port (
      wr_data_i : in  std_logic_vector(g_DWIDTH-1 downto 0);
      rd_addr_i : in  std_logic_vector(g_BUFF_AWIDTH-1 downto 0);
      wr_addr_i : in  std_logic_vector(g_BUFF_AWIDTH-1 downto 0);
      we_i      : in  std_logic;
      wclock_i  : in  std_logic;
      rclock_i  : in  std_logic;
      rd_data_o : out std_logic_vector(g_DWIDTH-1 downto 0)
      );
  end component;
--=================================================================================================
-- Synthesis Attributes
--=================================================================================================
--NA--
--=================================================================================================
-- Signal declarations
--=================================================================================================
  constant AFULL_THRESHOLD  : integer := 5900;
  constant AEMPTY_THRESHOLD : integer := 10;

  type matrix is array (g_VIDEO_FIFO_AWIDTH-1 to 0) of std_logic_vector(g_VIDEO_FIFO_AWIDTH downto 0);

  signal rbin   : std_logic_vector(g_VIDEO_FIFO_AWIDTH downto 0);
  signal rptr   : std_logic_vector(g_VIDEO_FIFO_AWIDTH downto 0);
  signal rwptr1 : std_logic_vector(g_VIDEO_FIFO_AWIDTH downto 0);
  signal rwptr2 : std_logic_vector(g_VIDEO_FIFO_AWIDTH downto 0);

  signal rempty       : std_logic;
  signal s_ren        : std_logic;
  signal raempty      : std_logic;
  signal wfull        : std_logic;
  signal wafull       : std_logic;
  signal fifo_hempty  : std_logic;
  signal wen          : std_logic;
  signal rwbin        : std_logic_vector(g_VIDEO_FIFO_AWIDTH downto 0);
  signal rdata_count  : std_logic_vector(g_VIDEO_FIFO_AWIDTH downto 0);
  signal wbin         : std_logic_vector(g_VIDEO_FIFO_AWIDTH downto 0);
  signal wptr         : std_logic_vector(g_VIDEO_FIFO_AWIDTH downto 0);
  signal s_wrptr2_tmp : std_logic_vector(g_VIDEO_FIFO_AWIDTH downto 0);

  signal wrptr1      : std_logic_vector(g_VIDEO_FIFO_AWIDTH downto 0);
  signal wrptr2      : std_logic_vector(g_VIDEO_FIFO_AWIDTH downto 0);
  signal wrbin       : std_logic_vector(g_VIDEO_FIFO_AWIDTH downto 0);
  signal wdata_count : std_logic_vector(g_VIDEO_FIFO_AWIDTH downto 0);
  signal raddr       : std_logic_vector(g_VIDEO_FIFO_AWIDTH-1 downto 0);
  signal waddr       : std_logic_vector(g_VIDEO_FIFO_AWIDTH-1 downto 0);
  signal rbnext      : std_logic_vector(g_VIDEO_FIFO_AWIDTH downto 0);
  signal rgnext      : std_logic_vector(g_VIDEO_FIFO_AWIDTH downto 0);
  signal wbnext      : std_logic_vector(g_VIDEO_FIFO_AWIDTH downto 0);
  signal wgnext      : std_logic_vector(g_VIDEO_FIFO_AWIDTH downto 0);
  signal wdiff_bus   : std_logic_vector(g_VIDEO_FIFO_AWIDTH downto 0);
  signal rdiff_bus   : std_logic_vector(g_VIDEO_FIFO_AWIDTH downto 0);
  signal i           : integer;
  signal j           : integer;
begin

--=================================================================================================
-- Top level output port assignments
--=================================================================================================
  rdata_rdy_o   <= s_ren;
  rdata_count_o <= rdata_count(g_VIDEO_FIFO_AWIDTH-1 downto 0);
  wfull_o       <= wfull;
  wafull_o      <= wafull;
  rhempty_o     <= fifo_hempty;
  wdata_count_o <= wdata_count((g_VIDEO_FIFO_AWIDTH - 1) downto 0);
  --/* Memory read address pointer */
  raddr         <= rbin(g_VIDEO_FIFO_AWIDTH - 1 downto 0);
--  /* Increment binary counter */
  rbnext        <= rbin + (ren_i and not(rempty));
--  /* Binary to Gray conversion */
  rgnext        <= TO_STDLOGICVECTOR(TO_BITVECTOR(rbnext) srl 1) xor rbnext;
--  /* Write to memory only when FIFO is not full */
  wen           <= '1' when (wen_i = '1') and (wfull = '0') else
         '0';
--  /* Read from memory only when FIFO is not empty */
--//  assign ren = ((ren_i == 1'b1) && (rempty == 1'b0)) ? 1'b1 : 1'b0;
--  /* Memory write address pointer */
  waddr  <= wbin(g_VIDEO_FIFO_AWIDTH - 1 downto 0);
--  /* Increment binary counter */
  wbnext <= wbin + (wen_i and not(wfull));
--  /* Binary to Gray conversion */
--s_shift_right_val  <= TO_STDLOGICVECTOR(TO_BITVECTOR(s_filter_incr) SRA
--                   conv_integer(UNSIGNED(filter_factor_i)));
  wgnext <= TO_STDLOGICVECTOR(TO_BITVECTOR(wbnext) srl 1) xor wbnext;

  rempty_o <= rempty;
--=================================================================================================
-- Generate blocks
--=================================================================================================
--NA

--=================================================================================================
-- Asynchronous blocks
--=================================================================================================
  rdiff_bus    <= (rwbin - rbin);
  raempty_o    <= raempty;
  wdiff_bus    <= wbin - wrbin;
  s_wrptr2_tmp <= not(wrptr2(g_VIDEO_FIFO_AWIDTH downto g_VIDEO_FIFO_AWIDTH - 1))
                  & wrptr2(g_VIDEO_FIFO_AWIDTH - 2 downto 0);
--------------------------------------------------------------------------
-- Name       : GRAY2BIN_PROC
-- Description: Process converts gray code to binary
--------------------------------------------------------------------------
  GRAY2BIN_PROC :
  process(rwptr2, rwbin)
  begin
    rwbin(g_VIDEO_FIFO_AWIDTH) <= rwptr2(g_VIDEO_FIFO_AWIDTH);
    for i in 0 to g_VIDEO_FIFO_AWIDTH-1 loop
      rwbin(i) <= rwptr2(i) xor rwbin(i+1);
    end loop;
  end process;

--------------------------------------------------------------------------
-- Name       : GRAY2BIN_CONV
-- Description: Process implements gray to binary conversion
--------------------------------------------------------------------------
  GRAY2BIN_CONV :
  process(wrptr2, wrbin)
  begin
    wrbin(g_VIDEO_FIFO_AWIDTH) <= wrptr2(g_VIDEO_FIFO_AWIDTH);
    for j in 0 to g_VIDEO_FIFO_AWIDTH-1 loop
      wrbin(j) <= wrptr2(j) xor wrbin(j+1);
    end loop;
  end process;




--=================================================================================================
-- Synchronous blocks
--=================================================================================================
--------------------------------------------------------------------------
-- Name       : READ_PTR_ASSIGN_PROC
-- Description: Process reads data
--------------------------------------------------------------------------
  DELAY :
  process(rclock_i, rresetn_i)
  begin
    if rresetn_i = '0' then
      s_ren <= '0';
    elsif(rising_edge(rclock_i))then
      s_ren <= ren_i;
    end if;
  end process;

--------------------------------------------------------------------------
-- Name       : READ_PTR_ASSIGN_PROC
-- Description: Process reads data
--------------------------------------------------------------------------
  READ_PTR_ASSIGN_PROC :
  process(rclock_i, rresetn_i)
  begin
    if rresetn_i = '0' then
      rbin <= (others => '0');
      rptr <= (others => '0');
    elsif(rising_edge(rclock_i))then
      rbin <= rbnext;
      rptr <= rgnext;
    end if;
  end process;

--------------------------------------------------------------------------
-- Name       : SYNC_WRPTR_RDCLK_PROC
-- Description: Process synchronizes write pointer to read clock domain
--------------------------------------------------------------------------
  SYNC_WRPTR_RDCLK_PROC :
  process(rclock_i, rresetn_i)
  begin
    if rresetn_i = '0' then
      rwptr1 <= (others => '0');
      rwptr2 <= (others => '0');
    elsif(rising_edge(rclock_i))then
      rwptr1 <= wptr;
      rwptr2 <= rwptr1;
    end if;
  end process;

--------------------------------------------------------------------------
-- Name       : REMPTY_ASSIGN_PROC
-- Description: Process assigns read empty when next rptr equals synchronized wptr
--------------------------------------------------------------------------
  REMPTY_ASSIGN_PROC :
  process(rclock_i, rresetn_i)
  begin
    if rresetn_i = '0' then
      rempty <= '1';
    elsif(rising_edge(rclock_i))then
      if(rgnext = rwptr2)then
        rempty <= '1';
      else
        rempty <= '0';
      end if;
    end if;
  end process;
--------------------------------------------------------------------------
-- Name       : DATACNT_PROC
-- Description: Process counts data in FIFO (diff between write and read ptr)
--------------------------------------------------------------------------
  DATACNT_PROC :
  process(rclock_i, rresetn_i)
  begin
    if rresetn_i = '0' then
      rdata_count <= (others => '0');
    elsif(rising_edge(rclock_i))then
      rdata_count <= (rwbin - rbin);
    end if;
  end process;

--------------------------------------------------------------------------
-- Name       : READ_EMPTY_ASSIGN
-- Description: Process detects read buffer empty
--------------------------------------------------------------------------
  READ_EMPTY_ASSIGN :
  process(rclock_i, rresetn_i)
  begin
    if rresetn_i = '0' then
      raempty <= '1';
    elsif(rising_edge(rclock_i))then
      if(AEMPTY_THRESHOLD >= rdiff_bus)then
        raempty <= '1';
      else
        raempty <= '0';
      end if;
    end if;
  end process;

--------------------------------------------------------------------------
-- Name       : HALFEMPTY_PROC
-- Description: Process assigns fifo half empty signal
--------------------------------------------------------------------------
  HALFEMPTY_PROC :
  process(rclock_i, rresetn_i)
  begin
    if rresetn_i = '0' then
      fifo_hempty <= '1';
    elsif(rising_edge(rclock_i))then
      if(g_HALF_EMPTY_THRESHOLD >= rdiff_bus)then
        fifo_hempty <= '1';
      else
        fifo_hempty <= '0';
      end if;
    end if;
  end process;

-------WRITE SECTION----------------------
--------------------------------------------------------------------------
-- Name       : BIN_GRAY_CTR_PROC
-- Description: Process implements binary and gray counters
--------------------------------------------------------------------------
  BIN_GRAY_CTR_PROC :
  process(wclock_i, wresetn_i)
  begin
    if wresetn_i = '0' then
      wbin <= (others => '0');
      wptr <= (others => '0');
    elsif(rising_edge(wclock_i))then
      wbin <= wbnext;
      wptr <= wgnext;
    end if;
  end process;

--------------------------------------------------------------------------
-- Name       : SYNC_READ_PTR
-- Description: Syncronizes read pointer into write clock domain
--------------------------------------------------------------------------
  SYNC_READ_PTR :
  process(wclock_i, wresetn_i)
  begin
    if wresetn_i = '0' then
      wrptr1 <= (others => '0');
      wrptr2 <= (others => '0');
    elsif(rising_edge(wclock_i))then
      wrptr1 <= rptr;
      wrptr2 <= wrptr1;
    end if;
  end process;
  -- FIFO is full when following 3 condition are true
  --1. The wptr and the synchronized rptr MSB's are not equal
  --2. The wptr and the synchronized rptr 2nd MSB's are not equal
  --3. All other wptr and synchronized rptr bits must be equal
--------------------------------------------------------------------------
-- Name       : FIFO_FULL_ASSIGN
-- Description: Synchronizes read pointer into write clock domain
--------------------------------------------------------------------------
  FIFO_FULL_ASSIGN :
  process(wclock_i, wresetn_i)
  begin
    if wresetn_i = '0' then
      wfull <= '0';
    elsif(rising_edge(wclock_i))then
      if(wgnext = s_wrptr2_tmp)then
        wfull <= '1';
      else
        wfull <= '0';
      end if;
    end if;
  end process;

--------------------------------------------------------------------------
-- Name       : FIFO_COUNT
-- Description: Data available in FIFO is difference between write and read pointer
--------------------------------------------------------------------------
  FIFO_COUNT :
  process(wclock_i, wresetn_i)
  begin
    if wresetn_i = '0' then
      wdata_count <= (others => '0');
    elsif(rising_edge(wclock_i))then
      wdata_count <= wbin - wrbin;
    end if;
  end process;



--------------------------------------------------------------------------
-- Name       : WA_FULL_ASSIGN
-- Description: Assigns wafull signal
--------------------------------------------------------------------------
  WA_FULL_ASSIGN :
  process(wclock_i, wresetn_i)
  begin
    if wresetn_i = '0' then
      wafull <= '0';
    elsif(rising_edge(wclock_i))then
      if(wdiff_bus >= AFULL_THRESHOLD)then
        wafull <= '1';
      else
        wafull <= '0';
      end if;
    end if;
  end process;


--=================================================================================================
-- Component Instantiations
--=================================================================================================
  ram2port_inst : ram2port
    generic map(
      g_BUFF_AWIDTH => g_VIDEO_FIFO_AWIDTH,
      g_DWIDTH      => g_INPUT_VIDEO_DATA_BIT_WIDTH
      )
    port map(
      wr_data_i => wdata_i,
      rd_addr_i => raddr,
      wr_addr_i => waddr,
      we_i      => wen,
      wclock_i  => wclock_i,
      rclock_i  => rclock_i,
      rd_data_o => rdata_o
      );
end video_fifo;
