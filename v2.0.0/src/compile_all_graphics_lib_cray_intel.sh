#!/bin/sh
#################################################################################
#
# Build graphics library: gph, gphfont, gphcntr, util w3g and decod_ut libraries
#                         on CRAY intel_sandybridge and Haswell with Intel
#                       l FORTRAN compiler using module compile standard
#
#################################################################################
#################################################################################

target=$1
if [ $# -ne 1 ]; then
  set +x
  echo " "
  echo " "
  echo "  #############################################################"
  echo "  #                                                           #"
  echo "  #   Usage:                                                  #"
  echo "  #                                                           #"
  echo "  #         $0   intel  #"
  echo "  #      or                                                   #"
  echo "  #                                                           #"
  echo "  #         $0   cray   #"
  echo "  #                                                           #"
  echo "  #############################################################"
  echo " "
  echo " "
  exit
fi

#### Set library version ####
export version=v2.0.0

. $MODULESHOME/init/sh
module load craype-sandybridge
module load craype-haswell
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

set -x

module list

mkdir -p ../$1
dlist="gph gphfont gphcntr util w3g decod_ut"
for dir in $dlist; do
    echo "Building $dir library"
    case $dir
    in
       gph)
          cd $dir
          if [ -f ./libgph_${version}_8.a ] ; then
              rm -f ./libgph_${version}_8.a
          fi
          make
          cp ./libgph_${version}_8.a  ../../$1
          make clean
          ;;
       gphfont)
          cd ../$dir
          if [ -f ./libgphfont_${version}_8.a ] ; then
              rm -f ./libgphfont_${version}_8.a
          fi
          make
          cp ./libgphfont_${version}_8.a  ../../$1
          make clean
          ;;
       gphcntr)
          cd ../$dir
          if [ -f ./libgphcntr_${version}_8.a ] ; then
              rm -f ./libgphcntr_${version}_8.a
          fi
          make
          cp ./libgphcntr_${version}_8.a  ../../$1
          make clean
          ;;
       util)
          cd ../$dir
          if [ -f ./libutil_${version}.a ] ; then
              rm -f ./libutil_${version}.a
          fi
          make
          cp ./libutil_${version}.a  ../../$1
          make clean
          ;;
       w3g)
          cd ../$dir
          if [ -f ./libw3g_${version}_8.a ] ; then
              rm -f ./libw3g_${version}_8.a
          fi
          make
          cp ./libw3g_${version}_8.a  ../../$1
          make clean
          ;;
       decod_ut)
          cd ../$dir
          if [ -f ./libdecod_ut_${version}.a ] ; then
              rm -f ./libdecod_ut_${version}.a
          fi
          makedecod_ut.sh
          cp ./libdecod_ut_${version}.a  ../../$1
          ;;
       *)
          echo " No more library to build "
          break
       ;;
    esac
done
