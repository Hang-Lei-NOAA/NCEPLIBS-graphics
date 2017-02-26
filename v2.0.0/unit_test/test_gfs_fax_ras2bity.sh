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
