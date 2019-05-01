# *** manually set environments (for gnu compiler) of graphics ***

# !!! module environment (*THEIA*) !!!
 module load gcc/6.2.0

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
 export MPICC=mpicc
 export MPIFC=mpif90

 export DEBUG="-g -O0"
 export CFLAGS="-O3 -g -DUNDERSCORE -fPIC"
 export FFLAGS="-D_LITTLE_ENDIAN -O3 -g -fconvert=big-endian -fPIC"
 export CPPFLAGS="-P -traditional-cpp"
 export MPICFLAGS="-O3 -DUNDERSCORE -DLINUX -fPIC"
 export MPIFFLAGS="-O3 -fPIC"
 export MODPATH="-J"
 export I4R4=""
 export I4R8="-fdefault-real-8"
 export I8R8="-fdefault-integer-8 -fdefault-real-8"

 export CPPDEFS=""
 export CFLAGSDEFS=""
 export FFLAGSDEFS="-fno-range-check"
 export DECOD_UTINC="-I${DECODINC} -I${GEMINC} -I${OS_INC}"

 export USECC=""
 export USEFC="YES"
 export DEPS=""
 export DECOD_UTDEPS="GEMPAK $GEMPAK_VER"
