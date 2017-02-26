#!/bin/sh
#            Test All Utilities in util_shared.v1.0.5 
#    This script use utilities in ut_shared v1.0.5 to generate
#    the GFS FAX chart image *.gif files.
#
#  1) Execute UPAPREP
#  2) Execute PLOTVPAP
#  3) Execute TRPANL
#  4) Execute FXCOMPOZ
#  5) Execute Fax Processing (generate image gifi files) 
#  6) Execute RSONDE
#  7) Execute WNDALFTF - This utility consists of 5 steps.
#  8) Execute RAS2BIT
#  9) Execute SIXBIT - generate 4 AFOS charts of winds aloft.
# 10) Execute SIXBIT2

set +x

module unload intel/15.0.3.187
module load intel/16.3.210
module load gempak/6.32.0
module load  ncarg-intel-sandybridge/6.1.0
module use /usrx/local/nceplibs/util_shared.v1.0.5/modulefiles
module load util_shared/1.0.5

set +x
echo " "
echo "############################################################"
echo " 1. TEST Execute the UPAPREP for mercator tropical analysis "
echo "############################################################"
echo " "

#  1.Test Program UPAPREP "
#    READS IN OBSERVATIONAL RADIOSONDE UPPER AIR
#    REPORTS AND REFORMATS THE MANDATORY LEVEL DATA INTO A SIMPLE
#    FLAT FILE FORMAT FOR INPUT INTO GRAPHICS CODES
#
export PDY=20170214
export cyc=00
export cycle=t${cyc}z
export dir=` pwd `
export DATA=` pwd `
export data=$dir/data
export gif=YESs

