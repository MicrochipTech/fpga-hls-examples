
TCL Script Directory Structure

The TCL Script directory is organized as shown below:

 TCL_Script 
     |
     |----src
     |     |---src_components
     |     |---src_constraints
     |     |---src_hdl
     |     |---1_create_design.tcl
     |     |---2_constrain_design.tcl
     |     |---4_implement_design.tcl
     |     |---5_program_design.tcl
     |     |---hls_updates.tcl
     |
     |----common.tcl
     |----script.tcl
     |----readme.txt


TCL Script Folders

TCL_Script\src folder contains the following folders:
* src_components: contains core configuration TCLs, which are required to create the design.
* src_constraints: contains IO, user timing, and floor planning constraints.
* src_hdl: contains HDL files, if applicable.

TCL Files

TCL_Script\src includes the following TCL files:
* 1_create_design.tcl: executes all the required core configuration TCLs with necessary user HDL files from src folder to create the design.
* 2_constraints.tcl: imports all the constraints which are required for the design.
* 4_implement_design.tcl: runs synthesis, place & route, and verify timing.
* 5_program_design.tcl: creates the programming job file.
* hls_updates.tcl: integrate HLS module and other helper modules into the design
* common.tcl: provides all the IP core versions, tool profiles, and device information required to implement the design.
* script.tcl: this is the top-level script, which creates the Libero_Project directory, sets device, project name, and other tool profiles. It invokes all the above TCLs which are required to complete the Libero Design flow.

Running the TCL

The TCL scripts are validated for Libero v2022.3 and IP versions as specified in the common.tcl. To run the TCL, follow:
1. Launch the Libero software
2. Select Project > Execute Script....
3. Click Browse and select script.tcl from the downloaded TCL_Scripts directory.
4. Click Run.
After successful execution of TCL script, Libero project is created within TCL_Scripts directory.

Updating TCL for New Libero Versions and IP Versions

Update the IP Core versions in the common.tcl and run the TCL flow in the new Libero version. By default, the given TCL script should run for new Libero and IP releases.

If there are any mismatches in execution, check the following:
1. For Libero related errors, check Libero release notes for changes related to the design components/tools or changes to TCL commands.
2. For IP core related errors, check the IP handbook and release notes for changes in IP configuration parameters, ports and their functionality. If necessary, update the IP configuration parameters, ports and connections in the TCL.

Refer to Libero SoC TCL Command Reference Guide for more details on TCL commands. Contact Techsupport if you run into any TCL related queries.
