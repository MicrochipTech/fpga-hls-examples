import json
import os
import re
import sys
from typing import Any, Dict, List, Tuple

sys.path.append('[YOUR SMARTHLS INSTALLATION HERE]]lib/python')
from instrumentation.read_vcd import run_reader
from matplotlib import animation  # type: ignore
from matplotlib import pyplot as plt
from matplotlib.artist import Artist  # type: ignore

if "ipykernel" in sys.modules:
    import IPython 

# InstrumentConfig holds all the information we need about the
# design itself (e.g. signals, output files, etc.)
class InstrumentConfig:
    def __init__(
        self, hls_output_dir: str, hls_project: str, synplify_project: str
    ) -> None:
        self.hls_project = hls_project
        self.synplify_project = synplify_project

        instrument_conf_json = os.path.join(hls_project, "instrument_conf.json")
        with open(instrument_conf_json) as conf_file:
            conf = json.load(conf_file)
            self.waveform_period = conf["dashboard"]["waveform_period"]

            mult = int(self.waveform_period)
            if (int(self.waveform_period) % 2) == 1:
                mult = mult * 1000
            self.dump_duration = int(conf["iice_options"]["sample_buffer_depth"] * mult)

            self.iice = conf["iice_options"]["iice_name"]
            if self.iice == "":
                self.iice = f"IICE_{os.path.basename(hls_project)}"

        self.sample_dump_file = os.path.join(synplify_project, f"{self.iice}.vcd")
        self.instrument_dir = (
            f'{os.path.join(hls_project, hls_output_dir, "scripts", "instrument")}'
        )
        self.hls_output_dir = hls_output_dir
        self.signals: List[Dict] = []


# PlotConfig holds all the information specific to this method of
# FIFO occupancy visualizing (e.g. the bar plot dashboard)
class PlotConfig:
    def __init__(self) -> None:
        # Plotting Variables:
        self.depth_bars: Any
        self.avg_bars: Any
        self.max_bars: Any
        self.figure = plt.figure(figsize=(5, 5))

        self.text: List[Any] = []
        self.in_notebook = True if "ipykernel" in sys.modules else False


# --------------------------------------------------------------------------------------------------


def run_fifo_dashboard(
    hls_output_dir: str, hls_project_path: str, synthesis_path: str, interactive: str
) -> None:
    """
    This is the function that actually starts the dashboard visualizing.
      You can call this function in your own Python script, or in a Jupyter notebook.
    """
    instrument_config = InstrumentConfig(
        hls_output_dir, hls_project_path, synthesis_path
    )
    plot_config = PlotConfig()
    get_fifo_list(instrument_config)
    init_plot(instrument_config, plot_config)

    if plot_config.in_notebook:
        while 1:
            plotting_loop(0, instrument_config, plot_config)
    else:
        if interactive == "0":
            while not plotting_loop(0, instrument_config, plot_config):
                break
            plt.savefig(f"{instrument_config.iice}_dashboard_plot.png")
        else:
            a = animation.FuncAnimation(  # noqa: F841
                plot_config.figure,
                plotting_loop,
                fargs=(instrument_config, plot_config),
                repeat=True,
            )
            plt.show()


def plotting_loop(
    frames: int, instrument_config: InstrumentConfig, plot_config: PlotConfig
) -> bool:
    """
    The 'semaphore method' of reading/writing a semaphore file is how this particular implementation 
    of the dashboard visualizer works. You are allowed to implement your own if this doesn't suit your needs.
    """
    semaphore_file = os.path.join(instrument_config.instrument_dir, "test")
    if not os.path.isfile(semaphore_file):
        return False
    with open(semaphore_file, "r+") as s:
        # If we read a 1 in the semaphore file, we know that there is a new sample dump
        if "1" in s.read():
            # Read from the dump file
            parse_dump_file(instrument_config)
            # Plot the newly dumped file contents
            plot_live(instrument_config, plot_config)

            if plot_config.in_notebook:
                IPython.display.clear_output()  # Clear the display
                IPython.display.display(plot_config.figure)  # Display the new figure

            # Done reading the dump file, overwrite the semaphore file with a 0
            s.seek(0)
            s.write("0")
            return True
        return False


