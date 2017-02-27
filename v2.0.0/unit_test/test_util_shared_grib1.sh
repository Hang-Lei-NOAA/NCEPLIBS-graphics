#!/bin/sh
#            Test Utilities for GRIB1
#    The script tests the following utilities in GRIB1
#    1. Executable OVERGRIDID
#    2. Executable OVERMODEL.GRIB
#    3. Executable OVERDATE.GRIB

set +x

echo " "
echo "###################################################"
echo " Test Utilities for GRIB1"
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

set +x
echo " "
echo "###################################################"
echo " 1. Test OVERGRIDID "
echo "###################################################"
echo " "

# THIS SCRIPT READ A FORECAST FILE (UNIT 11), MODIFIES PDS OCTET(8)
# TO CORRECT THE GRIB GRID ID AND RE-WRITES THE FILE TO UNIT 51.
# STANDARD INPUT IS A 3-DIGIT INTEGER, FOR EXAMPLE 255 (User define grid)

ln -s gfs.t00z.pgrb.1p00.f012_grib1  fort.11
overgridid >> pgmout <<EOF 2>errfile
255
EOF
if [ $? -eq 0 ]; then echo ""; echo " Execute OVERGRIDID :  PASS ! "; echo ""; else echo " Execute OVERGRIDID :  FAIL !" ;echo ""; err=1; fi
sleep 2

mv fort.51 gfs.t00z.pgrb.1p00.f012_grib1_new
rm fort.11

cp gfs.t00z.pgrb.1p00.f012_grib1_new $output
echo " Output files from OVERGRIDID : "
echo " "
ls -l $output
echo " "

set +x
echo " "
echo "###################################################"
echo " 2. Test OVERMODEL.GRIB "
echo "###################################################"
echo " "

ln -s gec00.t00z.pgrbaf00  fort.11
overmodel.grib >> pgmout <<EOF 2>errfile
80
EOF
set +x
if [ $? -eq 0 ]; then echo ""; echo " Execute OVERMODEL.GRIB :  PASS ! "; echo ""; else echo " Execute OVERMODEL.GRIB :  FAIL !" ;echo ""; err=1; fi
sleep 2

mv  fort.51 $output/gec00.t00z.pgrbaf00.modified
rm fort.11
echo " Output files from OVERMODEL.GRIB : "
echo " "
ls -l $output
echo " "

set +x
echo " "
echo "###################################################"
echo " 3. Test OVERDATE.GRIB "
echo "###################################################"
echo " "

ln -s gfs.t00z.pgrb.1p00.f012_grib1  fort.11
overdate.grib >> pgmout <<EOF 2>errfile 
20170224
EOF
set +x
if [ $? -eq 0 ]; then echo ""; echo " Execute OVERDATE.GRIB :  PASS ! "; echo ""; else echo " Execute OVERDATE.GRIB :  FAIL !" ;echo ""; err=1; fi
sleep 2

mv fort.51 gfs.t00z.pgrb.1p00.f012_grib1_overdate_new
rm fort.11
cp gfs.t00z.pgrb.1p00.f012_grib1_overdate_new $output

echo " Output files from OVERMODEL.GRIB : "
echo " "
ls -l $output
echo " "

