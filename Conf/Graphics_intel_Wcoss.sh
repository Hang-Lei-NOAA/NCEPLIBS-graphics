# *** for WCOSS IBM phase1/phase2 (intel) ***
 module purge
 module load ics/17.0.3

# module "graphics" not available, use general instead
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

 module load gempak/ncep

 DECODINC=./include
 [[ $GEMPAK_VER == "" ]] && export GEMPAK_VER=ncep
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
 export DECOD_UTINC="-I${DECODINC} -I${OS_INC} -I${GEMINC}"

 export USECC=""
 export USEFC="YES"
 export DEPS=""
 export DECOD_UTDEPS="GEMPAK $GEMPAK_VER"
