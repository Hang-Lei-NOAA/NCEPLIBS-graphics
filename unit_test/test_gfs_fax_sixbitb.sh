#!/bin/sh
#            Test Utility SIXBITB2
#      Packs raw bit image into 6 bit bedient format
#

set +x
echo " "
echo "###################################################"
echo " Execute  SIXBITB "
echo "###################################################"
echo " "

module load EnvVars/1.0.2
module load ips/18.0.1.163
module load CFP/2.0.1
module load impi/18.0.1
module load lsf/10.1
module load prod_util/1.1.0
module load prod_envir/1.0.2
module load ips/18.0.1.163
module load bufr_dumplist/1.5.0
module load dumpjb/4.0.0
module load NCL/6.4.0
#
#   This is a test version of GRIB_UTIL.v1.1.0 on DELL
#
module load dev/grib_util/1.1.0
#
#   This is a test version of UTIL_SHARED.v1.0.8 on DELL
#
module load dev/util_shared/1.0.8
module list

export PDY=20180816
export cyc=00
export cycle=t${cyc}z

#
#  Setup working directories
#
# If you want to use temporary directories,
# you can change variable dir to temporary
#
export data=/gpfs/dell2/stmp/${LOGNAME}/data
export output=/gpfs/dell2/stmp/${LOGNAME}/output
mkdir -p $data $output

#
#  Clean up temp directory before test starts
#
if [ "$(ls -A $output)" ]; then
   echo "Cleaning $output"
   rm $output/*
fi
if [ "$(ls -A $data)" ]; then
   echo "Cleaning $data"
   rm $data/*
fi

cp /usrx/local/nceplibs/dev/lib/fax_data/*  $data

cd $data

#  3.Test Program SIXBITB2
#    Packs raw bit image into 6 bit bedient format
#

cat graph_wndanftf.header f59 > mapback.pur
cp mapback.pur image002.pur
cp mapback.pur image001.pur

jobn=gfs_fax_anl_00
FAXOUT=bkwndalf.${cyc}

export FORT11="mapback.pur"
export FORT12="mapback.pur"
export FORT15=graph_sixbitb.generic.f15
export FORT18=graph_sixbitb.wndanftf.$cycle
export FORT52=x6b
export FORT55=putlab.55
export FORT60=f60
export FORT61=f61
export FORT62=f62
export FORT63=f63
export FORT71=ras
export FORT72=rs2
# the 6 bit output is assigned here
export FORT81="bkwndalf.${cyc}"

$SIXBITB >> pgmout 2> errfile

cp bkwndalf.${cyc} $output
set +x
if [ $? -eq 0 ]; then echo ""; echo " Executable SIXBITB :  PASS ! "; echo ""; else echo " Executable SIXBITB :  FAIL !" ;echo ""; err=1; fi
sleep 2

cp bkwndalf.${cyc} $output
echo " "
echo " Output file from SIXBITB : "
ls -l $output/*
echo " "
