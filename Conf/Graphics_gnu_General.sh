# *** manually set environments (for gnu compiler) of graphics ***

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
 export GRAPHICS_VER=v2.0.0
 export GRAPHICS_SRC=
 export GPH_LIB8=$ANCHORDIR/libgph_${GRAPHICS_VER}_8.a
 export GPHFONT_LIB8=$ANCHORDIR/libgphfont_${GRAPHICS_VER}_8.a
 export GPHCNTR_LIB8=$ANCHORDIR/libgphcntr_${GRAPHICS_VER}_8.a
 export W3G_LIB8=$ANCHORDIR/libw3g_${GRAPHICS_VER}_8.a
 export UTIL_LIB=$ANCHORDIR/libutil_${GRAPHICS_VER}.a
 export DECOD_UT_LIB=$ANCHORDIR/libdecod_ut_${GRAPHICS_VER}.a

 DECODINC=./include
# on theia: module load gempak/7.4.2
 export GEMPAK=/apps/gempak/7.4.2/gempak
 export OS_ROOT=/apps/gempak/7.4.2/os/linux64
 export OS_INC=$OS_ROOT/include
 [[ $GEMPAK_VER == "" ]] && export GEMPAK_VER=v7.4.2
 [[ $GEMINC == "" ]] && export GEMINC=$GEMPAK/include

 export CC=gcc
 export FC=gfortran
 export CPP=cpp
 export OMPCC="$CC -fopenmp"
 export OMPFC="$FC -fopenmp"
 export MPICC=mpigcc
 export MPIFC=mpigfortran

 export DEBUG="-g -fbacktrace -O0"
 export CFLAGS="-g -O3 -std=c99 -fPIC"
 export FFLAGS="-g -fbacktrace -O3 -fconvert=big-endian -fno-range-check -fcray-pointer -fPIC"
 export FREEFORM="-ffree-form"
 export FPPCPP="-cpp"
 export CPPFLAGS="-P -traditional-cpp"
 export MPICFLAGS="-g -O3 -std=c99 -fPIC"
 export MPIFFLAGS="-g -fbacktrace -O3 -fconvert=big-endian -fno-range-check -fcray-pointer -fPIC"
 export MODPATH="-J"
 export I4R4=""
 export I4R8="-fdefault-real-8"
 export I8R8="-fdefault-integer-8 -fdefault-real-8"

 export CPPDEFS=""
 export CFLAGSDEFS="-DUNDERSCORE -DLINUX"
 export FFLAGSDEFS="-D_LITTLE_ENDIAN"
 export DECOD_UTINC="-I${DECODINC} -I${GEMINC} -I${OS_INC}"

 export USECC=""
 export USEFC="YES"
 export DEPS=""
 export DECOD_UTDEPS="GEMPAK $GEMPAK_VER"
