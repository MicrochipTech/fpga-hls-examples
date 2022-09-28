Each of the Training directories contains a Libero subdirectory which can be 
used to regenerate the training for new versions of Libero.
Each of the Libero subdirectories contains the following:

1. readme.txt - this file lists the commands to regenerate the training project
   using the tcl flow.

2. softconsole - this folder has the original Softconsole project. You can use
   this in case you want to regenerate the hex file to be used in the
   Libero project. 

3. src - this folder has all the source files used to recreate the Libero project. 

4. libero_flow.tcl - this is the file that needs to be sourced to the Libero
   executable in script mode. You can also run this file in the IDE by
   selecting <Project><Execute Script>

Note: While running libero_flow.tcl, if you see a failure in configuring a
particular core because it is no longer supported in that particular Libero
release, you can edit the top of libero_flow.tcl to update the version of 
that particular core with the latest version.
