### Aliases
alias dcusers='lmutil lmstat -f Design-Compiler'
alias vcsusers='lmutil lmstat -f VCSRuntime_Net'
alias genususers='lmutil lmstat -f Genus_Synthesis'
alias innovususers='lmutil lmstat -f Innovus_Impl_System'
alias xrunusers='lmutil lmstat -f Xcelium_Single_Core'



###################################### CADENCE #################################################
### Cadence License
CDS_LIC_FILE=5280@cadence-lic.ece.cmu.edu
export CDS_LIC_FILE
export LM_LICENSE_FILE=$LM_LICENSE_FILE:/afs/ece/support/cds/share/image/usr/cds/share/license/license.dat

#### Cadence Genus - synthesis
export GENUS_DIR=/afs/ece.cmu.edu/support/cds/share/image/usr/cds/genus-20.11/tools.lnx86

# Cadence Conformal - logic equivalence checker
export LEC_DIR=/afs/ece.cmu.edu/support/cds/share/image/usr/cds/confrml-18.10.300/tools.lnx86

# Cadence Xcelium - gate-level simulation
export SIM_DIR=/afs/ece.cmu.edu/support/cds/share/image/usr/cds/xcelium-19.03.010/tools.lnx86

# Cadence Innovus - place and route
export INNOV_DIR=/afs/ece.cmu.edu/support/cds/share/image/usr/cds/innovus-19.10.000/tools.lnx86

# Cadence Quantus - layout parasitic extraction
export QRC_DIR=/afs/ece.cmu.edu/support/cds/share/image/usr/cds/ext-17.10.000/tools.lnx86

# Cadence Voltus and Tempus - power and timing signoff
export VOLTUS_TEMPUS_DIR=/afs/ece.cmu.edu/support/cds/share/image/usr/cds/ssv-19.12.000/tools.lnx86

# Cadence Virtuoso - schematic and layout editor
export CDSHOME=/afs/ece/support/cds/share/image/usr/cds/ic-6.18.030

# Cadence Spectre - SPICE simulation
export MMSIM=/afs/ece.cmu.edu/support/cds/share/image/usr/cds/mmsim-10.11.279

export PATH=${GENUS_DIR}/bin:${LEC_DIR}/bin:${SIM_DIR}/bin:${INNOV_DIR}/bin:${QRC_DIR}/bin:${VOLTUS_TEMPUS_DIR}/bin:${CDSHOME}/tools/bin:${CDSHOME}/tools/dfII/bin:${MMSIM}/tools/bin:${MMSIM}/tools/dfII/bin:${PATH}

### Cadence JasperGold
export PATH="/afs/ece/support/cds/share/image/usr/cds/jasper-18.12.000/bin:$PATH"
################################################################################################


###################################### SYNOPSYS ################################################
### Synopsys License
SYNOPSYS=/afs/ece/support/synopsys
export LM_LICENSE_FILE="$LM_LICENSE_FILE:${SYNOPSYS}/license.dat"

#### Synopsys Library Compiler
export SYNOPSYS_SYN_ROOT="/afs/ece/support/synopsys/synopsys.release/P-Foundation/2019.03/syn"
export PATH="/afs/ece/support/synopsys/synopsys.release/L-Foundation/2016.06/lib_compiler_vL-2016.06/bin:$PATH"

#### VCS 2015
## DVE doesn't work in 2019 b/c not in gui folder
##export VCS_HOME="$SYNOPSYS/synopsys.release/P-Foundation/vcs/P-2019.06-SP2-1"
##export VCS_HOME="$SYNOPSYS/synopsys.release/L-Foundation/2016.06/vcs_vL-2016.06"
## As of 6/01/2020, this is the newest version that I could get working
export VCS_HOME=$SYNOPSYS/synopsys.release/vcs-mx_vK-2015.09
export PATH=$PATH:$VCS_HOME/bin
export VCS_ARCH_OVERRIDE=linux
export VCS_MODE_FLAG=64
# export VCS_TARGET_ARCH=amd64
export MANPATH=$MANPATH:$VCS_HOME/doc/man
export VCS_LIC_EXPIRE_WARNING=0


#### Rest of Synopsys 2019
export PATH="/afs/ece/support/synopsys/synopsys.release/P-Foundation/2019.03/syn/P-2019.03/bin:$PATH"
################################################################################################


####################################### MENTOR #################################################
### Mentor Tessent
export LM_LICENSE_FILE=/afs/ece.cmu.edu/support/mgc/license.dat:$LM_LICENSE_FILE
export MGLS_LICENSE_FILE=${LM_LICENSE_FILE}
# export TESSENT=/afs/ece.cmu.edu/support/mgc/mgc.release/tessent_2020_1
export TESSENT=/afs/ece.cmu.edu/support/mgc/mgc.release/tessent_2016_4
export PATH="${PATH}:${TESSENT}/bin"
export MANPATH="${MANPATH}:${TESSENT}/man"

# Mentor Calibre - layout versus schematic (LVS) and design rule checker (DRC)
export MGC_HOME=/afs/ece/support/mgc/mgc.release/cal_2018.2_33.24/aoi_cal_2018.2_33.24
################################################################################################
