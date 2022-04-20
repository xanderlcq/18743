#### Template Script for RTL->Gate-Level Flow (generated from GENUS 18.14-s037_1) 

if {[file exists /proc/cpuinfo]} {
  sh grep "model name" /proc/cpuinfo
  sh grep "cpu MHz"    /proc/cpuinfo
}

puts "Hostname : [info hostname]"
set_db / .hdl_error_on_blackbox true
set_db / .hdl_error_on_latch true
set_db / .fail_on_error_mesg true
##############################################################################
## Preset global variables and attributes
##############################################################################

set DESIGN max
set GEN_EFF high
set MAP_OPT_EFF high
set DATE [clock format [clock seconds] -format "%b%d-%T"] 
set _OUTPUTS_PATH ./out
set _REPORTS_PATH ./rep
set _LOG_PATH ./log
# set vcd_file ../../sim/WORK/column.vcd

set_db / .init_lib_search_path {/afs/andrew.cmu.edu/course/18/743/asap7/}
set_db / .script_search_path {./}  
set_db / .init_hdl_search_path {./src} 

set_db / .information_level 7 

set_db auto_ungroup none

#set_db libscore_enable true 

###############################################################
## Library setup
###############################################################

read_libs " \
    asap7sc7p5t_AO_RVT_TT_ccs_201020.lib \
    asap7sc7p5t_INVBUF_RVT_TT_ccs_201020.lib \
    asap7sc7p5t_OA_RVT_TT_ccs_201020.lib\
    asap7sc7p5t_SEQ_RVT_TT_ccs_201020.lib \
    asap7sc7p5t_SIMPLE_RVT_TT_ccs_201020.lib \
"
read_physical -lef " \
  asap7_tech_4x_201209.lef \
  asap7sc7p5t_27_R_4x_201211.lef \
"
read_qrc qrcTechFile_typ03_scaled4xV06
set_db / .hdl_generate_index_style %s_%d_
set_db / .lp_insert_clock_gating false
set_db / .hdl_flatten_complex_port false
#set_db / .hdl_track_filename_row_col true 
#set_db lp_power_unit uW 

####################################################################
## Load Design
####################################################################

set all_files [glob ./src/*.sv]
# foreach file $all_files {
#  set module_source "$file"
#  set both "{$module_source}"
#  read_file -f sverilog $both
#  analyze -format sverilog $both 
# }
# read_hdl -define P=${P} -define Q=${Q} -define THRESHOLD=${THRESHOLD} -language sv "bitonic.sv"
read_hdl -define RISING -language sv ${all_files}

elaborate $DESIGN
puts "Runtime & Memory after 'read_hdl'"
time_info Elaboration

check_design -unresolved

####################################################################
## Constraints Setup
####################################################################

# read_sdc chip_${ACLKP}.sdc
#puts "The number of exceptions is [llength [vfind "$DESIGN" -exception *]]"

if {![file exists ${_LOG_PATH}]} {
  file mkdir ${_LOG_PATH}
  puts "Creating directory ${_LOG_PATH}"
}

if {![file exists ${_OUTPUTS_PATH}]} {
  file mkdir ${_OUTPUTS_PATH}
  puts "Creating directory ${_OUTPUTS_PATH}"
}

if {![file exists ${_REPORTS_PATH}]} {
  file mkdir ${_REPORTS_PATH}
  puts "Creating directory ${_REPORTS_PATH}"
}
check_timing_intent

###################################################################################
## Define cost groups (clock-clock, clock-output, input-clock, input-output)
###################################################################################

# if {[llength [all_registers]] > 0} { 
#   define_cost_group -name I2C -design $DESIGN
#   define_cost_group -name C2O -design $DESIGN
#   define_cost_group -name C2C -design $DESIGN
#   path_group -from [all_registers] -to [all_registers] -group C2C -name C2C
#   path_group -from [all_registers] -to [all_outputs] -group C2O -name C2O
#   path_group -from [all_inputs]  -to [all_registers] -group I2C -name I2C
# }

# define_cost_group -name I2O -design $DESIGN
# path_group -from [all_inputs]  -to [all_outputs] -group I2O -name I2O
# foreach cg [vfind / -cost_group *] {
#   report_timing -group [list $cg] >> $_REPORTS_PATH/${DESIGN}_pretim.rpt
# }

#set_pin_activity -activity_type system -duty 0.5 -freq 100000 -global
#set_db lp_power_analysis_effort high

####################################################################
## Annotate Switching
####################################################################
# read_vcd $vcd_file -vcd_scope column_tb/DUT

####################################################################
## Power Constraints Setup
####################################################################
#set_attr .lp_power_optimization_weight 0.1
#set_max_dynamic_power 0.000005
# set_db lp_power_analysis_effort medium


####################################################################################################
## Synthesizing to generic 
####################################################################################################

set_db / .syn_generic_effort $GEN_EFF
syn_generic

# build_rtl_power_models -clean_up_netlist
puts "Runtime & Memory after 'syn_generic'"
time_info GENERIC
# report_dp > $_REPORTS_PATH/generic/${DESIGN}_datapath.rpt
# write_snapshot -outdir $_REPORTS_PATH -tag generic
# report_summary -directory $_REPORTS_PATH


# ####################################################################################################
# ## Synthesizing to gates
# ####################################################################################################

 set_db / .syn_map_effort $MAP_OPT_EFF
 syn_map
 puts "Runtime & Memory after 'syn_map'"
 time_info MAPPED
 # write_snapshot -outdir $_REPORTS_PATH -tag map
 # report_summary -directory $_REPORTS_PATH
 # report_dp > $_REPORTS_PATH/map/${DESIGN}_datapath.rpt

 # foreach cg [vfind / -cost_group *] {
 #   report_timing -group [list $cg] > $_REPORTS_PATH/${DESIGN}_[vbasename $cg]_post_map.rpt
 # }


#######################################################################################################
## Optimize Netlist
#######################################################################################################
 
set_db / .syn_opt_effort $MAP_OPT_EFF
syn_opt
# set_db [get_db lib_cells] .cell_delay_multiplier 1.0
# write_snapshot -outdir $_REPORTS_PATH -tag syn_opt
# report_summary -directory $_REPORTS_PATH

puts "Runtime & Memory after 'syn_opt'"
time_info OPT

# foreach cg [vfind / -cost_group *] {
#   report_timing  -group [list $cg] > $_REPORTS_PATH/${DESIGN}_[vbasename $cg]_post_opt.rpt
# }

######################################################################################################
## write backend file set (verilog, SDC, config, etc.)
######################################################################################################

report_timing -unconstrained > $_REPORTS_PATH/${DESIGN}_timing.rpt
# report_area > $_REPORTS_PATH/${DESIGN}_area.rpt
report_messages > $_REPORTS_PATH/${DESIGN}_messages.rpt

write_snapshot -outdir $_REPORTS_PATH -tag final
report_summary -directory $_REPORTS_PATH
write_hdl  > ${_OUTPUTS_PATH}/${DESIGN}_m.v
write_script > ${_OUTPUTS_PATH}/${DESIGN}_m.script
write_sdc > ${_OUTPUTS_PATH}/${DESIGN}_m.sdc


write_sdf -timescale ns -precision 3 > ${_OUTPUTS_PATH}/${DESIGN}_m.sdf

# read_vcd $vcd_file -vcd_scope column_tb/DUT
report_power > $_REPORTS_PATH/${DESIGN}_power.rpt
#################################
### write_do_lec
#################################

puts "Final Runtime & Memory."
time_info FINAL
puts "============================"
puts "Synthesis Finished ........."
puts "============================"

exit

