#!/bin/sh
#            Test Utility FXCOMPOZ
#      Packs raw bit image into 6 bit bedient format
#

set +x
echo " "
echo "###################################################"
echo " Execute the FXCOMPOZ "
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

#  5.Test Program FXCOMPOZ
#    TO EMULATE WHAT CLIFF FRIDLIND DOES TO COMPOSE ONE FAX-
#    TRANSMITTED CHART FROM UP-TO-FOUR COMPONENTS.

jobn=gfs_fax_anl_00
grep TRP850_g identifyfax.tbl | read Keyword sub00 sub06 sub12 sub18 gif name
submn=3836
export FAXOUT submn name Keyword gif toc prt jobn lprt
export INFILE=trpismer.00
export subnn=3836
export PDYHH=2017022400
export outname=00HR_850MB_HGT_WIND.gfs_fax_anl_00.gif
export KEYW=TRP850_g

grep TRP850_g convertfax.tbl | read keyword width height FMAT WMO ORIG HEADER ROTATE

 ras=ras.out
 INFILEcrd=crd.out
 parmsg=ssno=3836
 export FORT66=ras.out
 export FORT67=crd.out

$FXCOMPOZ trpismer.00 parm='ssno=3836' >> pgmout 2> errfile

set +x
if [ $? -eq 0 ]; then echo ""; echo " Execute FXCOMPOZ :  PASS ! "; echo ""; else echo " Execute FXCOMPOZ :  FAIL !" ;echo ""; err=1; fi
sleep 2

#  FAX processing
#
 echo P4 > header
 echo 1728 '   ' 3540 >> header

 echo $width '   '  $height >> header
 cat header $ras  >  image

 rotat='-rotate 270'

 echo rotat is $rotat

 convert -rotate 270 PBM:image gif:00HR_850MB_HGT_WIND.gfs_fax_anl_00.gif
set +x
if [ $? -eq 0 ]; then echo ""; echo " Generate FAX image :  PASS ! "; echo ""; else echo " Generate FAX image :  FAIL !" ;echo ""; err=1; fi
sleep 2

cp ras.out crd.out 00HR_850MB_HGT_WIND.gfs_fax_anl_00.gif $output

echo " Output files from FXCOMPOZ : "
ls -l $output
echo " "
