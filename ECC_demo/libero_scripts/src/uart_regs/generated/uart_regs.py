# UART register accessor by VHDLwhiz
# Generated with the command:
# python gen_uart_regs.py start=1:out cmd=8:out WB_EN=1:out ram_addr=8:out write_data=8:out read_data=8:in sum_out=32:in sb_count=32:in db_count=32:in

import math
import argparse
import serial
from serial.tools.list_ports import comports

# UART accessible register structure:
# (Name, Mode, Bit Length, Data Type)
registers = [
    ('start', 'out', 1, 'std_logic'),
    ('cmd', 'out', 8, 'std_logic_vector'),
    ('WB_EN', 'out', 1, 'std_logic'),
    ('ram_addr', 'out', 8, 'std_logic_vector'),
    ('write_data', 'out', 8, 'std_logic_vector'),
    ('read_data', 'in', 8, 'std_logic_vector'),
    ('sum_out', 'in', 32, 'std_logic_vector'),
    ('sb_count', 'in', 32, 'std_logic_vector'),
    ('db_count', 'in', 32, 'std_logic_vector'),
]

# Default UART configuration
UART_PORT = "COM7"
BAUD_RATE = 115200

# Protocol constants
READ_REQ = 0x0A
START_WRITE = 0x0B
END_WRITE = 0x0C
ESCAPE = 0x0D

