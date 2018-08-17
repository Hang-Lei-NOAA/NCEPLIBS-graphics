#!/bin/sh
#            Test Utility RAS2BIT
#    Read generic pixel image with generic unspecified header
#    and compress the pixels to bits.

set +x
echo " "
echo "###################################################"
echo " Execute  RAS2BITY "
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

# 4. Program RAS2BIT
#    Read generic pixel image with generic unspecified header
#    and compress the pixels to bits.

export FORT11=f8
export FORT59=f59

fssize=`cat f8 | wc -c `
echo $fssize  >fin
echo 1728 >>fin
echo 2440 >>fin

ras2bit <fin > pgmout 2> errfile

set +x
if [ $? -eq 0 ]; then echo ""; echo " Executable RAS2BIT :  PASS ! "; echo ""; else echo " Executable RAS2BIT :  FAIL !" ;echo ""; err=1; fi
sleep 2

cp f59 $output

echo " Output file from RAS2VBIT : "
echo " "
ls -l $output
echo " "
