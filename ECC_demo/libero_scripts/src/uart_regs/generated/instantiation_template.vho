-- UART register accessor by VHDLwhiz

  constant clk_hz : integer := 100e6;

  signal clk : std_logic;
  signal rst : std_logic;
  signal uart_to_dut : std_logic;
  signal uart_from_dut : std_logic;

  -- UART accessible registers
  signal start : std_logic;
  signal cmd : std_logic_vector(7 downto 0);
  signal WB_EN : std_logic;
  signal ram_addr : std_logic_vector(7 downto 0);
  signal write_data : std_logic_vector(7 downto 0);
  signal read_data : std_logic_vector(7 downto 0);
  signal sum_out : std_logic_vector(31 downto 0);
  signal sb_count : std_logic_vector(31 downto 0);
  signal db_count : std_logic_vector(31 downto 0);

begin

  -- Generated with the command:
  -- python gen_uart_regs.py start=1:out cmd=8:out WB_EN=1:out ram_addr=8:out write_data=8:out read_data=8:in sum_out=32:in sb_count=32:in db_count=32:in
  UART_REGS_INST : entity work.uart_regs(rtl)
  generic map (
    clk_hz => clk_hz
  )
  port map (
    clk => clk,
    rst => rst,
    uart_rx => uart_rx,
    uart_tx => uart_tx,
    start => start,
    cmd => cmd,
    WB_EN => WB_EN,
    ram_addr => ram_addr,
    write_data => write_data,
    read_data => read_data,
    sum_out => sum_out,
    sb_count => sb_count,
    db_count => db_count
  );
  