def init_plot(instrument_config: InstrumentConfig, plot_config: PlotConfig) -> None:
    """
    PLOTTING: Set up the plot. This function will be run the very first time you run run_fifo_dashboard to
    draw the bar outlines of each FIFO and add their titles.
    """

    plot_config.figure.subplots_adjust(bottom=0.4)
    y_axis = [0] * len(instrument_config.signals) 
    plot_config.text = [""] * len(instrument_config.signals)

    x_axis = []
    depths = []

    for signal in instrument_config.signals:
        x_axis.append(signal["short_name"])
        depths.append(signal["depth"])

    # Set the depths
    plot_config.depth_bars = plt.bar(
        x_axis, depths, align="center", edgecolor="black", color="white"
    )

    # Set the max and the averages as 0 as placeholders
    plot_config.max_bars = plt.bar(
        x_axis, y_axis, alpha=0.5, align="center", color="gray"
    )
    plot_config.avg_bars = plt.bar(x_axis, y_axis, label="Average Occupancies")

    # Set the x-axis labels
    plt.xticks(rotation=90, fontsize=7, ha="center")


def plot_live(instrument_config: InstrumentConfig, plot_config: PlotConfig) -> None:
    """
    PLOTTING: Update the plot live. This function is run every time the plotting script is provided new data from the 
    monitoring program.
    """
    signals = instrument_config.signals

    # Get the time the VCD file was changed:
    plt.title(f"Average Occupancies\n{get_date(instrument_config)}")

    # Display the new plot
    for signal_no in range(len(signals)):
        signal = signals[signal_no]
        avg = round(signal["average_value"], 2)

        # Plot signal's min, max, and average
        plot_config.max_bars[signal_no].set_height(signal["max"])

        if signal["average_value"] > signal["almost_full"]:
            colour = "r"
        elif signal["average_value"] < signal["almost_empty"]:
            colour = "y"
        else:
            colour = "g"
        plot_config.avg_bars[signal_no].set_height(avg)
        plot_config.avg_bars[signal_no].set(color=colour)

        # Caption bar with percent occupancy
        if plot_config.text[signal_no]:
            Artist.remove(plot_config.text[signal_no])
        percent = int(signal["average_value"]) / int(signal["depth"]) * 100
        plot_config.text[signal_no] = plt.text(
            signal_no,
            avg,
            f'{avg}/{signal["depth"]} ({percent}%)',
            ha="center",
            rotation=20,
            fontsize=7,
        )

        # Reset the average value in preperation for the next sample dump
        signal["average_value"] = 0


def get_fifo_list(instrument_config: InstrumentConfig) -> None:
    """
    This function parses the file generated by functions_synplify.tcl that is of the form
    module_name_1:
        fifo_1_a,10,1
        fifo_1_b,12,1
        fifo_1_c,133,1

    module_name_2:
        fifo_2_a,8,1
        fifo_2_b,22,1

    This file is created to tell us what FIFOs exist in the design, and what their almost full/almost empty values are
    """
    module: str = ""
    list_file = os.path.join(instrument_config.instrument_dir, ".fifo_list")
    with open(list_file, "r") as data:
        for line in data:
            if ":" in line:
                module = line.strip()[:-1]
            else:
                name, almost_full_value, almost_empty_value = line.strip().split(",")
                # CHANGES HERE: Because we want to exclude any SmartHLS Infrastructure FIFOs from the plot, we filter out any signals
                # w/ "axi4" in the name.
                if name.find("axi4") == -1: 
                    # Get depth:
                    depth, short_name = get_short_name_and_depth(
                        instrument_config, name, module
                    )
                    signal_dict = {
                        "name": name,
                        "short_name": short_name,
                        "module": module,
                        "average_value": 0,  # Average value seen across the sample dump
                        # The maximum value seen the ENTIRE time the plotter is
                        # running, not just the max of the sample dump
                        "max": 0,
                        "depth": int(depth),
                        "almost_full": int(almost_full_value),
                        "almost_empty": int(almost_empty_value),
                    }
                    instrument_config.signals.append(signal_dict)


