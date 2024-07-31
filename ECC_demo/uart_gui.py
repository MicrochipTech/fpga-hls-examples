from libero_scripts.src.uart_regs.generated.uart_regs import UartRegs
from serial.tools.list_ports import comports
import time
import ipywidgets as widgets
from IPython.display import display
from functools import partial

def list_available_com_ports():
        ports = comports()
        available_ports = [port.device for port in ports]
        return available_ports

class UART_GUI:
        def __init__(self) -> None:
                self.uart_regs : UartRegs = None

                style = {'description_width': 'initial'}
                self.ports_list = widgets.Dropdown(options=list_available_com_ports(), description='Port:', style=style)
                self.connect_button = widgets.Button(description='Connect', style=style)
                self.disconnect_button = widgets.Button(description='Disconnect', style=style)

                self.write_addr = widgets.BoundedIntText(min=0, max=255, step=1, description='Write Address:', style=style)
                self.write_data = widgets.IntText(description='Write Data:', style=style)
                self.write_button = widgets.Button(description='Write', style=style)

                self.read_addr = widgets.BoundedIntText(min=0, max=255, step=1, description='Read Address:', style=style)
                self.read_data = widgets.IntText(description='Read Data:', disabled=True, style=style)
                self.read_button = widgets.Button(description='Read', style=style)

                self.write_back_check = widgets.Checkbox(value=False, description='Write Back Enable', indent=False, style=style)
                self.sum_output = widgets.IntText(description='Sum:', disabled=True, style=style)
                self.sum_button = widgets.Button(description='Sum', style=style)

                self.sb_counter = widgets.IntText(description='Single Bit Error Count:', disabled=True, style=style)
                self.db_counter = widgets.IntText(description='Double Bit Error Count:', disabled=True, style=style)
                self.clear_counter_button = widgets.Button(description='Clear Counters', style=style)

                layout = widgets.Layout(border='1px solid black', overflow='scroll')
                self.log = widgets.Output(layout=layout)
                self.init_ram_button = widgets.Button(description='Initialize RAM', style=style)
                self.clear_ram_button = widgets.Button(description='Clear RAM Content', style=style)
                self.clear_log_button = widgets.Button(description='Clear Log', style=style)

                self.grid = widgets.GridspecLayout(5, 6, height='300px')

                self.grid[0, 3] = self.ports_list
                self.grid[0, 4] = self.connect_button
                self.grid[0, 5] = self.disconnect_button

                self.grid[1, 0] = self.write_addr
                self.grid[1, 1] = self.write_data
                self.grid[1, 2] = self.write_button

                self.grid[2, 0] = self.read_addr
                self.grid[2, 1] = self.read_data
                self.grid[2, 2] = self.read_button

                self.grid[3, 0] = self.write_back_check
                self.grid[3, 1] = self.sum_output
                self.grid[3, 2] = self.sum_button

                self.grid[4, 0] = self.sb_counter
                self.grid[4, 1] = self.db_counter
                self.grid[4, 2] = self.clear_counter_button

                self.grid[1:4, 3:] = self.log
                self.grid[4, 3] = self.init_ram_button
                self.grid[4, 4] = self.clear_ram_button
                self.grid[4, 5] = self.clear_log_button

                self.connect_button.on_click(partial(self.connect, com_port=self.ports_list.value))
                self.disconnect_button.on_click(self.disconnect)
                self.write_button.on_click(self.write_cmd)
                self.read_button.on_click(self.read_cmd)
                self.sum_button.on_click(self.sum_cmd)
                self.clear_counter_button.on_click(self.clear_counter_cmd)
                self.init_ram_button.on_click(self.init_ram_cmd)
                self.clear_ram_button.on_click(self.clear_ram_cmd)
                self.clear_log_button.on_click(self.clear_log)

        def connect(self, button, com_port):
            self.uart_regs = UartRegs(port=com_port, baud_rate=115200, debug=False)
            self.log.append_display_data(f"Opening UART_PORT: {com_port} at baud rate: 115200")

        def disconnect(self, button):
            del self.uart_regs
            self.uart_regs = None
            self.log.append_display_data("Disconnected")
        
        # all uart_regs preserve the previous value
        def run_cmd(self, cmd_name, WB_EN=0, ram_addr=0, write_data=0):
            cmd = {'RAM_CLEAR': 0, 'RAM_INIT': 1, 'READ': 2, 'WRITE': 3, 'CLEAR_COUNT': 4, 'SUM': 5}
            if self.uart_regs is None:
                self.log.append_display_data("UART port is not connected. Connect and try again")
            else:
                self.uart_regs.write_regs({'start': 1, 'cmd': cmd[cmd_name], 'WB_EN': WB_EN, 'ram_addr': ram_addr, 'write_data': write_data})
                time.sleep(0.1)
                self.uart_regs.write_regs({'start': 0}) # turn off HLS module

        def write_cmd(self, button):
              self.run_cmd('WRITE', ram_addr=self.write_addr.value, write_data=self.write_data.value)
              self.log.append_display_data(f"Writing value {self.write_data.value} at address {self.write_addr.value}.")

        def read_cmd(self, button):
            self.run_cmd('READ', WB_EN=self.write_back_check.value, ram_addr=self.read_addr.value)
            reg = self.uart_regs.read_regs()
            self.read_data.value = reg['read_data']
            self.sb_counter.value = reg['sb_count']
            self.db_counter.value = reg['db_count']
            self.log.append_display_data(f"Reading value from address {self.read_addr.value}.")

        def sum_cmd(self, button):
            self.run_cmd(cmd_name='SUM', WB_EN=self.write_back_check.value)
            reg = self.uart_regs.read_regs()
            self.sum_output.value = reg['sum_out']
            self.sb_counter.value = reg['sb_count']
            self.db_counter.value = reg['db_count']
            self.log.append_display_data(f"Summing all values from address 0 to 255.")
        
        def clear_counter_cmd(self, button):
            self.run_cmd('CLEAR_COUNT')
            reg = self.uart_regs.read_regs()
            self.sb_counter.value = reg['sb_count']
            self.db_counter.value = reg['db_count']
            self.log.append_display_data(f"Clearing ECC counter values")
        
        def init_ram_cmd(self, button):
              self.run_cmd('RAM_INIT')
              self.log.append_display_data(f"Initializing RAM with incremental values")

        def clear_ram_cmd(self, button):
              self.run_cmd('RAM_CLEAR')
              self.log.append_display_data(f"Clearing RAM content")
        
        def clear_log(self, button):
              self.log.clear_output()

        def display(self):
                display(self.grid)