mkdir -p $data
cp /usrx/local/nceplibs/fax_data/*  $data
cd $data

echo ${PDY}${cyc} > upaprep.input

export FORT9=graph_upaprep.ft9.mrcontrl
export FORT10=gfs.$cycle.prepbufr
export FORT22=graph_upaprep.ft22.aircft
export FORT23=graph_upaprep.ft23.satwnd
export FORT24=graph_upaprep.ft24.tiros
export FORT55=$data/gfs.${PDY}${cyc}.upaprep
export FORT56=$data/gfs.${PDY}${cyc}.aircft
export FORT57=$data/gfs.${PDY}${cyc}.satwnd
export FORT58=$data/gfs.${PDY}${cyc}.satell
export FORT75=$data/LOGMSG

upaprep < upaprep.input > pgmout 2> errfile

set +x
if [ $? -eq 0 ]; then echo ""; echo " Execute UPAPREP :  PASS ! "; echo ""; else echo " Execute UPAPREP :  FAIL !" ;echo ""; err=1; fi
sleep 2

set +x
echo " "
echo "###################################################"
echo " 2. Test Execute PLOTVPAP "
echo "###################################################"
echo " "

#  2.Test Program PLOTVPAP
#    SELECTS UPPER AIR DATA FOR PLOTTING AND OUTPUTS IT TO
#    FT55 WHICH IS THEN PASSED TO A CODE USING BEDIENT'S CONTOURING
#    PACKAGE.

unset FORT01 FORT10 FORT22 FORT23 FORT24 FORT55 FORT56 FORT57 FORT58 FORT75 FORT9

export FORT15="graph_plotvpap.gfs.anl"
export FORT26="graph_plotvpap.plotmlty.ft26"
export FORT41="gfs.${PDY}${cyc}.upaprep"
export FORT42="gfs.${PDY}${cyc}.aircft"
export FORT43="gfs.${PDY}${cyc}.satwnd"
export FORT44="gfs.${PDY}${cyc}.satell"
export FORT55="$data/OLDlabel55"
export FORT60="$data/label60"
export FORT61="$data/label61"
export FORT62="$data/label62"
export FORT63="$data/label63"
export FORT75="$data/LOGMSG"

plotvpap >> $data/pgmout 2> errfile

set +x
if [ $? -eq 0 ]; then echo ""; echo " Execute PLOTVPAP :  PASS ! "; echo ""; else echo " Execute PLOTVPAP :  FAIL !" ;echo ""; err=1; fi
sleep 2

set +x
echo " "
echo "###################################################"
echo " 3. Test Execute TRPANL "
echo "###################################################"
echo " "

#  3.Test Program TRPANL
#    SELECTS UPPER AIR DATA FOR PLOTTING AND OUTPUTS IT TO
#    FT55 WHICH IS THEN PASSED TO A CODE USING BEDIENT'S CONTOURING
#    PACKAGE.

FAXOUT=trpismer.${cyc}
unset FORT01 FORT15 FORT26 FORT41 FORT42 FORT43 FORT44 FORT55 FORT60 FORT61 FORT62 FORT63 FORT75

export FORT8="graph_trpanl.ft8.gfs_${cycle}.anl"
export FORT12="gfs.$cycle.pgrbanl"
export FORT22="gfs.$cycle.pgrbianl"
export FORT48="graph_awpseed"
export FORT52="$data/x6b"
export FORT54="$data/OLDlabel55"
export FORT55="$data/f55"
export FORT60="$data/f60"
export FORT61="$data/f61"
export FORT62="$data/f62"
export FORT63="$data/f63"
export FORT71="$data/ras"
export FORT72="$data/rs2"
export FORT81="$data/trpismer.${cyc}"

trpanl < graph_trpanl.ft5.gfs_${cycle}.anl >> $data/pgmout 2> errfile
set +x
if [ $? -eq 0 ]; then echo ""; echo " Execute TRPANL :  PASS ! "; echo ""; else echo " Execute TRPANL :  FAIL !" ;echo ""; err=1; fi
sleep 2

set +x
echo " "
echo "###################################################"
echo " 4. Test Execute FXCOMPOZ "
echo "###################################################"
echo " "

#  4.Test Program FXCOMPOZ
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
# convert6bit.sh

grep TRP850_g convertfax.tbl | read keyword width height FMAT WMO ORIG HEADER ROTATE
ROTATE=270

ras=ras.out
INFILEcrd=crd.out
parmsg=ssno=3836
export FORT66=ras.out
export FORT67=crd.out

fxcompoz trpismer.00 parm='ssno=3836' > pgmout 2> errfile

set +x
if [ $? -eq 0 ]; then echo ""; echo " Execute FXCOMPOZ :  PASS ! "; echo ""; else echo " Execute FXCOMPOZ :  FAIL !" ;echo ""; err=1; fi
sleep 2

export PATH=$PATH:/usrx/local/prod/imagemagick/6.8.3/intel/sandybridge/bin:.
export LIBPATH="$LIBPATH":/usrx/local/prod/imagemagick/6.8.3/intel/sandybridge/lib
export DELEGATE_PATH=/usrx/local/prod/imagemagick/6.8.3/intel/sandybridge/share/ImageMagick-6

set +x
echo " "
echo "###################################################"
echo " 5. FAX chart processing  "
echo "###################################################"
echo " "

#  5. FAX processing
#
echo P4 > header
echo 1728 '   ' 3540 >> header
cat header $ras  >  image
convert -rotate 270 PBM:image gif:00HR_850MB_HGT_WIND.gfs_fax_anl_00.gif
set +x
if [ $? -eq 0 ]; then echo ""; echo " Generate FAX image :  PASS ! "; echo ""; else echo " Generate FAX image :  FAIL !" ;echo ""; err=1; fi
sleep 2

grep TRP850V identifyfax.tbl | read Keyword sub00 sub06 sub12 sub18 gif toc prt lprt name
submn=3837
export FAXOUT submn name Keyword gif toc prt jobn lprt
export INFILE=trpismer.00
export subnn=3837
export PDYHH=2017022400
export OUTPATH=ANAL_850MB_HGT_WIND.gfs_fax_anl_00.ntc
export outname=ANAL_850MB_HGT_WIND.gfs_fax_anl_00.fax
export KEYW=TRP850V
grep TRP850V convertfax.tbl | read keyword width height FMAT WMO ORIG HEADER ROTATE

ras=ras.out
INFILEcrd=crd.out
parmsg=ssno=2400
export FORT66=ras.out
export FORT67=crd.out

fxcompoz trpismer.00 parm='ssno=2400' > pgmout 2> errfile

set +x
if [ $? -eq 0 ]; then echo ""; echo " Execute FXCOMPOZ :  PASS ! "; echo ""; else echo " Execute FXCOMPOZ :  FAIL !" ;echo ""; err=1; fi
sleep 2

echo P4 > header
echo 1728 '   ' 3540  >> header
cat header $ras  >  image
convert -rotate 270 PBM:image gif:00HR_700MB_HGT_WIND.gfs_fax_anl_00.gif
set +x
if [ $? -eq 0 ]; then echo ""; echo " Generate FAX image :  PASS ! "; echo ""; else echo " Generate FAX image :  FAIL !" ;echo ""; err=1; fi
sleep 2

fxcompoz trpismer.00 parm='ssno=2403' > pgmout 2> errfile

echo P4 > header
echo 1728 '   ' 3500  >> header
cat header $ras  >  image

convert -rotate 270 PBM:image gif:00HR_500MB_HGT_WIND.gfs_fax_anl_00.gif
set +x
if [ $? -eq 0 ]; then echo ""; echo " Generate FAX image :  PASS ! "; echo ""; else echo " Generate FAX image :  FAIL !" ;echo ""; err=1; fi
sleep 2

fxcompoz trpismer.00 parm='ssno=2406' > pgmout 2> errfile

echo P4 > header
echo 1728 '   ' 3500  >> header
cat header $ras  >  image
convert -rotate 270 PBM:image gif:00HR_250MB_HGT_WIND.gfs_fax_anl_00.gif
set +x
if [ $? -eq 0 ]; then echo ""; echo " Generate FAX image :  PASS ! "; echo ""; else echo " Generate FAX image :  FAIL !" ;echo ""; err=1; fi
sleep 2

set +x
echo " "
echo "###################################################"
echo " 6. Test Execute RSONDE                            "
echo " PRODUCE UPPER AIR WIND PLOTS                      " 
echo "###################################################"
echo " "

#  6. Program RSONDE
#     Generate formatted radiosonde

export FORT11=gfs.${cycle}.prepbufr
export FORT51=f51Z
rsonde < graph_rsonde.ft05.Z > pgmout 2> errfile

export FORT11=gfs.${cycle}.prepbufr
export FORT51=f51P
rsonde < graph_rsonde.ft05.Z > pgmout 2> errfile

set +x
if [ $? -eq 0 ]; then echo ""; echo " Executable RSONDE :  PASS ! "; echo ""; else echo " Executable RSONDE :  FAIL !" ;echo ""; err=1; fi
sleep 2

###########################################################
# cat the oservation files together
###########################################################

cat f51Z f51P >formatted.soundings

###########################################################
# draw ncar graphics map
###########################################################

set +x
echo " "
echo "###################################################"
echo " 7. Execute WNDANFTF "
echo "###################################################"
echo " "

# 7. program WNDANFTF  (PRODUCE UPPER AIR WIND PLOTS)
#    This program plots wind barbs and temperatures at

unset FORT01 FORT11 FORT51
export FORT20=formatted.soundings

wndanftf > pgmout 2> errfile

set +x
if [ $? -eq 0 ]; then echo ""; echo " Executable WNDANFTF :  PASS ! "; echo ""; else echo " Executable WNDANFTF :  FAIL !" ;echo ""; err=1; fi
sleep 2

ictrans -d xwd  -fdn 2 -resolution 1728x2440  -e 'zoom 0.08 0.0 0.79  1.0' -e 'plot 1' gmeta >f8

set +x
echo " "
echo "###################################################"
echo " 8. Test  Execute  RAS2BIT "
echo "###################################################"
echo " "

# 8. program RAS2BIT
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

set +x
echo " "
echo "###################################################"
echo " 9. Test Execute SIXBITB "
echo "###################################################"
echo " "

# 9. Program SIXBITB
#    Packs raw bit image into 6 bit bedient format

cat graph_wndanftf.header f59 > mapback.pur
cp mapback.pur image002.pur
cp mapback.pur image001.pur

jobn=gfs_fax_anl_00
FAXOUT=bkwndalf.${cyc}

export FORT11="mapback.pur"
export FORT12="mapback.pur"
export FORT15=graph_sixbitb.generic.f15
export FORT18=graph_sixbitb.wndanftf.$cycle
export FORT52=x6b
export FORT55=putlab.55
export FORT60=f60
export FORT61=f61
export FORT62=f62
export FORT63=f63
export FORT71=ras
export FORT72=rs2
# the 6 bit output is assigned here
export FORT81="bkwndalf.${cyc}"

sixbitb > pgmout 2> errfile

set +x
if [ $? -eq 0 ]; then echo ""; echo " Executable SIXBITB :  PASS ! "; echo ""; else echo " Executable SIXBITB :  FAIL !" ;echo ""; err=1; fi
sleep 2

set +x
echo " "
echo "###################################################"
echo " 10. Test Execute SIXBIT2 "
echo "###################################################"
echo " "

# 10. program SIXBITB2
#    Reads station pixel coordinates and station wind,
#    temperture, dewpoint, cloud, weather, sky cover and barometer
#    data and plots standard plots on a generic bitmap background.

export FORT12="mapback.pur"
export FORT12="image002.pur"
export FORT13="fort.13"
export FORT15="graph_sixbitb.generic.f15"
export FORT18="graph_sixbitb.trpsfcmv.$cycle"
export FORT39="f89"
################
#scratch files
################
export FORT60="f60"
export FORT61="f61"
export FORT62="f62"
export FORT63="f63"
export FORT71="ras"
export FORT72="rs2"
export FORT52="x6b"
export FORT55="putlab.55"
################
#output file(s)
################
export FORT81="tropc${cycle}"."${cyc}"

sixbitb2 > pgmout 2> errfile

set +x
if [ $? -eq 0 ]; then echo ""; echo " Executable SIXBITB2 :  PASS ! "; echo ""; else echo " Executable SIXBITB2 :  FAIL !" ;echo ""; err=1; fi
sleep 2

grep WNDAFT_g identifyfax.tbl | read Keyword sub00 sub06 sub12 sub18 gif toc prt lprt name
if [ ${cyc} = '00' ]; then submn=$sub00; fi
if [ ${cyc} = '12' ]; then submn=$sub12; fi
submn=2929
echo bkwndalf.00 2929 WNDS_ALOFT_GR_14_24_34 WNDAFT_g YES NO NO gfs_fax_anl_00 x
export FAXOUT submn name Keyword gif toc prt jobn lprt
export INFILE=bkwndalf.00
export subnn=2929
export PDYHH=2017022400
export outname=WNDS_ALOFT_GR_14_24_34.gfs_fax_anl_00.gif
export KEYW=WNDAFT_g
grep WNDAFT_g convertfax.tbl | read keyword width height FMAT WMO ORIG HEADER ROTATE

ras=ras.out
INFILEcrd=crd.out
parmsg=ssno=2929
export FORT66=ras.out
export FORT67=crd.out
fxcompoz bkwndalf.00 parm='ssno=2929' > pgmout 2> errfile

set +x
if [ $? -eq 0 ]; then echo ""; echo " Execute FXCOMPOZ :  PASS ! "; echo ""; else echo " Execute FXCOMPOZ :  FAIL !" ;echo ""; err=1; fi
sleep 2

echo P4 > header
echo 1728 '   ' 1244  >> header
cat header $ras  >  image
rotat='-rotate 180'
convert -rotate 180 PBM:image gif:WNDS_ALOFT_GR_14_24_34.gfs_fax_anl_00.gif
set +x
if [ $? -eq 0 ]; then echo ""; echo " Generate FAX image :  PASS ! "; echo ""; else echo " Generate FAX image :  FAIL !" ;echo ""; err=1; fi
sleep 2
