# *** manually set environments (for intel compiler) of landsfcutil ***

 : ${USERMODE:=false}  # user mode (USERMODE) is closed by default
                       # set env var USERMODE to "true" to active it
 ${USERMODE} && {
    echo "Environment set by user"
# On theia/cray, user can load environment
#   module load intel/18.0.1.163
# Or set environment on specific platform
    intel_version=2018.1.163
    intel_topdir=/apps/intel/compilers_and_libraries_$intel_version
    source $intel_topdir/linux/bin/compilervars.sh intel64
 }

 ANCHORDIR=..
 export COMP=ips
 export LANDSFCUTIL_VER=v2.1.0
 export LANDSFCUTIL_SRC=
 export LANDSFCUTIL_INC4=$ANCHORDIR/include/landsfcutil_${LANDSFCUTIL_VER}_4
 export LANDSFCUTIL_INCd=$ANCHORDIR/include/landsfcutil_${LANDSFCUTIL_VER}_d
 export LANDSFCUTIL_LIB4=$ANCHORDIR/liblandsfcutil_${LANDSFCUTIL_VER}_4.a
 export LANDSFCUTIL_LIBd=$ANCHORDIR/liblandsfcutil_${LANDSFCUTIL_VER}_d.a

 export CC=icc
 export FC=ifort
 export CPP=cpp
 export OMPCC="$CC -qopenmp"
 export OMPFC="$FC -qopenmp"
 export MPICC=mpiicc
 export MPIFC=mpiifort

 export DEBUG="-g -traceback -O0"
 export CFLAGS="-g -traceback -O3 -fPIC"
 export FFLAGS="-g -traceback -O3 -fp-model strict -ip -fPIC"
 export FPPCPP="-cpp"
 export FREEFORM="-free"
 export CPPFLAGS="-P -traditional-cpp"
 export MPICFLAGS="-g -traceback -O3 -fPIC"
 export MPIFFLAGS="-g -traceback -O3 -fPIC"
 export MODPATH="-module "
 export I4R4="-integer-size 32 -real-size 32"
 export I4R8="-integer-size 32 -real-size 64"
 export I8R8="-integer-size 64 -real-size 64"

 export CPPDEFS=""
 export CFLAGSDEFS="-DUNDERSCORE -DLINUX"
 export FFLAGSDEFS=""

 export USECC=""
 export USEFC="YES"
 export DEPS=""