def get_short_name_and_depth(
    instrument_config: InstrumentConfig, name: str, module: str
) -> Tuple[int, str]:
    """
    Hack-y way to get the depth:
    It's a lot harder to get the depth from the synthesis report (*.srr) than from the HLS report,
    so we just parse the HLS report if it's an HLS generated FIFO.
    Else it's probably an Infrastructure FIFO, in which case the depths are hardcoded.
    """
    BB_re = rf"({module}\_BB\_[^\/]+)_inst"
    BB_match = re.findall(BB_re, name)
    short_name = ""
    depth = 0
    # If this is an User defined FIFO, then the module's report file to
    # which the FIFO belongs to should have the depth of the FIFO
    if BB_match:
        short_name = BB_match[0]
        # Getting module name assuming the name doesn't have _BB in it
        summary_file = f"{instrument_config.hls_project}/{instrument_config.hls_output_dir}/reports/summary.hls.{module}.rpt"  # noqa: E501
        summary_line_re = rf"\|\s*{short_name}\s*\|\s*(.*?)\s*\|\s*(.*?)\s*\|\s*(.*?)\s*\|\s*(.*?)\s*\|\s*(.*?)\s*\|\s*(.*?)\s*\|"  # noqa: E501

        with open(summary_file, "r") as lines:
            for line in lines:
                summary_match = re.match(summary_line_re, line)
                if summary_match:
                    depth = int(summary_match[5])

    # If this is an HLS defined FIFO, then the depths are hardcoded.
    else:
        match_axi4init_r_or_w = re.findall(
            r"((\w+\/)+(axi4initiator_r|axi4initiator_w)_\w+)", name
        )
        match_axi4init = re.findall(r"((\w+\/)+axi4initiator_\w+_\w+)", name)
        match_axi4slv = re.findall(r"((\w+\/)+axi4slv_\w+)", name)

        if match_axi4init_r_or_w:
            depth = 64
            short_name = match_axi4init_r_or_w[0][0]

        elif match_axi4init:
            depth = 1
            short_name = match_axi4init[0][0]
        else:
            if match_axi4slv:
                short_name = match_axi4slv[0][0]
            else:
                short_name = name
            depth = 8

    return depth, short_name


def parse_dump_file(instrument_config: InstrumentConfig) -> None:
    """
    This function takes the parsed vcd file and extracts the average_value of each signal
    """
    data = run_reader(instrument_config.sample_dump_file)

    for signal_letter in data[0][instrument_config.sample_dump_file]:
        signal = data[0][instrument_config.sample_dump_file][signal_letter]

        # CHANGES HERE: Because we want to exclude any SmartHLS Infrastructure FIFOs from the plot, we filter out any signals
        # w/ "axi4" in the name.
        if re.match("usedw", signal["name"]) and signal["hier"].find("axi4") == -1:
            full_hier = f"{signal['hier']}/{signal['name']}"

            for config_signal in instrument_config.signals:
                if config_signal["name"] in full_hier:
                    signal_dict = config_signal

            # Iterate through signal values, getting the average value
            signal_values = signal["samples"]

            last_changed = 0
            last_value = 0
            avg = 0.0
            for time_value in signal_values:
                timestamp = int(time_value[0])
                new_value = int(time_value[1][1:], 2)
                if timestamp == 0:
                    last_value = new_value
                    avg = last_value
                else:
                    last_value_duration = timestamp - last_changed
                    avg = (
                        (last_changed) * (avg) + (last_value_duration) * (last_value)
                    ) / timestamp
                    if int(signal_dict["max"]) < last_value:
                        signal_dict["max"] = last_value

                    last_value = new_value
                    last_changed = timestamp

            duration = instrument_config.dump_duration - (last_changed)
            # HERE
            signal_dict["average_value"] = round((
                (last_changed) * (avg) + (duration) * (last_value)
            ) / (instrument_config.dump_duration), 2)


def get_date(instrument_config: InstrumentConfig) -> str:
    """
    Getting the date of the new vcd dump file
    """
    with open(instrument_config.sample_dump_file, "r") as f:
        for line in f:
            if line.strip() == "$date":
                return next(f).strip()

    return "No date found."

run_fifo_dashboard("hls_output", "YOUR PATH TO THE PROJECT", "YOUR PATH TO THE SYNTHESIS DIRECTORY", "1")