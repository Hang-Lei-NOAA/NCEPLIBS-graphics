#!/bin/sh
#            Test Utility TRPSFCMV
#    Plots the following in the tropical strip: analyzed wind
#    barbs and temperatures at several hundred locations, contours of
#    1000 mb analyzed streamfunction, gridded winds, station plots
#    and tropical cyclone positions.
#

set +x

echo " "
echo "###################################################"
echo " Execute the TRPSFCMV "
echo "###################################################"
echo " "

module load PrgEnv-intel/5.2.56
module unload intel/15.0.3.187
module load intel/16.3.210
module load gempak/6.32.0
module load  ncarg-intel-sandybridge/6.1.0
export PATH="$PATH":$NCARG_BIN

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

#  6.Test Program TRPSFCMV
#    Plots the following in the tropical strip: analyzed wind
#    barbs and temperatures at several hundred locations, contours of
#    1000 mb analyzed streamfunction, gridded winds, station plots
#    and tropical cyclone positions.

unset FORT01 FORT11 FORT78

export   FORT01=0
export   FORT11=gfs.t00z.pgrbanl
export   FORT12=gfs.t00z.pgrbianl
export   FORT38=satwinds
export   FORT31=tcvitals
export   FORT43=NHPLOT
export   FORT44=afosplot
export   FORT74=HBULL
export   FORT87=afosplot
export   FORT88=f88
export   FORT89=f89
export filesize=`cat NHPLOT | wc -c`
echo $filesize > fsize_in
${TRPSFCMV} <fsize_in >> pgmout 2> errfile
set +x
if [ $? -eq 0 ]; then echo ""; echo " Execute TRPSFCMV :  PASS ! "; echo ""; else echo " Execute TRPSFCMV :  FAIL !" ;echo ""; err=1; fi
sleep 2

cp  f11 f88 f89 afosplot HBULL $output
echo " Output files from TRPSFCMV: "
echo " "
ls -l $output
echo " "
