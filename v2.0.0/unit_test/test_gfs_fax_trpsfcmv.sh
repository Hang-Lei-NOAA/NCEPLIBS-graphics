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