class UartRegs:

    def __init__(self, port, baud_rate, debug=False):
        """UART access to FPGA registers by VHDLwhiz.com
        Set debug=True to enable printing of sent and received bytes."""

        self.debug = debug
        if self.debug:
            print(f"Opening UART_PORT: {port} at baud rate: {baud_rate}")
        self.ser = serial.Serial(port, baud_rate, timeout=1)

    def print_byte_debug(self, byte):
        protocol_constants = {
            READ_REQ: "READ_REQ",
            START_WRITE: "START_WRITE",
            END_WRITE: "END_WRITE",
            ESCAPE: "ESCAPE"
        }
        hex_str = f"{byte:02x}"
        control_char_info = protocol_constants.get(byte, "")
        if control_char_info:
            print(f"{hex_str} - {control_char_info}")
        else:
            print(hex_str)

    def read_regs(self):
        """Read all input and output registers and return a dict with the values on the form:
        {reg_name: value, ...}  Ex.: {'s3': 15, 's2': 13, 's1': 1}"""
        
        # Calculate lengths of in_regs and out_regs
        in_regs_length = sum(reg[2] for reg in registers if reg[1] == 'in')
        out_regs_length = sum(reg[2] for reg in registers if reg[1] == 'out')
        
        # Pad lengths to multiples of 8
        in_regs_length = math.ceil(in_regs_length / 8) * 8
        out_regs_length = math.ceil(out_regs_length / 8) * 8

        # Calculate the expected number of bytes based on the registers
        expected_bytes = (in_regs_length + out_regs_length) // 8

        if self.debug:
            print("Sending Read request:")
            self.print_byte_debug(READ_REQ)
        self.ser.write(bytes([READ_REQ]))

        prev_byte = None
        receiving_data = True
        escape_next = False
        data = bytearray()

        if self.debug:
            print("Receiving bytes (hex):")

        # Read data from UART
        while True:
            byte = self.ser.read(1)
            if not byte:
                print("Read timed out")
                exit(1)

            byte = byte[0]
            
            if self.debug:
                self.print_byte_debug(byte)

            if byte == START_WRITE and prev_byte != ESCAPE:
                receiving_data = True
            elif receiving_data:
                if byte == END_WRITE and not escape_next:
                    receiving_data = False
                    break
                elif byte != ESCAPE or escape_next:
                    data.append(byte)
                    escape_next = False
                elif byte == ESCAPE:
                    escape_next = True
            prev_byte = byte

        # Check if the number of read data bytes matches the expected number
        if len(data) != expected_bytes:
            raise IOError(f"Received {len(data)} bytes, but expected {expected_bytes} bytes.")

        # Extract register values
        regs_values = {}
        start_bit_in = 0
        start_bit_out = 0
        in_regs = "".join([f"{byte:08b}" for byte in data[-(in_regs_length // 8):]])[-in_regs_length:]
        out_regs = "".join([f"{byte:08b}" for byte in data[:out_regs_length // 8]])[-out_regs_length:]

        def extract_bits(value, start, end):
            return value[start:end + 1]

        for name, mode, length, _ in reversed(registers):
            if mode == 'in':
                end_bit = start_bit_in + length
                value = extract_bits(in_regs, start_bit_in, end_bit - 1)
                start_bit_in = end_bit
            else:
                end_bit = start_bit_out + length
                value = extract_bits(out_regs, start_bit_out, end_bit - 1)
                start_bit_out = end_bit

            # Convert the binary string value to an integer
            regs_values[name] = int(value, 2)

        return regs_values

    @classmethod
    def print_table(cls, header_cols, rows, include_int_val=False, regs_values=None):
        # Determine the widths for each column
        widths = [max(len(col), max(len(str(row[i])) for row in rows)) + 2 for i, col in enumerate(header_cols)]

        # Construct the header line
        header = "".join([f"{col:<{width}}" for col, width in zip(header_cols, widths)])

        # Construct the separator line
        separator = "=" * len(header)

        # Print the header and separator
        print(header)
        print(separator)

        # Print the table rows
        for row in rows:
            print("".join([f"{str(item):<{widths[i]}}" for i, item in enumerate(row)]))

    def print_regs(self, regs_values):
        """Print a nice ASCII table with the reg values returned by read_regs()"""

        header_cols = ["Reg name", "Bits", "Type", "Mode", "Hex val"]
        has_int_val = any(data_type in ['unsigned', 'signed'] for _, _, _, data_type in registers)
        
        if has_int_val:
            header_cols.append("Int val")
        
        rows = [[name, str(length), data_type, mode, hex(regs_values[name])] for name, mode, length, data_type in registers]
        
        if has_int_val:
            for row in rows:
                value = regs_values[row[0]]
                int_val = ""
                if row[2] == 'unsigned':
                    int_val = value
                elif row[2] == 'signed':
                    bit_length = int(row[1])
                    int_val = value - (1 << bit_length) if value & (1 << (bit_length - 1)) else value

                row.append(int_val)
        self.print_table(header_cols, rows)
    
    def read_and_print_regs(self):
        """Read and print all registers in a nice ASCII table"""

        all_values = self.read_regs()
        self.print_regs(all_values)

    @classmethod
    def list_regs(cls):
        header_cols = ["Register Name", "Bits", "Type", "Mode"]
        rows = [[name, str(length), data_type, mode] for name, mode, length, data_type in registers]
        cls.print_table(header_cols, rows)

    def write_regs(self, write_values):
        """Takes a dict with the register names and values to write on the form:
        {reg_name: value} Ex. {'s1': 1, 's2': 15, 's3': 255}
        
        If a complete set of output values isn't given this method will
        use read_regs() to get the current values for the missing registers before writing."""

        write_values = self.read_back_missing_out_regs(write_values)

        # Build the write data from the register values
        write_data_bits = ""
        for name, mode, length, data_type in reversed(registers):
            if mode == 'out':
                value = write_values[name]
                
                # Check if the value is in the valid range for the given data type
                if data_type == 'signed':
                    if value >= (1 << (length - 1)) or value < -(1 << (length - 1)):
                        raise ValueError(f"The value {value} for register {name} exceeds the {length}-bit length allowed for signed.")
                else:
                    if value < 0 or value >= (1 << length):
                        raise ValueError(f"The value {value} for register {name} exceeds the {length}-bit length allowed for unsigned.")

                if data_type == 'signed' and value < 0:
                    value_bits = f"{value & ((1 << length) - 1):0{length}b}" # Two's complement for negative values
                else:
                    value_bits = f"{value:0{length}b}"
                
                write_data_bits += value_bits

        # Pad the write data to 8-bit boundaries
        padding_length = (8 - len(write_data_bits) % 8) % 8
        write_data_bits += "0" * padding_length

        # Convert to bytes and escape control characters
        write_bytes = bytearray()
        write_bytes.append(START_WRITE) # Directly append the integer

        for i in range(0, len(write_data_bits), 8):
            byte_value = int(write_data_bits[i:i + 8], 2)
            if byte_value in [READ_REQ, START_WRITE, END_WRITE, ESCAPE]: # Directly use the integers
                write_bytes.append(ESCAPE) # Directly append the integer
            write_bytes.append(byte_value)
        write_bytes.append(END_WRITE) # Directly append the integer

        if self.debug:
            print("Sending bytes (hex):")

            for b in write_bytes:
                self.print_byte_debug(b)

        # Send the write data
        bytes_written = self.ser.write(write_bytes)

        # Check that all bytes were written
        if bytes_written != len(write_bytes):
            raise IOError(f"Write failed! {bytes_written} bytes written out of {len(write_bytes)}")

    def read_back_missing_out_regs(self, write_values):
        """Read the current value of any output registers that are missing from write_values.
        Return a complete list of all output registers that can be used to write them to the target."""

        # Create a copy of the provided write values to avoid modifying the original object
        complete_write_values = write_values.copy()

        # Check if any out-mode registers are missing
        missing_values = [name for name, mode, _, _ in registers if mode == 'out' and name not in complete_write_values]

        if missing_values:

            if self.debug:
                print("Reading the currect values from the target before updating the outputs")

            # Read current values of all registers if there are missing out-mode values
            current_values = self.read_regs()

            # Fill in missing values for "out" registers
            for name in missing_values:
                complete_write_values[name] = current_values[name]

        return complete_write_values
    

if __name__ == "__main__":

    class WriteAction(argparse.Action):
        def __call__(self, parser, namespace, values, option_string=None):
            # Ensure that at least one out-mode register value is provided
            if len(values) < 1:
                parser.error("argument -w/--write: must provide at least one out-mode register value in the format reg_name=value.")

            # Parse the provided values into a dictionary
            write_values = {name: int(value, 0) for name, value in (v.split('=') for v in values)}
            
            # Validate that the provided names correspond to out-mode registers
            out_register_names = [name for name, mode, _, _ in registers if mode == 'out']
            for name in write_values.keys():
                if name not in out_register_names:
                    parser.error(f"argument -w/--write: {name} is not a valid out-mode register name.")

            setattr(namespace, self.dest, write_values)
    
    def list_available_com_ports():
        ports = comports()
        available_ports = [port.device for port in ports]
        return available_ports
    
    parser = argparse.ArgumentParser(
        description="Command-line interface to read from and write to UART-accessible registers by VHDLwhiz",
        epilog="Example: 'python uart_regs.py -w reg1=255 reg2=0xff reg3=0b11111111'. "
           "This will write 255 to 'reg1', 'reg2', and 'reg3'."
    )

    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument('-r', '--read', action='store_true', help='Read all registers')
    group.add_argument('-w', '--write', nargs='*', action=WriteAction, metavar='reg_name=value',
                   help='Write to one or more out mode registers. The value can be given as hex (e.g., 0xff), '
                        'binary (e.g., 0b1111), or as a signed or unsigned integer.')
    group.add_argument('-l', '--list', action='store_true', help='List all registers')
    parser.add_argument('-d', '--debug', action='store_true', help='Print debugging info about received and sent bytes')

    available_ports = list_available_com_ports()
    parser.add_argument('-c', '--com', default=UART_PORT, help=f'Set the UART port. Default is {UART_PORT}'
        f' as defined in the UART_PORT constant. Available ports: {", ".join(available_ports)}')

    args = parser.parse_args()

    if args.list:
        UartRegs.list_regs()
    else:

        uart_regs = UartRegs(port=args.com, baud_rate=BAUD_RATE, debug=args.debug)

        if args.read:
            uart_regs.read_and_print_regs()
        elif args.write:
            uart_regs.write_regs(args.write)
            print("Write succeeded")