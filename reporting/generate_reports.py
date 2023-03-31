#!/usr/bin/env python3
import os
import sys

starting_directory = os.path.dirname(os.path.realpath(__file__))
os.chdir(starting_directory)
exit_status = 0

# the -r flag rebuilds the compiler
if '-r' in sys.argv:
    os.chdir(os.path.expanduser('~/legup'))
    exit_status = os.system('make fast -j4')
    os.chdir(starting_directory)

# this loop goes into each folder,
# runs shls,
# checks for any summary files,
# and prints the static runtime estimate section for each
# we skip it if the compilation step exited with an error
if exit_status == 0:
    for test_folder in os.listdir():
        if not os.path.isdir(test_folder):
            continue
        os.chdir(test_folder)
        # if compilation fails, we print its output, and exit
        exit_status = os.system('shls -a > temp')
        if exit_status:
            with open('temp') as compiler_output:
                print(compiler_output.read())
            os.remove('temp')
            break
        os.remove('temp')
        os.chdir('hls_output/reports')
        for file_name in os.listdir():
            if file_name.startswith('summary.hls'):
                print('file %s in folder %s' % (file_name, test_folder))
                with open(file_name) as summary_file:
                    # printing lines will become True once we reach the section
                    printing_lines = False
                    for line in summary_file:
                        if 'Static Runtime Estimate' in line:
                            printing_lines = True
                        if printing_lines:
                            print(line.strip())
        os.chdir(starting_directory)