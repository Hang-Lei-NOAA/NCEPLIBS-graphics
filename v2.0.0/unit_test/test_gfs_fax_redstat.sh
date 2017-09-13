#!/bin/sh
#            Test Utility REDSTAT
#     Read avn prepbufr file, extract low level sat.
#     winds and write latitude, longitude, wind, and
#     pressure level to formatted output file for
#     downstream use.
#

set +x

set +x
echo " "
echo "###################################################"
echo " Execute the REDSTAT "
echo "###################################################"
echo " "

module load PrgEnv-intel/5.2.56
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

#  2.Test Program REDSTAT
#     Read avn prepbufr file, extract low level sat.
#     winds and write latitude, longitude, wind, and
#     pressure level to formatted output file for
#     downstream use.
#

export   FORT01=0
unset FORT01 FORT11 FORT12 FORT13 FORT14 FORT15 FORT16 FORT17 FORT52
export   FORT11=gfs.t00z.prepbufr
export   FORT78=satwinds
$REDSTAT

cp satwinds $output
set +x
if [ $? -eq 0 ]; then echo ""; echo " Execute REDSTAT :  PASS ! "; echo ""; else echo " Execute REDSTAT :  FAIL !" ;echo ""; err=1; fi
sleep 2

cp satwinds $output
echo "Output file from READSTAT : "
echo " "
ls -l $output/*
echo " "
