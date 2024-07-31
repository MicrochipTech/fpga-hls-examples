-- UART register accessor by VHDLwhiz
-- Generated with the command:
-- python gen_uart_regs.py start=1:out cmd=8:out WB_EN=1:out ram_addr=8:out write_data=8:out read_data=8:in sum_out=32:in sb_count=32:in db_count=32:in
  
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart_regs is
  generic (
    clk_hz : positive := 80000000;
    baud_rate : positive := 115200
  );
  port (
    clk : in std_logic;
    rst : in std_logic;

    uart_rx : in std_logic;
    uart_tx : out std_logic;

    -- UART accessible registers
    start : out std_logic;
    cmd : out std_logic_vector(7 downto 0);
    WB_EN : out std_logic;
    ram_addr : out std_logic_vector(7 downto 0);
    write_data : out std_logic_vector(7 downto 0);
    read_data : in std_logic_vector(7 downto 0);
    sum_out : in std_logic_vector(31 downto 0);
    sb_count : in std_logic_vector(31 downto 0);
    db_count : in std_logic_vector(31 downto 0)
  );
end uart_regs;

architecture rtl of uart_regs is

  signal in_regs : std_logic_vector(103 downto 0) := (others => '0');
  signal out_regs : std_logic_vector(31 downto 0);

begin

  in_regs(103 downto 72) <= db_count;
  in_regs(71 downto 40) <= sb_count;
  in_regs(39 downto 8) <= sum_out;
  in_regs(7 downto 0) <= read_data;
  write_data <= out_regs(31 downto 24);
  ram_addr <= out_regs(23 downto 16);
  WB_EN <= out_regs(15);
  cmd <= out_regs(14 downto 7);
  start <= out_regs(6);

  BACKEND : entity work.uart_regs_backend(rtl)
    generic map (
      clk_hz => clk_hz,
      baud_rate => baud_rate,
      in_bytes => 13,
      out_bytes => 4
    )
    port map (
      clk => clk,
      rst => rst,
      uart_rx => uart_rx,
      uart_tx => uart_tx,
      in_regs => in_regs,
      out_regs => out_regs
    );

end architecture;