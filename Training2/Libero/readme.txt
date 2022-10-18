This training can be regenerated on Windows using Cygwin or on Linux.

-----------------------------------------------------------------------
Windows (Cygwin):
-----------------------------------------------------------------------

1. Open Cygwin by running the .bat file from the SmartHLS installation directory, e.g.: 

C:\Microchip\Libero_SoC_v2022.2\SmartHLS-2022.2\cygwin64\Cygwin.bat

2. Navigate to this current directory, e.g.:

cd /cygdrive/c/training_libero_projects/training2

Note that C:\ is replaced by /cygdrive/c/

3. Run the Bash script to generate the HLS example designs:

bash run_shls_on_examples.sh

4. When this completes, use Libero to generate the project. This can be
   done from the shell or the IDE.

4a. Shell: From the same directory, run the command:

libero SCRIPT:libero_flow.tcl LOGFILE:output.log &

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
