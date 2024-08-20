library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart_regs_backend is
  generic (
    clk_hz : positive;
    baud_rate : positive;
    in_bytes : natural;
    out_bytes : natural
  );
  port (
    clk : in std_logic;
    rst : in std_logic;
    uart_rx : in std_logic;
    uart_tx : out std_logic;
    in_regs : in std_logic_vector(in_bytes * 8 - 1 downto 0);
    out_regs : out std_logic_vector(out_bytes * 8 - 1 downto 0)
  );
end uart_regs_backend;

architecture rtl of uart_regs_backend is

  -- Control characters
  constant READ_REQ    : std_logic_vector(7 downto 0) := x"0A";
  constant START_WRITE : std_logic_vector(7 downto 0) := x"0B";
  constant END_WRITE   : std_logic_vector(7 downto 0) := x"0C";
  constant ESCAPE      : std_logic_vector(7 downto 0) := x"0D";

  -- Internal copy of entity output
  signal out_regs_i : std_logic_vector(out_regs'range);

  signal recv_data : std_logic_vector(7 downto 0);
  signal recv_valid : std_logic;

  signal recv_data_prev_is_escape : std_logic;

  signal send_data : std_logic_vector(7 downto 0);
  signal send_valid : std_logic;
  signal send_ready : std_logic;

  type rx_state_type is (RX_IDLE, RX_GET_BYTES, RX_WAIT_END_WRITE);
  signal rx_state : rx_state_type;

  -- Shift reg for sampling the next out_regs values from the UART RX
  signal rx_sreg : std_logic_vector(out_regs'range);

  constant rx_i_max : integer := out_bytes - 1;
  signal rx_i : integer range 0 to rx_i_max; -- rx_sreg byte index

  -- Signal from RX_FSM to TX_FSM to start TX of reg content
  signal tx_start : std_logic;

  type tx_state_type is (TX_IDLE, TX_START_WRITE,
    TX_CHECK_BYTE, TX_ESCAPE, TX_DATA, TX_END_WRITE);
  signal tx_state : tx_state_type;

  constant tx_bytes : integer := in_bytes + out_bytes;

  -- Shift reg with the in and output data to send send over UART
  signal tx_sreg : std_logic_vector(tx_bytes * 8 - 1 downto 0);
  
  constant tx_i_max : integer := tx_bytes - 1;
  signal tx_i : integer range 0 to tx_i_max; -- tx_sreg byte index
  signal tx_byte : std_logic_vector(7 downto 0); -- Next byte to send

begin

  out_regs <= out_regs_i;

  UART_RX_INST : entity work.uart_rx(rtl)
    generic map (
      clk_hz => clk_hz,
      baud_rate => baud_rate
    )
    port map (
      clk => clk,
      rst => rst,
      rx => uart_rx,
      recv_tdata => recv_data,
      recv_tvalid => recv_valid,
      stop_bit_error => open
    );

  UART_TX_INST : entity work.uart_tx(rtl)
    generic map (
      clk_hz => clk_hz,
      baud_rate => baud_rate
    )
    port map (
      clk => clk,
      rst => rst,
      tx => uart_tx,
      send_tdata => send_data,
      send_tvalid => send_valid,
      send_tready => send_ready
    );

  RX_FSM : process (clk)
    variable recv_data_is_escape : std_logic;

  begin
    if rising_edge(clk) then
      if rst = '1' then
        out_regs_i <= (others => '0');
        rx_state <= RX_IDLE;
        recv_data_prev_is_escape <= '0';
        rx_sreg <= (others => '0');
        rx_i <= 0;
        tx_start <= '0';

      else

        -- Pulsed
        tx_start <= '0';

        -- If a byte arrives over UART
        if recv_valid = '1' then

          if recv_data = ESCAPE then
            recv_data_is_escape := '1';
          else
            recv_data_is_escape := '0';
          end if;

          recv_data_prev_is_escape <= recv_data_is_escape;

          case rx_state is

            -- Wait for read or write command
            when RX_IDLE =>
              null;

            -- Sample the bytes to output to out_regs
            when RX_GET_BYTES =>
              
              -- Check to allow this logic to be optimized away if there are no outputs
              if out_regs'length > 0 then

                if recv_data_is_escape = '0' or recv_data_prev_is_escape = '1' then
                  recv_data_prev_is_escape <= '0';

                  -- Shift in the bytes
                  rx_sreg <= rx_sreg(rx_sreg'high - 8 downto 0) & recv_data;

                  if rx_i = rx_i_max then
                    rx_state <= RX_WAIT_END_WRITE;
                  else
                    rx_i <= rx_i + 1;
                  end if;
                end if;
              end if;

            -- Await the END_WRITE command
            when RX_WAIT_END_WRITE =>
              
              rx_state <= RX_IDLE;
              rx_i <= 0;

              -- Only output the received data when the END_WRITE command
              -- comes after the numbers of data bytes that we are expecting
              if recv_data = END_WRITE then
                out_regs_i <= rx_sreg;
              end if;
              
          end case;

          -- This logic is outside of the case rx_statement because we want to force
          -- the FMS back into sync whenever it receives an unescaped control char
          if recv_data_prev_is_escape = '0' then

            if recv_data = READ_REQ then
              rx_state <= RX_IDLE;
              rx_i <= 0;
              tx_start <= '1';
            end if;

            if recv_data = START_WRITE then
              rx_state <= RX_GET_BYTES;
              rx_i <= 0;
            end if;

            if recv_data = END_WRITE then
              rx_state <= RX_IDLE;
              rx_i <= 0;
            end if;

          end if;
        end if;
      end if;
    end if;
  end process;

  TX_FSM : process(clk)
    variable b : std_logic_vector(7 downto 0);

  begin
    if rising_edge(clk) then
      if rst = '1' then
        send_data <= (others => '0');
        send_valid <= '0';
        tx_state <= TX_IDLE;
        tx_sreg <= (others => '0');
        tx_i <= 0;
        tx_byte <= (others => '0');

      else

        case tx_state is
        
          -- Wait until a send command is receied on the UART RX
          when TX_IDLE =>
            
            if tx_start = '1' then
              tx_state <= TX_START_WRITE;

              -- Concatenate the output and input vector data to send
              tx_sreg <= out_regs_i & in_regs;
            end if;
          
          -- Send START_WRITE byte
          when TX_START_WRITE =>

            send_data <= START_WRITE;
            send_valid <= '1';

            if send_ready = '1' and send_valid = '1' then -- Byte sent
              tx_state <= TX_CHECK_BYTE;
              send_valid <= '0';
            end if;
          
          -- Check if we need to escape this data byte
          when TX_CHECK_BYTE =>

            -- Slice the next data byte to send and shift
            tx_sreg <= tx_sreg(tx_sreg'high - 8 downto 0) & x"00";
            b := tx_sreg(tx_sreg'high downto tx_sreg'length - 8);
            tx_byte <= b;

            if b = READ_REQ or b = START_WRITE or b = END_WRITE or b = ESCAPE then
              tx_state <= TX_ESCAPE;
            else
              tx_state <= TX_DATA;
            end if;
            
          -- Send the escape sequence
          when TX_ESCAPE =>

            send_data <= ESCAPE;
            send_valid <= '1';

            if send_ready = '1' and send_valid = '1' then -- Byte sent
              tx_state <= TX_DATA;
              send_valid <= '0';
            end if;
        
          -- Send the data byte
          when TX_DATA =>

            send_data <= tx_byte;
            send_valid <= '1';

            if send_ready = '1' and send_valid = '1' then -- Byte sent
              send_valid <= '0';
              
              if tx_i = tx_i_max then
                tx_state <= TX_END_WRITE;
                tx_i <= 0;
              else
                tx_state <= TX_CHECK_BYTE;
                tx_i <= tx_i + 1;
              end if;

            end if;

          -- Send the END_WRITE byte
          when TX_END_WRITE =>
            
            send_data <= END_WRITE;
            send_valid <= '1';

            if send_ready = '1' and send_valid = '1' then -- Byte sent
              tx_state <= TX_IDLE;
              send_valid <= '0';
            end if;

        end case;
        
      end if;
    end if;
  end process;

end architecture;