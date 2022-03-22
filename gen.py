#This file is an util script that will generate SIM and SYNTH directory for a given verilog dir
import subprocess
from pathlib import Path
import os
from subprocess import PIPE
import glob
import sys


synth_no_clk_tcl = './tcl/no_clk_sample.tcl'
synth_clk_tcl = './tcl/clk_sample.tcl'
clk_setup_tcl = './tcl/clk.tcl'

def gen_sim(top_module_name, src_dir):
    src_dir += '/'
    synth_dir = './SIM/{}/'.format(top_module_name)
    synth_src_dir = synth_dir+'src/'

    src_dir = os.path.abspath(src_dir)+'/'
    synth_dir = os.path.abspath(synth_dir)+'/'
    synth_src_dir = os.path.abspath(synth_src_dir)+'/'

    print('generating sim directory for top module:{}, src file directory:{}'.format(top_module_name, synth_dir))
    Path(synth_dir).mkdir(parents=True, exist_ok=True)

    #make dir
    #link soure files
    # sv_files = glob.glob(src_dir+'*.sv')
    # print("creating sort files sym links for: {}".format(sv_files))
    # print('ln -s {}* {}'.format(src_dir, synth_src_dir))
    # res = subprocess.run('ln -s {}* {}'.format(src_dir, synth_src_dir), shell=True, stdout=PIPE, stderr=PIPE)

    res = subprocess.run('cp {}vcs.args {}/'.format(src_dir, synth_dir), shell=True, stdout=PIPE, stderr=PIPE)

    print('Creating make file')
    makefile = open('{}Makefile'.format(synth_dir), 'w')
    makefile.write('rising:\n\tvcs -sverilog -debug_all -full64 -top tb -f vcs.args +define+RISING\nfalling:\n\tvcs -sverilog -debug_all -full64 -top tb -f vcs.args +define+FALLING\npulse:\n\tvcs -sverilog -debug_all -full64 -top tb -f vcs.args +define+PULSE')
    makefile.close()
    

def gen_synth(top_module_name, src_dir, clk=False):
    src_dir += '/'
    synth_dir = './SYNTH/{}/'.format(top_module_name)
    synth_src_dir = synth_dir+'src/'

    src_dir = os.path.abspath(src_dir)+'/'
    synth_dir = os.path.abspath(synth_dir)+'/'
    synth_src_dir = os.path.abspath(synth_src_dir)+'/'

    print('generating synth directory for top module:{}, src file directory:{}'.format(top_module_name, src_dir))
    Path(synth_src_dir).mkdir(parents=True, exist_ok=True)

    #make dir
    #link soure files
    sv_files = glob.glob(src_dir+'*.sv')
    print("creating sort files sym links for: {}".format(sv_files))

    res = subprocess.run('ln -s {}*.sv {}'.format(src_dir, synth_src_dir), shell=True, stdout=PIPE, stderr=PIPE)
    # os.symlink(src_dir+'*.sv', synth_src_dir)
    #make tcl files

    run_tcl = synth_dir+'run.tcl'
    clk_tcl = synth_dir+'clk.tcl'
    if clk == False:
        #combinational module
        print('Creating combinational run.tcl')
        sample_tcl = open(synth_no_clk_tcl)
        tcl_content = sample_tcl.read()
        sample_tcl.close()

        tcl_content = tcl_content.replace('TOP_MODULE_NAME', top_module_name)

        output_tcl = open(run_tcl, 'w')
        output_tcl.write(tcl_content)
        output_tcl.close()

    else:
        print('Creating Sequential run.tcl')
        sample_tcl = open(synth_clk_tcl)
        tcl_content = sample_tcl.read()
        sample_tcl.close()

        tcl_content = tcl_content.replace('TOP_MODULE_NAME', top_module_name)

        output_tcl = open(run_tcl, 'w')
        output_tcl.write(tcl_content)
        output_tcl.close()

        print('Creating clk.tcl')
        sample_tcl = open(clk_setup_tcl)
        tcl_content = sample_tcl.read()
        sample_tcl.close()

        tcl_content = tcl_content.replace('TOP_MODULE_NAME', top_module_name)

        output_tcl = open(clk_tcl, 'w')
        output_tcl.write(tcl_content)
        output_tcl.close()

    print('Creating make file')
    makefile = open('{}Makefile'.format(synth_dir), 'w')
    makefile.write('all:\n\tdc_shell -f run.tcl')
    makefile.close()
    print("Don't forget to source 18743_setup.bash")
    print("Please run:\ncd {}; make".format(synth_dir))

    
# gen_synth('top_wrapper', './src/rtl/snl', True)

if __name__ == "__main__":
    if len(sys.argv) != 5 or (sys.argv[4] not in ['comb','seq']) or (sys.argv[1] not in ['SIM','SYNTH']):
        print('Invalid args')
        print('Usage: python3 gen.py [SYNTH|SIM] [top_module_name] [dir name within src/rtl] [comb|seq]')
        exit(0)
    include_clk = sys.argv[3] == 'seq'
    
    if sys.argv[1] == 'SYNTH':
        gen_synth(sys.argv[2], './src/rtl/'+sys.argv[3], include_clk)
    else:
        gen_sim(sys.argv[2], './src/rtl/'+sys.argv[3])