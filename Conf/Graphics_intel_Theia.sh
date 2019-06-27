# *** for Theia (intel) ***
 WORKDIR=/scratch3/NCEPDEV/nwprod/IPS
 MODULEPATH=/apps/lmod/lmod/modulefiles/Core
 module use -a $WORKDIR/modulefiles/core_third
 module load EnvVars/1.0.2
 module load ips/18.0.1.163
 module load dev/graphics/2.0.0 && GRAPHICS_VER=v2.0.0
 module use -a /apps/modules/modulefiles
 module load gempak/7.4.2

 DECODINC=./include
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
 export CPPFLAGS="-P -traditional-cpp"
 export MPICFLAGS="-g -traceback -O3 -DUNDERSCORE -DLINUX -std=c99 -fPIC"
 export MPIFFLAGS="-g -traceback -O3 -xHOST -fPIC"
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
