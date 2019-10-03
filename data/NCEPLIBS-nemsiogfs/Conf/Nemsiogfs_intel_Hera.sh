# *** for Hera (intel) ***
#WORKDIR=/scratch2/NCEPDEV/nwprod/NCEPLIBS
#module use -a $WORKDIR/modulefiles
#module load intel/19.0.4.243
#module load impi/2019.0.4
#module load intel/18.0.5.274
#module load impi/2018.0.4
#module load nemsio/2.2.5
#module load nemsiogfs/2.2.0
 grep -E "(^|:|/)nemsio/" <<< "$LOADEDMODULES" &> /dev/null \
  || module load nemsio/2.2.4
 grep -E "(^|:|/)nemsiogfs/" <<< "$LOADEDMODULES" &> /dev/null \
  || module load nemsiogfs/2.2.1

 export CC=icc
 export FC=ifort
 export CPP=cpp
 export OMPCC="$CC -qopenmp"
 export OMPFC="$FC -qopenmp"
 export MPICC=mpiicc
 export MPIFC=mpiifort

 export DEBUG="-g -traceback -O0"
 export CFLAGS="-g -O3 -ftz -traceback -xHOST -axcore-avx512 -fPIC"
 export FFLAGS="-g -O3 -ftz -traceback -fpe0 -xHOST -axcore-avx512 -fPIC"
 export FPPCPP="-cpp"
 export FREEFORM="-free"
 export CPPFLAGS="-P -traditional-cpp"
 export MPICFLAGS="-g -O3 -ftz -traceback -xHOST -axcore-avx512 -fPIC"
 export MPIFFLAGS="-g -O3 -ftz -traceback -fpe0 -xHOST -axcore-avx512 -fPIC"
 export MODPATH="-module "
 export I4R4="-integer-size 32 -real-size 32"
 export I4R8="-integer-size 32 -real-size 64"
 export I8R8="-integer-size 64 -real-size 64"

 export CPPDEFS=""
 export CFLAGSDEFS="-DUNDERSCORE -DLINUX"
 export FFLAGSDEFS=""

 export USECC=""
 export USEFC="YES"
 export DEPS="NEMSIO $NEMSIO_VER"
