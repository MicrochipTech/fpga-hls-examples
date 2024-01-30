This training can be regenerated on Windows or on Linux.

-----------------------------------------------------------------------
Windows:
-----------------------------------------------------------------------

1. Open terminal you prefer and navigate to this current directory, e.g.:

cd C:\Workspace\fpga-hls-examples-main\Training1\

2. Set shls to point to the correct executable.

3. Navigate to folders and follow steps below to generate the HLS example designs:

3.1 	cd Canny_FIFO_Switch

	shls hw

	cd ..

3.2	cd Gaussian_FIFO_Pipelined
	
	shls hw

	cd ..

3.3	cd RGB2YCbCr

	shls hw

	cd ..

3.4	cd YCbCr2RGB

	shls hw

	cd ..

3.5	cd alpha_blend

	shls hw

	cd ..

3.6 	cd Libero 

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
