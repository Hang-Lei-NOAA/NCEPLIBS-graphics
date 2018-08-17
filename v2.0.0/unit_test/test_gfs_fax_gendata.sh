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
