# ####################################################################

#  Created by Genus(TM) Synthesis Solution 18.14-s037_1 on Tue Mar 29 15:08:02 EDT 2022

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1.0fF
set_units -time 1.0ps

# Set the current design
current_design snl_top_wrapper

set_clock_gating_check -setup 0.0 
