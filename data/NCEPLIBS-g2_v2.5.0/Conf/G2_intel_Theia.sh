# *** for Theia (intel) ***
#WORKDIR=/scratch2/NCEPDEV/nwprod/NCEPLIBS
#module use -a $WORKDIR/modulefiles
#module load intel/19.0.4.243
#module load intel/18.0.5.274
#module load g2/3.1.0
 grep -E "(^|:|/)jasper/" <<< "$LOADEDMODULES" &> /dev/null \
  || module load jasper/1.900.1
 grep -E "(^|:|/)png/" <<< "$LOADEDMODULES" &> /dev/null \
  || module load png/1.2.44
 grep -E "(^|:|/)z/" <<< "$LOADEDMODULES" &> /dev/null \
  || module load z/1.2.6
 grep -E "(^|:|/)g2/" <<< "$LOADEDMODULES" &> /dev/null \
  || module load g2/3.1.1

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
 export CFLAGSDEFS="-DUNDERSCORE -DLINUX -DUSE_JPEG2000 -DUSE_PNG -D__64BIT__"
 export FFLAGSDEFS=""

 export USECC="YES"
 export USEFC="YES"
 export DEPS=
