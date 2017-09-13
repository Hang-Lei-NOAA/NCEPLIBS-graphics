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
