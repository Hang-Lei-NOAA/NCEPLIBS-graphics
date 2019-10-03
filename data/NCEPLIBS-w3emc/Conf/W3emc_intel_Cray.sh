# *** for WCOSS Cray (intel) ***
#module purge
#module load PrgEnv-intel
#module load craype-sandybridge
#module load w3emc-intel/2.3.0
#module load sigio-intel/2.1.0
#module load nemsio-intel/2.2.3
#new_ver=2.2.4
#reset_version nemsio $new_ver
 grep -E "(^|:|/)w3emc/" <<< "$LOADEDMODULES" &> /dev/null \
  || module load w3emc/2.3.1
 grep -E "(^|:|/)sigio/" <<< "$LOADEDMODULES" &> /dev/null \
  || module load sigio/2.1.1
 grep -E "(^|:|/)nemsio/" <<< "$LOADEDMODULES" &> /dev/null \
  || module load nemsio/2.2.4

 export CC=cc
 export FC=ftn
 export CPP=cpp
 export OMPCC="$CC -qopenmp"
 export OMPFC="$FC -qopenmp"
 export MPICC=$CC
 export MPIFC=$FC

 export DEBUG="-g -traceback -O0"
 export CFLAGS="-g -traceback -O3 -axCORE-AVX2 -fPIC"
 export FFLAGS="-g -traceback -O3 -axCORE-AVX2 -fPIC"
 export FPPCPP="-cpp"
 export FREEFORM="-free"
 export CPPFLAGS="-P -traditional-cpp"
 export MPICFLAGS=$CFLAGS
 export MPIFFLAGS=$FFLAGS
 export MODPATH="-module "
 export I4R4="-integer-size 32 -real-size 32"
 export I4R8="-integer-size 32 -real-size 64"
 export I8R8="-integer-size 64 -real-size 64"

 export CPPDEFS=""
 export CFLAGSDEFS="-DUNDERSCORE -DLINUX"
 export FFLAGSDEFS=""

 export USECC=""
 export USEFC="YES"
 export DEPS="NEMSIO $NEMSIO_VER, SIGIO $SIGIO_VER"
