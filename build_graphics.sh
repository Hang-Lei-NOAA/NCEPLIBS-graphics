#!/bin/sh

 : ${THISDIR:=$(dirname $(readlink -f -n ${BASH_SOURCE[0]}))}
 CDIR=$PWD; cd $THISDIR

 source ./Conf/Analyse_args.sh
 source ./Conf/Collect_info.sh
 source ./Conf/Gen_cfunction.sh
 source ./Conf/Reset_version.sh

 if [[ ${sys} == "intel_general" ]]; then
   sys6=${sys:6}
   source ./Conf/Graphics_${sys:0:5}_${sys6^}.sh
 elif [[ ${sys} == "gnu_general" ]]; then
   sys4=${sys:4}
   source ./Conf/Graphics_${sys:0:3}_${sys4^}.sh
 else
   source ./Conf/Graphics_intel_${sys^}.sh
 fi
 $CC --version &> /dev/null || {
   echo "??? GRAPHICS: compilers not set." >&2
   exit 1
 }
 [[ -z $GRAPHICS_VER || -z $GPH_LIB8 ]] && {
   echo "??? GRAPHICS: module/environment not set." >&2
   exit 1
 }

set -x
 gphLib8=$(basename ${GPH_LIB8})
 gphfontLib8=$(basename ${GPHFONT_LIB8})
 gphcntrLib8=$(basename ${GPHCNTR_LIB8})
 w3gLib8=$(basename ${W3G_LIB8})
 utilLib=$(basename ${UTIL_LIB})
 decod_utLib=$(basename ${DECOD_UT_LIB})

#################
 cd src
