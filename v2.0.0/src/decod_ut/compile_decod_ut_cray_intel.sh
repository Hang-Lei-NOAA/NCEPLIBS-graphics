#!/bin/sh

#################################################################################
# 
# Build gph library: gph library on CRAY intel_sandybridge and Haswell with
#                    Intel FORTRAN compiler using module compile standard
#
#################################################################################
#################################################################################

target=$1
if [ $# -ne 1 ]; then
 set +x
 echo " "
 echo " "
 echo "  #########################################################"
 echo "  #                                                       #"
 echo "  #   Usage:                                              #"
 echo "  #                                                       #"
 echo "  #         $0   intel      #"
 echo "  #      or                                               #"
 echo "  #                                                       #"
 echo "  #         $0   cray       #"
 echo "  #                                                       #"
 echo "  #########################################################"
 echo " "
 echo " "
 exit
fi

#### Set library version ####
export version=v2.0.0

. $MODULESHOME/init/sh
# Loading ncep environment
module load ncep/1.0

# Loading Intel Compiler Suite
module load PrgEnv-intel/5.2.56
module unload intel/15.0.3.187
module load intel/16.3.210

if [ $target = intel ]; then
   module swap craype-haswell craype-sandybridge
elif [ $target = cray ]; then
   module swap craype-sandybridge craype-haswell
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
 exit
fi

module list

set -x

if [ -f ./libdecod_ut_${version}.a ] ; then
  rm -f ./libdecod_ut_${version}.a
fi

makedecod_ut.sh

mkdir -p ../../$1

cp ./libdecod_ut_${version}.a ../../$1