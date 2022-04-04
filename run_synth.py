#!/usr/bin/env python3

import os
import sys
import subprocess


def modify_tcl(directory, macro):
    file = open(directory+'/run.tcl', 'r')
    fileData = file.read().split('\n')
    file.close()

    for line in range(len(fileData)):
        if (fileData[line].startswith('read_hdl')):
            fileData[line] = "read_hdl -define " + macro + " -language sv ${all_files}"
    
    file = open(directory+'/run.tcl', 'w')
    for line in fileData:
        file.write(line + '\n')
    file.close()


def run_program(top_module_name, directory, synth_type, macro):
    print(top_module_name, directory, synth_type)

    src_dir = './SYNTH/'+directory
    dest_dir = src_dir+'_'+synth_type+'_'+macro.lower()

    # Generate Synth directories
    subprocess.run(['python3', 'gen.py', 'SYNTH', top_module_name, directory, synth_type])
    subprocess.run(['mv', src_dir, dest_dir])

    # Modify TCL file
    modify_tcl(dest_dir, macro)
    
    # Copy SR Latch File
    subprocess.run(['cp', './src/rtl/lib/sr_latch.sv', dest_dir+'/src/sr_latch.sv'])

    # Change the Working Directory
    cwd = os.getcwd()
    os.chdir(dest_dir)
    subprocess.run(['make'])

    files = arr = os.listdir('./')
    for file in files:
        if (file != "rep"):
            subprocess.run(['rm', '-rf', file])
    os.chdir(cwd)




modules = [
        # 'equal', 'not_equal', 'exclusive_max', 'exclusive_min', 'max', 
        'min', 'greater_than', 'less_than', 'greater_than_eq'
        'less_than_eq'
        ]

macros = ['RISING', 'FALLING', 'PULSE']

for module in modules:
    for macro in macros:
        if (macro == 'PULSE'):
            run_program(module, module, 'seq', macro)
        else:
            run_program(module, module, 'comb', macro)

