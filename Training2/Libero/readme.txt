This training can be regenerated on Windows or on Linux.

-----------------------------------------------------------------------
Windows:
-----------------------------------------------------------------------

1. Open the Windows command prompt (cmd) and navigate to the current directory.

2. Navigate to this current directory, e.g.:

> cd C:\Workspace\fpga-hls-examples-main\Training2\Libero

3. Run the following script to generate the HLS example designs:

> run_shls_on_examples.bat

4. When this completes, use Libero to generate the project. This can be
   done from the shell or the IDE.

4a. Shell: From the same directory, run the command:

> libero SCRIPT:libero_flow.tcl LOGFILE:output.log &

4b. IDE: 
- Open Libero
- Go to File -> Execute Script
- Choose libero_flow.tcl under "Script file". There are no arguments needed.
- Click 'Run'


-----------------------------------------------------------------------
Linux:
-----------------------------------------------------------------------

1. First run the Bash script to generate the HLS example designs:

bash run_shls_on_examples.sh

2. When this completes, use Libero to generate the project. This can be
   done from the shell or the IDE.

2a. Shell: From the same directory, run the command:

libero SCRIPT:libero_flow.tcl LOGFILE:output.log &

2b. IDE: 
- Open Libero
- Go to File -> Execute Script
- Choose libero_flow.tcl under "Script file". There are no arguments needed.
- Click 'Run'
