library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart_tx is
  generic (
    clk_hz : positive;
    baud_rate : positive
  );
  port (
    clk : in std_logic;
    rst : in std_logic;

    -- UART output line
    tx : out std_logic;

    -- Word to send (ready/valid handshake)
    send_tdata : in std_logic_vector(7 downto 0);
    send_tvalid : in std_logic;
    send_tready : out std_logic
  );
end uart_tx;

architecture rtl of uart_tx is

  -- For counting clock periods
  constant clock_cycles_per_bit : integer := integer(real(clk_hz) / real(baud_rate));
  subtype clk_counter_type is integer range 0 to clock_cycles_per_bit - 1;
  signal clk_counter : clk_counter_type;

  type state_type is (IDLE, START_BIT, DATA_BITS, STOP_BIT);
  signal state : state_type;

  -- For sampling the data input
  signal data_sampled : std_logic_vector(7 downto 0);

  -- For counting the number of transmitted bits
  signal bit_counter : integer range 0 to 7;

begin

  FSM_PROC : process(clk)

    -- Increment clk_counter
    -- Return true if the counter wrapped
    impure function clk_counter_wrapped return boolean is
    begin
      if clk_counter = clk_counter_type'high then
        clk_counter <= 0;
        return true;
      else
        clk_counter <= clk_counter + 1;
        return false;
      end if;
    end function;

  begin
    if rising_edge(clk) then
      if rst = '1' then
        state <= IDLE;
        send_tready <= '1';
        tx <= '1';
        clk_counter <= 0;
        data_sampled <= (others => '0');
        bit_counter <= 0;

      else
        tx <= '1';

        case state is

          -- Wait for the valid signal
          when IDLE =>
            send_tready <= '1';

            if send_tvalid = '1' then
              state <= START_BIT;
              data_sampled <= send_tdata;
              send_tready <= '0';
            end if;

          -- Transmit the start bit
          when START_BIT =>
            tx <= '0';

            if clk_counter_wrapped then
              state <= DATA_BITS;
            end if;

          -- Transmit the data bits
          when DATA_BITS =>
            tx <= data_sampled(bit_counter);

            if clk_counter_wrapped then
              if bit_counter = send_tdata'high then
                state <= STOP_BIT;
                bit_counter <= 0;
              else
                bit_counter <= bit_counter + 1;
              end if;
            end if;

          -- Transmit the stop bit
          when STOP_BIT =>
            if clk_counter_wrapped then
              state <= IDLE;
              send_tready <= '1';
            end if;

        end case;

      end if;
    end if;
  end process;

end architecture;