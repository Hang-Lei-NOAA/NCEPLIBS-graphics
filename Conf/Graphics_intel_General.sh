# *** manually set environments (for intel compiler) of graphics ***

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
 export GRAPHICS_VER=v2.0.0
 export GRAPHICS_SRC=
 export GPH_LIB8=$ANCHORDIR/libgph_${GRAPHICS_VER}_8.a
 export GPHFONT_LIB8=$ANCHORDIR/libgphfont_${GRAPHICS_VER}_8.a
 export GPHCNTR_LIB8=$ANCHORDIR/libgphcntr_${GRAPHICS_VER}_8.a
 export W3G_LIB8=$ANCHORDIR/libw3g_${GRAPHICS_VER}_8.a
 export UTIL_LIB=$ANCHORDIR/libutil_${GRAPHICS_VER}.a
 export DECOD_UT_LIB=$ANCHORDIR/libdecod_ut_${GRAPHICS_VER}.a

 DECODINC=./include
# on *THEIA*: module load gempak/7.4.2
 export GEMPAK=/apps/gempak/7.4.2/gempak
 export OS_ROOT=/apps/gempak/7.4.2/os/linux64
 export OS_INC=$OS_ROOT/include
 [[ $GEMPAK_VER == "" ]] && export GEMPAK_VER=v7.4.2
 [[ $GEMINC == "" ]] && export GEMINC=$GEMPAK/include

 export CC=icc
 export FC=ifort
 export CPP=cpp
 export OMPCC="$CC -qopenmp"
 export OMPFC="$FC -qopenmp"
 export MPICC=mpiicc
 export MPIFC=mpiifort

 export DEBUG="-g -traceback -O0"
 export CFLAGS="-g -traceback -O3 -std=c99 -fPIC"
 export FFLAGS="-g -traceback -O3 -convert big_endian -assume byterecl -assume noold_ldout_format -C -fPIC"
 export FPPCPP="-cpp"
 export FREEFORM="-free"
 export CPPFLAGS="-P -traditional-cpp"
 export MPICFLAGS="-g -traceback -O3 -std=c99 -fPIC"
 export MPIFFLAGS="-g -traceback -O3 -fPIC"
 export MODPATH="-module "
 export I4R4="-integer-size 32 -real-size 32"
 export I4R8="-integer-size 32 -real-size 64"
 export I8R8="-integer-size 64 -real-size 64"

 export CPPDEFS=""
 export CFLAGSDEFS="-DUNDERSCORE -DLINUX"
 export FFLAGSDEFS="-D_LITTLE_ENDIAN"
 export DECOD_UTINC="-I${DECODINC} -I${GEMINC} -I${OS_INC}"

 export USECC=""
 export USEFC="YES"
 export DEPS=""
 export DECOD_UTDEPS="GEMPAK $GEMPAK_VER"
