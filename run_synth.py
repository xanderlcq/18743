#!/usr/bin/env python3

import os
import sys
import subprocess
from subprocess import PIPE


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
    
    linker_files = open("./src/rtl/" + directory + "/vcs.args", "r").readlines()[:-2]
    for f in linker_files:
        res = subprocess.run('ln -s {} {}'.format(f.strip("\n"), dest_dir+"/src/"), shell=True, stdout=PIPE, stderr=PIPE)    

    # Change the Working Directory
    cwd = os.getcwd()
    os.chdir(dest_dir)
    subprocess.run(['make'])

    files = arr = os.listdir('./')
    # Delete unnecessary Files
    for file in files:
        if (file != "rep" and file != "src" and file != "Makefile" and file != "run.tcl"):
            subprocess.run(['rm', '-rf', file])
    os.chdir(cwd)



modules = ['filter', 'mux_b_t_s', 'mux_t_be_t_1', 'mux_t_be_t_N']
macros = ['RISING']

for module in modules:
    for macro in macros:
        run_program(module, module, 'seq', macro)


modules = ['mux_t_t_t_1', 'mux_t_t_t_N']
macros = ['RISING']

for module in modules:
    for macro in macros:
        run_program(module, module, 'comb', macro)
