This training can be regenerated on Windows or on Linux.

-----------------------------------------------------------------------
Windows:
-----------------------------------------------------------------------

1. Open a Powershell terminal.

2. Set up the SmartHLS and Libero paths by dot-sourcing the setup script
   shipped with your Libero SoC installation. Note the leading '. ' (a dot
   followed by a space) - without it the PATH changes are discarded as soon
   as the script exits and 'shls' will not be found. Adjust the path if
   Libero SoC is not installed under C:\Microchip.

> . "C:\Microchip\Libero_SoC_2026.1\SmartHLS\SmartHLS\bin\setup_shls_path.ps1"

   This has to be repeated in every new terminal. Verify that both tools
   resolve before continuing:

> Get-Command shls, libero

3. Navigate to this current directory, e.g.:

> cd C:\Workspace\fpga-hls-examples-main\Training1\Libero

4. Run the following script to generate the HLS example designs:

> .\run_shls_on_examples.ps1

   Windows restricts script execution by default. If this fails with
   "running scripts is disabled on this system", run it with a
   per-invocation bypass instead - this needs no administrator rights and
   changes no persistent setting:

> powershell -ExecutionPolicy Bypass -File .\run_shls_on_examples.ps1

5. When this completes, use Libero to generate the project. This can be
   done from the shell or the IDE.

5a. Shell: From the same directory, run the command:

> libero SCRIPT:libero_flow.tcl LOGFILE:output.log | Write-Output

5b. IDE:
- Open Libero
- Go to File -> Execute Script
- Choose libero_flow.tcl under "Script file". There are no arguments needed.
- Click 'Run'


-----------------------------------------------------------------------
Linux:
-----------------------------------------------------------------------

1. Set up the SmartHLS and Libero paths by sourcing the setup script
   shipped with your Libero SoC installation, e.g.:

source <Libero install>/SmartHLS/SmartHLS/bin/setup_shls_path.sh

   This has to be repeated in every new shell. Verify that both tools
   resolve before continuing:

which shls libero

2. Run the Bash script to generate the HLS example designs:

bash run_shls_on_examples.sh

3. When this completes, use Libero to generate the project. This can be
   done from the shell or the IDE.

3a. Shell: From the same directory, run the command:

libero SCRIPT:libero_flow.tcl LOGFILE:output.log &

3b. IDE:
- Open Libero
- Go to File -> Execute Script
- Choose libero_flow.tcl under "Script file". There are no arguments needed.
- Click 'Run'
