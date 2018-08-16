#!/bin/sh
#################################################################################
#
# Build graphics library: gph, gphfont, gphcntr, util w3g and decod_ut libraries
#                         on DELL or CRAY intel_sandybridge and Haswell with Intel
#                         FORTRAN compiler using module compile standard
#
#################################################################################
#################################################################################

target=$1
#### Set library version ####
export version=v2.0.0

if [ $# -ne 1 ]; then
  set +x
  echo " "
  echo " "
  echo "  #############################################################"
  echo "  #                                                           #"
  echo "  #   Usage:                                                  #"
  echo "  #                                                           #"
  echo "  #         $0   intel               #"
  echo "  #                                                           #"
  echo "  #      or                                                   #"
  echo "  #                                                           #"
  echo "  #         $0   cray                #"
  echo "  #                                                           #"
  echo "  #      or                                                   #"
  echo "  #                                                           #"
  echo "  #         $0   dell                #"
  echo "  #                                                           #"
  echo "  #############################################################"
  echo " "
  echo " "
  exit
fi

if [ $target = intel ]; then
    . $MODULESHOME/init/sh
    module load craype-sandybridge
    module load craype-haswell
    module load PrgEnv-intel/5.2.56
    module swap craype-haswell craype-sandybridge
    module unload intel/15.0.3.187
    module load intel/16.3.210
    module load gempak/7.3.1
elif [ $target = cray ]; then
    . $MODULESHOME/init/sh
    module load craype-sandybridge
    module load craype-haswell
    module swap craype-sandybridge craype-haswell
    module load PrgEnv-intel/5.2.56
    module unload intel/15.0.3.187
    module load intel/16.3.210
    module load gempak/7.3.1
elif [ $target = dell ]; then
    module load ips/18.0.1.163
    module load bufr/11.2.0
    module use -a /gpfs/dell1/nco/ops/nwpara/modulefiles/
    module load gempak/7.3.1
else
   echo "  "
   echo "  "
   echo "  $1   is invalid argument. Usage: "
   echo "  "
   echo "           $0   intel      "
   echo "  "
   echo "        or                 "
   echo "  "
   echo "           $0   cray       "
   echo "  "
   echo "        or                 "
   echo "  "
   echo "           $0   dell       "
   echo "  "
   echo "  "
   exit
fi

set -x

module list

set -x

if [ -f ./libdecod_ut_${version}.a ] ; then
  rm -f ./libdecod_ut_${version}.a
fi

makedecod_ut.sh

mkdir -p ../../$1

cp ./libdecod_ut_${version}.a ../../$1
