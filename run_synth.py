#!/usr/bin/env python3

import os
import sys
import subprocess
from subprocess import PIPE
import argparse


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

def modify_gamma(directory, top_module_name, gamma_width):
    file = open(directory+'/src/'+ top_module_name +'.sv', 'r')
    fileData = file.read().split('\n')
    file.close()

    for line in range(len(fileData)):
        if ("parameter GAMMA_CYCLE_WIDTH" in fileData[line]):
            fileData[line] = '#(parameter GAMMA_CYCLE_WIDTH='+ gamma_width +','
    
    file = open(directory+'/src/'+ top_module_name +'.sv', 'w')
    for line in fileData:
        file.write(line + '\n')
    file.close()


def run_program(top_module_name, directory, synth_type, macro, gamma_width):
    print(top_module_name, directory, synth_type)

    src_dir = './SYNTH/'+directory
    dest_dir = src_dir+'_'+synth_type+'_'+macro.lower()+'_'+gamma_width

    # Generate Synth directories
    subprocess.run(['python3', 'gen.py', 'SYNTH', top_module_name, directory, synth_type])
    subprocess.run(['mv', src_dir, dest_dir])

    # Modify TCL file
    modify_tcl(dest_dir, macro)

    # Modify Gammawidth
    modify_gamma(dest_dir, top_module_name, gamma_width)
    
    # Copy all the required Source files
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
        if (file != "rep" and file != "src" and file != "Makefile" and file != "run.tcl" and file != "chips.sdc"):
            subprocess.run(['rm', '-rf', file])
    os.chdir(cwd)

parser = argparse.ArgumentParser(description='Generate the synthesis folders and run the genus script for synthesis report.\n\
All the files and reports are stored in a directory under SYNTH/"DIR_SYN_MACRO_GWIDTH"')

requiredArgs = parser.add_argument_group('required arguments')
requiredArgs.add_argument("-d", "--DIR", help="Directory within src/rtl", required=True)
requiredArgs.add_argument("-t", "--TOP", help="Top Module name", required=True)
requiredArgs.add_argument("-s", "--SYN", help="Synthesis Type", choices=["seq", "comb"], required=True)
parser.add_argument("-m", "--MACRO", help="Macro Type", choices=["RISING", "FALLING", "PULSE"], default="")
parser.add_argument("-g", "--GWIDTH", help="Width of the Gamma cycle", type=int, default=16)

args = parser.parse_args()

run_program(args.TOP, args.DIR, args.SYN, args.MACRO, args.GWIDTH)