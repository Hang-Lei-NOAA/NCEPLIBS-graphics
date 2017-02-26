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

module unload intel/15.0.3.187
module load intel/16.3.210
module load gempak/6.32.0
module load  ncarg-intel-sandybridge/6.1.0

module use /usrx/local/nceplibs/util_shared.v1.0.5/modulefiles
module load util_shared/1.0.5

export PDY=20170224
export cyc=00
export cycle=t${cyc}z
export dir=` pwd `
export output=$dir/output

#
#  Setup working directories
#
# If you want to use temporary directories,
# you can change variable dir to temporary
#
export data=$dir/data
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

cp /usrx/local/nceplibs/fax_data/*  $data

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
