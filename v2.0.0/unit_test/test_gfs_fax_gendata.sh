#!/bin/sh
#            Test Utility GENDATA
#   READS THE SURFACE SYNOPTIC, SURFACE SHIP,
#   MOORED BUOYS, DRIFTING BUOYS AND CMAN OBSERVATIONS
#   AND CREATES A FILTERED SURFACE AFOS PLOTFILE FOR
#   USE IN MAKING THE TROPICAL MERCATOR SURFACE
#   This script uses to test the utility gendata in util_shared.v1.0.5 on CRAY
#

set +x
echo " "
echo "###################################################"
echo " Execute the GENDATA for mercator tropical analysis"
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

#  1.Test Program GENDATA
#   READS THE SURFACE SYNOPTIC, SURFACE SHIP,
#   MOORED BUOYS, DRIFTING BUOYS AND CMAN OBSERVATIONS
#   AND CREATES A FILTERED SURFACE AFOS PLOTFILE FOR
#   USE IN MAKING THE TROPICAL MERCATOR SURFACE

export  FORT01=0
unset FORT01

export  FORT11=synop.$PDY$cyc
export  FORT12=metar.$PDY$cyc
export  FORT13=ships.$PDY$cyc
export  FORT14=lcman.$PDY$cyc
export  FORT15=mbuoy.$PDY$cyc
export  FORT16=dbuoy.$PDY$cyc
export  FORT17=graph_pillist1
export  FORT52=NHPLOT
$GENDATA >> pgmout <<EOF 2>errfile
$PDY
  50 -50  00 360 006 006
EOF

cp NHPLOT $output

set +x
if [ $? -eq 0 ]; then echo ""; echo " Execute GENDATA :  PASS ! "; echo ""; else echo " Execute GENDATA :  FAIL !" ;echo ""; err=1; fi
sleep 2

echo " Output file from GENDAT : "
echo " "
ls -l $output
echo " "