#################

 $skip || {
#-------------------------------------------------------------------
# Start building libraries
#
 echo
 echo "   ... build gph library ..."
 echo
   cd gph
   make clean LIB=$gphLib8
   FFLAGS8="$I8R8 $FFLAGS"
   USECC="YES"
   collect_info gph 8 OneLine8 LibInfo8
   gphInfo8=gph_info_and_log8.txt
   $debg && make debug FFLAGS="$FFLAGS8" LIB=$gphLib8 &> $gphInfo8 \
         || make build FFLAGS="$FFLAGS8" LIB=$gphLib8 &> $gphInfo8
   make message MSGSRC="$(gen_cfunction $gphInfo8 OneLine8 LibInfo8)" \
                LIB=$gphLib8
   cd ..

 echo
 echo "   ... build gphfont library ..."
 echo
   cd gphfont
   make clean LIB=$gphfontLib8
   FFLAGS8="$I8R8 $FFLAGS"
   USECC=""
   collect_info gphfont 8 OneLine8 LibInfo8
   gphfontInfo8=gphfont_info_and_log8.txt
   $debg && make debug FFLAGS="$FFLAGS8" LIB=$gphfontLib8 &> $gphfontInfo8 \
         || make build FFLAGS="$FFLAGS8" LIB=$gphfontLib8 &> $gphfontInfo8
   make message MSGSRC="$(gen_cfunction $gphfontInfo8 OneLine8 LibInfo8)" \
                LIB=$gphfontLib8
   cd ..

 echo
 echo "   ... build gphcntr library ..."
 echo
   cd gphcntr
   make clean LIB=$gphcntrLib8
   FFLAGS8="$I8R8 $FFLAGS"
   USECC=""
   collect_info gphcntr 8 OneLine8 LibInfo8
   gphcntrInfo8=gphcntr_info_and_log8.txt
   $debg && make debug FFLAGS="$FFLAGS8" LIB=$gphcntrLib8 &> $gphcntrInfo8 \
         || make build FFLAGS="$FFLAGS8" LIB=$gphcntrLib8 &> $gphcntrInfo8
   make message MSGSRC="$(gen_cfunction $gphcntrInfo8 OneLine8 LibInfo8)" \
                LIB=$gphcntrLib8
   cd ..

 echo
 echo "   ... build w3g library ..."
 echo
   cd w3g
   make clean LIB=$w3gLib8
   FFLAGS8="$I8R8 $FFLAGS"
   USECC="YES"
   collect_info w3g 8 OneLine8 LibInfo8
   w3gInfo8=w3g_info_and_log8.txt
   $debg && make debug FFLAGS="$FFLAGS8" LIB=$w3gLib8 &> $w3gInfo8 \
         || make build FFLAGS="$FFLAGS8" LIB=$w3gLib8 &> $w3gInfo8
   make message MSGSRC="$(gen_cfunction $w3gInfo8 OneLine8 LibInfo8)" \
                LIB=$w3gLib8
   cd ..

 echo
 echo "   ... build util library ..."
 echo
   cd util
   make clean LIB=$utilLib
   USECC="YES"
   collect_info util - OneLine LibInfo
   utilInfo=util_info_and_log.txt
   $debg && make debug LIB=$utilLib &> $utilInfo \
         || make build LIB=$utilLib &> $utilInfo
   make message MSGSRC="$(gen_cfunction $utilInfo OneLine LibInfo)" \
                LIB=$utilLib
   cd ..

 echo
 echo "   ... build decod_ut library ..."
 echo
   cd decod_ut
   make clean LIB=$decod_utLib
   DEPS=$DECOD_UTDEPS
   USECC="YES"
   collect_info decod_ut - OneLine LibInfo
   decod_utInfo=decod_ut_info_and_log.txt
   $debg && make debug FFLAGS="$DECOD_UTINC $FFLAGS" \
                       LIB=$decod_utLib &> $decod_utInfo \
         || make build FFLAGS="$DECOD_UTINC $FFLAGS" \
                       LIB=$decod_utLib &> $decod_utInfo
   make message MSGSRC="$(gen_cfunction $decod_utInfo OneLine LibInfo)" \
                LIB=$decod_utLib
   cd ..
 }

 $inst && {
#
#     Install libraries and source files 
#
   SRC_DIR=
   cd gph
   $local && instloc=../..
   [[ $instloc == --- ]] && instloc=$(dirname $GPH_LIB8)
   LIB_DIR8=$instloc
   [ -d $LIB_DIR8 ] || mkdir -p $LIB_DIR8
   make clean LIB=
   make install LIB=$gphLib8 LIB_DIR=$LIB_DIR8
   cd ..

   cd gphfont
   $local && instloc=../..
   [[ $instloc == --- ]] && instloc=$(dirname $GPHFONT_LIB8)
   LIB_DIR8=$instloc
   [ -d $LIB_DIR8 ] || mkdir -p $LIB_DIR8
   make clean LIB=
   make install LIB=$gphfontLib8 LIB_DIR=$LIB_DIR8
   cd ..

   cd gphcntr
   $local && instloc=../..
   [[ $instloc == --- ]] && instloc=$(dirname $GPHCNTR_LIB8)
   LIB_DIR8=$instloc
   [ -d $LIB_DIR8 ] || mkdir -p $LIB_DIR8
   make clean LIB=
   make install LIB=$gphcntrLib8 LIB_DIR=$LIB_DIR8
   cd ..

   cd w3g
   $local && instloc=../..
   [[ $instloc == --- ]] && instloc=$(dirname $W3G_LIB8)
   LIB_DIR8=$instloc
   [ -d $LIB_DIR8 ] || mkdir -p $LIB_DIR8
   make clean LIB=
   make install LIB=$w3gLib8 LIB_DIR=$LIB_DIR8
   cd ..

   cd util
   make clean LIB=
   $local && instloc=../..
   [[ $instloc == --- ]] && instloc=$(dirname $UTIL_LIB)
   LIB_DIR=$instloc
   [ -d $LIB_DIR ] || mkdir -p $LIB_DIR
   make install LIB=$utilLib LIB_DIR=$LIB_DIR
   cd ..

   cd decod_ut
   make clean LIB=
   $local && {
     instloc=../..
     LIB_DIR=$instloc
     SRC_DIR=
   } || {
     [[ $instloc == --- ]] && {
       LIB_DIR=$(dirname $DECOD_UT_LIB)
       SRC_DIR=$GRAPHICS_SRC
     } || {
       LIB_DIR=$instloc
       SRC_DIR=$instloc/src
       [[ $instloc == ../.. ]] && SRC_DIR=
     }
     [ -d $LIB_DIR ] || mkdir -p $LIB_DIR
     [ -z $SRC_DIR ] || { [ -d $SRC_DIR ] || mkdir -p $SRC_DIR; }
   }
   make install LIB=$decod_utLib LIB_DIR=$LIB_DIR SRC_DIR=$SRC_DIR
   cd ..
 }

