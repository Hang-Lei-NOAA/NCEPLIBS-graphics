#!/bin/bash

 : ${THISDIR:=$(dirname $(readlink -f -n ${BASH_SOURCE[0]}))}
 CDIR=$PWD; cd $THISDIR

 source ./Conf/Analyse_args.sh
 source ./Conf/Collect_info.sh
 source ./Conf/Gen_cfunction.sh
 source ./Conf/Reset_version.sh

 if [[ ${sys} == "intel_general" ]]; then
   sys6=${sys:6}
   source ./Conf/Landsfcutil_${sys:0:5}_${sys6^}.sh
 elif [[ ${sys} == "gnu_general" ]]; then
   sys4=${sys:4}
   source ./Conf/Landsfcutil_${sys:0:3}_${sys4^}.sh
 else
   source ./Conf/Landsfcutil_intel_${sys^}.sh
 fi
 $CC --version &> /dev/null || {
   echo "??? LANDSFCUTIL: compilers not set." >&2
   exit 1
 }
 [[ -z $LANDSFCUTIL_VER || -z $LANDSFCUTIL_LIB4 ]] && {
   echo "??? LANDSFCUTIL: module/environment not set." >&2
   exit 1
 }

set -x
 landsfcutilLib4=$(basename ${LANDSFCUTIL_LIB4})
 landsfcutilLibd=$(basename ${LANDSFCUTIL_LIBd})
 landsfcutilInc4=$(basename ${LANDSFCUTIL_INC4})
 landsfcutilIncd=$(basename ${LANDSFCUTIL_INCd})

#################
 cd src
#################

 $skip || {
#-------------------------------------------------------------------
# Start building libraries
#
 echo
 echo "   ... build (i4/r4) landsfcutil library ..."
 echo
   make clean LIB=$landsfcutilLib4 MOD=$landsfcutilInc4
   mkdir -p $landsfcutilInc4
   FFLAGS4="$I4R4 $FFLAGS ${MODPATH}$landsfcutilInc4"
   collect_info landsfcutil 4 OneLine4 LibInfo4
   landsfcutilInfo4=landsfcutil_info_and_log4.txt
   $debg && make debug FFLAGS="$FFLAGS4" LIB=$landsfcutilLib4 \
                                         &> $landsfcutilInfo4 \
         || make build FFLAGS="$FFLAGS4" LIB=$landsfcutilLib4 \
                                         &> $landsfcutilInfo4
   make message MSGSRC="$(gen_cfunction $landsfcutilInfo4 OneLine4 LibInfo4)" \
                LIB=$landsfcutilLib4

 echo
 echo "   ... build (i4/r8) landsfcutil library ..."
 echo
   make clean LIB=$landsfcutilLibd MOD=$landsfcutilIncd
   mkdir -p $landsfcutilIncd
   FFLAGSd="$I4R8 $FFLAGS ${MODPATH}$landsfcutilIncd"
   collect_info landsfcutil d OneLined LibInfod
   landsfcutilInfod=landsfcutil_info_and_logd.txt
   $debg && make debug FFLAGS="$FFLAGSd" LIB=$landsfcutilLibd \
                                         &> $landsfcutilInfod \
         || make build FFLAGS="$FFLAGSd" LIB=$landsfcutilLibd \
                                         &> $landsfcutilInfod
   make message MSGSRC="$(gen_cfunction $landsfcutilInfod OneLined LibInfod)" \
                LIB=$landsfcutilLibd
 }

 $inst && {
#
#     Install libraries and source files 
#
   $local && {
     instloc=..
     LIB_DIR4=$instloc
     LIB_DIRd=$instloc
     INCP_DIR=$instloc/include
     [ -d $INCP_DIR ] || { mkdir -p $INCP_DIR; }
     INCP_DIR4=$INCP_DIR
     INCP_DIRd=$INCP_DIR
     SRC_DIR=
   } || {
     [[ $instloc == --- ]] && {
       LIB_DIR4=$(dirname $LANDSFCUTIL_LIB4)
       LIB_DIRd=$(dirname $LANDSFCUTIL_LIBd)
       INCP_DIR4=$(dirname $LANDSFCUTIL_INC4)
       INCP_DIRd=$(dirname $LANDSFCUTIL_INCd)
       SRC_DIR=$LANDSFCUTIL_SRC
     } || {
       LIB_DIR4=$instloc
       LIB_DIRd=$instloc
       INCP_DIR=$instloc/include
       INCP_DIR4=$INCP_DIR
       INCP_DIRd=$INCP_DIR
       SRC_DIR=$instloc/src
       [[ $instloc == .. ]] && SRC_DIR=
     }
     [ -d $LIB_DIR4 ] || mkdir -p $LIB_DIR4
     [ -d $LIB_DIRd ] || mkdir -p $LIB_DIRd
     [ -d $LANDSFCUTIL_INC4 ] && { rm -rf $LANDSFCUTIL_INC4; } \
                              || { mkdir -p $INCP_DIR4; }
     [ -d $LANDSFCUTIL_INCd ] && { rm -rf $LANDSFCUTIL_INCd; } \
                              || { mkdir -p $INCP_DIRd; }
     [ -z $SRC_DIR ] || { [ -d $SRC_DIR ] || mkdir -p $SRC_DIR; }
   }

   make clean LIB=
   make install LIB=$landsfcutilLib4 MOD=$landsfcutilInc4 \
                LIB_DIR=$LIB_DIR4 INC_DIR=$INCP_DIR4 SRC_DIR=
   make install LIB=$landsfcutilLibd MOD=$landsfcutilIncd \
                LIB_DIR=$LIB_DIRd INC_DIR=$INCP_DIRd SRC_DIR=$SRC_DIR
 }

