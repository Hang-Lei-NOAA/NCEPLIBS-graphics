# *** for WCOSS Cray (intel) ***
 module purge
 module load PrgEnv-intel
 module load craype-sandybridge
 module load graphics-intel/2.0.0
 module load gempak/7.3.1

 DECODINC=./include
 [[ $GEMPAK_VER == "" ]] && export GEMPAK_VER=v7.3.1
 [[ $GEMINC == "" ]] && export GEMINC=$GEMPAK/include

 export CC=cc
 export FC=ftn
 export CPP=cpp
 export OMPCC="$CC -qopenmp"
 export OMPFC="$FC -qopenmp"
 export MPICC=mpiicc
 export MPIFC=mpiifort

 export DEBUG="-g -traceback -O0"
 export CFLAGS="-g -traceback -O3 -axCORE-AVX2 -std=c99 -fPIC"
 export FFLAGS="-g -traceback -O3 -axCORE-AVX2 -convert big_endian -assume byterecl -assume noold_ldout_format -C -fPIC"
 export FPPCPP="-cpp"
 export FREEFORM="-free"
 export CPPFLAGS="-P -traditional-cpp"
 export MPICFLAGS="-g -traceback -O3 -axCORE-AVX2 -std=c99 -fPIC"
 export MPIFFLAGS="-g -traceback -O3 -axCORE-AVX2 -fPIC"
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
