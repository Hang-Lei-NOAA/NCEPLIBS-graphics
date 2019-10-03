# *** for Theia/Gaea/Jet (intel) ***
#WORKDIR=/scratch2/NCEPDEV/nwprod/NCEPLIBS_CCPP
#module use -a $WORKDIR/modulefiles
#module load intel/19.0.4.243
 module load sfcio/1.1.0

 export CC=icc
 export FC=ifort
 export CPP=cpp
 export OMPCC="$CC -qopenmp"
 export OMPFC="$FC -qopenmp"
 export MPICC=mpiicc
 export MPIFC=mpiifort

 export DEBUG="-g -traceback -O0"
 export CFLAGS="-g -O3 -traceback -xHOST -fPIC"
 export FFLAGS="-g -O3 -traceback -xHOST -convert big_endian -assume byterecl -fPIC"
 export FPPCPP="-cpp"
 export FREEFORM="-free"
 export CPPFLAGS="-P -traditional-cpp"
 export MPICFLAGS="-g -O3 -traceback -xHOST -axcore-avx512 -fPIC"
 export MPIFFLAGS="-g -O3 -traceback -xHOST -convert big_endian -assume byterecl -fPIC"
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
