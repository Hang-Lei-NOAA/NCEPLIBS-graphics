# *** manually set environments (for gnu compiler) of sfcio ***

 : ${USERMODE:=false}  # user mode (USERMODE) is closed by default
                       # set env var USERMODE to "true" to active it
 ${USERMODE} && {
    echo "Environment set by user"
# On theia/cray, user can load environment
#   module load gcc/6.2.0
# Or set environment on specific platform
    gcc_version=6.2.0
    gcc_topdir=/apps/gcc/$gcc_version
    export PATH=$gcc_topdir/bin:$PATH
    export LIBRARY_PATH=$gcc_topdir/lib64:$LIBRARY_PATH
    export LD_LIBRARY_PATH=$gcc_topdir/lib64:$LD_LIBRARY_PATH
    export INCLUDE=$gcc_topdir/include:$INCLUDE
    export MANPATH=$gcc_topdir/share/man:$MANPATH
 }

 ANCHORDIR=..
 export COMP=gnu
 export SFCIO_VER=v1.1.0
 export SFCIO_SRC=
 export SFCIO_INC4=$ANCHORDIR/include/sfcio_${SFCIO_VER}_4
 export SFCIO_LIB4=$ANCHORDIR/libsfcio_${SFCIO_VER}_4.a

 export CC=gcc
 export FC=gfortran
 export CPP=cpp
 export OMPCC="$CC -fopenmp"
 export OMPFC="$FC -fopenmp"
 export MPICC=mpigcc
 export MPIFC=mpif90

 export DEBUG="-g -fbacktrace -O0"
 export CFLAGS="-g -O3 -fPIC"
 export FFLAGS="-g -fbacktrace -O3 -fconvert=big-endian -fimplicit-none -fno-second-underscore -frecord-marker=4 -funroll-loops -Wall -fPIC"
 export FREEFORM="-ffree-form"
 export FPPCPP="-cpp"
 export CPPFLAGS="-P -traditional-cpp"
 export MPICFLAGS="-g -O3 -fPIC"
 export MPIFFLAGS="-g -fbacktrace -O3 -fconvert=big-endian -fimplicit-none -fno-second-underscore -frecord-marker=4 -funroll-loops -Wall -fPIC"
 export MODPATH="-J"
 export I4R4=""
 export I4R8="-fdefault-real-8"
 export I8R8="-fdefault-integer-8 -fdefault-real-8"

 export CPPDEFS=""
 export CFLAGSDEFS="-DUNDERSCORE -DLINUX"
 export FFLAGSDEFS=""

 export USECC=""
 export USEFC="YES"
 export DEPS=""
