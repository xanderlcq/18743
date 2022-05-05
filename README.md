Initial Commit
# Space Time Building Blocks

## Team
[Alexander Li](acli@andrew.cmu.edu), [Karthik Bhat](kbhat2@andrew.cmu.edu), and [Shridhar Ganiger](sganiger@andrew.cmu.edu)

## Summary
In this project, we explore, define, and implement various fundamental building blocks and macro blocks of Space-Time Algebra. We have implemented primitive functions for different signal types, k-Winner Takes-all, Run-time variable delay unit, memory unit, and multiple flavors of mux in temporal domain. All the designs are parameterized. The designs synthesized for a comparison on power, performance and area with varying parameters. 

## Modules Designed


* **Converters**
  * binary2unary
  * converter
* **Primitives**
  * equal
  * exclusive_max
  * exclusive_min
  * greater_than
  * greater_than_eq
  * less_than
  * less_than_eq
  * max
  * min
  * not_equal
* **Macro Blocks**
  * filter
  * kwta
  * mem
  * mux - 10 variants
  * variable delay 



## Directory
    .
    ├── SIM                           # Contains all the simulation files of all the modules
    |   └── [module]
    |        ├── Makefile             # Makefile for compiling and running the simulation
    |        └── vcs.args             # Arguments required to run the vcs tool
    ├── src/rtl                       # Contains all the RTL design of modules designed
    |   └── [module]
    |        └── tb/testbench.sv      # Module testbench file
    |        ├── module.sv            # The SystemVerilog design file
    |        └── vcs.args             # Arguments required to run the vcs tool. Includes the location to dependencies
    ├── SYNTH                         # Contains the Synthesis files and report generated
    |   └── [module]
    |        └── rep                  # Contains the synthesis report files
    |        ├── src                  # Contains all the source files required for synthesis
    |        ├── Makefile             # Makefile to run the genus tool
    |        └── run.tcl              # .tcl file for the synthesis
    ├── tcl                           # Holds temporary .tcl files required for synthesis file generation
    ├── 18743_setup.bash              # Setups the Synopys licence and VCS environment
    ├── cadence.bash                  # Setups the cadence licence and genus envrionment
    ├── gen.py                        # Script to generate the files required for simulation or synthesis
    ├── README.md
    └── run_synth.py                  # Script to automatically synthesis reports for modules

## Environment Setup

Before working, please make sure to run the following.
1. export NEURAL_HOME=<project_directory_location>
2. source $NEURAL_HOME/18743_setup.bash
3. source $NEURAL_HOME/cadence.bash

## Running Simulation

The Makefile under the SIM/module will run the vcs and compile all the verilog files required for the module's simulation. It provides option to change between the module's different signal design for compiling and runnning simulation
    
    make falling                # Falling-edge signals
    make rising                 # Rising-edge signals
    make pulse                  # Pulse-based signals

## Scripts

**gen.py**

A python script to generate files required for simulation or synthesis under SIM or SYNTH folders respectively. Details for using this script can be found with the help command.


**run_synth.py**

A python script is used to create the synthesis files and generating the synthesis reports automatically.
This script takes in certain arguments such as module names, directory and other parameters required for running the synthesis for various modules. More details can be viewed with the script's help command.
